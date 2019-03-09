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
String sql = "select * from upload_logs where `student_id` = ?  and `assignment_id`=?";
	stmt=conn.prepareStatement(sql); 
	stmt.setString(1, studentId);
	stmt.setString(2, assignmentId);
	  ResultSet rs = stmt.executeQuery();  
	if(rs.next())
	{
		success = "N";
		message="Already Uploaded";
	    obj.put("Success",success);
		obj.put("Message",message);
	}
	else
	{
		success = "Y";
		message="Not Uploaded";
	    obj.put("Success",success);
		obj.put("Message",message);
		
	}
}
catch(Exception e)
{
  obj.put("Success","N");
  obj.put("Message","Some problem occured. Please contact administrator "+e);
}

  out.println(obj);
%>