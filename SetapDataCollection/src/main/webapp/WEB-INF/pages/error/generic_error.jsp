<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>template</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/setap.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<div id="modal-header" class="modal-header"></div>
		<div class="page_content">
			<c:if test="${not empty errCode}">
				<h1>${errCode} : System Errors</h1>
			</c:if>

			<c:if test="${empty errCode}">
				<h1>System Errors</h1>
			</c:if>

			<c:if test="${not empty errMsg}">
				<h4>${errMsg}</h4>
			</c:if>

		
		</div>

		<div id="modal-footer" class="modal-footer"></div>
	</div>
</body>
</html>



