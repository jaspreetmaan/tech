
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Maan Infotech</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 91%, 78% 100%, 57% 92%, 37% 99%, 20% 93%, 0 100%, 0 0);

}

</style>

</head>
<body>

 	<%@ include file="normalnavbar.jsp" %>
 	<div class="container-fluid p-o m-o">
 		<div class="jumbotron primary-background text-white banner-background ">
 			<div class="container">
 				<h3 class="disply-3"> Welcome to TechBlog
 				</h3>
 		
 				<p>Welocme to technical blog, world of technology 
 				For larger organizations and businesses, Web development teams can consist of hundreds of people (Web developers) and follow standard methods like Agile methodologies while developing Web sites.</p>
 				<p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.</p>
 				 
 				 <button class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span> Start ! its Free</button>
 				 <a href="login-page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>
 			</div>
 		</div>	
 		
 
 	</div>
 <!-- 	cards -->
 	<div class="container">
 	
 		<div class="row">
 		
 			<div class="col-md-4">
 				<div class="card">
					
				  	<div class="card-body">
				  	<h5 class="card-title">Java Programming</h5>
				  	 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				   	<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
				 			
 			</div>
 			<div class="col-md-4">
 				<div class="card">
					
				  	<div class="card-body">
				  	<h5 class="card-title">Java Programming</h5>
				  	 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				   	<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
				 			
 			</div>
 			<div class="col-md-4">
 				<div class="card">
					
				  	<div class="card-body">
				  	<h5 class="card-title">Java Programming</h5>
				  	 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				   	<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
				 			
 			</div>
 			
 		
 		</div>
 			<div class="row mt-4  ">
 		
 			<div class="col-md-4">
 				<div class="card">
					
				  	<div class="card-body">
				  	<h5 class="card-title">Java Programming</h5>
				  	 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				   	<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
				 			
 			</div>
 			<div class="col-md-4">
 				<div class="card">
					
				  	<div class="card-body">
				  	<h5 class="card-title">Java Programming</h5>
				  	 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				   	<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
				 			
 			</div>
 			<div class="col-md-4">
 				<div class="card">
					
				  	<div class="card-body">
				  	<h5 class="card-title">Java Programming</h5>
				  	 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				   	<a href="#" class="btn primary-background text-white">Read More</a>
  					</div>
				</div>
				 			
 			</div>
 			
 		
 		</div>
 		
 	</div>
	

<!--Javascript  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<!-- <script>
$(document).ready(function()
{
	alert("document loaded")
	})
</script> --> 
</body>
</html>