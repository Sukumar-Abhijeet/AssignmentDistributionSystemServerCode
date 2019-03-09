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

	String facultyName = request.getParameter("facultyName");
	String department = request.getParameter("department");
	String designation = request.getParameter("designation");
	String role = request.getParameter("role");
	String number = request.getParameter("number");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String subString = number.substring(0,4);
    String registrationNumber = "TAT"+subString+ rand.nextInt(500);
try{
	

	String query = " insert into faculties (id, name, branch_id, phone, email , gender  , designation , role)"
	        + " values (?, ?, ?, ?, ?, ? , ? , ? )";
	stmt = conn.prepareStatement(query);

	stmt.setString (1, registrationNumber);
	stmt.setString (2, facultyName);
	stmt.setInt (3, Integer.parseInt(department));
	stmt.setString (4, number);
	stmt.setString   (5,email);
	stmt.setString (6, gender);
	stmt.setString (7, designation);
	stmt.setString (8, role);

	// out.println(stmt);
	
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
  obj.put("Message","Some problem occured. Please contact administrator "+ex);
  }
  out.println(obj);
%>
