/**
 * 
 */
package com.personal.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.personal.dao.ChildInfoDao;
import com.personal.dao.PersonalInfoDao;
import com.personal.model.ChildInfo;
import com.personal.model.PersonalInfo;
import com.personal.util.AWSS3Util;
import com.personal.util.AluminiCommonUtils;
import com.personal.util.EmailUtil;

/**
 * @author koti
 *
 */
@Controller
public class RegistrationController {
	Logger log = Logger.getLogger(RegistrationController.class);

	@Autowired
	PersonalInfoDao personalDao;
	@Autowired
	ChildInfoDao childInfoDao;
	@Autowired ServletContext objContext;
	@RequestMapping("/registerUser")
	public @ResponseBody String registerUser(
			@ModelAttribute PersonalInfo personalInfo,@RequestParam("file") List<MultipartFile> multipartFile, HttpSession session) {
		boolean isInsert = false;
		JSONObject json = null;
		String keyName=null;
		try {
			json = new JSONObject();
			PersonalInfo sessinBean = (PersonalInfo) session
					.getAttribute("LoginBean");
		/*	if (sessinBean != null) {*/
				AWSS3Util obj= new AWSS3Util();
				if (!multipartFile.isEmpty()){
				json = new JSONObject();
				int i =0;
				String imgUrl = null;
				for(MultipartFile file: multipartFile){
					
					keyName = AluminiCommonUtils.getRandomNum();
					byte[] bytes = file.getBytes();

					// Creating the directory to store file
					String rootPath = System.getProperty("catalina.home");
					File dir = new File(rootPath + File.separator + "tmpFiles");
					if (!dir.exists())
						dir.mkdirs();

					// Create the file on server
					File serverFile = new File(dir.getAbsolutePath()+ File.separator + keyName);
					BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
					stream.write(bytes);
					stream.close();

					
					//System.out.println(file.getName());
					
					//MultipartFile mf = (MultipartFile)request.getParameter("");
					
					imgUrl = obj.uploadfile(serverFile, true, keyName);
					if (i==0){
						json.put("old", imgUrl);	
					}
					if (i == 1){
						json.put("new", imgUrl);
					}
					i++;
				}
				}
				personalInfo.setUpdatedBy(sessinBean.getRollNo());
				personalInfo.setOldPhotoPath(String.valueOf(json.get("old")));
				personalInfo.setNewPhotoPath(String.valueOf(json.get("new")));
				String sRandom = String.valueOf(Math.round(Math.random() * 1000000));
				personalInfo.setPassword(sRandom);
				isInsert = personalDao.updatePersonalInfo(personalInfo);
				if (isInsert) {
					EmailUtil.sendEmail(personalInfo, objContext);
					json.put("200", "User registration successfull");
				} else {
					json.put("400", "User registration fail");
				}
			 /*}else {
				json.put("400", "Invalid session, login and try again");
			}*/
		} catch (Exception e) {
			log.error("Exception in registerUser in RegistrationController", e);
			json.put("500", "Internal error. User registration fail");
		}
		return json.toString();
	}


	
	@RequestMapping("/updateSpouseDetails")
	public @ResponseBody String updateSpouseDetails(@ModelAttribute PersonalInfo personal,
			@ModelAttribute ChildInfo childInfo,@RequestParam("file") List<MultipartFile> multipartFile,
			HttpServletRequest request,HttpSession session) {
		  String res = "fail";
		try {
			System.out.println("inside spouse........");
			/*PersonalInfo sessinBean = (PersonalInfo) session.getAttribute("LoginBean");
			if(sessinBean != null){*/
				
				//PersonalInfo dbObject = personalDao.getPersonalInfo(sessinBean.getRollNo());
			PersonalInfo dbObject = personalDao.getPersonalInfo("87EC101");
				if(dbObject != null){
					dbObject.setSpouseName(personal.getSpouseName());
					dbObject.setAboutSouse(personal.getAboutSouse());
					dbObject.setSpousePhoto(personal.getSpousePhoto());
					System.out.println("bfore");
					if(personalDao.updatePersonalInfo(dbObject)){
						System.out.println("bfore");
						childInfo.setRollNo(dbObject.getRollNo());
						System.out.println("bfore child");
						boolean isChildSave = childInfoDao.saveChildrenInfo(childInfo);
						System.out.println("bfore child"+isChildSave);
						if(isChildSave){
							res = "success";	
						}
					}
				}
			//}
		} catch (Exception e) {
			// TODO: handle exception
			log.error("Exception in RegistrationController", e);
			e.printStackTrace();
		}
		return res;
	}
	@RequestMapping (value = "/uploadToS3")
	public @ResponseBody String uploadImages(HttpServletRequest request, @RequestParam("file") List<MultipartFile> multipartFile){
		String imgUrl = "";
		String keyName = "";
		JSONObject json = null;
		try{
			AWSS3Util obj= new AWSS3Util();
			if (!multipartFile.isEmpty()){
			json = new JSONObject();
			int i =0;
			for(MultipartFile file: multipartFile){
				
				keyName = AluminiCommonUtils.getRandomNum();
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator + keyName);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				
				//System.out.println(file.getName());
				
				//MultipartFile mf = (MultipartFile)request.getParameter("");
				
				imgUrl = obj.uploadfile(serverFile, true, keyName);
				if (i==0){
					json.put("old", imgUrl);	
				}
				if (i == 1){
					json.put("new", imgUrl);
				}
				i++;
			}
			imgUrl = json.toString();
			}
			
		}catch(Exception e){
			log.error("Excetption in uploadImages", e);
		}finally{
			
		}
		return imgUrl;
	}

}
