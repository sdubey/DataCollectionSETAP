<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>InstructorLogs</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="resources/bootstrap/js/bootstrap.min.js">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link href="resources/css/setap.css" rel="stylesheet">

</head>
<body>
	<div id="container">
		<div id="modal-header" class="modal-header">
			<%@ include file="header.jsp"%>
			<h3><span class="tab">Instructor Class Log</span></h3>
		</div>
	<form id="instructer_logs" action="addInstruction"  method="post">
		<div class="page_content">
			<h4>1 - General Information</h4>
			<div class="row-fluid">
				<div class="span6">
					<div class="mycontent-left">
						<select name="select_instructor" title="Instructor">
							<option value="Marc">Marc</option>
							<option value="John">John</option>
							<option value="Maria">Maria</option>
							<option value="4" selected="selected">Select Instructor</option>				
						</select><br> 
						<select class="form-control" name="select_team">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option selected="selected">Select team</option>
						</select> <br> <input type="date" class="form-control"
							placeholder="Select Date" name="meeting_date">
					</div>
				</div>
				<div class="span6">
					<div class="mycontent-right">
						<p>This recording is a (Check one):</p>
						<input type="checkbox" name="meetingReason" value="Regular scrum">Regular
						scrum team meeting<br> <input type="checkbox"
							name="meetingReason" value="Extra team Meeting"> Extra
						team Meeting<br> <input type="checkbox" name="meetingReason"
							value="Teamwork Issue">Teamwork Issue<br> <input
							type="checkbox" name="meetingReason" value="Other">Other
					</div>
				</div>
			</div>
			<hr>
			<h4>2 - Attendance</h4>
			<div class="row-fluid">
				<div class="span6">
					<div class="mycontent-left">
						<select name="Choose_absent_member" title="Choose Number" name="Choose_absent_member" >
							<option value="1" selected="selected">Select No. of absent member</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
					</div>
				</div>
				<div class="span6">
					<div class="mycontent-right">
						<textarea class="form-control" rows="2"  name="textarea_reason" >Type Reason for absence here</textarea>
					</div>	
				</div>
			</div>
			<hr>
			<h4>3 - Effectiveness</h4>
			<div class="row-fluid">
				<div class="span6 radio-inline">
					<div class="mycontent-left">
						<p>Team's effectiveness : (1 poor, 5 excellent)</p>
						 Below &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  
						 &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp At  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Above<br>
						 Expectataion &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Expectataion&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Expectataion<br>
						<label class="checkbox-inline">
						 <input type="radio" name="team_effectiveness" value="1"> 1 &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						 <input type="radio" name="team_effectiveness" value="2"> 2 &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						 <input type="radio" name="team_effectiveness" value="3"> 3 &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						 <input type="radio" name="team_effectiveness" value="4"> 4 &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						 <input type="radio" name="team_effectiveness" value="5"> 5
						</label>
					</div>
				</div>
				
				<div class="span6 radio-inline">
					<div class="mycontent-right">
						<p>Team Lead's effectiveness : (1 poor, 5 excellent)</p>
						 Below &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp  
						 &nbsp&nbsp&nbsp &nbsp&nbsp&nbsp At  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Above<br>
						 Expectataion &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Expectataion&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
						 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Expectataion<br>
						<label class="checkbox-inline">
						 <input type="radio" name="team_lead_effectiveness" value="1"> 1 &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						 <input type="radio" name="team_lead_effectiveness" value="2"> 2 &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						 <input type="radio" name="team_lead_effectiveness" value="3"> 3 &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						 <input type="radio" name="team_lead_effectiveness" value="4"> 4 &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
						 <input type="radio" name="team_lead_effectiveness" value="5"> 5
						</label>
					</div>
				</div>
			</div>
			<hr>
			<h4>4 - Checkpoints (Optional) </h4>
			<div class="row-fluid">
				<div class="span12">
					<a href="checkpoints">Manage Checkpoints ( Create , Delete , Modify )</a>
					<!-- <div class="icon-question-sign" title="help"></div> -->	
				</div>
			</div>

			<div class="row-fluid">
				<div class="span12">
					<button class="btn-primary btn-right-submit" type="submit">Submit</button>
						<br>
				</div>
			</div>
		</div>
		<hr>
		<div class="page_content"></div>
		</form>
		<div id="modal-footer" class="modal-footer">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>