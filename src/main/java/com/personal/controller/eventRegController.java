package com.personal.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

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

import com.personal.dao.ChildInfoDao;
import com.personal.dao.EventsDao;
import com.personal.dao.PersonalInfoDao;
import com.personal.model.Events;
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
		String photoPath = null;
		try {
			json=new JSONObject();
			
				if (!multipartFile.isEmpty()){
				json = new JSONObject();
				for(MultipartFile file: multipartFile){
					if (!multipartFile.isEmpty()){
							photoPath = AWSS3Util.ImageUpload(file);
					}
						}
				if(StringUtils.isNotBlank(photoPath)){
					events.setEventPhotosPath(photoPath);	
				}
				
			}
				events.setUpdatedBy("RRRRRR");
				
				
				isInsert = eventsDao.save(events);
				
				if (isInsert) {
					json.put("status_code", 200);
				} else {
					json.put("status_code", 400);
				}
				
				

		} catch (Exception e) {
			e.printStackTrace();
			json.put("status_code", 500);
			
		}
		json.put("type", "Save Success");
				return json.toString() ;
		}
		@RequestMapping("/eventUpdateUser")
	public @ResponseBody String eventUpdateUser(
			@ModelAttribute Events events,@RequestParam("file") List<MultipartFile> multipartFile, HttpSession session) {
		JSONObject reponse =new JSONObject();
		Events eventObj = null;
		String photoPath = null;
		 eventObj = eventsDao.getEvent1(events.getEventId());
		 if(eventObj != null && eventObj.getEventId() >0){
				try {
					photoPath = eventObj.getEventPhotosPath();
					 if(StringUtils.isNotBlank(events.getEventDescription())){
						 eventObj.setEventDescription(events.getEventDescription().trim());
					 }
					 if(events.getEventDate() != null){
						 eventObj.setEventDate(events.getEventDate());
					 }
					 if(StringUtils.isNotBlank(events.getEventName())){
						 eventObj.setEventName(events.getEventName().trim());
					 }
						if (!multipartFile.isEmpty()){
							for (MultipartFile file : multipartFile) {
								photoPath = AWSS3Util.ImageUpload(file);
							}
						}
						eventObj.setUpdatedBy("RRRRRR");
						if(StringUtils.isNotBlank(photoPath)){
							eventObj.setEventPhotosPath(photoPath);	
						}
						if (eventsDao.updateEvent(eventObj)) {
							reponse.put("status_code", 200);
						} else {
							reponse.put("status_code", 400);
						}
				} catch (Exception e) {
					e.printStackTrace();
					reponse.put("status_code", "500");
				}
			 
		 }
		 		reponse.put("type", "Update Success");
				return reponse.toString() ;
		}
}
