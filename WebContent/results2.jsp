<%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="java.sql.Connection"%>
    <%
          
    %>
    <!DOCTYPE html>
    <html>
    <link href="style2.css" rel="stylesheet" type="text/css">
   <div class="topnav">
  <a href="admin.jsp">Home</a>
  <a class="active" href="viewresult.html">Results</a>
 
  <a href="Login.html">Logout</a>
  </div>
    <body>
<center>
     <h1>Poll Results</h1>
      <br><br><br>
      <h3>Faculty Poll Results</h3>
    <table border="1">
    <tr>
    <td>Name</td>
    <td>No.of.Votes</td>
    
    </tr>
    </center>
    
    <%
    String name=request.getParameter("name");
    try{
      Connection connection = null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","saikirankummari");

      Statement st=con.createStatement();
      String strQuery = (" SELECT VNAME, COUNT(*) FROM pollfaculty GROUP BY VNAME ORDER BY 2 DESC");
      
      ResultSet rs = st.executeQuery(strQuery);
     
      while(rs.next()){
    	  
    	    %>
    	    <tr>
    	    <td><%=rs.getString(1) %></td>
    	    <td><%=rs.getString(2) %></td>
    	    </tr>
    	    

    	    
    	    <%
    	    }
      
     
    
   
    connection.close();
  }
    catch (Exception e)
    {
    e.printStackTrace();
    }
    %>
    </table>
    </body>
    </html>
    