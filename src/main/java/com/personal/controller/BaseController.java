package com.personal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
//import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.personal.basemodel.FamilyImages;
import com.personal.dao.ChildInfoDao;
import com.personal.dao.EventsDao;
import com.personal.dao.FacultyInfoDao;
import com.personal.dao.FamilyImagesDao;
import com.personal.dao.PersonalInfoDao;
import com.personal.model.ChildInfo;
import com.personal.model.Events;
import com.personal.model.FacultyInfo;
import com.personal.model.PersonalInfo;

@Controller
public class BaseController {
	@Autowired
	PersonalInfoDao personalInfoDao;
	@Autowired
	FacultyInfoDao facultyInfoDao;
	@Autowired
	EventsDao eventDao;
	@Autowired
	ChildInfoDao childInfoDao;
	@Autowired FamilyImagesDao familyImagesDao;
	Logger log = Logger.getLogger(BaseController.class);

	@RequestMapping(value = "/personal")
	public String getPersonalPage(ModelMap model) {
		System.out.println("this is the sample sample page...");
		return "personal";
	}

	@RequestMapping(value = "/aluminiHome")
	public String getaluminiHomePage(ModelMap model,HttpServletRequest request) throws JsonGenerationException, JsonMappingException, IOException {
		System.out.println("alumini page...");
		String json = "";
		List<PersonalInfo> finalList = null;
		List<PersonalInfo> listPersonalInfo =   personalInfoDao.getPersonalInfoAll("verified");
		List<ChildInfo> finalChildList = null;
		if(listPersonalInfo != null && listPersonalInfo.size() > 0){
			finalList = new ArrayList<PersonalInfo>();
			for(PersonalInfo localPersonalInfo : listPersonalInfo ){
				
				
				if(StringUtils.isEmpty(localPersonalInfo.getDateOfBirth())){
					localPersonalInfo.setDateOfBirth("");
				}
				if(StringUtils.isEmpty(localPersonalInfo.getOldPhotoPath())){
					localPersonalInfo.setOldPhotoPath("https://s3-us-west-2.amazonaws.com/alumini-public-images/blankMale.jpeg");
				}
				if(StringUtils.isEmpty(localPersonalInfo.getNewPhotoPath())){
					localPersonalInfo.setNewPhotoPath("https://s3-us-west-2.amazonaws.com/alumini-public-images/blankMale.jpeg");
				}
				if(StringUtils.isEmpty(localPersonalInfo.getSpousePhoto())){
					localPersonalInfo.setSpousePhoto("https://s3-us-west-2.amazonaws.com/alumini-public-images/blankFemale.jpeg");
				}
				if(StringUtils.isEmpty(localPersonalInfo.getSpouseName())){
					localPersonalInfo.setSpouseName("");
				}
				if(StringUtils.isEmpty(localPersonalInfo.getAboutSouse())){
					localPersonalInfo.setAboutSouse("");
				}
				finalList.add(localPersonalInfo);
				//child info
				List<ChildInfo> listChildInfo =  childInfoDao.getChildrenInfoAll(localPersonalInfo.getRollNo());
				if (listChildInfo != null && listChildInfo.size()>0){
					finalChildList = new ArrayList<ChildInfo>();
					for(ChildInfo localChildInfo :listChildInfo){
						if(StringUtils.isEmpty(localChildInfo.getChildPhotoPath())){
							localChildInfo.setChildPhotoPath("https://s3-us-west-2.amazonaws.com/alumini-public-images/blankChild.jpeg");
						}
						finalChildList.add(localChildInfo);
					}
					localPersonalInfo.setListChild(finalChildList);
					
					//family images
					List<FamilyImages> listFamilyImages = familyImagesDao.getFamilyImagesAll(localPersonalInfo.getRollNo()); 
					localPersonalInfo.setListFamilyImages(listFamilyImages);
				}
			}
		}
		ObjectMapper mapper = new ObjectMapper();
		json = mapper.writeValueAsString(finalList);
		request.setAttribute("listPersonal", json);
		return "alumini";
	}

	/*@RequestMapping(value = "/galleryHome")
	public String getGalleryHomePage(ModelMap model) {
		System.out.println("alumini page...");
		return "gallery";
	}*/

