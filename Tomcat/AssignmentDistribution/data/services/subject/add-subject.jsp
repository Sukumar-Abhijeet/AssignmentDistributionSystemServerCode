<%@include file="../../../dbconnection/dbconnection.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%
response.setHeader("Access-Control-Allow-Origin", "*");
response.setHeader("Access-Control-Allow-Methods", "POST,GET");
response.setHeader("Access-Control-Allow-Headers", "Content-Type");
response.setContentType("application/x-www-form-urlencoded;charset=utf-8");
%>
<%
Random rand = new Random();
PreparedStatement stmt = null;
	 JSONObject obj=new JSONObject();
	String success = "N";
	String message = "";

	String subjectName = request.getParameter("subjectName");
	String subjectCode = request.getParameter("subjectCode");
	String acronym = request.getParameter("acronym");
	

try{
if(acronym.equals(""))
	{
	
		String query = " insert into subjects (code, name)"
 	        + " values (?, ?,)";
 	stmt = conn.prepareStatement(query);

 	stmt.setString (1, subjectCode);
 	stmt.setString (2, subjectName);
	}
	else{
		String query = " insert into subjects (code, name, short_name)"
	        + " values (?, ?, ?)";
	stmt = conn.prepareStatement(query);

 	stmt.setString (1, subjectCode);
 	stmt.setString (2, subjectName);
 	stmt.setString (3, acronym);
	}
 	 if(stmt.executeUpdate() == 1)
	{
	 	 success = "Y";
		 message = "Subject Addition Successful";
		 obj.put("Success",success);
		 obj.put("Message",message);
	}
	else
	{
		 success = "N";
		 message = "Subject Addition Failed";
		 obj.put("Success",success);
		 obj.put("Message",message);
	}
}
catch (Exception ex) {
  obj.put("Success","N");
  obj.put("Message","Some problem occured. Please contact administrator "+ex);
  }
  out.println(obj);
%>
