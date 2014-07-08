package edu.sfsu.setap.model;

import java.util.Date;

public class InstructorLogsBean {

	int instructorLogsId ;
	int semesterId ;
	int setapUserId ;
	int teamId ;
	Date meetingDate ;
	String meetingReason ;
	int absentMembers ;
	String absenceReason ;
	int teamLeadEffectiveness ;
	int teamEffectiveness ;
	
	public int getInstructorLogsId() {
		return instructorLogsId;
	}
	public void setInstructorLogsId(int instructorLogsId) {
		this.instructorLogsId = instructorLogsId;
	}
	public int getSemesterId() {
		return semesterId;
	}
	public void setSemesterId(int semesterId) {
		this.semesterId = semesterId;
	}
	public int getSetapUserId() {
		return setapUserId;
	}
	public void setSetapUserId(int setapUserId) {
		this.setapUserId = setapUserId;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public Date getMeetingDate() {
		return meetingDate;
	}
	public void setMeetingDate(Date meetingDate) {
		this.meetingDate = meetingDate;
	}
	public String getMeetingReason() {
		return meetingReason;
	}
	public void setMeetingReason(String meetingReason) {
		this.meetingReason = meetingReason;
	}
	public int getAbsentMembers() {
		return absentMembers;
	}
	public void setAbsentMembers(int absentMembers) {
		this.absentMembers = absentMembers;
	}
	public String getAbsenceReason() {
		return absenceReason;
	}
	public void setAbsenceReason(String absenceReason) {
		this.absenceReason = absenceReason;
	}
	public int getTeamLeadEffectiveness() {
		return teamLeadEffectiveness;
	}
	public void setTeamLeadEffectiveness(int teamLeadEffectiveness) {
		this.teamLeadEffectiveness = teamLeadEffectiveness;
	}
	public int getTeamEffectiveness() {
		return teamEffectiveness;
	}
	public void setTeamEffectiveness(int teamEffectiveness) {
		this.teamEffectiveness = teamEffectiveness;
	}
	
}
