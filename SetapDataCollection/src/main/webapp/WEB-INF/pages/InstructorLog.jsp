<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="edu.sfsu.setap.model.*,edu.sfsu.setap.db.*,java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>InstructorLogs</title>

<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css"
	rel="stylesheet">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>

<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link href="resources/css/setap.css" rel="stylesheet">
<!-- jQuery Form Validation code -->


<script>


$(document).ready(function() {
	
    var date = new Date();

    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();

    if (month < 10) month = "0" + month;
    if (day < 10) day = "0" + day;

    var today = year + "-" + month + "-" + day;       
    $("#meeting_date").attr("value", today);

		
	$('#instructer_logs').validate({ // initialize the plugin

		rules : {
			select_instructor : {
				required : true,
			},
			select_team : {
				required : true,
			},
			Choose_absent_member : {
				required : true,
			},
			meeting_date : {
				required : true,
			},
			meetingReason : {
				required : true,
			},
			team_effectiveness : {
				required : true,
			},
			textarea_reason : {
				required : true,
			},
			team_lead_effectiveness : {
				required : true,
			}
		},

		// Specify the validation error messages

		messages : {
			select_instructor : " Please choose Instructor",
			select_team : " Please select the team number",
			textarea_reason : " Please give the reason",
			Choose_absent_member : " No of absent memeber required",
			meeting_date : " Meeting date is mandatory",
			meetingReason : " Meeting reason is mandatory",
			team_effectiveness : " Team effectiveness is mandatory",
			team_lead_effectiveness:"Team lead's effectiveness is mandatory"

		},
		errorPlacement: function(error, element) {
			   if ( element.is(":radio") || element.is(":checkbox")) {   
			     error.appendTo( element.parent());
			   } else {
			     error.insertAfter(element);
			   }
			} // end errorPlacement
	});
});


</script>

<style>
form label.error {
	display: inline;
	font: 10px Tahoma, sans-serif;
	color: #ED7476;
	margin-left: 5px
}

form input.error,form input.error:hover,form input.error:focus,form select.error,form textarea.error
	{
	border: 1px solid #ED7476;
	background: #FFEDED
}

input[type=radio] {
  display: inline;
}
</style>

</head>
<body>
	<div id="container">
		<div id="modal-header" class="modal-header">
			<%@ include file="header.jsp"%>
			<h3>
				<span class="tab">Instructor Class Log</span>
			</h3>
		</div>
		   
		<form id="instructer_logs" action="addInstruction"  method="post">
			<div class="page_content">
			   <span style="color: red;"> Section (*) are mandatory, Please check for default values of the fields</span>
				
				<h4>1 - General Information <label class="control-label" for="input"><span style="color: red;">(*)</span></label></h4> 
     
				<div class="row-fluid">
					<div class="span6">
						<div class="mycontent-left">
						<select name="select_instructor" id="select_instructor" title="Instructor">
							<option value="" selected="selected">Select Instructor</option>
							<%
							for (Map.Entry<Integer, String> entry : DBConnectionUtil
									.getInstructors(DBConnectionUtil.getConnection()).entrySet()) {
							%>		  
							<option value=<%= entry.getValue()%>><%= entry.getValue()%></option>
							<%
							}
							%>
							</select><br><br>
						
							<select  name="select_team" id="select_team">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option selected="selected" value="">Select team</option>
							</select> <br><br>
							 <input type="date" id="meeting_date">
						</div>
					</div>
					<div class="span6">
						<div class="mycontent-right">
							<h4>This recording is a (Check one of the options):</h4>
							<input type="checkbox" name="meetingReason" value="Regular scrum" checked> Regular scrum team meeting<br> 
							<input type="checkbox" name="meetingReason" value="Extra team Meeting"> Extra team Meeting<br>
							<input type="checkbox" name="meetingReason" value="Teamwork Issue">Teamwork Issue<br> 
							<input type="checkbox" name="meetingReason" value="Other" class="required">Other <br>
						</div>
					</div>
				</div>
				<hr>
			    <h4>2 - Attendance <label class="control-label" for="input"><span style="color: red;">(*)</span></label></h4> 
     
     			<div class="row-fluid">
					<div class="span6">
						<div class="mycontent-left">
							<select name="Choose_absent_member" title="Choose Number" name="Choose_absent_member" id="Choose_absent_member">
								<option value="" selected="selected">Select No. of absent member</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>
					</div>
					<div class="span6">
						<div class="mycontent-right">
						    <input type="text" class="form-control" placeholder="Type Reason for absence here">
						</div>
					</div>
				</div>
				<hr>
				<h4>3 - Effectiveness <label class="control-label" for="input"><span style="color: red;">(*)</span></label></h4> 
     
				<div class="row-fluid">
					<div class="span6">
						<div class="mycontent-left">
							<p>Team's effectiveness : (1 poor, 5 excellent) </p>
							 
							<input type="radio" name="team_effectiveness"  value="1"> 1
							<input type="radio" name="team_effectiveness"  value="2"> 2
							<input type="radio" name="team_effectiveness"  value="3"> 3
							<input type="radio" name="team_effectiveness" value="4"> 4
							<input type="radio" name="team_effectiveness" value="5" > 5
							
						</div>
					</div>

					<div class="span6">
						<div class="mycontent-right">
							<p>Team Lead's effectiveness : (1 poor, 5 excellent)</p>
							<h6>Below Expect  At Expect      Above Expect</h6><br>
						 
						 	<input type="radio" name="team_lead_effectiveness"  value="1"> 1
							<input type="radio" name="team_lead_effectiveness"  value="2"> 2
							<input type="radio" name="team_lead_effectiveness"  value="3"> 3
							<input type="radio" name="team_lead_effectiveness" value="4"> 4
							<input type="radio" name="team_lead_effectiveness" value="5" > 5
						
						</div>
					</div>
				</div>
				<hr>
				<h4>4 - Checkpoints (Optional)</h4>
				<div class="row-fluid">
					<div class="span12">
						<a href="checkpoints">Manage Checkpoints ( Create , Delete ,
							Modify )</a>
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
		</form>
		<div id="modal-footer" class="modal-footer">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>