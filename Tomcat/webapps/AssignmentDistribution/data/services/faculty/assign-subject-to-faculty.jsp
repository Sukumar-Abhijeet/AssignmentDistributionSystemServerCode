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
PreparedStatement stmt,stmt2,stmt3 = null;
	 JSONObject obj=new JSONObject();
	String success = "N";
	String message = "";

	String facultyId = request.getParameter("faculty");
	String departmentId = request.getParameter("department");
	String batchId = request.getParameter("batch");
	String semseterId = request.getParameter("semseter");
	String subjectId = request.getParameter("multipleSubjects");
	String change = request.getParameter("change");
	String oldFacultyId = request.getParameter("oldFacultyId");
try{
	
	if(change.equals("YES"))
	{

		String query2 = "update faculty_subjects set faculty_id = ? where `branch_id`= ? and `batch_id` = ? and `semester_id` = ? and `subject_id` = ? ";
		stmt3 = conn.prepareStatement(query2);
		stmt3.setString   (1, facultyId);
		//stmt3.setString (1, oldFacultyId);
		stmt3.setInt (2, Integer.parseInt(departmentId));
		stmt3.setInt (3, Integer.parseInt(batchId));
		stmt3.setInt (4, Integer.parseInt(semseterId));
		stmt3.setInt   (5,Integer.parseInt(subjectId));

			if(stmt3.executeUpdate() == 1)
			{
				 success = "Y";
				 message = "Faculty Changed Successfully";
				 obj.put("Success",success);
				 obj.put("Message",message);
				 obj.put("Chnage","YES");
			}
			else
			{
				success = "N";
				 message = "Faculty Changed Failed";
				 obj.put("Success",success);
				 obj.put("Message",message);
			}

	}
	else
	{

			String sql = "select * from faculty_subjects where  `branch_id`= ? and `batch_id` = ? and `semester_id` = ? and `subject_id` = ? ";
		stmt2=conn.prepareStatement(sql); 
		//stmt2.setString (1, facultyId);
		stmt2.setInt (1, Integer.parseInt(departmentId));
		stmt2.setInt (2, Integer.parseInt(batchId));
		stmt2.setInt (3, Integer.parseInt(semseterId));
		stmt2.setInt   (4,Integer.parseInt(subjectId));
		  ResultSet rs = stmt2.executeQuery();  
		if(rs.next())
		{
			 success = "EX";
			 message = "Already Linked";
			 obj.put("Success",success);
			 obj.put("Message",message);
		}
		else
		{



					String query = " insert into faculty_subjects (faculty_id, branch_id, batch_id, semester_id, subject_id)"
				        + " values (?, ?, ?, ?, ?)";
				stmt = conn.prepareStatement(query);

				stmt.setString (1, facultyId);
				stmt.setInt (2, Integer.parseInt(departmentId));
				stmt.setInt (3, Integer.parseInt(batchId));
				stmt.setInt (4, Integer.parseInt(semseterId));
				stmt.setInt   (5,Integer.parseInt(subjectId));
				
				 if(stmt.executeUpdate() == 1)
				{
				 	 success = "Y";
					 message = "Subject Linked Successfully";
					 obj.put("Success",success);
					 obj.put("Message",message);
					 obj.put("Chnage","NO");
				}
				else
				{
					 success = "N";
					 message = "Subject Linked Failed";
					 obj.put("Success",success);
					 obj.put("Message",message);
				}
		}

	}
	

	
}
catch (Exception ex) {
  obj.put("Success","N");
  obj.put("Message","Some problem occured. Please contact administrator "+ex);
  }
  out.println(obj);
%>
