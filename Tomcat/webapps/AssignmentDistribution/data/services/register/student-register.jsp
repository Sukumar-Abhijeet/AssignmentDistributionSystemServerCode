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
	String success = "N";
	String message = "";

	String studentName = request.getParameter("studentName");
	String registrationNumber = request.getParameter("registrationNumber");
	String branchId = request.getParameter("branchId");
	String semsterId = request.getParameter("semesterId");
	String sectionName = request.getParameter("sectionName");
	String groupNumber = request.getParameter("groupNumber");
	String email = request.getParameter("email");
	String number = request.getParameter("number");
	String password = request.getParameter("password");
	 
	String subString = registrationNumber.substring(0,2);
	String batch = "20"+subString+"-20"+(Integer.parseInt(subString)+4);
try{
	

	String query = " insert into students (reg_no, name, semester_no, section, group_by , mobile , email, password ,default_password, branch_id , batch_year,batch_id)"
	        + " values (?, ?, ?, ?, ?, ? , ? , ? , ? ,?,?,?)";
	stmt = conn.prepareStatement(query);

	stmt.setString (1, registrationNumber);
	stmt.setString (2, studentName);
	stmt.setInt (3, Integer.parseInt(semsterId));
	stmt.setString (4, sectionName);
	stmt.setInt    (5, Integer.parseInt(groupNumber));
	stmt.setString (6, number);
	stmt.setString (7, email);
	stmt.setString (8, password);
	stmt.setString (9, password);
	stmt.setInt (10, Integer.parseInt(branchId));
	 stmt.setString (11, batch);
	stmt.setInt (12,Integer.parseInt(subString));
	
	 if(stmt.executeUpdate() == 1)
	{
	 	 success = "Y";
		 message = "Registration Successful";
		 obj.put("Success",success);
		 obj.put("Message",message);
	}
	else
	{
		 success = "N";
		 message = "Registration Failed";
		 obj.put("Success",success);
		 obj.put("Message",message);
	}
}
catch (Exception ex) {
  obj.put("Success","N");
  obj.put("Message","Some problem occured. Please contact administrator "+ex+stmt);
  }
  out.println(obj);
%>
