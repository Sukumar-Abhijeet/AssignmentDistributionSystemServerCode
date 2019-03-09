<%@include file="../../../dbconnection/dbconnection.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST,GET");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");

String facultyId = request.getParameter("facultyId");
JSONArray dataList = new JSONArray();
JSONObject obj = new JSONObject();
String success = "N";
String message = "";
PreparedStatement stmt = null;

try
{
String query = "update faculties set role = ? where id = ?";
stmt = conn.prepareStatement(query);
stmt.setString   (1, "ADMIN");
stmt.setString(2, facultyId);

	if(stmt.executeUpdate() == 1)
	{
	success = "Y";
	message="Temporarily Assigned";
	obj.put("Success",success);
	obj.put("Message",message);

	}
	else
	{
	success = "N";
	message="Not Activated Some Error Occured";
	obj.put("Success",success);
	obj.put("Message",message);

	}
	
}
catch(Exception e)
{
  obj.put("Success","N");
  obj.put("Message","Some problem occured. Please contact administrator ");
}

  out.println(obj);


%>