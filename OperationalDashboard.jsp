<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>
<html>


<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css1.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>Guard Operations Dashboard</title>
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
<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache"); 


if (session.getAttribute("officer")==null){
	response.sendRedirect("OperationalOfficer1.jsp");

}

%>
<div class="headr" >


		<h2><center>EGERTON UNIVERSITY</center></h2>
		<h3><center>EGERTON UNIVERSITY SECURITY DEPARTMENT</center></h3>

</div>
<h2><center>Operational Security Dashboard</center></h2>
<hr>
<nav>
<div class="container">
			<div class="row">
					<div class="col-md-4">
					
					<button type="button" class="btn btn-lg btn-primary" style="Height:40px;"data-toggle="modal" data-target="#mymodal2">Add new guard</button>
							<a href="GuardsAssigned.jsp"><button type="button" style="Height:40px;" class="btn btn-lg btn-primary" ">Guards Assigned</button></a>
					</div>
					<div class="col-md-4"></div>
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

<div class="modal fade" id="mymodal2">
	<div class="modal-dialog"> 
					
					
		<div class="modal-body">
					
		 <form action="AdGuaRDservlet" method="post">
			<div class="container " style="width:80%">
				<div class="card mx-auto" style="width: 50rem;">
									  
				  <div class="card-body">
						  
						   
					 <div class="jumbotron" style="height:60% ;width:120% ;background-color:#2e829e;"> 
						 
						 	<h2  style= "color:#ffffff"><center>Register New Guard  Here </center></h2>
						 				<h5 style="color:yellow"> ${Message} </h5>
					 	
					 		
			 					<div class="form-group">
			 						<label class="control-label"  style= "color:#ffffff" date"  >DATE</label>
			 					    <input type="date" name="date" class="form-control" style="padding:30px"  placeholder="date">
					
			 					</div>
					 					
			 					<div class="form-group">
				 					<label class="control-label"  style= "color:#ffffff" for ="name"  >FULL NAME</label>
				 				    <input type="text" name="name" class="form-control" style="padding:20px" placeholder="FULL NAMES">
					
					 			</div>
					 			<div class="form-group">
					 				<label class="control-label"  style= "color:#ffffff"for ="ssn" >SSN</label>
					 			    <input type="text" name="ssn" class="form-control" style="padding:20px" placeholder="SSN">
					
					 			</div>
					 			<div class="form-group">
					 				<label class="control-label"  style= "color:#ffffff"for ="phone_no" >PHONE NUMBER</label>
					 			    <input type="number" name="phone_no" class="form-control" placeholder="07...">
					
					 			</div>
								 			
			<button type="submit" class=" form-control btn btn-primary"  style= "background-color: #00394d">ADD GUARD</button>
					 					
							</div>
						</div>
					 			
	 		</div>
		</div>
							 
					
					  
					
	</form>
					
