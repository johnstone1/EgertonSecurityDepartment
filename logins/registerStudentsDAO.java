package logins;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class registerStudentsDAO {

	
	 String url="jdbc:mysql://localhost:3306/comp390?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

	String username="root";
	String password="";
	
	Connection con;
	Statement stmt;
	public void ConnecttoDBS() {
		
		
		try {
			
			con=DriverManager.getConnection(url,username,password);
			stmt=con.createStatement();
			System.out.println("Connection Sucessful");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	public void insertToDBS(String QueryInserti) {
		
		
	try {
		
		ConnecttoDBS();
		
		stmt.executeUpdate(QueryInserti);
		System.out.println(" close to Inserted");
		
		
	} catch (Exception e) {
		// TODO: handle exception
	}
		
	}
}
