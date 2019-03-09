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

String defaultPassFetched = request.getParameter("defaultPass");
String newPass = request.getParameter("newPass");
String userId = request.getParameter("userId");
String setNewPass = request.getParameter("setNewPass");
String userDesignation = request.getParameter("userDesignation");
String success = "N";
String message = "";
try
{
String sql = "select * from user_login where `login_id` = ?  and `status`='ACTIVE'";
	stmt=conn.prepareStatement(sql); 
	stmt.setString(1, userId);
	  ResultSet rs = stmt.executeQuery();  
	if(rs.next())
	{

		if(setNewPass.equals("YES"))
		{

			String oldPass = rs.getString("password");

		if(oldPass.equals(defaultPassFetched))
		{

			if(userDesignation.equals("STUDENT"))
			{
				String query = "update students set `password` = ? where `reg_no` = ?";
		 	stmt2 = conn.prepareStatement(query);

		 	stmt2.setString (1, newPass);
		 	stmt2.setString (2, userId);
			
				if(stmt2.executeUpdate() == 1)
				{
					success = "Y";
					message="Old Password Changed";
					obj.put("Password","SET");
				    obj.put("Success",success);
					obj.put("Message",message);
				}
				else
				{
					success = "N";
					message=" Password Change Failed";
				    obj.put("Success",success);
					obj.put("Message",message);
				}

			}
			else
			{
			
			String query = "update faculties set `password` = ? where `id` = ?";
		 	stmt2 = conn.prepareStatement(query);

		 	stmt2.setString (1, newPass);
		 	stmt2.setString (2, userId);
			
				if(stmt2.executeUpdate() == 1)
				{
					success = "Y";
					message="Default Password Changed";
					obj.put("Password","SET");
				    obj.put("Success",success);
					obj.put("Message",message);
				}
				else
				{
					success = "N";
					message=" Password Change Failed";
				    obj.put("Success",success);
					obj.put("Message",message);
				}
			}
			
		}
		else
		{
			success = "INV";
			message="Invalid Old password";
			obj.put("Success",success);
			obj.put("Message",message);

		}

		}
		else{

			String defaultPass = rs.getString("default_password");

		if(defaultPass.equals(defaultPassFetched))
		{


			String query = "update faculties set `password` = ? where `id` = ?";
		 	stmt2 = conn.prepareStatement(query);

		 	stmt2.setString (1, newPass);
		 	stmt2.setString (2, userId);
			
			if(stmt2.executeUpdate() == 1){
				success = "Y";
				message="Default Password Changed";
				obj.put("Password","SET");
			    obj.put("Success",success);
				obj.put("Message",message);
			}
			else{
				success = "N";
				message=" Password Change Failed";
			    obj.put("Success",success);
				obj.put("Message",message);
			}
			
		}
		else
		{
			success = "INV";
			message="Invalid Default password";
			obj.put("Success",success);
			obj.put("Message",message);

		}

		}

		
			
	}
	else
	{
				success = "N";
				message = "Invalid Credentials";
				obj.put("Success",success);
				obj.put("Message",message);
			
	}
}
catch(Exception e)
{
  obj.put("Success","N");
  obj.put("Message","Some problem occured. Please contact administrator "+e);
}

  out.println(obj);
%>