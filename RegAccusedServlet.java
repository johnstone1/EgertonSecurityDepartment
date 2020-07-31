

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class RegAccusedServlet
 */
@WebServlet("/RegAccusedServlet")
public class RegAccusedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegAccusedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		String referer = request.getHeader("Referer");
		String  id =request.getParameter("id");

		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String host="jdbc:mysql://localhost:3306/comp390?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

			String usn = "root";
			String pwd ="";
			
			Connection myConn = DriverManager.getConnection(host,usn,pwd);
			String sql="update clearance set action=? where id='"+id+"'";
			PreparedStatement ps= myConn.prepareStatement(sql);
			
			ps.setString(1, action);
			ps.executeUpdate();
			
			System.out.println("Person is cleared");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		response.sendRedirect(referer);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
	PrintWriter out = response.getWriter();
	String referer = request.getHeader("Referer");
	String regno=request.getParameter("regno");
	String full_name=request.getParameter("full_name");
	String phone_no = request.getParameter("contact");
	String caseID = request.getParameter("case_id");
	if(regno!=null || full_name!=null ||phone_no!=null||caseID!=null) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String host= "jdbc:mysql://localhost:3306/comp390";
			String usn ="root";
			String pwd="";
			
			Connection myCon = DriverManager.getConnection(host,usn,pwd);
			String query="INSERT INTO shame VALUES(default,?,?,?,?,default)";
			
			PreparedStatement ps = myCon.prepareStatement(query);
			
			ps.setString(1, full_name);
			ps.setString(2, regno);
			ps.setString(3, phone_no);
			ps.setString(4,caseID);
			
			ps.executeUpdate();
			System.out.println("Accused Inserted");
			ps.close();
			myCon.close();
			
			
			
		}catch(Exception exc) {
			exc.printStackTrace();
			System.out.println(exc);
		}
		response.sendRedirect(referer);
	}else {
		request.setAttribute("Message", "Input all fields");
	}
	
	}

}
