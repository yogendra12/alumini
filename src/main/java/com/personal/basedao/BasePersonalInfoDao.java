package com.personal.basedao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;

import com.personal.model.PersonalInfo;

public class BasePersonalInfoDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO personal_Info( rollNo, password, name,  email,contact_no, dob, city, country, aboutYou,spouseName,aboutSouse,updatedBy,updatedDate) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";

	public boolean savePersonalInfo(PersonalInfo personalInfo) {
		int update = 0;
		boolean isSave = false;
		try {
			update = jdbcTemplate.update(INSERT_SQL, new Object[] {
					personalInfo.getRollNo(), personalInfo.getPassword(),
					personalInfo.getName(), personalInfo.getEmail(),
					personalInfo.getContactNo(), personalInfo.getDateOfBirth(),
					personalInfo.getCity(), personalInfo.getCountry(),
					personalInfo.getAboutSouse(), personalInfo.getSpouseName(),
					personalInfo.getAboutSouse(), personalInfo.getUpdatedBy(),
					personalInfo.getUpdatedDate() });

			if (update > 0) {
				isSave = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return isSave;
	}

	public boolean updatePersonalInfo(PersonalInfo personalInfo) {
		int update = 0;
		boolean isUpdate = false;
		try {
			String sql = "UPDATE  personal_info  set  password = ? ,name = ? ,email = ?,contactNo = ?  ,dob = ? ,city = ? "
					+ ",country = ? ,aboutYou = ? ,spouseName = ?,aboutSouse=?, new_photo_path=?,old_photo_path=?,updatedBy =?,updatedDate=? where rollNo = ?";

			update = jdbcTemplate.update(sql,
					new Object[] { personalInfo.getPassword(),
							personalInfo.getName(), personalInfo.getEmail(),
							personalInfo.getContactNo(),
							personalInfo.getDateOfBirth(),
							personalInfo.getCity(), personalInfo.getCountry(),
							personalInfo.getAboutYou(),
							personalInfo.getSpouseName(),
							personalInfo.getAboutSouse(),
							personalInfo.getNewPhotoPath(),
							personalInfo.getOldPhotoPath(),
							personalInfo.getUpdatedBy(),
							personalInfo.getUpdatedDate(),
							personalInfo.getRollNo() });
			if (update > 0) {
				isUpdate = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isUpdate;

	}

	public boolean deletePersonalInfo(String rollNo) {
		boolean isDeleteRollno = false;
		try {
			String sql = "DELETE FROM  personal_Info WHERE rollNo=?";
			int delete = jdbcTemplate.update(sql, new Object[] { rollNo });
			if (delete > 0) {
				isDeleteRollno = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDeleteRollno;
	}

	public PersonalInfo getPersonalInfo(String rollNo) {
		try {
			String sql = "SELECT * from personal_info where rollNo = ? ";
			List<PersonalInfo> retlist = jdbcTemplate.query(sql,
					new Object[] { rollNo }, ParameterizedBeanPropertyRowMapper
							.newInstance(PersonalInfo.class));
			if (retlist.size() > 0)
				return retlist.get(0);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public Map<String, String> getRollNos() {
		List<PersonalInfo> retlist = null;
		Map<String, String> map = null;
		try {
			String sql = "SELECT concat_ws(' - ',rollNo, name) as name , rollNo from personal_info";
			retlist = jdbcTemplate.query(sql, new BeanPropertyRowMapper<PersonalInfo>(PersonalInfo.class));
			if(retlist != null && retlist.size() > 0){
				map = new HashMap<String, String>();
				for (PersonalInfo name : retlist){
					map.put(name.getRollNo(),name.getName());
				}
			}
		} catch (Exception e) {
			System.out.println("Exception in BasePersonalDao"+e);
		}
		return map;
	}

	public List<PersonalInfo> getPersonalInfoAll() {
		List<PersonalInfo> retlist = null;
		try {
			String sql = "SELECT * from personal_info  ";
			retlist = jdbcTemplate.query(sql,
					ParameterizedBeanPropertyRowMapper
							.newInstance(PersonalInfo.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}
}
