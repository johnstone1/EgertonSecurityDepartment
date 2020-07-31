

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import logins.reasonDAO;
import logins.registerStudentsDAO;

/**
 * Servlet implementation class reason
 */
@WebServlet("/reason")
public class reason extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public reason() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	
	}
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reason=request.getParameter("reason");
		
		  HttpSession session=request.getSession();
		   String your_regno=(String)session.getAttribute("userOne");
		
		
			reasonDAO one=new reasonDAO();
		
		if(reason!=null||reason!="") {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String host= "jdbc:mysql://localhost:3306/comp390?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

				String usn ="root";
				String pwd="gerry";
				
				Connection myCon = DriverManager.getConnection(host,usn,pwd);
				String query="INSERT INTO clearance VALUES(default,?,?,default)";
				
				PreparedStatement ps = myCon.prepareStatement(query);
				
				ps.setString(1, your_regno);
				ps.setString(2, reason);
				
				ps.executeUpdate();
				System.out.println("Clearance Submitted");
				ps.close();
				myCon.close();
				
				request.setAttribute("Message","CLEARANCE REQUEST SENT");
				
			}catch(Exception exc) {
				exc.printStackTrace();
				System.out.println("exc");
			}
			
			getServletContext().getRequestDispatcher("/WelcomeStudentPage.jsp").forward(request,response);

			
		}
		else {
			request.setAttribute("Message","ALL FIELDS ARE MANDATORY WHEN CLEARING");
			response.sendRedirect("WelcomeStudentPage.jsp");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	

}
