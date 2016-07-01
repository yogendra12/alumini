/**
 * 
 */
package com.personal.basedao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;

import com.personal.model.ChildInfo;

/**
 * @author koti
 *
 */
public class BaseChildInfoDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO child_Info"
			+ "( rollNo, childName, aboutChild,  childPhotoPath,updatedBy,updatedDate) values (?, ?, ?, ?, ?, ?)";

	public boolean saveChildrenInfo(ChildInfo childInfo) {
		int update = 0;
		boolean isSave = false;
		try {
			update = jdbcTemplate.update(INSERT_SQL, new Object[] {
					childInfo.getRollNo(), childInfo.getChildName(),
					childInfo.getAboutChild(), childInfo.getUpdatedBy(),
					childInfo.getUpdatedDate() });

			if (update > 0) {
				isSave = true;
			}
		} catch (Exception e) {
			return false;
		}
		return isSave;
	}

	public boolean updateChildInfo(ChildInfo childInfo) {
		int update = 0;
		boolean isUpdate = false;
		try {
			String sql = "UPDATE  child_Info  set   childName=?, aboutChild =?,  childPhotoPath =?,updatedBy=?,updatedDate =? where rollNo = ?";

			update = jdbcTemplate.update(
					sql,
					new Object[] { childInfo.getChildName(),
							childInfo.getAboutChild(),
							childInfo.getUpdatedBy(),
							childInfo.getUpdatedDate(),
							childInfo.getRollNo() });
			if (update == 0) {
				isUpdate = true;
			}
		} catch (Exception e) {

		}
		return isUpdate;

	}

	public boolean deleteChildrenInfo(int childId) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM  child_Info WHERE childId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { childId });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}
		return isDelete;
	}

	public ChildInfo getChildrenInfo(int childId) {
		try {
			String sql = "SELECT * from child_info where childId = ? ";
			List<ChildInfo> retlist = jdbcTemplate.query(sql,
					new Object[] { childId },
					ParameterizedBeanPropertyRowMapper
							.newInstance(ChildInfo.class));
			if (retlist.size() > 0)
				return retlist.get(0);
		} catch (Exception e) {

		}
		return null;
	}

	public List<ChildInfo> getChildrenInfoAll() {
		List<ChildInfo> retlist = null;
		try {
			String sql = "SELECT * from child_info  ";
			retlist = jdbcTemplate.query(sql,
					ParameterizedBeanPropertyRowMapper
							.newInstance(ChildInfo.class));

		} catch (Exception e) {

		}
		return retlist;
	}
}
