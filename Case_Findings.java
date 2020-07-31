

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Case_Findings
 */
@WebServlet("/Case_Findings")
public class Case_Findings extends HttpServlet {
	
	
	 String url="jdbc:mysql://localhost:3306/comp390?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

	String username="root";
	String password="";
	Connection conn;
	Statement stmt;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Case_Findings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String  id =request.getParameter("id");
		String Date=request.getParameter("Date");
		String regno_no=request.getParameter("regno_no");
		String venue=request.getParameter("venue");
		
		String time=request.getParameter("time");
		String occurance=request.getParameter("occurance");
		String findings=request.getParameter("findings");
		String remark=request.getParameter("remark");
		
		//System.out.println(findings);
		//System.out.println(remark);
	

		if(findings==""||findings.equals(null)||remark==""||remark.equals(null)) {
			
			request.setAttribute("Message","Please fill in findings and remark section ");
			getServletContext().getRequestDispatcher("/SecurityPanel.jsp").forward(request,response);
		}
			recordCaseDAO case1Findings= new recordCaseDAO();
			
			String sql="update complains set findings='"+findings+"',remarks='"+remark+"',Handled_by='admin' where number='"+id+"'";
		
			case1Findings.insertToDB(sql);
			System.out.println("Case Handled");
			request.setAttribute("Message"," One Case Handled");
			response.sendRedirect("SecurityPanel.jsp");
		

			
			
			
		
		
		
	
	
			
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
