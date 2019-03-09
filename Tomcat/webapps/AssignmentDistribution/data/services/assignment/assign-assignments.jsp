<%@include file="../../../dbconnection/dbconnection.jsp" %>
<%@page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST,GET");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
response.setContentType("application/json;charset=utf-8");
%>
<%
PreparedStatement stmt = null;
JSONArray dataList = new JSONArray();
JSONObject obj=new JSONObject();

String success = "N";
String message = "";

String departmentId = request.getParameter("department");
String batchId = request.getParameter("batch");
String faculty_id = request.getParameter("userId");
String semseterId = request.getParameter("semseter");
String subjectId = request.getParameter("subject");
String section = request.getParameter("section");
String group = request.getParameter("group");
String moduleId = request.getParameter("module");
String assignmentName = request.getParameter("assignmentFile");
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
String difficulty = request.getParameter("difficulty");

try
{
	String query = " insert into semester_assignments ( start_date, end_date, file_name, batch_id , faculty_id , branch_id, semester_no ,subject_id, module_id,section , group_by ,difficulty_lvl)"
	        + " values (?, ?, ?, ?, ?, ? , ? , ? , ? ,?,?,?)";
	stmt = conn.prepareStatement(query);
	
	stmt.setString (1, startDate);
	stmt.setString (2, endDate);
	stmt.setString (3, assignmentName);
	stmt.setInt (4, Integer.parseInt(batchId));
	stmt.setString (5, faculty_id);
	stmt.setInt (6, Integer.parseInt(departmentId));
	stmt.setInt (7, Integer.parseInt(semseterId));
	stmt.setInt (8, Integer.parseInt(subjectId));
	stmt.setInt (9, Integer.parseInt(moduleId));
	stmt.setString (10, section);
	stmt.setInt (11, Integer.parseInt(group));
	stmt.setString (12, difficulty);


	 if(stmt.executeUpdate() == 1)
	{
	 	 success = "Y";
		 message = "Assignment Uploaded";
		 obj.put("Success",success);
		 obj.put("Message",message);
	}
	else
	{
		 success = "N";
		 message = "Assignment Upload Failed";
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