package edu.sfsu.setap.model;

public class CheckPointBean {

	public String check_pointID; 
	public String class_session;
	public String team_number;
	public String creation_date;
	public String due_date;
	public String issue_status;
	public String closed_date;
	public String description;
	public String email_notification;

	public String getCheck_pointID() {
		return check_pointID;
	}
	public String getClass_session() {
		return class_session;
	}
	public String getTeam_number() {
		return team_number;
	}
	public String getCreation_date() {
		return creation_date;
	}
	public String getDue_date() {
		return due_date;
	}
	public String getIssue_status() {
		return issue_status;
	}
	public String getClosed_date() {
		return closed_date;
	}
	public String getDescription() {
		return description;
	}
	public String getEmail_notification() {
		return email_notification;
	}
	public void setCheck_pointID(String check_pointID) {
		this.check_pointID = check_pointID;
	}
	public void setClass_session(String class_session) {
		this.class_session = class_session;
	}
	public void setTeam_number(String team_number) {
		this.team_number = team_number;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}
	public void setIssue_status(String issue_status) {
		this.issue_status = issue_status;
	}
	public void setClosed_date(String closed_date) {
		this.closed_date = closed_date;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setEmail_notification(String email_notification) {
		this.email_notification = email_notification;
	}
}