</div>	
						
						
</div>
</div>	
						
						<div class="modal fade" id="mymodal3">
					<div class="modal-dialog"> 
					
					
					<div class="modal-body">
					
					<%
					
					
					String url="jdbc:mysql://localhost:3306/comp390";
						String username="root";
						String password="gerry";
						
						PreparedStatement state;
						Connection conn=null;
						Statement stmt=null;
						ResultSet res=null;
						
						Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
						 conn=DriverManager.getConnection(url,username,password);
						 
					
					%>
					
					 <form action="AssignedGuards" method="post">
					 
					  <%
					 
					stmt=conn.createStatement();
					String u=request.getParameter("u");
					
					
					String data="select * from guards where SSNO='"+u+"'";
					res=stmt.executeQuery(data);
					
					while (res.next()){
						
					
					 
					 
					 
					 %>
			<div class="container " style="width:40%">
					<div class="card mx-auto" style="width: 50rem;">
					 <img src="" class="card-img-top mx-auto"  alt="...">
					  
					  <div class="card-body">
						  
						   
						 <div class="jumbotron" style="height:60% ;width:120% ;background-color:#2e829e;"> 
						 
						 	<h2  style= "color:#ffffff"><center>ASSIGN GUARD  HERE </center></h2>
						 				<h5 style="color:red"> ${Message} </h5>
					 	
					 		
					 					
					 					<div class="form-group">
					 						<label class="control-label"  style= "color:#ffffff" for ="name"  >FULL NAME</label>
					 					    <input type="text" name="name" class="form-control" style="padding:20px" value="<%=res.getString(3) %>"readonly>
					
					 					</div>
					 					<div class="form-group">
					 						<label class="control-label"  style= "color:#ffffff"for ="ssn" >SSN</label>
					 					    <input type="text" name="ssn" class="form-control" style="padding:20px" value="<%=res.getString(4) %>" readonly>
					
					 					</div>
					 					
					 					<div class="form-group">
					 						<label class="control-label"  style= "color:#ffffff"for ="phone_no" >PHONE_NO</label>
					 					    <input type="text" name="phone_no" class="form-control" style="padding:20px" value="<%=res.getString(5) %> "readonly>
					 					</div>
					 					
					 					
					 					
					 						<div class="form-group">
														
												<label style="color:#ffffff" class="control-label" for ="place">PLACE</label>
										 		<select class="form-control" id="place" name="place">
										 					   			 	<option>Field</option>
										 					   			 	<option>LIBRARY</option>
										 					   			 	<option>ADMIN</option>
										 					   			 	<option>LOWERFIELD</option>
										 		 							<option>Gate A</option>
										 		 							<option>Gate B</option>
										 		 							<option>Gate C</option>	
										 					   			 	
										 		</select>
										 		
											</div>
										 					
					 					<div class="form-group">
					 						<label class="control-label"  style= "color:#ffffff"  >DATE</label>
					 					    <input type="date" name="date" class="form-control" style="padding:30px"  placeholder="date">
					
					 					</div>
					 					
					 					<div class="form-group">
														
										<label style="color:#ffffff; class="control-label" for ="timefrom">TIME_FROM</label>
					 					   			 	
					 					 <input  type="time" class="form-control" id="timefrom" name="timefrom">
					 
					 					   			 	
										</div>
										
										<div class="form-group">
														
										<label style="color:#ffffff; class="control-label" for ="timeto">TIME_TO</label>
					 					   			 	
					 					 <input  type="time" class="form-control" id="timeto" name="timeto">
					 
					 					   			 	
										</div>
					 					<%
					}
					 					%>
					 					
					 					
					 					
					 					
					 			
					 					<button type="submit" class=" form-control  btn-primary"  style= "background-color: #00394d">ASSIGN GUARD</button></br>
					 					<a href="OperationalDashboard.jsp" class="btn btn-default">BACK</a>
					 					
					 					
					 					</div>
					 				</div>
					 			
					 		</div>
					 		</div>
							 
					
					  
					
					</form>
					
					</div>
					</div>	
					</div>
								
			<h3 style="color:#ffffff"><center>GUARDS DETAILS</center></h3>		
				<div class="container">	
					<div class="row" >
					<div class="col-md-12 col-lg-12 col-sm-12">
					
					
					 <h5 style="color:red"> ${Message} </h5>
					  
					
					<table class="table table-bordered table-striped table-condensed align-center table-hover">
					  <thead>
					    <tr>
					    	
							<th scope="col">Date</th>
					      <th scope="col">Full Name</th>
					      <th scope="col">SSN</th>
					      <th scope="col"> Phone Number</th>
					      <th scope="col" class="text-center">Action</th>
					    	<th></th>
					    	<th></th>	
					     
					    </tr>
					  </thead>
					 
					  <%
					 try{
						 
						
						
							
							Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
							conn=DriverManager.getConnection(url,username,password);
							stmt=conn.createStatement();
							String data2="SELECT * from guards order by Date";
							res=stmt.executeQuery(data2);
							
							while(res.next()==true ){
						 
					 
					 
					  %>
					   <tbody>
					 	 <tr>
					 	 	
					 	 	<td><%=res.getString (2)%></td>
						   	<td><%=res.getString(3) %></td>
						   	<td><%=res.getString(4) %></td>
						  	 <td><%=res.getString(5) %></td>
						  	
						    <td class="text-center">
						  
						  			  <a href="AssignDuty.jsp?u=<%=res.getString(4) %>" class="btn btn-primary">ASSIGN GUARD</a>
						 		 </td>
						  <td class="text-center">
						  
						    <a href="EditGuards.jsp?u=<%=res.getString(4) %>" class="btn btn-warning">UPDATE</a>
						 	 </td>
					       
					        <td class="text-center">
	  
	   								 <a href="deleteGuards.jsp?d=<%=res.getString(4) %>" >
	   								 <button typle="submit" class="btn btn-danger" style="height:30px"> 
	   								 DELETE</button></a>
	 							 </td>
						  
						  	  
					  		</tr>
					  		 </tbody>
					  <%
						}
						}catch(Exception ex){
							out.println("error1");
						}finally{
							
						}
					  
					  %> 
					 
					</table>
					</div>
					</div><!-- End of Guard Details Table -->
					<hr>
			
				
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