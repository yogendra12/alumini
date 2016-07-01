package com.personal.basemodel;

import java.util.Date;

public class BaseEvents {
	protected int eventId;
	protected String eventName;
	protected String eventDescription;
	protected Date eventDate;
	protected String updatedBy;
	protected Date updatedDate;
	protected String eventPhotosPath;

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventDescription() {
		return eventDescription;
	}

	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}

	public Date getEventDate() {
		return eventDate;
	}

	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public String getEventPhotosPath() {
		return eventPhotosPath;
	}

	public void setEventPhotosPath(String eventPhotosPath) {
		this.eventPhotosPath = eventPhotosPath;
	}
}