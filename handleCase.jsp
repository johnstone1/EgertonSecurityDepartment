<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Case Findings</title>

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
					<div class="col-md-6">
					<a href="Accused.jsp"><button type="button" class="btn btn-primary" style="Height:50px;">
					  Accused Persons
					</button></a>
						</div>
					<div class="col-md-4"></div>
					<ul class="nav navbar-nav navbar-right">
					<div class="col-md-4">
	
									<a href="SecurityPanel.jsp" ><button type="submit" class="btn btn-danger">Back</button></a>	
						
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

 
 
  <%
 
			stmt=conn.createStatement();
			String u=request.getParameter("u");
			
			
			String data="select * from complains where number ='"+u+"'";
			res=stmt.executeQuery(data);
			
			while (res.next()){

 %>


<h4 style= "color:#ffffff"><center>Case Description </center></h4>
<h5 style="color:red"> ${Message} </h5>
 	
 <form action="Case_Findings" method="post">
 	<div class="container">
 		<div class="row">
 		<!-- <div class="col-lg-11 col-md-11 col-sm-11"> -->	
			<table class="table table-bordered table-striped table-condensed " >
			  
				  <thead>
						    <tr>
						   
						     <th style=" width:5">Case ID</th>
						      <th>Date of Occurance</th>
						      <th style=" width:4px">Time of Occurance</th>
						      <th style=" width:4px">Complainant RegNo</th>
						      <th scope="col">Venue</th>
						      <th scope="col">Case Description</th>						     
						      <th style=" width:8px">Findings</th>
						      <th style=" width:7px">Remarks</th>
						    </tr>
				  </thead>
				 		
			 		<tbody>
						 <tr>
							<td>
						<input type="text" name="id" class="form-control" value="<%=res.getString(1) %>"readonly>
							</td>
							<td>
						<%=res.getString(2) %> 			
							</td>
							<td>
						<%=res.getString(5) %> 
							</td>
							 <td> 
						<%=res.getString(3) %> 
							</td>
							 <td>
						<%=res.getString(4) %> 
							</td>
								
							 <td> 		
						<%=res.getString(6) %>
							 				
							</td>
						
	
							<td>
						<textarea type="text" name="findings" rows="4" cols="40"  value="<%=res.getString(8) %> "></textarea>
							 </td>
								<td>
						<select class="form-control" id="place" name="remark" value="<%=res.getString(9) %>">
									<option >Pending</option>
									<option>Complete</option>
												 					   			 	
						</select>
     
									</td>
								
						</tr>
			  		 </tbody>
			 		</table>
			 		</div>
				</div>
		</div>	 		
<div class="row">
	<div class="col-md-2">
	</div>
	<div class="col-md-4">
		<button type="button" class="btn btn-lg btn-primary" style="height:40px" data-toggle="modal" data-target="#mymodal">Add accused</button>
	</div>
	<div class="col-md-4"></div>
	<div class="col-md-2">
	
			<button type="submit" class="btn btn-warning">Submit Findings</button>	
	</div>

</div>
 		</form>	
 		
<%
}
%>
<div class="row">
	
	<div class="modal fade" id="mymodal">
	<div class="modal-dialog"> 
					
					
		<div class="modal-body">
						
    	 		<form action="RegAccusedServlet" method="post">
      			 		
    	 			<div class="container " style="width:80%">
					<div class="card mx-auto" style="width: 50rem;">
									  
	  					<div class="card-body">
						  
						   
		 				 <div class="jumbotron" style="height:60% ;width:120% ;background-color:#2e829e;">
      		<h2  style= "color:#ffffff"><center>Accused Person Details </center></h2>
      			 				
								 <div class="form-group">
				                        <br/>
				                        <label class="control-label" for="name">Student's Full Name</label>
				                        <input type="text" name="full_name" class="form-control" style="padding:20px" placeholder="Enter full name">
				                    </div>
	                    
				                      <div class="form-group">
					                        <br/>
					                        <label class="control-label" for="password">Registration No.</label>
					                        <input type="text" name="regno"  class="form-control" style="padding:20px" placeholder="Enter RegNo Here">
				                  			  </div>
	                    
				                      <div class="form-group">
				                        <br/>
						                        <label class="control-label" for="name">Phone Number</label>
						                        <input type="text" name="contact" class="form-control"  placeholder="Enter phone number">
				                    		</div>   
				                    <div class="form-group">
					                        <br/>
					                        <label class="control-label" for="password">Case ID attached to</label>
					                        <input type="number" name="case_id"  class="form-control" style="padding:20px" placeholder="digits only">
				                  			  </div>                 
	       							<div class="modal-footer">
								<div class="pull-center">
 									<button type="submit" sty="height:20px" class="btn btn-warning">SUBMIT</button>
 					
 								</div>	
						
							</div>
						</div>
						</div>
				</div>
			</div>				
		</form>
	</div>


</div>
</div>
	&nbsp
	</div>
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
