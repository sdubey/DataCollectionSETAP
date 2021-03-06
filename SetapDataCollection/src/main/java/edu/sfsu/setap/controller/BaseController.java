package edu.sfsu.setap.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.sfsu.setap.db.DBConnectionUtil;
import edu.sfsu.setap.exception.CustomGenericException;
import edu.sfsu.setap.model.CheckPointBean;
import edu.sfsu.setap.model.InstructorLogsBean;

@Controller
@RequestMapping("/")
public class BaseController {

	
	
	@RequestMapping(value = "/{type:.+}", method = RequestMethod.GET)
	public ModelAndView getPages(@PathVariable("type") String type)
		throws Exception {
 
	  if ("error".equals(type)) {
		// go handleCustomException
		throw new CustomGenericException("E888", "This is custom message");
	  } else if ("io-error".equals(type)) {
		// go handleAllException
		throw new IOException();
	  } else {
		return new ModelAndView("error").addObject("msg", type);
	  }
 
	}
	
	
	@ExceptionHandler(CustomGenericException.class)
	public ModelAndView handleCustomException(CustomGenericException ex) {
 
		ModelAndView model = new ModelAndView("error/generic_error");
		model.addObject("errCode", ex.getErrCode());
		model.addObject("errMsg", ex.getErrMsg());
 
		return model;
 
	}
 
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception ex) {
 
		ModelAndView model = new ModelAndView("error/generic_error");
		model.addObject("errMsg", ex.getLocalizedMessage());
		
		return model;
 
	}
	
	
	@RequestMapping(value = "/testAction", method = RequestMethod.GET)
	public ModelAndView testAction(HttpServletRequest request,
			HttpServletResponse response) {
		
		String term = request.getParameter("select_term"); 
		System.out.println(request.getParameter("select_term"));
		System.out.println("I am here yuhoooooo");
		HttpSession session = request.getSession();
		session.setAttribute("term", term);
		ModelAndView model = new ModelAndView("home");
		return model;
		
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public ModelAndView test(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("error");

		return model;

	}

	@RequestMapping(value = "/signout", method = RequestMethod.GET)
	public ModelAndView signout(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("login");
		HttpSession session = request.getSession(false);
		session.invalidate();
		return model;

	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView getHome(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = null;
		HttpSession session = request.getSession(false);

		if (session.getAttribute("user") == null) {
			model = new ModelAndView("login");
		} else {
			model = new ModelAndView("home");
		}
		return model;
	}
	
	
	
	@RequestMapping(value = "/validate", method = RequestMethod.POST)
	public ModelAndView validateData(HttpServletRequest request,
			HttpServletResponse response) throws SQLException, ClassNotFoundException {

		ModelAndView model = new ModelAndView();
		String user = request.getParameter("username");
		String password = request.getParameter("password");

		try {

			if (DBConnectionUtil.isValidUser(DBConnectionUtil.getConnection(),
					user, password)) {
				model.setViewName("home");

				HttpSession session = request.getSession();
				session.setAttribute("user", user);

			} else {
				String message = "OOps!!! Invalid Username/Password";
				request.setAttribute("message", message);
				model.setViewName("login");
			}
		} catch (SQLException e) {
			throw e;
		} catch (ClassNotFoundException e) {
			throw e;
		} catch (Exception e) {
			throw e;
		}

		return model;
	}

	
	@RequestMapping(value = "/addInstruction", method = RequestMethod.POST)
	public ModelAndView addInstruction(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("instruction_log_success");

		HttpSession session = request.getSession(false);

		if (session.getAttribute("user") == null) {
			model = new ModelAndView("login");
		} else {

			int instructorId = Integer.parseInt(request.getParameter("select_instructor"));
			int teamId = Integer.parseInt(request.getParameter("select_team"));
			String meetingDate = request.getParameter("meeting_date");
			String meetingReason = request.getParameter("meetingReason");
			int absentMember = Integer.parseInt(request
					.getParameter("Choose_absent_member"));
			String absenceReason = request.getParameter("textarea_reason");
			int teamLeadEffectiveness = Integer.parseInt(request
					.getParameter("team_lead_effectiveness"));
			int teamEffectiveness = Integer.parseInt(request
					.getParameter("team_effectiveness"));

			InstructorLogsBean instruction_bean = new InstructorLogsBean();
			
			
			System.out.println("instructorId "+ instructorId);
			System.out.println("teamId "+ teamId);
			System.out.println("meeting_date "+ meetingDate);
			System.out.println("meetingReason "+ meetingReason);
			System.out.println("absent_member "+ absentMember);
			System.out.println("textarea_reason "+ absenceReason);
			System.out.println("team_lead_effectiveness "+ teamLeadEffectiveness);
			System.out.println("team_effectiveness "+ teamEffectiveness);

			instruction_bean.setSemesterId(6);
			instruction_bean.setSetapUserId(instructorId);
			instruction_bean.setTeamId(teamId);
			instruction_bean.setMeetingDate(meetingDate);
			instruction_bean.setMeetingReason(meetingReason);
			instruction_bean.setAbsentMembers(absentMember);
			if (absenceReason!=null)
			{
			instruction_bean.setAbsenceReason(absenceReason);
			}else
			{
				instruction_bean.setAbsenceReason("No Reason provided");
			}
			instruction_bean.setTeamLeadEffectiveness(teamLeadEffectiveness);
			instruction_bean.setTeamEffectiveness(teamEffectiveness);
			
			try {
				DBConnectionUtil.addInstructiorLogs(DBConnectionUtil.getConnection(), instruction_bean);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
		}

		return model;
	}


	/*@RequestMapping(value = "/addInstruction", method = RequestMethod.POST)
	public ModelAndView addInstruction(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("instruction_log_success");

		HttpSession session = request.getSession(false);

		if (session.getAttribute("user") == null) {
			model = new ModelAndView("login");
		} else {

			String instructor = request.getParameter("select_instructor");
			int team = Integer.parseInt(request.getParameter("select_team"));
			String meeting_date = request.getParameter("meeting_date");
			String meetingReason = request.getParameter("meetingReason");
			int absent_member = Integer.parseInt(request
					.getParameter("Choose_absent_member"));
			String textarea_reason = request.getParameter("textarea_reason");
			int team_lead_effectiveness = Integer.parseInt(request
					.getParameter("team_lead_effectiveness"));
			int team_effectiveness = Integer.parseInt(request
					.getParameter("team_effectiveness"));

			InstructionLogBean instruction_bean = new InstructionLogBean();
			instruction_bean.setInstructor(instructor);
			instruction_bean.setTeam(team);
			instruction_bean.setMeeting_date(meeting_date);
			instruction_bean.setMeetingReason(meetingReason);
			instruction_bean.setAbsent_member(absent_member);
			instruction_bean.setTextarea_reason(textarea_reason);
			instruction_bean.setTeam_effectiveness(team_effectiveness);
			instruction_bean
					.setTeam_lead_effectiveness(team_lead_effectiveness);

			try {
				DBConnectionUtil.addRecordInstruction(
						DBConnectionUtil.getConnection(), instruction_bean);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}

		return model;
	}*/

	@RequestMapping(value = "/deleteRecord", method = RequestMethod.GET)
	public void DeleteData(HttpServletRequest request,
			HttpServletResponse response) {

		int id = Integer.parseInt(request.getParameter("id"));

		try {
			DBConnectionUtil.deleteRecord(id, DBConnectionUtil.getConnection());
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/addRecord", method = RequestMethod.POST)
	public ModelAndView AddData(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("create_update_checkpoint");
		HttpSession session = request.getSession(false);
		SimpleDateFormat fromUser = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MM-dd");

		if (session.getAttribute("user") == null) {
			model = new ModelAndView("login");
		} else {

			int teamNumber = Integer.parseInt(request.getParameter("team_number"));
			String creationDate = request.getParameter("creation_date");
			String dueDate = request.getParameter("due_date");
			String issueStatus = request.getParameter("issue_status");
			String closedDate = request.getParameter("closed_date");
			String description = request.getParameter("description");

			
			
			System.out.println("team_number "+teamNumber);
			System.out.println("creation_date"+creationDate);
			System.out.println("due_date"+dueDate);
			System.out.println("issue_status"+issueStatus);
			System.out.println("closed_date"+closedDate);
			System.out.println("description"+description);
			
			
			try {

				CheckPointBean check_point = new CheckPointBean();
				check_point.setTeamId(2);
				check_point.setCreationDate(myFormat.format(fromUser.parse(creationDate)));
				check_point.setDueDate(myFormat.format(fromUser.parse(dueDate)));
				check_point.setClosedDate(myFormat.format(fromUser.parse(closedDate)));
				check_point.setDescription(description);
				check_point.setIssueStatus(issueStatus);

				int id = DBConnectionUtil.addRecord(
						DBConnectionUtil.getConnection(), check_point);
				response.getWriter().print(id);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}
		return model;

	}

	@RequestMapping(value = "/updateRecord", method = RequestMethod.POST)
	public void UpdateData(HttpServletRequest request,
			HttpServletResponse response) {

		int id = Integer.parseInt(request.getParameter("id"));

		try {
			DBConnectionUtil.updateCheckpointRecord(id,
					DBConnectionUtil.getConnection(),
					request.getParameter("value"),
					Integer.parseInt(request.getParameter("columnId")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/export_logs", method = RequestMethod.GET)
	public ModelAndView getExport_logs(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("export_logs");

		HttpSession session = request.getSession(false);

		if (session.getAttribute("user") == null) {
			model = new ModelAndView("login");
		}

		return model;

	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public ModelAndView getTests(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("about");
		HttpSession session = request.getSession(false);

		if (session.getAttribute("user") == null) {

			model = new ModelAndView("login");
		}
		return model;

	}

	@RequestMapping(value = "/privacy", method = RequestMethod.GET)
	public ModelAndView getPrivecy(HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession(false);

		ModelAndView model = new ModelAndView("privacy");

		if (session.getAttribute("user") == null) {
			model = new ModelAndView("login");
		}

		return model;

	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView getPages() {

		ModelAndView model = new ModelAndView("login");
		return model;

	}

	@RequestMapping(value = "/terms_conditions", method = RequestMethod.GET)
	public ModelAndView getTermsConditions() {
		ModelAndView model = new ModelAndView("terms_conditions");
		return model;

	}

	@RequestMapping(value = "/checkpoints", method = RequestMethod.GET)
	public ModelAndView getCounselor() {
		ModelAndView model = new ModelAndView("create_update_checkpoint");
		return model;

	}

	@RequestMapping(value = "/admin_login", method = RequestMethod.GET)
	public ModelAndView getAdminLogin() {

		ModelAndView model = new ModelAndView("admin_login");
		return model;

	}

	@RequestMapping(value = "/create_checkpoint", method = RequestMethod.GET)
	public ModelAndView getCreate_checkpoint() {

		ModelAndView model = new ModelAndView("create_checkpoint");
		return model;

	}

	@RequestMapping(value = "/InstructorLog", method = RequestMethod.GET)
	public ModelAndView getInstructorLog() {

		ModelAndView model = new ModelAndView("InstructorLog");
		return model;

	}

	@RequestMapping(value = "/about_setap", method = RequestMethod.GET)
	public ModelAndView getSetap() {

		ModelAndView model = new ModelAndView("about_setap");
		return model;

	}

	@RequestMapping(value = "/ContactUs", method = RequestMethod.GET)
	public ModelAndView getContactUs(HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView model = new ModelAndView("contactUs");
		HttpSession session = request.getSession(false);

		if (session.getAttribute("user") == null) {
			model = new ModelAndView("login");
		}
		return model;

	}

	@RequestMapping(value = "/sendemail", method = RequestMethod.POST)
	public ModelAndView sendEmail(HttpServletRequest request,
			HttpServletResponse response) {
		int checkPointId = Integer.parseInt(request
				.getParameter("checkPointId"));
		ModelAndView model = new ModelAndView("email");
		System.out.println("yup, I came inside send email function!");
		System.out.println("id is: " + checkPointId);
		return model;
	}

}