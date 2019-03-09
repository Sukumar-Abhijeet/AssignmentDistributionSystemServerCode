<%@include file="../../../dbconnection/dbconnection.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST,GET");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
String query = "Select * from students where status ='INACTIVE'";
Statement s1 = null;
ResultSet resultSet = null;
JSONArray dataList = new JSONArray();
s1 = conn.createStatement();
resultSet = s1.executeQuery(query);
while(resultSet.next()) {
	JSONObject obj=new JSONObject();
	obj.put("RegNo", resultSet.getString("reg_no"));
	obj.put("Name", resultSet.getString("name"));
	obj.put("Mobile", resultSet.getString("mobile"));
	dataList.add(obj);
}
JSONObject mainObject = new JSONObject();
mainObject.put("Success", "OK");
mainObject.put("studentList", dataList);
out.println(mainObject.toString());
%>