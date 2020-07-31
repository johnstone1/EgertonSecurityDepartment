<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>


<%
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
                color:#ffffff;
            }
        </style>
</head>
<body style="background-color:  #006666;">

	<div class="headr" >


		<h2><center>EGERTON UNIVERSITY</center></h2>
		<h3><center>EGERTON UNIVERSITY SECURITY DEPARTMENT</center></h3>

</div>
<div  class="row">
<h4 style="color:yellow">${Message}</h4>
<div class="col-sm-6">
<div class="col-lg-2 col-md-2 col-sm2"></div>


</div>


<div  class="modal fade" id="mymodal">
  
				<div class="modal-dialog">
					<div style="background-color:#009999" class="modal-content">

						<div class="modal-header">
						
							<h3 style="color:#ffffff;"><center>Egerton University Security Department</center></h3>
							<h3 style="color:#ffffff;"><center>Register new Students</center></h3>
							
						</div>
						
      			 		<div class="col-12 grid-margin">
          
           </div>
           <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    
                    
                    
                    <form action="register_student" class="form-sample" method="post">
                     
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">NAME </label>
                            <div class="col-sm-9">
                              <input type="text" name="username"  placeholder="username" class="form-control" />
                            </div>
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label"> Gender</label>
                            <div class="col-sm-9">
                              <select class="form-control" name="gender">
                                <option>Male</option>
                                <option>Female</option>
                                <option>Any other</option>
                                
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">REG_NO</label>
                            <div class="col-sm-9">
                              <input type="text" name="regno" placeholder="Reg number" class="form-control" />
                            </div>
                          </div>
                        </div>
                       
                      </div>
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">FACULTY</label>
                            <div class="col-sm-9">
                              <select class="form-control" id="faculty" name=faculty>
 					   			 	<option>Faculty of Agriculture</option>
 					   			 	<option>Faculty of Science</option>
 					   			 	<option>Faculty of Education</option>
 					   			 	<option>Faculty of Arts and Social Sciences</option>
 					   			 	<option>Faculty of Health Sciences</option>
 					   			 	<option>Faculty of Engineering</option>
 					   			 	<option>Faculty of Environmental Resource Development(FERD)</option>
 					   			 	</select>

                            </div>
                          </div>
                        </div>
                       
                      </div>
                      
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Enter password</label>
                            <div class="col-sm-9">
                              <input type="password" name="password" placeholder="enter password" class="form-control" />
                            </div>
                          </div>
                        </div>
                       
                      </div>
                      <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label">Confirm password</label>
                            <div class="col-sm-9">
                              <input type="password" name="password2" placeholder="confirm password" class="form-control" />
                            </div>
                          </div>
                        </div>
                        
                      </div>
                        
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row">
                            <label class="col-sm-3 col-form-label"></label>
                            
                          </div>
                        </div>
                        <div class="col-md-6">
                          <div class="form-group row">
                            <button type="submit" class="btn btn-success mr-2">Submit</button>
                      
                          </div>
                        </div>
                      </div>
                      
                    </form>
                  </div>
                </div>
           
           
	</div>


</div>
</div>
</div>
<div class="container">
	<div class="row"></div>
	&nbsp
</div>
<footer style ="background-color: #222; color:#ffffff" class="site-footer" style="margin-botton:0px" >
	
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
</html>
</body>
