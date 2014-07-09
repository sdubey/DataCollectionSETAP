<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="edu.sfsu.setap.model.*,edu.sfsu.setap.db.*,java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>home</title>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link href="resources/css/setap.css" rel="stylesheet">


<script>

$(document).ready(function(){
	$("#select_term").change(function() {
		console.log(this.value);
		alert(this.value);
		$("#test").submit();
		});
});

</script>

</head>
<body>
	<div id="container">
		<div id="modal-header" class="modal-header">
			<%@ include file="header.jsp"%>
			<h3>
				<span class="tab">Home</span>
			</h3>
		</div>
		<div class="page_content">
			<h4>SETAP(Software Engineering Team work Assessment and
				Prediction) Data collection</h4>
			<h4>How to use this application :</h4>
			
			<form id="test" name="test" action="testAction" method="get">
			<p>
				This application provides the features to export/print/view the
				logs. <br> <br> The project mainly provides two
				functionalities :<br> <br> 
				
				Select Term/Semester (Default Selection is Current Semester) 
				
				<select name="select_term" id="select_term">
					<%
					for (Map.Entry<Integer, String> entry : DBConnectionUtil
					.getDefaultSettings(DBConnectionUtil.getConnection()).entrySet()) {
					%>
					<option value="" selected="selected"><%= entry.getValue()%></option>
					<%
			}
			for (Map.Entry<Integer, String> entry : DBConnectionUtil
					.getAllSemesters(DBConnectionUtil.getConnection()).entrySet()) {
			%>
					<option value=<%= entry.getKey()%>><%= entry.getValue()%></option>

					<%
			}
			
			%>
				</select>
				<br><br>
				
			</p>
           </form>

			a) <a href="InstructorLog">Enter Class logs</a> This feature allows
			to enter the class logs through electronic form based entries. <br>
			<br> b) <a href="export_logs"> View/Export Class logs</a> This
			feature allows to do the export/print the data of all the logs
			entered by the instructor. <br>
			<br>

		</div>

		<div id="modal-footer" class="modal-footer">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>