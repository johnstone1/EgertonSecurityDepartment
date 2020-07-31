<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clearance Form</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css1.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<style>
            .headr
            {
               font-family:    Georgia;
                font-size:      40px;
                font-weight:    bold;
                background-color: #222;
                color: #ffffff;
            }
        </style>
</head>

<body>




<div class="headr" >

		<h2><center>EGERTON UNIVERSITY</center></h2>
		<h3><center>EGERTON UNIVERSITY SECURITY DEPARTMENT</center></h3>

</div>
<nav>
	<div class="container">
			<div class="row">
					<div class="col-md-4">
					
						</div>
					<div class="col-md-4"></div>
					<ul class="nav navbar-nav navbar-right">
					<div class="col-md-4">
	
									<a href="clearance.jsp" ><button type="submit" class="btn btn-danger">Back</button></a>	
						
					</div>
					</ul>
			</div>
		</div>
	</nav>

<%


   String url="jdbc:mysql://localhost:3306/comp390?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
			String username="root";
			String password="";
			
			PreparedStatement state;
			Connection conn=null;
			Statement stmt=null;
			ResultSet res=null;
			
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
			 conn=DriverManager.getConnection(url,username,password);
	 

%>

 
 
  <%
 
			stmt=conn.createStatement();
			String u=request.getParameter("u");
			
			
			String data="select * from clearance where regno ='"+u+"'";
			res=stmt.executeQuery(data);
			
			while (res.next()){

 %>



<h5 style="color:red"> ${Message} </h5>
 	
 <form action="RegAccusedServlet" method="get">
 	<div class="container">
 		<div class="row">
 		<!-- <div class="col-lg-11 col-md-11 col-sm-11"> -->	
			<table class="table table-bordered table-striped table-condensed " >
			  
				  <thead>
						    <tr>
						   
						     
						      <th>RegNo</th>
						      <th>Reason for Clearance</th>
						      <th>Action</th>
						      
						    </tr>
				  </thead>
				 		
			 		<tbody>
						 <tr>
							<td>
						<input type="text" name="regno" class="form-control" value="<%=res.getString(1) %>"readonly>
							</td>
							<td>
						<%=res.getString(2) %> 			
							</td>
							
							 <td> 
				<select class="form-control" id="place" name="action">
								<option><%=res.getString(3) %> </option>
								<option >Granted</option>
								<option>Denied</option>
						</select>
							</td>
				
						</tr>
			  		 </tbody>
			 		</table>
			 		</div>
				</div>
		</div>	 		
<div class="row">
	<div class="col-md-9"></div>
	<div class="col-md-2">
	
			<button type="submit" class="btn btn-warning">Submit Clearance</button>	
	</div>

</div>

&nbsp
 		</form>	
 		
<%
}
%>

<!-- Beginning of footer -->
<footer style ="background-color: #222; color:#ffffff" class="site-footer" >
	<div class="container">

	
 <div class="row">
	<div class="col-md-4 ">
		<adress>
			Egerton University Security Department<br>
			P.O.BOX 536,<br>
			Egerton<br>
			PHONE NO_07XXXXXXXX
		</adress>
	</div>

	<div class="col-md-4 ">
		<address>
		Egerton University<br>
		<i>Transforming Lives Through Quality Education</i><br>
		NJORO Campus<br>
		www.egerton.ac.ke
		
		</address>
	</div>
	<div class="col-md-4" >
		 <adress >
       		Chief Security <br>
        	Egerton University-Kenya<br>
        	chiefsecurity@egerton.ac.ke<br>
		 </adress>
	</div>
	</div>
	<hr>
	<p>Website information</p>
	<div class="button-footer">
	<div class="col-md-8">©SecurityDepartmentEgertonUniverity .2019</div>
	</div>
	

   </div>

	</div>



</footer>

			
			
			  
			  

</body>
</html>
