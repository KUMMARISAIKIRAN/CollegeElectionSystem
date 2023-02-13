<%@page import="java.sql.*"%>



<%



String name=request.getParameter("sname");
String id=request.getParameter("sid");
String gender=request.getParameter("gd");
String position=request.getParameter("position");
String email=request.getParameter("semail");

%>





<%
try
{

Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","saikirankummari");
    		if(position.equals("HOD")){
PreparedStatement pstmt=con.prepareStatement("insert into hod2 values(?,?,?,?) ");
    		
pstmt.setString(1,name);
pstmt.setString(2,id);
pstmt.setString(3,gender);

pstmt.setString(4,email);
    		
int n=pstmt.executeUpdate();
    		

if(n>0)
{

response.sendRedirect("Welcome_screen.html");



}
else
{
out.println("Unsuccesfull Registration");
}
    		}
    		else if(position.equals("FACULTY"))
    				{
    			PreparedStatement pstmt=con.prepareStatement("insert into faculty2 values(?,?,?,?) ");
        		
    			pstmt.setString(1,name);
    			pstmt.setString(2,id);
    			pstmt.setString(3,gender);
    			
    			pstmt.setString(4,email);
    			    		
    			int n=pstmt.executeUpdate();
    			    		

    			if(n>0)
    			{

    			response.sendRedirect("Welcome_screen.html");



    			}
    			else
    			{
    			out.println("Unsuccesfull Registration");
    				}
    		
    			}
    		else if(position.equals("STUDENT"))
			{
		PreparedStatement pstmt=con.prepareStatement("insert into students1 values(?,?,?,?) ");
		
		pstmt.setString(1,name);
		pstmt.setString(2,id);
		pstmt.setString(3,gender);
		
		pstmt.setString(4,email);
		    		
		int n=pstmt.executeUpdate();
		    		

		if(n>0)
		{

		response.sendRedirect("Welcome_screen.html");



		}
		else
		{
		out.println("Unsuccesfull Registration");
			}
		
			}
    		else
			{
		PreparedStatement pstmt=con.prepareStatement("insert into student1 values(?,?,?,?) ");
		
		pstmt.setString(1,name);
		pstmt.setString(2,id);
		pstmt.setString(3,gender);
		
		pstmt.setString(4,email);
		    		
		int n=pstmt.executeUpdate();
		    		

		if(n>0)
		{

		response.sendRedirect("currentpolls.html");



		}
		else
		{
		out.println("Unsuccesfull Registration");
			}
				
			}}

catch(Exception e)
{
out.println(e);
}



%>