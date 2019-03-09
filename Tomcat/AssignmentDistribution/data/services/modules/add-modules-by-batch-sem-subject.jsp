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
PreparedStatement stmt = null;
JSONArray dataList = new JSONArray();
JSONObject obj=new JSONObject();

String semSubId = request.getParameter("semSubId");
String selectedLinkedSubjectId = request.getParameter("selectedLinkedSubject");
String selectedLinkedModulesId = request.getParameter("selectedLinkedModules");
String success = "N";
String message = "";
try
{
	String query = " insert into semester_subject_modules (sem_sub_id, subject_id, module_ids)"
	        + " values (?, ?, ?)";
	stmt = conn.prepareStatement(query);
	stmt.setInt (1, Integer.parseInt(semSubId));
	stmt.setInt (2, Integer.parseInt(selectedLinkedSubjectId));
	stmt.setString (3, selectedLinkedModulesId);
	if(stmt.executeUpdate() == 1)
	{
			success = "Y";
			message="Modules Linked";
		    obj.put("Success",success);
			obj.put("Message",message);
	}
	else
	{
			success = "N";
			message="Modules Linking Failed";
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