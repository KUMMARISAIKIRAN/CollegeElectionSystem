<%@page import="java.sql.*"%>



<%



String fullname=request.getParameter("fullname");
String sid=request.getParameter("sid");
String name=request.getParameter("cand");






try
{

Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","saikirankummari");
PreparedStatement pstmt=con.prepareStatement("insert into pollstudent values(?,?,?)");
pstmt.setString(1,fullname);
pstmt.setString(2,sid);
pstmt.setString(3,name);

pstmt.executeUpdate();
response.sendRedirect("currentpolls.html");
}
catch(Exception e)
{
out.println(e);
}



%>