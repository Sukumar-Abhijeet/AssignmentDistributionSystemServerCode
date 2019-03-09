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

PreparedStatement stmt = null;
	 JSONObject obj=new JSONObject();
	String success = "N";
	String message = "";

	String branch = request.getParameter("department");
	String batch = request.getParameter("batch");
	String semseter = request.getParameter("semseter");
	String multipleSubjects = request.getParameter("multipleSubjects");
	
try{

		String query = " insert into semester_subjects (semester_no, subject_ids,branch_id,batch_id)"
 	        + " values (?, ?,?,?)";
 	stmt = conn.prepareStatement(query);

 	stmt.setInt (1, Integer.parseInt(semseter));
 	stmt.setString (2, multipleSubjects);
 	stmt.setInt (3, Integer.parseInt(branch));
 	stmt.setInt (4, Integer.parseInt(batch));
	
	
 	 if(stmt.executeUpdate() == 1)
	{
	 	 success = "Y";
		 message = "Subjects Linked Successfully";
		 obj.put("Success",success);
		 obj.put("Message",message);
	}
	else
	{
		 success = "N";
		 message = "Subject Linking Failed";
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
