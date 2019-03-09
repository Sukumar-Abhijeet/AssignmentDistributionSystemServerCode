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
 JSONObject obj=new JSONObject();

String mobnumber = request.getParameter("mobnumber");
String success = "N";
String message = "";

 String sql = "select * from faculties where `phone` = ?";
 stmt=conn.prepareStatement(sql); 
 stmt.setString(1, mobnumber);
 ResultSet rs = stmt.executeQuery();
 if(rs.next())
 {
 	 success = "Y";
	 message = "Mobile Number Already Exist";
	 obj.put("Success",success);
	 obj.put("Message",message);
 }
 else
 {
 	 success = "N";
	 message = "New Mobile Number";
	 obj.put("Success",success);
	 obj.put("Message",message);

 }
 out.println(obj);


%>
