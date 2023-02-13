package Pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Login_servlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		try
		{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","saikirankummari");
    		PreparedStatement pstmt=con.prepareStatement("select * from signup where id=? and password=?");
    		pstmt.setString(1,id);
    		pstmt.setString(2,password);
    			
    		int n=pstmt.executeUpdate();
    		if(n==1){
    			response.sendRedirect("currentpolls.html");
    				//out.println("Successfully logged in....!!");
    			 	//out.println("Hello This is online College Election System !! Welcome to our website");
			}
    		else if(id.equals("123456789") && password.equals("admin1234"))
    		{
    			RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
            	rd.forward(request, response);
    		}
			else {
				out.println("Login Failed");
//				response.sendRedirect('Signup.html');
			}				
		}
		catch(Exception e)
		{		
			System.out.println(e);  
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}