	@RequestMapping(value = "/eventHome")
	public String getEventHomePage(ModelMap model, HttpServletRequest request)
			throws JsonGenerationException, JsonMappingException, IOException {
		List<Events> eventsList = eventDao.getAll();
		ObjectMapper mapper = null;
		String json = "";
		if (eventsList != null && eventsList.size() > 0) {
			mapper = new ObjectMapper();
			json = mapper.writeValueAsString(eventsList);
			request.setAttribute("eventsList", json);
			System.out.println(json);
		}
		System.out.println("alumini page...");
		return "event";
	}

	
	@RequestMapping(value = "/eventsregHome")
	public String geteventsregHomePage(ModelMap model, HttpServletRequest request) {
		System.out.println("eventsreg........");
		String eventId = request.getParameter("eventId");
		ObjectMapper mapper = null;
		String json = "";
		try{
		if (StringUtils.isNotBlank(eventId)) {
			List<Events> eventsList = eventDao.getEvent(Integer.parseInt(eventId));
			if (eventsList != null) {
				System.out.println(eventsList.get(0).getEventDate());
				mapper = new ObjectMapper();
				json = mapper.writeValueAsString(eventsList);
				request.setAttribute("eventsList1", json);
				System.out.println(json);
			}
		}else{
			request.setAttribute("eventsList1", "null");
		}
		}catch(Exception e){
			
		}

		return "eventsreg";
	}

	@RequestMapping(value = "/regHome")
	public String getRegHomePage(Model model, HttpSession session, HttpServletRequest request) {
		PersonalInfo sessinBean = (PersonalInfo) session.getAttribute("LoginBean");
		if(sessinBean != null){
			PersonalInfo localBean = personalInfoDao.getPersonalInfo(sessinBean.getRollNo());
			request.setAttribute("pBean", localBean );
			return "reg";
		}else{
			return "redirect:aluminiHome";
		}
	}

	
	@RequestMapping(value = "/facultyHome")
	public String getFacultyHomePage(ModelMap model, HttpServletRequest request) {
		System.out.println("alumini page...");
		List<FacultyInfo> listFacultyInfo = null;
		String responce = null;
		try {
			listFacultyInfo = facultyInfoDao.getFacultyInfoAll();
			ObjectMapper mapper = new ObjectMapper();
			responce = mapper.writeValueAsString(listFacultyInfo);
			request.setAttribute("facultyDetails", responce);
		} catch (Exception e) {

		}
		return "faculty";
	}

	@RequestMapping(value = "/facultyentry")
	public String getFacultyEntry(ModelMap model, HttpServletRequest objRequest, HttpSession session) {

		List<FacultyInfo> listFacultyInfo = null;
		String json = "";
		try {
			PersonalInfo sessinBean = (PersonalInfo) session.getAttribute("LoginBean");
			if(sessinBean != null){
				listFacultyInfo =facultyInfoDao.getFacultyInfoAll() ;
				ObjectMapper mapper = new ObjectMapper();
				json = mapper.writeValueAsString(listFacultyInfo);
				objRequest.setAttribute("facultyOrders", json);
				return "facreg";
			}else{
				return "redirect:aluminiHome";
			}
		} catch (Exception e) {
			log.error("Exception in getting rollnos", e);
			return "aluminiHome";
		}
	}

	@RequestMapping(value = "/aboutHome")
	public String getAboutHomePage(ModelMap model) {
		System.out.println("alumini page...");
		return "about";
	}

	@ModelAttribute("rollNos")
	public @ResponseBody String getRollNos(@ModelAttribute PersonalInfo personalInfo, ModelMap model,
			HttpServletRequest request) {
		Map<String, String> listRollNos = null;
		String json = "";
		try {
			listRollNos = personalInfoDao.getRollNos();
			ObjectMapper mapper = new ObjectMapper();
			json = mapper.writeValueAsString(listRollNos);
		} catch (Exception e) {
			log.error("Exception in getting rollnos", e);
		}
		return json;
	}

	@RequestMapping(value = "/importRollCSV")
	public @ResponseBody String importCSVData(@ModelAttribute PersonalInfo personalInfo, ModelMap model,
			HttpServletRequest request) {
		System.out.println("inside the controller");
		String s = request.getParameter("jso");

		JSONArray array = new JSONArray(s);
		for (int i = 0; i < array.length(); i++) {
			JSONObject a = (JSONObject) array.get(i);
			personalInfo.setRollNo((a.getString("rollNo")));
			personalInfo.setName(a.getString("name"));
			personalInfoDao.saveInfo(personalInfo);
		}

		return "suc";
	}

	@RequestMapping(value = "/importFacCsv")
	public @ResponseBody String importFacCsv(@ModelAttribute FacultyInfo facultyInfo, ModelMap model,
			HttpServletRequest request) {
		String s = request.getParameter("jso");
		System.out.println(s);
		JSONArray array = new JSONArray(s);
		for (int i = 0; i < array.length(); i++) {
			JSONObject a = (JSONObject) array.get(i);
			facultyInfo.setFacultyId(Integer.valueOf(a.getString("fId")));
			facultyInfo.setYear(a.getString("year"));
			facultyInfo.setSubject(a.getString("subject"));
			facultyInfo.setFacultyName(a.getString("name"));
			facultyInfoDao.save(facultyInfo);
		}

		return "suc";
	}
}
