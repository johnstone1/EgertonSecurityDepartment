<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assign Duty</title>

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
            }
        </style>
</head>

<body>

<div class="row">

<div class="col-md-1">

<iframe src="http://free.timeanddate.com/clock/i6r7xlta/n170/szw110/szh110/hoc009/hbw0/hfc9ff/cf100/hnc0f9/hwc000/fan2/fas16/fac555/fdi60/mqcf0f/mqs4/mql2/mqw4/mqd78/mhcf90/mhs4/mhl3/mhw4/mhd78/mmv0/hhc990/hhs2/hmc990/hms2/hscf09" frameborder="0" width="110" height="110"></iframe>

</div>
<div class="headr" >


		<h2  style="color:#ffffff"><center>EGERTON UNIVERSITY</center></h2>
		<h3  style="color:#ffffff"><center>EGERTON UNIVERSITY SECURITY DEPARTMENT</center></h3>

</div>
<h2 font-size:15px><center>Operational Security Dashboard</center></h2>
<hr>
</div>
<nav>
	<div class="container">
			<div class="row">
					
						</div>
					<div class="col-md-4"></div>
					<ul class="nav navbar-nav navbar-right">
					<div class="col-md-4">
	
									<a href="OperationalDashboard.jsp" ><button type="submit" class="btn btn-danger">Home</button></a>	
						
					</div>
					</ul>
			</div>
		</div>
	</nav>

<%


String url="jdbc:mysql://localhost:3306/COMP390";
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
 <div class="container">
 	<div class="row">
 			
			  <table class="table  table-bordered table-striped table-hover" style="margin-left:">
			  <thead>
			    <tr>
					
			      <th scope="col">Full Name</th>
			      <th scope="col">SSN</th>
			      <th scope="col"> Phone Number</th>
			      <th scope="col"> Place</th>
			      <th scope="col" class="text-center">Date</th>
			       <th scope="col" class="text-center">Time From</th>
			        <th scope="col" class="text-center">Time To</th>
			    
			     
			    </tr>
			  </thead>
 
 
  <%
 
stmt=conn.createStatement();
String u=request.getParameter("u");


String data="select * from guards where SSNO='"+u+"'";
res=stmt.executeQuery(data);

while (res.next()){
	

 
 
 
 %>
 <h3><center>ASSIGN GUARD  HERE </center></h3>


	 			<h5 style="color:red"> ${Message} </h5>
					 	<tbody>
					 	 <tr>
					 	 	<td>
					 	 	 <input  type="text" class="form-control" id="name" name="name" value="<%=res.getString (3)%>"readonly>
					 	 	
					 	 	</td>
						   	<td>
						   	
						   	 <input  type="text" class="form-control" id="ssn" name="ssn" value="<%=res.getString (4)%>"readonly>
						   	
						   	</td>
						   	<td>
						   	 <input  type="text" class="form-control" id="phone_no" name="phone_no" value="<%=res.getString (5)%>"readonly>
						   	
						   	</td> 
 		
 					<td>
 				
					 		<select class="form-control" id="place" name="place">
					 								<option>Security Department Offices</option>
					 					   			 <option>Administration Block</option>											 					   			 	<option>Field</option>
									   			 	<option>Library</option>
													<option>University Press</option>	
				 					   			 	<option>Field</option>
				 		 							<option>Gate A(Main)</option>
				 		 							<option>Gate B(Njokerio Entry)</option>
				 		 							<option>Gate C(Tatton)</option>	
					 		 	
					 					   			 	
					 		</select>
					 	
					 	</td>				
 					
 						<td>
 					    <input type="date" name="date" class="form-control" style="padding:30px"  placeholder="date">

 				</td>
 					<td>
 					   			 	
 					 <input  type="time" class="form-control" id="timefrom" name="timefrom">
 
 					   			 	
				</td>
					<td>				
					
 					 <input  type="time" class="form-control" id="timeto" name="timeto">
 
 					 </td>  			 	
					
					
				
 					<%
}
 					%>

 					</br>
 					</tbody>
 				 
		
		 	 </table>	
		  
		  </div>
		</div>  
<div class="row">
	<div class="col-md-10"></div>
	<div class="col-md-2">
	
			<button type="submit" class="btn btn-primary"  style= "height:40px">ASSIGN GUARD</button>	
	</div>

</div>
		
		
		
		</form>

	<div class="row">
	&nbsp
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

	</div>



</footer>		
			  
			  

</body>

</html>