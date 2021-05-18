<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="jquery-ui/jquery-ui.css">
    <link rel="stylesheet" href="jquery-ui/jquery-ui.structure.css">
    <link rel="stylesheet" href="jquery-ui/jquery-ui.theme.css">


<style type="text/css">

.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 91%, 78% 100%, 57% 92%, 37% 99%, 20% 93%, 0 100%, 0 0);

}
</style>
</head>
<body>
<%@ include file="normalnavbar.jsp" %>
	<main class="primary-background banner-background" style="padding-bottom: 80px;" >
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white ">
						<span class="fa fa-3x fa-user-circle"></span>
						<br>
						Register Here
					</div>
					<div class="card-body">
					
	<!-- form -->				
					<form id="reg-form" action="RegisterServlet" method="POST">
	 <div class="form-group">
	 
	 
    <label for="user_name">User Name</label>
    <input type="text" class="form-control" id="user_name" name="user_name" aria-describedby="" placeholder="Enter Name">
    
  </div>
					
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password" >
  </div>
   <div class="form-group">
	 
	 
    <label for="user_name">DOB</label>
    <input type="text" class="form-control" id="dateinput" name="dob" aria-describedby="" placeholder="Enter Your DOB" >
    
  </div>
  
    <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio"  id="gender"  name="gender"  value="male">Male
 
    <input type="radio"  id="gender"  name="gender" value="female" >Female
  </div>
  <div class="form-group">
  <textarea name="about" id="" class="form-control"  rows="5" placeholder="Enter something about yourself "></textarea>
  
  </div>
  
  
  <div class="form-check">
    <input type="checkbox" name="check"  class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">I agree T&C</label>
  </div>
  <br>
  <div class="container text-center" id="loader" style="display:none">
  <span class="fa fa-refresh fa-spin fa-4x "></span> <br>
  <h4>Please Wait...</h4>
  </div>
  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
</form>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU=" crossorigin="anonymous"></script>


<script type="text/javascript">
$(document).ready(function()
{
	console.log("loaded..........")
	$('#reg-form').on('submit',function(event)
	{
		event.preventDefault();
		
		let form=new FormData(this);
		
		$("#submit-btn").hide();
		$("#loader").show();
		//send register servlet
		$.ajax({
			url:"RegisterServlet",
			type:'POST',
			data:form,
			success:function (data, textStatus,jqXHR)
			{
				console.log(data);
				$("#submit-btn").show();
				$("#loader").hide();
				
				if(data.trim()==='done')
					{
				swal("Registerd Successfuly.. We are going to redirecting to login page")
				.then((value) => {
				 window.location="login-page.jsp"
				});
					}
				else
					{
					swal(data); 
					}
			}, 
		 error:function(jqXHR, textStatus , errorThrown)
		 {
				$("#submit-btn").show();
				$("#loader").hide();
			 swal("somthing went Wrong.. try again");
			
		 },
		 processData:false,
		 contentType:false
		});
	});
	});

</script>


<script type="text/javascript">
$( function() {
	var mdate = new Date();
	
    $( "#dateinput" ).datepicker({
    	changeMonth:true,
    	changeYear:true,
    	calculateWeeks:true,
    	showOtherMonths:true,
    	autoSize:true,
    	yearRange: "1960:2021",
    	maxDate:new Date(),
    	
    });
  } );




</script>
</body>
</html>