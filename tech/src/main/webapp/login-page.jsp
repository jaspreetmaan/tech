<%@page import="com.tech.blog.enities.Message"%>
<%@page import="com.tech.blog.enities.User"%>
<%

	User user =(User) session.getAttribute("CurrentUser");
	if(user != null)
	{
		response.sendRedirect("profile.jsp");
	}

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

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
	<!-- navbar -->
	<%@include file="normalnavbar.jsp" %>

	<main class="d-flex align-items-center primary-background banner-background" style="height: 80vh">
		<div class="container">
			<div class="row">
					<div class="col-md-4 offset-md-4">
						<div class="card">
							<div class="card-header  primary-background text-white text-center">
							
								<span class="fa fa-user-plus fa-3x"></span>
								<br>
								<p> Login here </p>
							
							</div>
							<% 
							
							Message m=(Message)session.getAttribute("msg");
							if(m != null)
							{
								
							
							%>
							<div class="alert <%= m.getCssClass() %>" role="alert">
								 <%= m.getContent() %>
								 
								</div> 
							
							
							<%
								session.removeAttribute("msg");
								}
							%>
							<div class=card-body>
							<form method="POST" action="LoginServlet">
									  <div class="form-group">
									    <label  for="exampleInputEmail1">Email address</label>
									    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required">
									    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
									  </div>
									  <div class="form-group">
									    <label for="exampleInputPassword1">Password</label>
									    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
									  </div>
									  <!-- <div class="form-check">
									    <input type="checkbox" class="form-check-input" id="exampleCheck1">
									    <label class="form-check-label" for="exampleCheck1">Check me out</label>
									  </div> -->
									  <div class="container text-center">
									  <button type="submit" class="btn btn-primary">Submit</button>
										</div>
									</form>
							</div>
						
						</div>
					
					</div>
			
			</div>
		
		</div>
	
	</main>

<!--Javascript  -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>