<%@include file="../../../dbconnection/dbconnection.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST,GET");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
response.setContentType("application/x-www-form-urlencoded;charset=utf-8");

JSONObject obj  =new JSONObject();
//JSONObject obj1 = new JSONObject();
JSONObject mainObject = new JSONObject();

String success = "N";
String message = "";

ResultSet rs,rs1 = null;
JSONArray dataList = new JSONArray();
PreparedStatement stmt = null;
Statement sm = null;

String branchId = request.getParameter("departmentId");
String batchId = request.getParameter("batchId");
String semseterId = request.getParameter("semester");

String sql = "select * from semester_subjects where `batch_id` = ? and `branch_id`= ? and `semester_no`= ?";
 stmt=conn.prepareStatement(sql); 
 stmt.setString(1, batchId);
 stmt.setString(2, branchId);
 stmt.setString(3, semseterId);

	
try{
	 rs = stmt.executeQuery();
	 
	    if(rs.next())
		{
		String subjectIds = rs.getString("subject_ids");
		String semSubId = rs.getString("id");

		String query = "select * from subjects where `id` IN("+subjectIds+")";
		sm = conn.createStatement();
		rs1 = sm.executeQuery(query);

			while(rs1.next())
			{
			JSONObject obj1 = new JSONObject();
			obj1.put("Name",rs1.getString("name"));
			obj1.put("Id",rs1.getString("id"));
			obj1.put("Code",rs1.getString("code"));
			obj1.put("ShortName",rs1.getString("short_name"));
			dataList.add(obj1);
			}
			success = "Y";
			message="Subjects Fetching Successful";
		    obj.put("SemSubID",semSubId);
		    obj.put("Success",success);
		    obj.put("Subjects",dataList);
			obj.put("Message",message);

			
		}
		else
		{
			success = "N";
			message="No Subjects Linked Please Link Subjects";
		    obj.put("Success",success);
			obj.put("Message",message);
		}
		
}
catch(Exception ex)
{
  obj.put("Success","N");
  obj.put("Message","Some problem occured. Please contact administrator "+ex);
}

out.println(obj);
%>