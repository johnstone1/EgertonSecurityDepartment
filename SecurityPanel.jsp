
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Security DashBoard</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
	<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
		<link href="style/css/bootstrap.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	
	<script src="style/js/jquery.js"></script>
  <script src="style/js/bootstrap.js"></script>
	<script src="style/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
	
	<style>
            .headr
            {
               font-family:    Georgia;
                font-size:      40px;
                font-weight:    bold;
                background-color: #222;
                color:#ffffff;
            }
        </style>
</head>
<body>
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache"); 


if (session.getAttribute("userOne")==null){
	response.sendRedirect("securityLogin.jsp");

}

%>
		

<div class="headr" >


		<h2><center>EGERTON UNIVERSITY</center></h2>
		<h3><center>EGERTON UNIVERSITY SECURITY DEPARTMENT</center></h3>

</div>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8">
					<!-- Button trigger modal -->
					<a href="duty.jsp">
					  Guards On Duty
					</a>
					<a href="clearance.jsp"><button type="button" class="btn btn-primary" style="Height:50px;"data-toggle="modal" data-target="#guards">
					  Requested Clearances
					</button></a>
					<a href="Accused.jsp"><button type="button" class="btn btn-primary" style="Height:50px;">
					  Accused Persons
					</button></a>
				</div>	
			<div class="col md-4"></div>
			<ul class="nav navbar-nav navbar-right">
				<div class="col-md-4">
					
					<form action="Logout">
						<button type="submit" class="btn btn-danger">Log Out</button>			
					</form>
					</div>
				</ul>
		</div>
	</div>	
</nav>




<div class="row">
	<h3  style="color:#ffffff" fon-size=15px><center>COMPLAINTS SUBMITTED </center></h3>
		<div class="col-md-4"></div>
		<div class="col-md-4">

					<form action="" method="get">
						<input type="text" name="search" class="form-control" placeholder="Search here by case data" >
					</form>
		</div>
		
</br>
 <h5 style="color:red"> ${Message} </h5>
</div>

		<div class="row">
			<div class="col-lg-10">
					</br></br>
					<table class="table table-bordered table-striped table-hover" style="margin-left:150px">
					  <thead>
					    <tr>
					   
					     <th scope="col">CaseID</th>
					      <th scope="col">Date of Occurance</th>
					      <th scope="col">Date Reported</th>
					      <th scope="col">Complainant RegNo</th>
					      <th scope="col">Venue</th>
					      <th scope="col">Time</th>
					      
					      <th scope="col">Place of Occurance</th>
					      <th scope="col">Accused person(s)</th>
					      
					      <th scope="col">Findings</th>
					      <th scope="col">Remarks</th>
					      
					      <th scope="col">Action</th>
					    </tr>
					  </thead>
					 
					  <%
					 try{
						 
						 String url="jdbc:mysql://localhost:3306/comp390?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

							String username="root";
							String password="";
							
							
							Connection conn=null;
							Statement stmt=null;
							ResultSet res=null;
							
							Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
							 conn=DriverManager.getConnection(url,username,password);
							stmt=conn.createStatement();
							String query=request.getParameter("search");
							String data;
							
							
							if(query!=null){
								data="SELECT * from complains where number like '%"+query+"%' or your_regno like '%"+query+"%'or date_of_occurrence like '%"+query+"%' or remarks like'%"+query+"%'";
							}
							else{
								
								data="SELECT * from complains ";
								
							}
							
							res=stmt.executeQuery(data);
							
							while(res.next()==true ){
						 
					 
					 
					  %>
					   <tbody>
					 	 <tr>
					 	 	<td><%=res.getString(1) %></td>
						   	<td><%=res.getString(2) %></td>
						   	<td><%=res.getString(10) %></td>
						    <td><%=res.getString(3) %></td>
						    <td><%=res.getString(4) %></td>
						    <td><%=res.getString(5) %></td>
						    <td><%=res.getString(6) %></td>
						     <td><%=res.getString(7) %></td>
						    
						     <td><%=res.getString(8) %></td>
						     <td><%=res.getString(9) %></td>
						    
					          <td> 
						      <a href="handleCase.jsp?u=<%=res.getString(1) %>" class="btn btn-warning">Handle Case</a>   
						 		 </td>
					  
					  		</tr>
					  		 </tbody>
					  <%
						}
						}catch(Exception ex){
							System.out.println("enter data again");
						}finally{
							
						}
					  
					  %> 
					 
					</table>
					</div>
			</div>


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

	



</footer>
	 
        
</body>

</html>