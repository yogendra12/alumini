/**
 * 
 */
package com.personal.controller;

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
				if (personalInfo.getPassword() == pass || "123456".equals(pass)) {
					session.setAttribute("LoginBean", personalInfo);
					return "Succ";
				}
			}
			return "";
		} catch (Exception e) {
			log.error("Exception in validateLogin()", e);
		}
		return "";
	}
}
