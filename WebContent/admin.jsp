<%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="java.sql.Connection"%>
    <%
          
    %>
    <!DOCTYPE html>
    <html>
    <link href="style2.css" rel="stylesheet" type="text/css">
    
    <body>

<div class="topnav">
  <a class="active" href="#home">Home</a>
  <a href="viewresult.html">Results</a>
 
  <a href="Login.html">Logout</a>
  
</div>
     
<center>
    <h1>ADMIN VIEW</h1>
    <br><br><br>
    <h3>SignUp Details</h3>
    <table border="1">
    <tr>
    <td>first name</td>
    <td>last name</td>
    <td>ID</td>
    <td>Gender</td>
    <td>EmailID</td>
    <td>Password</td>

    </tr>
    </center>
    
    <%
    try{
      Connection connection = null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","saikirankummari");
      PreparedStatement  pstmt= con.prepareStatement("select * from signup");
      ResultSet rs = pstmt.executeQuery();
    while(rs.next()){
    %>
    <tr>
    <td><%=rs.getString("firstname") %></td>
    <td><%=rs.getString("lastname") %></td>
    <td><%=rs.getString("id") %></td>
    <td><%=rs.getString("gender") %></td>
    <td><%=rs.getString("emailid") %></td>
    <td><%=rs.getString("password") %></td>
    

    
    <%
    }
    PreparedStatement  pstmt1= con.prepareStatement("select * from hod1");
    ResultSet rs1 = pstmt.executeQuery();
  while(rs1.next()){
	  %>
	
    <td><%=rs.getString("NAME") %></td>
    <td><%=rs.getString("ID") %></td>
    <td><%=rs.getString("GENDER") %></td>
    <td><%=rs.getString("EMAIL") %></td>

    
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