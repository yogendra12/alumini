package com.personal.basedao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;

import com.personal.model.FacultyInfo;

public class BaseFacultyInfoDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO faculty_Info( facultyId, year, subject, facultyName, facultyPhotoPath, aboutFaculty, contact, email, updatedBy) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public boolean save(FacultyInfo facultyInfo) {
		boolean isInsert = false;
		try {
			int insert = jdbcTemplate
					.update(INSERT_SQL,
							new Object[] { facultyInfo.getFacultyId(),
									facultyInfo.getYear(),
									facultyInfo.getSubject(),
									facultyInfo.getFacultyName(),
									facultyInfo.getFacultyPhotoPath(),
									facultyInfo.getAboutFaculty(),
									facultyInfo.getContact(),
									facultyInfo.getEmail(), 
									facultyInfo.getUpdatedBy()});
			if (insert > 0) {
				isInsert = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isInsert;
	}

	public boolean updateFacultyInfo(FacultyInfo facultyInfo) {
		boolean isUpdate = false;
		try {
			String sql = "UPDATE faculty_Info  set year = ? ,subject = ? ,facultyName = ? ,facultyPhotoPath = ? ,aboutFaculty = ? ,contact = ? ,email = ? ,updatedBy = ? ,updatedDate = ?  where facultyId = ? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] { facultyInfo.getYear(),
							facultyInfo.getSubject(),
							facultyInfo.getFacultyName(),
							facultyInfo.getFacultyPhotoPath(),
							facultyInfo.getAboutFaculty(),
							facultyInfo.getContact(), facultyInfo.getEmail(),
							facultyInfo.getUpdatedBy(),
							facultyInfo.getUpdatedDate(),
							facultyInfo.getFacultyId() });
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {

		}

		return isUpdate;
	}

	public boolean deleteFacultyInfo(int id) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM faculty_Info WHERE facultyId =?";
			int delete = jdbcTemplate.update(sql, new Object[] { id });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}
		return isDelete;

	}

	public FacultyInfo getFacultyInfo(int id) {
		try {
			String sql = "SELECT * from faculty_Info where  facultyId= ? ";
			List<FacultyInfo> retlist = jdbcTemplate.query(sql,
					new Object[] { id }, ParameterizedBeanPropertyRowMapper
							.newInstance(FacultyInfo.class));
			if (retlist.size() > 0)
				return retlist.get(0);
		} catch (Exception e) {

		}

		return null;
	}

	public List<FacultyInfo> getFacultyInfoAll() {
		List<FacultyInfo> retlist = null;
		try {
			String sql = "SELECT * from faculty_Info";
			retlist = jdbcTemplate.query(sql,
					ParameterizedBeanPropertyRowMapper
							.newInstance(FacultyInfo.class));

		} catch (Exception e) {

		}

		return retlist;
	}

}
