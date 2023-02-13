<%@page import="java.sql.*"%>



<%
String id=request.getParameter("id");
String password=request.getParameter("password");
out.println(id);
out.println(password);
%>





<%
try
{
Connection con=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","saikirankummari");
PreparedStatement pstmt=con.prepareStatement("Select * from admin where id=? and password=?");
pstmt.setString(1,id);
pstmt.setString(2,password);
ResultSet rs=pstmt.executeQuery();
if(rs.next())
{
//response.sendRedirect("adminhome.html");
out.println("Succesful");
}
else
{
out.println("Unsuccesfull login");
}

}

catch(Exception e)
{
out.println(e);
}




%>