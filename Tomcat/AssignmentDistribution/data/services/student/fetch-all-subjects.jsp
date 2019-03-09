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
Statement sm = null;

String studentId = request.getParameter("studentId");
String success = "N";
String message = "";
try
{
String sql = "select * from students where `reg_no` = ? ";
	stmt=conn.prepareStatement(sql); 
	stmt.setString(1, studentId);
	  ResultSet rs = stmt.executeQuery();  
	if(rs.next())
	{
		String branchId = rs.getString("branch_id");
		String batchId = rs.getString("batch_id");
		String semesterId = rs.getString("semester_no");
		String section = rs.getString("section");
		String groupId = rs.getString("group_by");

		String sql2 = "select * from semester_subjects where `batch_id` = ? and `branch_id` = ? and `semester_no` = ?";
		stmt2 = conn.prepareStatement(sql2); 
		stmt2.setString(1, batchId);
		stmt2.setString(2, branchId);
		stmt2.setString(3, semesterId);

		ResultSet rs2 = stmt2.executeQuery();

		if(rs2.next())
		{

			String subIds = rs2.getString("subject_ids");

				String query = "select * from batch_modules where `id` IN("+subIds+")";
				sm = conn.createStatement();
				ResultSet rs3 = sm.executeQuery(query);

					while(rs3.next())
					{
					JSONObject obj1 = new JSONObject();
					obj1.put("Name",rs3.getString("name"));
					obj1.put("Id",rs3.getString("id"));
					obj1.put("SubjectId",rs3.getString("subject_id"));
					obj1.put("Code",rs3.getString("code"));
					obj1.put("ShortName",rs3.getString("short_name"));
					obj1.put("ModuleIds",rs3.getString("module_ids"));
					dataList.add(obj1);
					}
					success = "Y";
					message="Subjects Fetching Successful";
					obj.put("BranchId",branchId);
					obj.put("BatchId",batchId);
					obj.put("SemesterId",semesterId);
					obj.put("Section",section);
					obj.put("GroupId",groupId);
				    obj.put("Success",success);
				    obj.put("Subjects",dataList);
					obj.put("Message",message);
		}			
		else
		{
				success = "N";
				message="No Subjects Linked";
				obj.put("Success",success);
				obj.put("Message",message);

		}
		
	}
	else
	{
		
			success = "N";
			message="No Student Details Found";
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