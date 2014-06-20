package edu.sfsu.setap.model;

public class SetapUserBean implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int userId;
	String userEmailId ; 
	String password ;
	
	public SetapUserBean() {
		super();
	}
	
	public SetapUserBean(String userEmailId, String password) {
		super();
		this.userEmailId = userEmailId;
		this.password = password;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public String getUserEmailId() {
		return userEmailId;
	}
	
	public void setUserEmailId(String userEmailId) {
		this.userEmailId = userEmailId;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
}
