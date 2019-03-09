<%@include file="../../../dbconnection/dbconnection.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST,GET");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
String query = "Select * from batches";
Statement s1 = null;
ResultSet resultSet = null;
JSONArray dataList = new JSONArray();
s1 = conn.createStatement();
resultSet = s1.executeQuery(query);
while(resultSet.next()) {
	JSONObject obj=new JSONObject();
	obj.put("Id", resultSet.getString("id"));
	obj.put("Batch", resultSet.getString("start_year")+"-"+resultSet.getString("end_year"));
	dataList.add(obj);
}
JSONObject mainObject = new JSONObject();
mainObject.put("Success", "OK");
mainObject.put("Batches", dataList);
out.println(mainObject);
%>