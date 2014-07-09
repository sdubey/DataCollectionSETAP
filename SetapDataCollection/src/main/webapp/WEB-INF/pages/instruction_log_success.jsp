<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ContactUS</title>
<script src="//code.jquery.com/jquery-1.9.1.js"></script>
<script
	src="//ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link href="resources/css/setap.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<div id="modal-header" class="modal-header">
			<%@ include file="header.jsp"%>
			<h3>
				<span class="tab">Contact US</span>
			</h3>
		</div>
		<div class="page_content">
			<h2>Data for the team is added successfully to the DB, continue
				adding data for other team, Or choose accordingly from the main menu</h2>
			<h3>To Continue adding <a href="InstructorLog"> Click Here!! </a></h3>

		</div>

		<div id="modal-footer" class="modal-footer">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>