<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="edu.sfsu.setap.model.*,edu.sfsu.setap.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Checkpoints</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="resources/bootstrap/js/bootstrap.min.js">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link href="resources/css/setap.css" rel="stylesheet">
<link href="resources/css/demo_page.css" rel="stylesheet" type="text/css" />
<link href="resources/css/demo_table.css" rel="stylesheet" type="text/css" />


<link href="resources/css/demo_table_jui.css" rel="stylesheet" type="text/css" />
<link href="resources/css/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/themes/smoothness/jquery-ui-1.7.2.custom.css" rel="stylesheet" type="text/css" media="all" />
<link href="resources/css/TableTools.css" rel="stylesheet" type="text/css" />
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="resources/js/jquery.jeditable.js" type="text/javascript"></script>
<script src="resources/js/jquery-ui.js" type="text/javascript"></script>
<script src="resources/js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8" src="resources/js/ZeroClipboard.js"></script>
<script type="text/javascript" charset="utf-8" src="resources/js/TableTools.js"></script>
<script type="text/javascript" src="resources/js/jquery.dataTables.editable.js"></script>

<script type="text/javascript">
$(document).ready( function () {
    $('#example').dataTable( {
        "sDom": 'T<"clear">lfrtip',
        "oTableTools": {
            "sSwfPath": "resources/swf/copy_csv_xls_pdf.swf"
        }
    } );
} );
</script>
</head>

<body id="dt_example">
	<div id="container">		
			<%@ include file="header.jsp"%>
			<h3><span class="tab">View/Export Class Log</span></h3>
		<div id="demo_jui">
			
			<div class="pagination-right">
			<h2>Copy to clip board,Export as CSV/Excel/PDF or Print</h2>
			</div>
			<table id="example" class="display">
				<thead>
					<tr>
					
					  <th>Instructor</th>  
  					  <th>Team</th>  
  					  <th>Date</th> 
  					  <th>Reason</th>  
  					  <th>Absence</th> 
  					  <th>Reason</th>  
  					  <th>Lead_effect</th>  
  					  <th>Team_effect</th>
					</tr>
				</thead>
				<tbody>
					<% for(InstructionLogBean c: DBConnectionUtil.getInstructionLogData(DBConnectionUtil.getConnection())){ %>
					<tr id="<%=c.getLog_id()%>">
						<td><%=c.getInstructor()%></td>
						<td><%=c.getTeam()%></td>
						<td><%=c.getMeeting_date()%></td>
						<td><%=c.getTextarea_reason()%></td>
						<td><%=c.getAbsent_member()%></td>
						<td><%=c.getTextarea_reason()%></td>
						<td><%=c.getTeam_lead_effectiveness()%></td>
						<td><%=c.getTeam_effectiveness()%></td>
						
					</tr>
					<% } %>
				</tbody>
			</table>
			</div>
		</div>
		<%@ include file="footer.jsp"%>
	
</body>
</html>