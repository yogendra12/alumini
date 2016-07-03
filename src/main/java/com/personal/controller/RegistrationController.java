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

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.personal.basemodel.FamilyImages;
import com.personal.dao.ChildInfoDao;
import com.personal.dao.FamilyImagesDao;
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
	@Autowired FamilyImagesDao familyImagesDao;
	@RequestMapping("/registerUser")
	public @ResponseBody String registerUser(
			@ModelAttribute PersonalInfo personalInfo,@RequestParam("file") List<MultipartFile> multipartFile, HttpSession session) {
		boolean isInsert = false;
		JSONObject json = null;
		try {
			json = new JSONObject();
			PersonalInfo sessinBean = (PersonalInfo) session
					.getAttribute("LoginBean");
			if (sessinBean != null) {
				if (!multipartFile.isEmpty()){
				json = new JSONObject();
				String imgUrl = null;
				int i =0;
				for(MultipartFile file: multipartFile){
					imgUrl = AWSS3Util.ImageUpload(file);
					if (i==0){
						json.put("oldImg", imgUrl);	
					}
					if (i == 1){
						json.put("newImg", imgUrl);
					}
					i++;
				}
				}
				personalInfo.setUpdatedBy(sessinBean.getRollNo());
				personalInfo.setOldPhotoPath(String.valueOf(json.get("oldImg")));
				personalInfo.setNewPhotoPath(String.valueOf(json.get("newImg")));
				String sRandom = String.valueOf(Math.round(Math.random() * 1000000));
				personalInfo.setPassword(sRandom);
				isInsert = personalDao.updatePersonalInfo(personalInfo);
				if (isInsert) {
					EmailUtil.sendEmail(personalInfo, objContext);
					json.put("200", "User registration successfull");
				} else {
					json.put("400", "User registration fail");
				}
			 }else {
				json.put("400", "Invalid session, login and try again");
			}
		} catch (Exception e) {
			log.error("Exception in registerUser in RegistrationController", e);
			json.put("500", "Internal error. User registration fail");
		}
		return json.toString();
	}


	
	@RequestMapping("/updateSpouseDetails")
	public @ResponseBody String updateSpouseDetails(@ModelAttribute PersonalInfo personal,
			@ModelAttribute ChildInfo childInfo,@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request,HttpSession session) {
		  //String res = "fail";
		JSONObject json = null;
		try {
			json = new JSONObject();
			System.out.println("inside spouse........");
			PersonalInfo sessinBean = (PersonalInfo) session.getAttribute("LoginBean");
			if(sessinBean != null){
								
			PersonalInfo dbObject = personalDao.getPersonalInfo(sessinBean.getRollNo());
			//PersonalInfo dbObject = personalDao.getPersonalInfo("87EC101");
				if(dbObject != null){
					dbObject.setSpouseName(personal.getSpouseName());
					dbObject.setAboutSouse(personal.getAboutSouse());
					//upload image
					String imgUrl = AWSS3Util.ImageUpload(multipartFile);
					if(StringUtils.isNotBlank(imgUrl)){
						dbObject.setSpousePhoto(imgUrl);	
					}
					if(personalDao.updatePersonalInfo(dbObject)){
						json.put("200", dbObject.getSpousePhoto());
					}else{
						json.put("400", "Error in creation of spouse");
					}
				}
			} else {
				json.put("400", "Invalid session, login and try again");
			}
		} catch (Exception e) {
			log.error("Exception in RegistrationController", e);
			e.printStackTrace();
			json.put("500", "Error in creation of spouse");
		}
		return json.toString();
	}
	
	@RequestMapping("/insertChildData")
	public @ResponseBody String insertChildData(@ModelAttribute ChildInfo childInfo, 
			@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request,HttpSession session) {
		JSONObject json = null;
		try {
			json = new JSONObject();
			System.out.println("inside spouse........");
			PersonalInfo sessinBean = (PersonalInfo) session.getAttribute("LoginBean");
			if(sessinBean != null){
					//upload image
					if(!multipartFile.isEmpty()){
						String imgUrl = AWSS3Util.ImageUpload(multipartFile);
						if(StringUtils.isNotBlank(imgUrl)){
							childInfo.setChildPhotoPath(imgUrl);	
						}	
					}
					
					childInfo.setRollNo(sessinBean.getRollNo());
					if(childInfoDao.saveChildrenInfo(childInfo)){
						json.put("200", childInfo.getChildPhotoPath());
					}else{
						json.put("400", "Error in creation of child");
					}
			} else {
				json.put("400", "Invalid session, login and try again");
			}
		} catch (Exception e) {
			log.error("Exception in RegistrationController", e);
			e.printStackTrace();
			json.put("500", "Error in creation of spouse");
		}
		return json.toString();
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
	@RequestMapping("/insertFamilyData")
	public @ResponseBody String insertFamilyData(@ModelAttribute FamilyImages familyImages, 
			@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request,HttpSession session) {
		JSONObject json = null;
		try {
			json = new JSONObject();
			PersonalInfo sessinBean = (PersonalInfo) session.getAttribute("LoginBean");
			if(sessinBean != null){
					//upload image
					if(!multipartFile.isEmpty()){
						String imgUrl = AWSS3Util.ImageUpload(multipartFile);
						if(StringUtils.isNotBlank(imgUrl)){
							familyImages.setImagePath(imgUrl);	
						}	
					}
					familyImages.setRollNo(sessinBean.getRollNo());
					familyImages.setUpdatedBy(familyImages.getRollNo());
					if(familyImagesDao.saveFamilyImages(familyImages)){
						json.put("200", familyImages.getImagePath());
					}else{
						json.put("400", "Error in uploading family images");
					}
				} else {
					json.put("400", "Invalid session, login and try again");
				}
		} catch (Exception e) {
			log.error("Exception in RegistrationController", e);
			e.printStackTrace();
			json.put("500", "Exception in uploading family images ");
		}
		return json.toString();
	}
}
