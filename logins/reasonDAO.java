package logins;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class reasonDAO {

	
	 String url="jdbc:mysql://localhost:3306/comp390?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

	String username="root";
	String password="";
	
	Connection con;
	Statement stmt;
	public void ConnecttoDB() {
		
		
		try {
			
			
			con=DriverManager.getConnection(url,username,password);
			stmt=con.createStatement();
			System.out.println("Connection Sucessful");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
	
	public void insertToDB(String QueryInsert) {
		
		ConnecttoDB();
	try {
		
		stmt.executeUpdate(QueryInsert);
		System.out.println(" close to Inserted");
		
		
	} catch (Exception e) {
		// TODO: handle exception
	}
		
	}
	
	
	

}

