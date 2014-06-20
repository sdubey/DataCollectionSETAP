<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Makes "field" always required. Nothing and blanks are
	invalid.</title>
<link rel="stylesheet"
	href="http://jquery.bassistance.de/validate/demo/site-demos.css">
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/setap.css" rel="stylesheet">
</head>
<body>
	<div id="container">
		<div class="page_content">
			<form method="post" id="myForm" name="myForm">
				<h2 class="widgettitle2" style="margin: 13px 0px 2px 0px">Contact
					Us</h2>
				<p class="legend">
					<strong>Note:</strong> Required fields are marked with an asterisk
					(<em>*</em>)
				</p>
				<fieldset>
					<legend>[ Your Details ] </legend>
					<div>
						<label for="name">Name<em>*</em></label> <input tabindex="1"
							size="40" type="text" name="name" id="name" />
					</div>
					<div>
						<label for="email">Email Id<em>*</em></label> <input tabindex="2"
							size="40" type="text" name="email" id="email" />
					</div>
					<div>
						<label for="contactnumber">Contact Number</label> <input
							tabindex="3" size="40" type="text" name="contactnumber"
							id="contactnumber" />
					</div>
					<div>
						<label for="city">City<em>*</em></label> <input tabindex="4"
							size="40" type="text" name="city" id="city" />
					</div>
					<div>
						<label for="description">Description<em>*</em></label>
						<textarea tabindex="5" name="desc" cols="35" rows="4" id="desc"></textarea>
					</div>
				</fieldset>
				<div class="buttonrow">
					<input tabindex="6" type="button" class="btn" value="Submit"
						onclick="submitForm();" /> <input tabindex="7" type="button"
						class="btn" value="Cancel" />
				</div>
			</form>

			<script
				src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.12.0/jquery.validate.js"
				type="text/javascript"></script>
			<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.js"
				type="text/javascript"></script>


			<script>
				function submitForm() {
					var validator = $("#myForm").validate({
						rules : {
							name : "required",
							email : "required",
							contactnumber : "required",
							city : "required",
							desc : "required"
						},
						errorElement : "span",
						messages : {
							name : " Enter Name",
							email : " Enter Email",
							contactnumber : " Enter Contact No",
							city : " Enter City",
							desc : " Enter Description"
						}
					});
					if (validator.form()) { // validation perform
						$('form#myForm').attr({
							action : 'mycontroller'
						});
						$('form#myForm').submit();
					}
				}
			</script>
		</div>
	</div>
</body>
</html>
