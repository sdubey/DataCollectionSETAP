<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/css/demo_page.css" rel="stylesheet"
	type="text/css" />
<link href="resources/css/demo_table.css" rel="stylesheet"
	type="text/css" />
<script
	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<body id="dt_example">
	<div id="container">
	   <%@ include file="header.jsp"%>
		<h1>SETAP Admin Login</h1>
		<div  id="column_broad" style="background-color:#FFFFFF;float:right;">
			<form method="post">
				<h2>LogIn in to continue</h2>
				<label>User name :<input type="text" name="username" size="20"><br></label>
				<label>Password :<input type="password" name="password" size="20"><br></label>
				<input type="Submit" value="Submit">
			</form>
	   </div>
	   <hr>
    	<div id="footer"><%@ include file="footer.jsp"%></div>
	</div>
</body>
</html>