<%@include file="../../../dbconnection/dbconnection.jsp" %>
<%@page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST,GET");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
response.setContentType("application/x-www-form-urlencoded;charset=utf-8");
%>
<%
PreparedStatement stmt = null;
JSONArray dataList = new JSONArray();
JSONObject obj=new JSONObject();

String subjectId = request.getParameter("subject");
String batchId = request.getParameter("batch");
String branchId = request.getParameter("department");
String semesterId = request.getParameter("semseter");
String section = request.getParameter("section");
String groupId = request.getParameter("group");
String moduleId = request.getParameter("module");
String assignmentName = request.getParameter("assignmentName");
String success = "N";
String message = "";

 
try
{
String sql = "select * from assignment_submission_view where `batch_id` = ?  and `branch_id`= ?  and semester_no = ? and subject_id = ? and module_id = ? and section = ? and (group_by =  '3' or group_by = ?) and assignment_id = ?";
	stmt=conn.prepareStatement(sql); 
	stmt.setString(1, batchId);
	stmt.setString(2, branchId);
	stmt.setString(3, semesterId);
	stmt.setString(4, subjectId);
	stmt.setString(5, moduleId);
	stmt.setString(6, section);
	stmt.setString(7, groupId);
	stmt.setString(8, assignmentName);
	  ResultSet rs = stmt.executeQuery();  
	  int count = 0;
	if(rs.next())
	{
				do
				{
					JSONObject obj1 = new JSONObject();
					obj1.put("Name",rs.getString("name"));
					obj1.put("RegNo",rs.getString("reg_no"));
					obj1.put("AssignmentFile",rs.getString("assignment_name"));
					//obj1.put("Difficulty",rs.getString("difficulty_lvl"));
					count ++;
					dataList.add(obj1);

				}while(rs.next());
					
					success = "Y";
					message="Assignment Fetching Successful";
					obj.put("Success",success);
					obj.put("Message",message);
					obj.put("AssignmentList",dataList);
					obj.put("Totalnumber",count);
			
		

	}
	else
	{
		success = "N)";
		message="No Assignments";
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