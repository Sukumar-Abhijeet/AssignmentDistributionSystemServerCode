<%@include file="../../../dbconnection/dbconnection.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST,GET");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
response.setContentType("application/x-www-form-urlencoded;charset=utf-8");
%>
<%
PreparedStatement stmt,stmt2 = null;
JSONArray dataList = new JSONArray();
JSONObject obj=new JSONObject();

String assignmentId = request.getParameter("assignmentId");
String studentId = request.getParameter("studentId");
String success = "N";
String message = "";
try
{
String sql = "select * from download_logs where `assignment_id` = ?  and `student_id`=?";
	stmt=conn.prepareStatement(sql); 
	stmt.setString(1, assignmentId);
	stmt.setString(2, studentId);
	  ResultSet rs = stmt.executeQuery();  
	if(rs.next())
	{
		success = "P";
		message="Already Dowloaded";
	    obj.put("Success",success);
		obj.put("Message",message);
	}
	else
	{
		String query = " insert into download_logs (assignment_id, student_id)"
	        + " values (?, ?)";
	stmt2 = conn.prepareStatement(query);
	stmt2.setString (1, assignmentId);
	stmt2.setString(2, studentId);
		if(stmt2.executeUpdate() == 1)
		{
		 	 success = "Y";
			 message = "Download logs recorded";
			 obj.put("Success",success);
			 obj.put("Message",message);
		}
		else
		{
			 success = "N";
			 message = "Download logs error";
			 obj.put("Success",success);
			 obj.put("Message",message);
		}
		
	}
}
catch(Exception e)
{
  obj.put("Success","N");
  obj.put("Message","Some problem occured. Please contact administrator "+e);
}

  out.println(obj);
%>