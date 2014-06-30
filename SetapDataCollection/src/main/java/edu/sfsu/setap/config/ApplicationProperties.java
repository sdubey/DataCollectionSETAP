package edu.sfsu.setap.config;


public class ApplicationProperties {

	private String database;
	private String dbuser;
	private String dbpassword;
	private String driverClass;
	
	 
	public String getDriverClass() {
		return driverClass;
	}

	public void setDriverClass(String driverClass) {
		this.driverClass = driverClass;
	}

	public String getDatabase() {
		return database;
	}

	public void setDatabase(String database) {
		this.database = database;
	}

	public String getDbuser() {
		return dbuser;
	}

	public void setDbuser(String dbuser) {
		this.dbuser = dbuser;
	}

	public String getDbpassword() {
		return dbpassword;
	}

	public void setDbpassword(String dbpassword) {
		this.dbpassword = dbpassword;
	}

	public ApplicationProperties()
	{
	    this.database="jdbc:mysql://setapproject.org/student_sonal";
		this.dbpassword="sfsu2014";
		this.dbuser= "sdubey";
		this.driverClass="com.mysql.jdbc.Driver";
	
	}
	
}
