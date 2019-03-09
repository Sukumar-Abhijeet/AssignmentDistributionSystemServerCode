<%@include file="../../../dbconnection/dbconnection.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST,GET");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");

String regNo = request.getParameter("regNo");
JSONArray dataList = new JSONArray();
JSONObject obj = new JSONObject();
String success = "N";
String message = "";
PreparedStatement stmt = null;

try
{
String query = "update students set status = ? where reg_no = ?";
stmt = conn.prepareStatement(query);
stmt.setString   (1, "ACTIVE");
stmt.setString(2, regNo);

	if(stmt.executeUpdate() == 1)
	{
	success = "Y";
	message="Activated";
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