package edu.sfsu.setap.model;

public class CheckPointBean {

	int checkPointID;
	int teamId ;
	String creationDate;
	String dueDate;
	String issueStatus;
	String closedDate;
	String description;
	String emailNotificationStatus;
	
	public int getCheckPointID() {
		return checkPointID;
	}
	public void setCheckPointID(int checkPointID) {
		this.checkPointID = checkPointID;
	}
	
	public String getCreationDate() {
		return creationDate;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public void setCreationDate(String creationDate) {
		this.creationDate = creationDate;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getIssueStatus() {
		return issueStatus;
	}
	public void setIssueStatus(String issueStatus) {
		this.issueStatus = issueStatus;
	}
	public String getClosedDate() {
		return closedDate;
	}
	public void setClosedDate(String closedDate) {
		this.closedDate = closedDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmailNotificationStatus() {
		return emailNotificationStatus;
	}
	public void setEmailNotificationStatus(String emailNotificationStatus) {
		this.emailNotificationStatus = emailNotificationStatus;
	}

}
