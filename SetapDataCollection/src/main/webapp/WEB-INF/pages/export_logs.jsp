<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="edu.sfsu.setap.model.*,edu.sfsu.setap.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>template</title>


<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/setap.css" rel="stylesheet">
<link href="resources/css/demo_page.css" rel="stylesheet" type="text/css" />
<link href="resources/css/demo_table.css" rel="stylesheet"	type="text/css" />
<link href="resources/css/demo_table_jui.css" rel="stylesheet" type="text/css" />
<link href="resources/css/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/TableTools.css" rel="stylesheet" type="text/css" />
<script src="resources/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.jeditable.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>
<script src="resources/js/jquery.validate.js" type="text/javascript"></script>
<script src="resources/js/jquery.dataTables.editable.js" type="text/javascript"></script>


<script type="text/javascript" charset="utf-8" src="resources/js/ZeroClipboard.js"></script>
<script type="text/javascript" charset="utf-8" src="resources/js/TableTools.js"></script>


<script type="text/javascript">
$(document).ready( function () {
    $('#instructorLogs').dataTable( {
        "sDom": 'T<"clear">lfrtip',
        "oTableTools": {
            "sSwfPath": "resources/swf/copy_csv_xls_pdf.swf"
        }
    } );
} );
</script>
</head>
<body>
	<div id="container">
		<div id="modal-header" class="modal-header">
			<%@ include file="header.jsp"%>
			<h3><span class="tab">View/Export Class Log</span></h3>
		</div>
		
		<div class="page_content">
		
		<div id="demo_jui">
		
<table id="instructorLogs" class="display">
				<thead>
					<tr>	
					  <th>Instructor</th>  
  					  <th>Team</th>  
  					  <th>Date</th> 
  					  <th>Reason</th>  
  					  <th>Absence</th> 
  					  <th>Lead_effect</th>  
  					  <th>Team_effect</th>
					</tr>
				</thead>
				<tbody>
					<% for(InstructorLogsBean instructionLog: DBConnectionUtil.getInstructionLogData(DBConnectionUtil.getConnection())){ %>
					<tr id="<%=instructionLog.getInstructorLogsId()%>">
					    <td><%=instructionLog.getSetapUserId()%></td>
						<td><%=instructionLog.getTeamId()%></td>
						<td><%=instructionLog.getMeetingDate()%></td>
						<td><%=instructionLog.getMeetingReason()%></td>
						<td><%=instructionLog.getAbsentMembers()%></td>
						<td><%=instructionLog.getTeamLeadEffectiveness()%></td>
						<td><%=instructionLog.getTeamEffectiveness()%></td>
					</tr>
					<% } %>
				</tbody>
			</table>
	</div>
	</div>
		<div id="modal-footer" class="modal-footer">
			<%@ include file="footer.jsp"%>
		</div>
	</div>
</body>
</html>