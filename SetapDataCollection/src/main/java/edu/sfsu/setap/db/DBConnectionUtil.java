package edu.sfsu.setap.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServlet;
import edu.sfsu.setap.model.CheckPointBean;
import edu.sfsu.setap.model.InstructorLogsBean;
import edu.sfsu.setap.config.ApplicationProperties;
public class DBConnectionUtil extends HttpServlet {
	
	
	
	private static final long serialVersionUID = 1L;

	
	public static boolean isValidUser(Connection connection, String user_id,
			String password) {
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int rsCount = 0;
		try {
			String selectStatement = "select * from setap_users where user_name=? and password=?";

			preparedStatement = connection.prepareStatement(selectStatement);
			preparedStatement.setString(1, user_id);
			preparedStatement.setString(2, password);
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				rsCount++;
			}

			if (rsCount > 0) {
				return true;
			}

		} catch (SQLException e) {
			System.out.println(e);
			System.out.println("Exception occured ");
		}
		return false;
	}

	
	public static int addInstructiorLogs(Connection connection,
			InstructorLogsBean instructor_log) {
		int autoIncKeyFromFunc = -1;
		PreparedStatement preparedStatement = null;
		Statement stmt = null;
		ResultSet rs = null;

		String inserStatement = "insert into instructorLogs values(null,?,?,?,?,?,?,?,?,?)";
		
		try {
			preparedStatement = connection.prepareStatement(inserStatement);

			stmt = connection.createStatement();
			preparedStatement.setInt(1, instructor_log.getSemesterId());
			preparedStatement.setInt(2, instructor_log.getSetapUserId());
			preparedStatement.setInt(3, instructor_log.getTeamId());
			preparedStatement.setString(4,  instructor_log.getMeetingDate());
			preparedStatement.setString(5, instructor_log.getMeetingReason());
			preparedStatement.setInt(6, instructor_log.getAbsentMembers());
			preparedStatement.setString(7,instructor_log.getAbsenceReason());
			preparedStatement.setInt(8, instructor_log.getTeamLeadEffectiveness());
			preparedStatement.setInt(9, instructor_log.getTeamEffectiveness());
			
			System.out.println("prepared ststement is " + preparedStatement);

			preparedStatement.executeUpdate();

			rs = stmt.executeQuery("SELECT LAST_INSERT_ID()");

			if (rs.next()) {
				autoIncKeyFromFunc = rs.getInt(1);
			} else {
			}

			rs.close();

			System.out.println("Key returned from "
					+ "'SELECT LAST_INSERT_ID()': " + autoIncKeyFromFunc);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return autoIncKeyFromFunc;

	}
	
	
	public static int addRecord(Connection connection, CheckPointBean checkpoint) {
		int autoIncKeyFromFunc = -1;
		PreparedStatement preparedStatement = null;
		Statement stmt = null;
		ResultSet rs = null;

		
		String insertSQL = "INSERT INTO checkpoints" +
				"(checkPointID," +
				"teamId," +
				"creationDate," +
				"dueDate," +
				"issueStatus," +
				"closedDate," +
				"description," +
				"emailNotificationStatus) " +
				"VALUES (null,?,?,?,?,?,?,?)";

		
		System.out.println("insertSQL " + insertSQL);

		try {
			preparedStatement = connection.prepareStatement(insertSQL);

			stmt = connection.createStatement();
			
			preparedStatement.setInt(1, checkpoint.getTeamId());
			preparedStatement.setString(2, checkpoint.getCreationDate());
			preparedStatement.setString(3, checkpoint.getDueDate());
			preparedStatement.setString(4, checkpoint.getIssueStatus());
			preparedStatement.setString(5, checkpoint.getClosedDate());
			preparedStatement.setString(6, checkpoint.getDescription());
			preparedStatement.setString(7, "N");

			System.out.println("prepared ststement is " + preparedStatement);

			preparedStatement.executeUpdate();

			rs = stmt.executeQuery("SELECT LAST_INSERT_ID()");

			if (rs.next()) {
				autoIncKeyFromFunc = rs.getInt(1);
			} else {
			}

			rs.close();

			System.out.println("Key returned from "
					+ "'SELECT LAST_INSERT_ID()': " + autoIncKeyFromFunc);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return autoIncKeyFromFunc;
	}

	public static Connection getConnection() throws SQLException,
			ClassNotFoundException {
		Connection connection = null;
		
		ApplicationProperties prop = new ApplicationProperties();


		System.out.println("Driver Class is "+ prop.getDriverClass());
		System.out.println("user name is "+ prop.getDbuser());
		System.out.println("password is "+ prop.getDbpassword());
		System.out.println("db url is "+ prop.getDatabase());
		
		System.out.println(prop.getDbuser());
		System.out.println(prop.getDbpassword());
		System.out.println(prop.getDatabase());
	
		
		
		Class.forName(prop.getDriverClass());
		
		connection = DriverManager.getConnection(
				prop.getDatabase(), prop.getDbuser(),prop.getDbpassword());

		return connection;
	}

	public static void updateCheckpointRecord(int id, Connection connection,
			String updatedValue, int colIdx) throws SQLException {
		String field = null;

		if (colIdx == 0)
			field = "issueStatus";
		else if (colIdx == 1)
			field = "teamId";
		else if (colIdx == 2)
			field = "creationDate";
		else if (colIdx == 3)
			field = "dueDate";
		else if (colIdx == 4)
			field = "closedDate";
		else if (colIdx == 5)
			field = "description";
		else {
		}
		PreparedStatement preparedStatement = null;
		String updateStatement = "update checkpoints set " + field
				+ " = ? where checkPointID = " + id;

		preparedStatement = connection.prepareStatement(updateStatement);
		preparedStatement.setString(1, updatedValue);
		preparedStatement.executeUpdate();
		System.out.println(updateStatement);

	}

	public static void deleteRecord(int id, Connection connection) {
		PreparedStatement preparedStatement = null;

		String deleteSQL = "delete from checkpoints where checkPointID = ?";
		try {
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, id);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	
	public static List<CheckPointBean> getDBData(Connection connection) {
		Statement statement = null;
		ResultSet resultSet = null;
		List<CheckPointBean> lst = new ArrayList<CheckPointBean>();

		try {

			statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from checkpoints");

			while (resultSet.next()) {
				CheckPointBean obj = new CheckPointBean();
				obj.setCheckPointID(Integer.parseInt(resultSet.getString("checkPointID")));
				obj.setTeamId(Integer.parseInt(resultSet.getString("teamId")));
				obj.setCreationDate(resultSet.getString("creationDate"));
				obj.setClosedDate(resultSet.getString("closedDate"));
				obj.setDueDate(resultSet.getString("dueDate"));
				obj.setIssueStatus(resultSet.getString("issueStatus"));
				obj.setDescription(resultSet.getString("description"));
				obj.setEmailNotificationStatus(resultSet
						.getString("emailNotificationStatus"));
				
				lst.add(obj);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lst;

	}
	
	public static List<InstructorLogsBean> getInstructionLogData(
			Connection connection) {
		Statement statement = null;
		ResultSet resultSet = null;
		List<InstructorLogsBean> lst = new ArrayList<InstructorLogsBean>();

		try {

			statement = connection.createStatement();
			resultSet = statement.executeQuery("select * from instructorLogs");

			while (resultSet.next()) {
				InstructorLogsBean instructorLogs = new InstructorLogsBean();
				
				instructorLogs.setInstructorLogsId(resultSet.getInt("instructorLogsId"));
				instructorLogs.setSemesterId(resultSet.getInt("semesterId"));
				instructorLogs.setSetapUserId(resultSet.getInt("setapUserId"));
				instructorLogs.setTeamId(resultSet.getInt("teamId"));
				instructorLogs.setMeetingDate(resultSet.getString("meetingDate"));
				instructorLogs.setMeetingReason(resultSet.getString("meetingReason"));
				instructorLogs.setAbsentMembers(resultSet.getInt("absentMember"));
				instructorLogs.setTeamEffectiveness(resultSet.getInt("teamEffectiveness"));
				instructorLogs.setTeamLeadEffectiveness(resultSet.getInt("teamEffectiveness"));
				
				
				lst.add(instructorLogs);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lst;

	}
	
	
	public static HashMap<Integer,String> getDefaultSettings(
			Connection connection) {
		Statement statement = null;
		ResultSet resultSet = null;
		HashMap<Integer,String> map = new HashMap<Integer,String>();

		try {

			statement = connection.createStatement();
			resultSet = statement.executeQuery("select semester.semesterId,semester.abbreviation  from semester,defaultSettings " +
					"where semester.SemesterId = defaultSettings.currentSemester;");

			while (resultSet.next()) {
								
			map.put(resultSet.getInt("SemesterId"), resultSet.getString("abbreviation"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;

	}

	
	
	public static HashMap<Integer,String> getInstructors(
			Connection connection) {
		Statement statement = null;
		ResultSet resultSet = null;
		HashMap<Integer,String> map = new HashMap<Integer,String>();

		try {
			
			statement = connection.createStatement();
			String query ="select instructor.instructorId,CONCAT(setapUserConfidential.nameFirst,\" \",setapUserConfidential.nameLast)" +
					" from setapUserConfidential,setapUser,instructor where setapUserConfidential.setapUserConfidentialId =  setapUser.setapUserConfidentialId " +
					"and instructor.setapUserId = setapUser.setapUserId";
			resultSet = statement.executeQuery(query);

			while (resultSet.next()) {
								
			map.put(resultSet.getInt(1), resultSet.getString(2));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;

	}
	
	public static HashMap<Integer,String> getAllSemesters(
			Connection connection) {
		Statement statement = null;
		ResultSet resultSet = null;
		HashMap<Integer,String> map = new HashMap<Integer,String>();

		try {

			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM  `semester` ");

			while (resultSet.next()) {
								
			map.put(resultSet.getInt("semesterId"), resultSet.getString("abbreviation"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return map;

	}
	
}