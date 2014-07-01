<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="edu.sfsu.setap.model.*,edu.sfsu.setap.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>template</title>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/setap.css" rel="stylesheet">
<link href="resources/css/demo_page.css" rel="stylesheet" type="text/css" />
<link href="resources/css/demo_table.css" rel="stylesheet"	type="text/css" />
<link href="resources/css/demo_table_jui.css" rel="stylesheet" type="text/css" />
<link href="resources/css/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.jeditable.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>
<script src="resources/js/jquery.validate.js" type="text/javascript"></script>
<script src="resources/js/jquery.dataTables.editable.js" type="text/javascript"></script>
<script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
</script>

<script type="text/javascript">
        $(document).ready(function () {
            $("#companies").dataTable({"sPaginationType": "full_numbers",
 			   						   "bJQueryUI": true})
            .makeEditable({sDeleteHttpMethod: "GET",
                		   sDeleteURL: "deleteRecord",
                		   sDeleteRowButtonId: "btnDeleteRow",
                		   sAddNewRowFormId: "formAddNewRow",
                           sAddNewRowButtonId: "btnAddNewRow",
                           sAddNewRowOkButtonId: "btnAddNewRowOk",
                           sAddNewRowCancelButtonId: "btnAddNewRowCancel",
                           sAddURL: "addRecord",
                           sAddHttpMethod: "POST",
                           sUpdateURL: "updateRecord",
                           aoColumns: [{indicator: 'Saving...',
                        	   			type: 'select',
										onblur: 'submit',
										data: "{'':'Please select', 'OPEN':'OPEN','CLOSED':'CLOSED', 'OVERDUE':'OVERDUE', 'REOPEN':'REOPEN'}"
										},
                              			null,
                              			{},
                              			{},
                              			{},
                              			{},
                              			null,
                              			null]});
             });
        </script>
</head>
<body>
	<div id="container">
		<div id="modal-header" class="modal-header">
			<%@ include file="header.jsp"%>
			<h3><span class="tab">Create/Update Checkpoints</span></h3>
		</div>
		
		<div class="pagination-centered">
			<button class="btn-primary" id="btnDeleteRow">Delete Checkpoint</button>
			<button class="btn-primary" id="btnAddNewRow">Add Checkpoint</button><br><br>
			<!--  class="btn-primary btn-right-submit" -->
		</div>
		
		<div class="page_content">
		
		<div id="demo_jui">
		
			<table id="companies" class="display">
				<thead>
					<tr>
						<th>Issue Status </th>
						<th>Team # </th>
						<th>Creation Date</th>
						<th>Due Date </th>
						<th>Closed Date</th>
						<th>Description</th>
						<th>Email Sent </th>
						<th>Send Email</th>
					</tr>
				</thead>
				<tbody>
					<% for(CheckPointBean c: DBConnectionUtil.getDBData(DBConnectionUtil.getConnection())){ %>
					<tr id="<%=c.getCheck_pointID()%>">
						<td><%=c.getIssue_status()%></td>
						<td><%=c.getTeam_number()%></td>
						<td><%=c.getCreation_date()%></td>
						<td><%=c.getDue_date()%></td>
						<td><%=c.getClosed_date()%></td>
						<td><%=c.getDescription()%></td>
						<td><%=c.getEmail_notification()%></td>
						<td>
							<form method="POST" action="sendemail">
								<input name="checkPointId" type="hidden" value="<%=c.getCheck_pointID()%>">
								<input type="submit" value="Send Email">
							</form>
						</td>
					</tr>
					<% } %>
				</tbody>
			</table>
			<form id="formAddNewRow" action="#" title="Add new row">
				
				<label for="issue_status">Status:</label> <select
					name="issue_status" id="issue_status" rel="0">
					<option value="OPEN">OPEN</option>
					<option value="CLOSED">CLOSED</option>
					<option value="REOPEN">REOPEN</option>
					<option value="OVERDUE">OVERDUE</option>
				</select> <br />
				<label for="team_number">team_number:</label> <select
					name="team_number" id="team_number" rel="1">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="4">5</option>
					<option value="4">6</option>
					<option value="4">7</option>
				</select> <br />

				<label for="creation_date">creation_date</label>
				<input type="text"	name="creation_date" id="creation_date" rel="2"> <br /> 
				<label for="due_date">due_date</label>
				<input type="text" name="due_date" id="due_date" rel="3"> <br />
				<label for="closed_date">closed_date</label>
			    <input type="text" name="closed_date" id="datepicker" rel="4"><br /> 
				<label for="description">Description</label> 
				<input type="text" name="description" id="description" rel="5" /> <br />
				<input type="hidden" id="id" name="id" value="N" rel="6" /> 
				<input type="hidden" id="id" name="id" value="<button id='btnmail'>Send Mail</button>" rel="7" />

				<button id="btnAddNewRowOk">Add</button>
				<button id="btnAddNewRowCancel">Cancel</button>
			</form>
		</div>
	    </div>
		<div id="modal-footer" class="modal-footer">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>