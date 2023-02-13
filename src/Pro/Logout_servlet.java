package Pro;

import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  

/**
 * Servlet implementation class Logout_servlet
 */
public class Logout_servlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
response.setContentType("text/html");  
PrintWriter out=response.getWriter();  

request.getRequestDispatcher("Welcome_screen.html").include(request, response);  

HttpSession session=request.getSession();  
session.invalidate();  


out.close();  
}  
}  