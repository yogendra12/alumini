package com.personal.basedao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedBeanPropertyRowMapper;
import org.springframework.transaction.annotation.Transactional;

import com.personal.model.Events;

public class BaseEventsDao {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public final String INSERT_SQL = "INSERT INTO events( eventName, eventDescription, eventDate, updatedBy, updatedDate, eventPhotosPath) values (?, ?, ?, ?, ?, ?)";

	/* this should be conditional based on whether the id is present or not */
	@Transactional
	public boolean save(final Events events) {
		boolean isSave = false;
		try{
		if (events.getEventDate() == null) {
			events.setEventDate(new Date());
		}
		java.sql.Timestamp eventDate = new java.sql.Timestamp(events
				.getEventDate().getTime());

		if (events.getUpdatedDate() == null) {
			events.setUpdatedDate(new Date());
		}
		java.sql.Timestamp updatedDate = new java.sql.Timestamp(events
				.getUpdatedDate().getTime());

		int insert = jdbcTemplate.update(
				INSERT_SQL,
				new Object[] {  events.getEventName(),
						events.getEventDescription(), eventDate,events.getUpdatedBy(), updatedDate,
						events.getEventPhotosPath() });
		if (insert > 0) {
			isSave = true;
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isSave;
	}

	public boolean updateEvent(Events events) {
		boolean isUpdate = false;
		try {
			String sql = "UPDATE events  set eventName = ? ,eventDescription = ? ,eventDate = ? ,updatedBy = ? ,updatedDate = ? ,eventPhotosPath = ?  where   eventId =? ";

			int update = jdbcTemplate.update(
					sql,
					new Object[] { events.getEventName(),
							events.getEventDescription(),
							events.getEventDate(), events.getUpdatedBy(),
							events.getUpdatedDate(),
							events.getEventPhotosPath(), events.getEventId() });
			if (update > 0) {
				isUpdate = true;
			}

		} catch (Exception e) {

		}

		return isUpdate;
	}

	public boolean deleteEvent(int id) {
		boolean isDelete = false;
		try {
			String sql = "DELETE FROM events WHERE eventId=?";
			int delete = jdbcTemplate.update(sql, new Object[] { id });
			if (delete > 0) {
				isDelete = true;
			}
		} catch (Exception e) {

		}

		return isDelete;
	}

	public Events getEvent(int id) {
		List<Events> retlist = null;
		try {
			String sql = "SELECT * from events where eventId = ? ";
			retlist = jdbcTemplate.query(sql, new Object[] {id},
					ParameterizedBeanPropertyRowMapper
							.newInstance(Events.class));
			if (retlist.size() > 0)
				return retlist.get(0);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public List<Events> getAll() {
		List<Events> retlist = null;
		try {
			String sql = "SELECT * from events";
			retlist = jdbcTemplate.query(sql,
					ParameterizedBeanPropertyRowMapper
							.newInstance(Events.class));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return retlist;
	}

}
