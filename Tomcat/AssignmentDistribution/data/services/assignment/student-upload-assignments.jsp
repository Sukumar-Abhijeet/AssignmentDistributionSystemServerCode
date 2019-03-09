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
PreparedStatement stmt,stmt2 = null;
Statement s1 = null;
ResultSet resultSet = null;
JSONArray dataList = new JSONArray();
JSONObject obj=new JSONObject();

String success = "N";
String message = "";

String student_id = request.getParameter("userId");
String assignmentId = request.getParameter("assignment");
String assignmentName = request.getParameter("assignmentFile");


try
{
	String query = " insert into student_assignments_submission ( student_id , assignment_id ,assignment_name)"
	        + " values (?, ?, ?)";
	stmt = conn.prepareStatement(query);
	
	
	stmt.setString (1, student_id);
	stmt.setInt (2, Integer.parseInt(assignmentId));
	stmt.setString (3, assignmentName);
	

	 if(stmt.executeUpdate() == 1)
	{
		 

		String sql2 = "Select * from student_assignments_submission ORDER BY id DESC LIMIT 1";
		s1 = conn.createStatement();
		resultSet = s1.executeQuery(sql2);
		if(resultSet.next())
		{
		  String id = resultSet.getString("id");
		  String studentId = resultSet.getString("student_id");
		  String assignmenId = resultSet.getString("assignment_id");


		  String query2 = " insert into upload_logs( student_id , assignment_id ,student_submission_id)"
	        + " values (?, ?, ?)";
			stmt2 = conn.prepareStatement(query2);
			stmt2.setString (1, studentId);
			stmt2.setInt (2,  Integer.parseInt(assignmentId));
			stmt2.setInt (3, Integer.parseInt(id));

			
			 if(stmt2.executeUpdate() == 1)
			{
				 success = "Y";
				 message = "Assignment Uploaded";
				 obj.put("Success",success);
				 obj.put("Message",message);

			}
			else
			{
				success = "DW";
				 message = "Assignment Uploaded Dowload Logs Not updated";
				 obj.put("Success",success);
				 obj.put("Message",message);
			}

		}
		else
			{
				success = "DW";
				 message = "Assignment Uploaded Dowload Logs Not updated";
				 obj.put("Success",success);
				 obj.put("Message",message);
			}

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