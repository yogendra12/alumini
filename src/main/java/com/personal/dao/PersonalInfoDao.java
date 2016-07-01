
package com.personal.dao;

import org.springframework.beans.factory.annotation.Autowired;
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


}

