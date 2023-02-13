package Pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class admin extends HttpServlet {
  private static final long serialVersionUID = 1L;
       
    public admin() {
        super();
        // TODO Auto-generated constructor stub
    }

 
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    PrintWriter out = response.getWriter();
    
    try {
      Class.forName("oracle.jdbc.driver.OracleDriver");
      
      // connection establishment
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","systemsaikiran");
      
      // creating the statement
      PreparedStatement  pstmt= con.prepareStatement("select * from signup");
      
      ResultSet rs = pstmt.executeQuery();
      
        while (rs.next())
        {
          out.println("Firstname="+ rs.getString(1) +"Lastname="+ rs.getString(2) +" ID="+ rs.getString(3) +"Gender="+ rs.getString(4) +" Email="+ rs.getString(5) + "Password="+rs.getString(6));
          out.println("");
        }
        
        // close the connection
      con.close();

    }
    catch(Exception e){
      System.out.println(e);
    }
  }

}