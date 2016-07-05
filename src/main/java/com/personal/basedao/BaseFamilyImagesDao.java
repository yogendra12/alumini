package com.personal.basedao;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;

import com.personal.basemodel.FamilyImages;

public class BaseFamilyImagesDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<FamilyImages> getFamilyImagesAll(String rollNo) {
		List<FamilyImages> retlist = null;
		try {
			StringBuffer sBuffer = new StringBuffer();
			sBuffer.append("SELECT * from family_images ");
			if (StringUtils.isNotBlank(rollNo)) {
				sBuffer.append(" where rollNo ='" + rollNo + "' and isPublic=1");
			}else {
				sBuffer.append(" where isPublic=1");
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
	public boolean saveFamilyImages(FamilyImages familyImages) {
		boolean isSave = false;
		try {
			String sql = "insert into family_images (rollNo, description,updatedBy,imagePath,isPublic) values(?,?,?,?,?)";
			int i = jdbcTemplate.update(sql,new Object[]{
						familyImages.getRollNo(),
						familyImages.getDescription(),
						familyImages.getUpdatedBy(),
						familyImages.getImagePath(),
						familyImages.getIsPublic()
					});
				if(i > 0){
					isSave = true;
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}
	
	public boolean deleteFamilyInfo(int familyImgId) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM  family_images WHERE id=?";
			int delete = jdbcTemplate.update(sql, new Object[] { familyImgId });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}
		return isDelete;
	}
	
}
