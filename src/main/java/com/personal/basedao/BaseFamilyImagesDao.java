package com.personal.basedao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.stereotype.Repository;

import com.personal.basemodel.FamilyImages;

@Repository
public class BaseFamilyImagesDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<FamilyImages> getFamilyImagesAll(String rollNo) {
		List<FamilyImages> retlist = null;
		try {
			StringBuffer sBuffer = new StringBuffer();
			sBuffer.append("SELECT * from family_images ");
			if (StringUtils.isNotBlank(rollNo)) {
				sBuffer.append(" where rollNo ='" + rollNo + "'");
			}
			System.out.println(sBuffer.toString());
			retlist = jdbcTemplate.query(sBuffer.toString(),
					ParameterizedBeanPropertyRowMapper
							.newInstance(FamilyImages.class));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return retlist;
	}
}
