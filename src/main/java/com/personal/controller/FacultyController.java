package com.personal.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.personal.dao.ChildInfoDao;
import com.personal.dao.EventsDao;
import com.personal.dao.FacultyInfoDao;
import com.personal.dao.PersonalInfoDao;
import com.personal.model.Events;
import com.personal.model.FacultyInfo;
import com.personal.util.AWSS3Util;
import com.personal.util.AluminiCommonUtils;

/**
 * @author koti
 *
 */
@Controller
public class FacultyController {
	Logger log = Logger.getLogger(FacultyController.class);
	@Autowired
	EventsDao eventsDao;
	@Autowired
	PersonalInfoDao personalDao;
	@Autowired
	ChildInfoDao childInfoDao;
	@Autowired
	FacultyInfoDao facultyInfoDao;

	@RequestMapping("/facultyUpdate")
	public @ResponseBody String facultyUpdate(
			@ModelAttribute Events events, @RequestParam("file") List<MultipartFile> multipartFile, HttpSession session,HttpServletRequest objRequest) {
		
		
		String responce = null;
		String fname=null;
		String contact=null;
		String email=null;
		String aboutFaculty=null;
		String id = null;
		boolean update= false;
		JSONObject json = null;
		String keyName=null;
		List<FacultyInfo> listFacultyInfo = null;
		try {
			json = new JSONObject();
			FacultyInfo facultyInfo = new FacultyInfo();
			id = objRequest.getParameter("id");
			fname = objRequest.getParameter("fname");
			aboutFaculty = objRequest.getParameter("aboutFaculty");
			email = objRequest.getParameter("email");
			contact = objRequest.getParameter("contact");
			
			facultyInfo = facultyInfoDao.getFacultyInfo(Integer.parseInt(id));
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
					json.put("fimage", imgUrl);	
				}
				
				i++;
			}
			if(StringUtils.isNotBlank(json.get("fimage").toString())){
				facultyInfo.setFacultyPhotoPath(json.get("fimage").toString());
			}
			}

			
			
			
			facultyInfo.setFacultyId(Integer.parseInt(id));
			if(StringUtils.isNotBlank(fname)){
				facultyInfo.setFacultyName(fname);
			}
			if(StringUtils.isNotBlank(aboutFaculty)){
				facultyInfo.setAboutFaculty(aboutFaculty);;
			}
			if(StringUtils.isNotBlank(email)){
				facultyInfo.setEmail(email);
			}
			if(StringUtils.isNotBlank(contact)){
				facultyInfo.setContact(contact);
			}
			
		update=	facultyInfoDao.updateFacultyInfo(facultyInfo);
		
			
		listFacultyInfo =facultyInfoDao.getFacultyInfoAll() ;
		ObjectMapper mapper = new ObjectMapper();
		responce = mapper.writeValueAsString(listFacultyInfo);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
			responce = "null";
			
		}
				return responce;
		}
}
