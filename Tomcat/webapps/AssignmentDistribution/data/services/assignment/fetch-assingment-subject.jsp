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

String semester = request.getParameter("semseter");
String batchId = request.getParameter("batch");
String branchId = request.getParameter("department");
String facultyId = request.getParameter("facultyId");

String success = "N";
String message = "";

 
try
{
String sql = "select * from faculty_subjct_view where `branchId`= ?  and `semesterId`	 = ? and `batchId` = ? and `facultyId` = ?";
	stmt=conn.prepareStatement(sql); 
	stmt.setString(1, branchId);
	stmt.setString(2, semester);
	stmt.setString(3, batchId);
	stmt.setString(4, facultyId);
	
	  ResultSet rs = stmt.executeQuery();  
	if(rs.next())
	{
				do
				{
					JSONObject obj1 = new JSONObject();
					obj1.put("SubjectName",rs.getString("subjectName"));
					obj1.put("Code",rs.getString("subjectCode"));
					obj1.put("ShortName",rs.getString("shortName"));
					
					dataList.add(obj1);

				}while(rs.next());
					
					success = "Y";
					message="Subjects Fetching Successful";
					obj.put("Success",success);
					obj.put("Message",message);
					obj.put("SubjectsList",dataList);
			
		

	}
	else
	{
		success = "N)";
		message="No subjects";
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