package edu.sfsu.setap.model;

public class InstructionLogBean {

	String instructor;
	int team;
	String meeting_date;
	String meetingReason;
	int absent_member;
	String textarea_reason;
	int team_lead_effectiveness;
	int team_effectiveness;
	String Semester;
	int  log_id ;

	public int getLog_id() {
		return log_id;
	}

	public void setLog_id(int log_id) {
		this.log_id = log_id;
	}

	public int getAbsent_member() {
		return absent_member;
	}

	public void setAbsent_member(int absent_member) {
		this.absent_member = absent_member;
	}

	public String getSemester() {
		return Semester;
	}

	public void setSemester(String semester) {
		Semester = semester;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public int getTeam() {
		return team;
	}

	public void setTeam(int team) {
		this.team = team;
	}

	public String getMeeting_date() {
		return meeting_date;
	}

	public void setMeeting_date(String meeting_date) {
		this.meeting_date = meeting_date;
	}

	public String getMeetingReason() {
		return meetingReason;
	}

	public void setMeetingReason(String meetingReason) {
		this.meetingReason = meetingReason;
	}

	public String getTextarea_reason() {
		return textarea_reason;
	}

	public void setTextarea_reason(String textarea_reason) {
		this.textarea_reason = textarea_reason;
	}

	public int getTeam_lead_effectiveness() {
		return team_lead_effectiveness;
	}

	public void setTeam_lead_effectiveness(int team_lead_effectiveness) {
		this.team_lead_effectiveness = team_lead_effectiveness;
	}

	public int getTeam_effectiveness() {
		return team_effectiveness;
	}

	public void setTeam_effectiveness(int team_effectiveness) {
		this.team_effectiveness = team_effectiveness;
	}

}
