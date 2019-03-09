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
PreparedStatement stmt,stmt2 = null;
JSONArray dataList = new JSONArray();
JSONObject obj=new JSONObject();

String subjectId = request.getParameter("subjectId");
String batchId = request.getParameter("batchId");
String branchId = request.getParameter("branchId");
String semesterId = request.getParameter("semesterId");
String section = request.getParameter("section");
String groupId = request.getParameter("groupId");
String moduleId = request.getParameter("moduleId");
String success = "N";
String message = "";

 java.util.Date dNow = new java.util.Date();
 SimpleDateFormat month = new SimpleDateFormat ("MM");
 SimpleDateFormat day = new SimpleDateFormat ("dd");
 String serverMonth = month.format(dNow);
 String serverDay = day.format(dNow);
try
{
String sql = "select * from semester_assignments where `batch_id` = ?  and `branch_id`= ? and semester_no = ? and subject_id = ? and module_id = ? and section = ? and (group_by =  '3' or group_by = ?)";
	stmt=conn.prepareStatement(sql); 
	stmt.setString(1, batchId);
	stmt.setString(2, branchId);
	stmt.setString(3, semesterId);
	stmt.setString(4, subjectId);
	stmt.setString(5, moduleId);
	stmt.setString(6, section);
	stmt.setString(7, groupId);
	  ResultSet rs = stmt.executeQuery();  
	if(rs.next())
	{
		String startDateData  =rs.getString("start_date");
		String endDateData  =rs.getString("end_date");

		String  startMonth = startDateData.substring(5,7);
		String  startDate = startDateData.substring(8,10);

		String  endMonth = endDateData.substring(5,7);
		String  endDate = endDateData.substring(8,10);
		
		if(startMonth.equals(serverMonth)){
			if(Integer.parseInt(startDate)<= Integer.parseInt(serverDay) && Integer.parseInt(endDate)>=Integer.parseInt(serverDay))
			{
					do
					{
						
						JSONObject obj1 = new JSONObject();
						obj1.put("FileName",rs.getString("file_name"));
						obj1.put("AssignmentId",rs.getString("id"));
						obj1.put("Difficulty",rs.getString("difficulty_lvl"));
						obj1.put("StartDate",startDateData.substring(0,10));
						obj1.put("EndDate",endDateData.substring(0,10));
						dataList.add(obj1);

					}while(rs.next());
					success = "Y";
					message="Assignment Fetching Successful";
					obj.put("Success",success);
					obj.put("Message",message);
					obj.put("AssignmentList",dataList);
			}
			else
			{
				success = "N";
				message="NO Assignments Available";
				obj.put("Success",success);
				obj.put("Message",message);
			}
		}
		else
			{
				success = "N";
				message="NO Assignments Available";
				obj.put("Success",success);
				obj.put("Message",message);
			}

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