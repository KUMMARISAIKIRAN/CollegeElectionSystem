package Pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Signup_servlet extends HttpServlet {
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter(); 
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String id=request.getParameter("id");
		String gender=request.getParameter("gender");	
		String email=request.getParameter("emailid");
		
		String password=request.getParameter("password");
		
		System.out.println(firstname);
		System.out.println(lastname);
		System.out.println(id);
		System.out.println(gender);
		System.out.println(email);
		
		System.out.println(password);
		try
		{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","saikirankummari");
    		
        
    			PreparedStatement pstmt=con.prepareStatement("insert into signup values(?,?,?,?,?,?)");
    			
    			pstmt.setString(1,firstname);
    			pstmt.setString(2,lastname);
    			pstmt.setString(3,id);
    			pstmt.setString(4,gender);
    			pstmt.setString(5,email);
    			
    			pstmt.setString(6,password);
    			
    			int n=pstmt.executeUpdate();
    			if(n>0)
    				response.sendRedirect("Login.html");
    			else
    				out.println("Failed.....!!");
		}
		catch(Exception e)
		{		
			System.out.println(e);  
			System.out.println("hirdgreh....................");  
		}
		out.close();
	}
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		
//		doGet(request, response);
//	}

}
