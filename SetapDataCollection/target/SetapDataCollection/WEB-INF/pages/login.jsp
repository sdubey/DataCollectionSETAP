<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Login</title>
<link rel="stylesheet" href="resources/bootstrap/js/bootstrap.min.js">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link href="resources/css/setap.css" rel="stylesheet">
</head>
<body>
	<div id="modal-header" class="modal-header">
		<h4>SETAP(Software Engineering Team work Assessment and
			Prediction) Instructor Log Data collection</h4>
	</div>
	
	
	<div class="container">
		<div class="page_content">
			<div class="row-fluid">
				<div class="span6">
					<div class="mycontent-left">
						<h4>About SETAP :</h4>
						<p>
							Some steps in the process of SETAP are currently performed
							manually on paper. This SETAP project allows
							electronic-form-based entry of instructer's logs after each
							class. Specifically, the in-class observation data.<br>
							<br> <a> Click here</a> for more details about SETAP.
						</p>

					</div>
				</div>
				<div class="span6">
					<div class="mycontent-right">
						<form class="form-signin" role="form" action="validate"
							action="validate" method="post">
							<h2 class="form-signin-heading">Please sign in</h2>
							<div class="pagination-centered">
							<input type="email" name="username" class="form-control"
								placeholder="Email address" required autofocus><br>
							<input type="password" name="password" class="form-control"
								placeholder="Password" required> <br>
								<button class="btn-primary" type="reset">Cancel</button>
								<button class="btn-primary" type="submit">Sign in</button><br>
								<br>
							</div>

							<p>For account access or login issue please mail to
								admin@setap.com
							<p>
						</form>
					</div>
				</div>
				<hr>
			</div>

			<div id="modal-footer" class="modal-footer">
				<%@ include file="footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>