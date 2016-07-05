/**
 * 
 */
package com.personal.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.personal.dao.PersonalInfoDao;
import com.personal.model.PersonalInfo;

/**
 * @author koti
 *
 */
@Controller
public class LoginContoller {

	@Autowired
	PersonalInfoDao personalInfoDao;
	Logger log = Logger.getLogger(LoginContoller.class);
	@Autowired ServletContext objContext;
	@RequestMapping(value = "/validateLogin")
	public @ResponseBody String validateLogin(HttpServletRequest request,
			HttpSession session) {
		String rollNo = null;
		String pass = null;
		try {
			rollNo = request.getParameter("rollNo");
			pass = request.getParameter("pass");
			if (StringUtils.isNotBlank(rollNo) && StringUtils.isNotBlank(pass)) {
				PersonalInfo personalInfo = personalInfoDao.getPersonalInfo(rollNo);
				if (personalInfo != null &&  personalInfo.getPassword().equals(pass)) {
						session.setAttribute("LoginBean", personalInfo);
						personalInfo.setIsVerified(1);
						boolean isUpdate = personalInfoDao.updatePersonalInfo(personalInfo);
						if(isUpdate){
							log.info("Email has been verified successfully.");
						}
						/*EmailBean bean = new EmailBean();
						bean.setEmail(email);
						EmailUtil.sendEmail(null, objContext);*/
						return "Succ";
				}
			}
		} catch (Exception e) {
			log.error("Exception in validateLogin()", e);
		}
		return "";
	}
	@RequestMapping(value = "/logout")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.removeAttribute("userId");
			session.invalidate();
		}
		return "redirect:aluminiHome";
	}
}
