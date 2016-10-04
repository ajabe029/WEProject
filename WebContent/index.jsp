<!DOCTYPE html>
<html lang="en">
  	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	    <meta name="description" content="sign up page / splash page">
	    <meta name="author" content="Parsnip Systems">
	    <link rel="icon" href="img/anonymous_mask.ico">
	
	    <title>Sign-Up</title>
	
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
	    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
	
	    <!-- Custom styles for this template -->
	    <link href="css/theme.css" rel="stylesheet">
	    <link href="css/login.css" rel="stylesheet">
	
	    <script src="js/ie-emulation-modes-warning.js"></script>
  	</head>
  	<body>
<!-- Carousel start -->
        <ul class="cb-slideshow">
            <li><span>Image 01</span></li>
            <li><span>Image 02</span></li>
            <li><span>Image 03</span></li>
            <li><span>Image 04</span></li>
            <li><span>Image 05</span></li>
            <li><span>Image 06</span></li>
            <li><span>Image 07</span></li>
        </ul>
<!-- End of carousel -->

<!-- Start of Code - Sign-up page -->
		
		<div class="container">
			<div class="row">
				<div class="col-xs-6 col-xs-offset-6">
					<div class="login-form panel panel-default">
						<% if(null!=request.getAttribute("errorMessage"))
						    {%>
						    <div class="alert alert-danger">
						    	<%out.println(request.getAttribute("errorMessage"));%>
						    </div>
						    <%
						    }
						%>
		      			<h1 class="logo">Incredible Recipes</h1>
		      			<br>
					    <ul class="nav nav-tabs">
					    	<li class="tab active"><a href="#signup">Sign Up</a></li>
					    	<li class="tab"><a href="#login">Log In</a></li>
					    </ul>
				      
						<div class="tab-content">
						 	<div id="signup">   
						   		<h2 class="panel-heading">Sign Up</h2>
					          	<form action="registerServlet" method="post">
					          	<div class="panel-body">
						         	<div class="row">
						         		<div class="col-xs-6">
							            	<div class="field-wrap">
							              		<label for="regFirstname">First Name<span class="req">*</span></label>
							              		<input type="text" name="regFirstname"  autocomplete="off" />
						            		</div>
					            		</div>
					            		<div class="col-xs-6">
							            	<div class="field-wrap">
							              		<label for="regLastname">Last Name<span class="req">*</span></label>
							              		<input type="text" name="regLastname" required="required" autocomplete="off"/>
							            	</div>
						            	</div>
						          	</div>
						          	<div class="row">
							          	<div class="col-xs-12">
							       			<div class="field-wrap">
						            			<label for="regUsername">Username<span class="req">*</span></label>
						            			<input type="text" name="regUsername" required="required" autocomplete="off"/>
						          			</div>
						          			<div class="field-wrap">
						            			<label for="regEmail">Email Address<span class="req">*</span></label>
						            			<input type="email" name="regEmail" required="required" autocomplete="off"/>
						          			</div>
						          			<div class="field-wrap">
						      					<label for="regPassword">Choose Password<span class="req">*</span></label>
						            			<input type="password" name="regPassword" required="required" autocomplete="off"/>
						          			</div>
						          			<div class="field-wrap">
						      					<label for="regConfirmPassword">Confirm Password<span class="req">*</span></label>
						            			<input type="password" name="regConfirmPassword" required="required" autocomplete="off"/>
						          			</div>
							          	</div>
						          	</div>
						      	</div>
						        <button type="submit" class="button button-block" value="login">Register</button>
				          		</form>
							</div>
						        
						    <div id="login">   
						    	<h2 class="panel-heading">Login</h2>
						        <form action="loginServlet" method="post">
						        	<div class="panel-body">
						        		<div class="row">
						        			<div class="col-xs-12">
										        <div class="field-wrap">
									            	<label for="loginUsername">Username<span class="req">*</span></label>
									            	<input type="text" name="loginUsername" required="required" autocomplete="off"/>
										        </div>
									          	<div class="field-wrap">
									            	<label for="loginPassword">Password<span class="req">*</span></label>
									            	<input type="password" name="loginPassword" required="required" autocomplete="off"/>
									          	</div>
										     <p class="forgot"><a href="#">Forgot Password?</a></p>
										     </div>
					        			</div>
						        	</div>
						          	<button class="button button-block">Log In</button>
						        </form>
						     </div>
						</div><!-- tab-content -->
					</div> <!-- /form -->
				</div>
		</div>
		</div>
<!-- End of Code -->

	<!-- Bootstrap core JavaScript -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/docs.min.js"></script>
    <script src="js/ie10-viewport-bug-workaround.js"></script>
    <script src="js/custom.js"></script>
    
	</body>
</html>