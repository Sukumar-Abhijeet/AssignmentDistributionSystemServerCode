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
PreparedStatement stmt,stmt2 = null;
JSONArray dataList = new JSONArray();
JSONObject obj=new JSONObject();

String regNumber = request.getParameter("registrationNumber");
String password = request.getParameter("password");
String success = "N";
String message = "";
try
{
String sql = "select * from user_login where `login_id` = ?  and `status`='ACTIVE'";
	stmt=conn.prepareStatement(sql); 
	stmt.setString(1, regNumber);
	  ResultSet rs = stmt.executeQuery();  
	if(rs.next())
	{
		String defaultPass = rs.getString("default_password");
		String dbPassword = rs.getString("password");

		if(dbPassword.equals(password))
		{
			obj.put("Role", rs.getString("role"));
			obj.put("Designation", rs.getString("Designation"));
			obj.put("Name", rs.getString("name"));
			obj.put("Id", rs.getString("login_id"));
			obj.put("Email", rs.getString("email"));
			obj.put("Mobile", rs.getString("mobile"));
			success = "Y";
			message="Login Success";
			obj.put("Password","SET");
		    obj.put("Success",success);
			obj.put("Message",message);
		}

		else if(dbPassword.equals("NOTSET"))
		{
			if(defaultPass.equals(password))
			{
				obj.put("Designation", rs.getString("Designation"));
				obj.put("Role", rs.getString("role"));
				obj.put("Name", rs.getString("name"));
				obj.put("Id", rs.getString("login_id"));
				obj.put("Password","NOTSET");
				success = "Y";
				message="Login Success";
			    obj.put("Success",success);
				obj.put("Message",message);

			}
			else
			{
				success = "N";
				message = "Invalid Default Credentials";
				obj.put("Success",success);
				obj.put("Message",message);
			}
		}
		else
		{
			success = "N";
			message="Invalid Credential";
			obj.put("Success",success);
			obj.put("Message",message);

		}
			
	}
	else
	{
		String sql2 = "select * from user_login where `login_id` = ?  and `status`='INACTIVE'";
			stmt2=conn.prepareStatement(sql2); 
			stmt2.setString(1, regNumber);
			ResultSet rs2 = stmt2.executeQuery();  
			if(rs2.next())
			{
				success = "INA";
				message = "Account Inactive";
				obj.put("Success",success);
				obj.put("Message",message);
			}
			else
			{
				success = "N";
				message = "Invalid Credentials";
				message="Login failed";
				obj.put("Success",success);
				obj.put("Message",message);
			}
			
	}
}
catch(Exception e)
{
  obj.put("Success","N");
  obj.put("Message","Some problem occured. Please contact administrator ");
}

  out.println(obj);
%>