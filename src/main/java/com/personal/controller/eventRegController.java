package com.personal.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

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
import com.personal.dao.EventsDao;
import com.personal.dao.PersonalInfoDao;
import com.personal.model.ChildInfo;
import com.personal.model.Events;
import com.personal.model.PersonalInfo;
import com.personal.util.AWSS3Util;
import com.personal.util.AluminiCommonUtils;

/**
 * @author koti
 *
 */
@Controller
public class eventRegController {
	Logger log = Logger.getLogger(eventRegController.class);
	@Autowired
	EventsDao eventsDao;
	@Autowired
	PersonalInfoDao personalDao;
	@Autowired
	ChildInfoDao childInfoDao;

	@RequestMapping("/eventRegisterUser")
	public @ResponseBody String eventRegisterUser(
			@ModelAttribute Events events,@RequestParam("file") List<MultipartFile> multipartFile, HttpSession session) {
		boolean isInsert = false;
		JSONObject json = null;
		String keyName=null;
		try {
			json=new JSONObject();
			
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
			
				}

				events.setUpdatedBy("RRRRRR");
				events.setEventPhotosPath(imgUrl);
				isInsert = eventsDao.save(events);
				
			System.out.println("hiiiiiiiiiiiiiiii");
				//isInsert=true;
				if (isInsert) {
					json.put("200", "User registration successfull");
				} else {
					json.put("400", "User registration fail");
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
			
		}
				return json.toString() ;
		}
}
