<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>email</title>
<link rel="stylesheet" href="resources/bootstrap/js/bootstrap.min.js">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link href="resources/css/setap.css" rel="stylesheet">
</head>
<div id="container">
		<div id="modal-header" class="modal-header">
			<%@ include file="header.jsp"%>
			
			<form action="checkpoints" method="get">
		    <p>Email address: <input name="email" value="jDoe@mail.sfsu.edu"></p>
		    <p>Mail subject: <input name="subject" value="OPEN -Checkpoint- 2014-03-19 -Team 5"></p>
		    <p>Mail message: <textarea name ="text_area" >this is a sample check point</textarea></p>
		    <p>Creation date: <input name=cdtae value=2014-03-19></p>
		    <p>due date <input name="ddate" value="2014-03-29"></p>
		    <p><input type="reset" value="Cancel" align="right" >
		    <input type="submit"  value = "send mail" align="right" ></p>
		    <br><br>
		</form>
			
		</div>
			<div id="modal-footer" class="modal-footer">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>