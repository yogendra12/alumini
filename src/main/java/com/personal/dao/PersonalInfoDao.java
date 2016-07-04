
package com.personal.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.personal.basedao.BasePersonalInfoDao;
import com.personal.model.PersonalInfo;




@Repository(value = "personalInfoDao")
public class PersonalInfoDao extends BasePersonalInfoDao
{
	
	@Autowired
	public JdbcTemplate jdbcTemplate;
public void saveInfo(PersonalInfo personalInfo){
	String sql= "insert into personal_info (rollNo, name) values(?,?)";
	jdbcTemplate.update(sql, new Object [] {personalInfo.getRollNo(), personalInfo.getName()});
}


public List<PersonalInfo> getPersonalData(PersonalInfo personalInfo){
	List<PersonalInfo> finalList = null;  
	String sql= "select * from personal_info pi, child_info ci  where pi.rollNo = ci.rollNo ";
	List<PersonalInfo> dbList  = jdbcTemplate.query(sql, new Object [] {personalInfo.getRollNo(), personalInfo.getName()}, new BeanPropertyRowMapper<PersonalInfo>(PersonalInfo.class));
	if(dbList != null && dbList.size() > 0){
		finalList = new ArrayList<PersonalInfo>();
		for (PersonalInfo modifiedObj : dbList){
			if(modifiedObj.getRollNo() == null){
				
			}
		}	
	}
	
	return null;
}
}

