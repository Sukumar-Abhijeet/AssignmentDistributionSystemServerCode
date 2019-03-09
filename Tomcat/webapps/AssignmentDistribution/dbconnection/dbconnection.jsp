<%@ page import="java.sql.*"%>
<%
 Connection conn = null; 
  String connectionURL = "jdbc:mysql://localhost:3306/assignmentdistribution"; 
  // assumes database name is the same as username
  try {
    Class.forName("com.mysql.jdbc.Driver"); 
    conn = DriverManager.getConnection(connectionURL, "root", "root");
  }
  catch(SQLException e) {
    out.println("SQLException caught: " +e.getMessage());
  }
%>