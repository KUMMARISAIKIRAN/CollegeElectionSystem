<%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="java.sql.Connection"%>
    <%
          
    %>
    <!DOCTYPE html>
    <html>
    <link rel="stylesheet" href="ho.css" type="text/css"></link>
 <h1><center>HOD POLL</center></h1>
    <body>

    
    
   
   
    
    <%
    try{
      Connection connection = null;
      Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","saikirankummari");
      PreparedStatement  pstmt= con.prepareStatement("select * from hod2");
      ResultSet rs = pstmt.executeQuery();
      %>
    <center>  
    <form name="f" action="hod.jsp" method="post" > 
      <label>Enter Your Name</label>&nbsp&nbsp

                           <input type=text required placeholder="Name" name="fullname" autofocus><br><br>
                        </div>
                        <label>Enter Your Id Number</label>

<input type=text required name="sid" placeholder="Id Number"><br><br>
                      
      
      
      
      <label><b>Select Candidates</b></label>
<select name="cand">
    <% 
 while(rs.next()){
    %>
    
<option><%=rs.getString("name") %></option>
   
    
    <%
    }
    %>
    </select>
    <br><br><br><br>
   <button class="button"><span>VOTE</span></button>
    </form>
     </center>
    <% 
    connection.close();
    } catch (Exception e) {
    e.printStackTrace();
    }
    %>
    </table>
    </body>
    </html>