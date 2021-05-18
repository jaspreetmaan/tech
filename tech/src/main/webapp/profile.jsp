<%@page import="com.tech.blog.enities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.Dao.PostDao"%>
<%@page import="com.tech.blog.enities.Message"%>
<%@page errorPage="error.jsp" %>
<%@page import="com.tech.blog.enities.User"%>
<%

	User user =(User) session.getAttribute("CurrentUser");
	if(user == null)
	{
		response.sendRedirect("login-page.jsp");
	}

%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background{
clip-path: polygon(50% 0%, 100% 0, 100% 91%, 78% 100%, 57% 92%, 37% 99%, 20% 93%, 0 100%, 0 0);

}

		.liked{
		background:#2196f3!important;
		color: white;
	
	}
	
</style>




</head>
<body>

		<!-- Nav Bar -->
					
					<nav class="navbar navbar-expand-lg navbar-dark primary-background">
			  <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>Tech Blog</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNav">
			    <ul class="navbar-nav mr-auto">
			      <li class="nav-item active">
			        <a class="nav-link" href="profile.jsp"><span class="fa fa-fire"></span> Maan InfoTech<span class="sr-only">(current)</span></a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#"><span class="fa fa-id-badge"> </span> Contact</a>
			      </li>
			       <li class="nav-item">
			        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"> </span> Posts</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#"><span class="fa fa-navicon"> </span> Catagories</a>
			   
			      
			      
			    </ul>
			    		<ul class="navbar-nav mr-right">
			    		 <li class="nav-item">
			    	  			  <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"> </span> <%= user.getName() %></a>
			  			    </li>
			    			 <li class="nav-item">
			    	  			  <a class="nav-link"  href="LogoutServlet"><span class="fa fa-user-plus"> </span> Logout</a>
			  			    </li>
			    		</ul>
			  </div>
			</nav>
			
			<!-- end of NavBar -->
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
							
							
				<!-- main body of the page -->
							
								<main>
								
											<div class="container-fluid">
													<div class="row mt-4">
													
														<div class= "col-md-4">
														
														
														<!-- categories -->
		
														
															<div class="list-group">
																  <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
																    
																    All Posts
																  </a>
																 	<% PostDao d = new PostDao(ConnectionProvider.getConnection() );
																 		ArrayList <Category> list1= d.getAllCategories();
																 		for(Category cc:list1)
																 		{
																 			
				 	
																 	%>
																 	
																 	<a href="#" onclick="getPosts(<%=cc.getCid()%>,this)"  class=" c-link list-group-item list-group-item-action">
																    
																    	<%= cc.getName()%>
																  </a>
																  <% } %>
																 	
															</div>
															
														</div>
														
														<div class= "col-md-8" >
														
											<!-- posts -->
											
																<div class="container text-center" id="loader">
																	<i class="fa fa-refresh fa-4x fa-spin"></i>
																	<h3 class="mt-4">Loading...</h3>
																
																</div>
																
																<div class="container" id="post-container">
																
																
																</div>
																
								
														</div>
													
													</div>
													
											
											</div>
								
								</main>
							
							
							
							<!-- end main body of the page -->
							
							
							
							

		<!-- Profile Modal -->
		
	


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel"> TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
       	<img alt="notfound" src="profile/<%= user.getProfie() %> " width="140px" height="140px"  style="border-radius:50%;">
         <h5 class="modal-title" id="exampleModalLabel">  <%= user.getName() %></h5>
           </div>
         
         		<!-- details -->
         
   <div id="profile-details">
		 <table class="table">
			  <tbody>
			    <tr>
			      <th scope="row">ID :</th>
			      <td><%= user.getId() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Email :</th>
			      <td><%= user.getEmail() %></td>
			       
			    </tr>
			      <tr>
			      <th scope="row">DOB :</th>
			      <td><%= user.getDob() %></td>
			      
			    </tr>
			    <tr>
			      <th scope="row">Gender :</th>
			      <td><%= user.getGender() %></td>
			     
			    </tr>
			      <tr>
			      <th scope="row">Registered on :</th>
			      <td><%= user.getRdate().toLocaleString() %></td>
			     
			    </tr>
			  </tbody>
		</table>
		</div>
         

         
      
        
        <div id="profile-edit">
        <h3 class="mt-4">Please Edit Carefully</h3>
        
        
        <!-- form -->
        
        <form action="EditServlet" method="post" enctype="multipart/form-data">
        <table class="table">
        
        <tr>
        
        <td> ID : </td>
        <td> <%= user.getId()  %></td>
        
        </tr>	 
        
        
          <tr>
        
        <td> Email : </td>
        <td> <input type="email" class="form-control" name="user_email" value="<%=  user.getEmail()%>"> </td>
        
        </tr>
       <tr>
        
        <td> Profile Pic: </td>
        <td> <input type="file" class="form-control" name="image"> </td>
        
        </tr>
        
        </table>
        	<button type="submit" class="btn btn-outline-primary"> Save</button>
        
        
        </form>
        
        </div>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profle-button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
		
		<!-- End of Profile modal -->
		
		
		<!-- add post modal -->
	
	 
		<!-- Modal -->
		<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      
		      
		        <form id="add-post-form" action="AddPostServlet"  method="post">
		        
		       		<div class="form-group">
		       		
		       		<select class="form-control" name="cid">
		        		<option selected disabled>---Select Category</option>
		        		<%
		        		
		        			PostDao dao = new PostDao(ConnectionProvider.getConnection());
		        			ArrayList<Category> list= dao.getAllCategories();
		        			for(Category c:list)
		        			{
		        				
		        			
		        		%>
		        		<option value="<%= c.getCid() %>"><%= c.getName() %></option>
		        		<% } %>

		        	</select>
		       		
		       		</div>
		        
		        	<div class="form-group">
		        	
		        		<input type="text" name="pTitle" placeholder="Enter post Title" class="form-control" >
		        	
		        	</div>
		        	<div class="form-group">
		        	
		        		<textarea   class="form-control" name="pContent" style="height:150px;" placeholder="Enter content"></textarea>
		        	
		        	</div>
		        	
		        	<div class="form-group">
		        	
		        		<textarea  class="form-control" name="pCode" style="height:150px;" placeholder="Enter your Program (if any)"></textarea>
		        	
		        	</div>
		        	<div class="form-group">
		        		<label>Select your pic</label><br>
		        		<input type="file" id="pic" name="pic" placeholder="Choose Your pic" class="form-control" >
		        	
		        	</div>
		        		<div class="container text-center">
		        		
		        			<button type="submit" class="btn btn-outline-primary">Post</button> 
		        		
		        		</div >
		        
		        
		        
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
		
	
		
		<!-- end of add post modal -->
		
		

</body>

<!--Javascript  -->
<script src=" 	https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script type="text/javascript">


$(document).ready(function(){
	let editStatus =false;
	$("#profile-edit").hide();
	$("#edit-profle-button").click(function(){	
	if(editStatus == false)
		{
		$("#profile-details").hide();
		$("#profile-edit").show();
		$(this).text("Ok");
		editStatus=true;
		}
	else
		{
		
			$("#profile-details").show();
			$("#profile-edit").hide();
			$(this).text("Edit");
			editStatus=false;
			
		}
	
			
	});
	
		
});




</script>

<!-- now add post js -->

<script>

$(document).ready(function (e){

	 $("#add-post-form").on("submit",function (event){
		 //this code gets called when form is submitted...
		 event.preventDefault();
		 console.log("you have clicked on submit...")
		 let form = new FormData(this);
		 
		  
		 // now requesting to server
		 $.ajax({
			url:"AddPostServlet",
			type:'POST',
			data: form,
			success: function (data, textStatus, jqXHR){
				swal({
					  title: "Good job!",
					  text: "Saved Successfully",
					  icon: "success",
					  button: "OK",
					});
				//success
			}, error: function(jqXHR, textStatus, errorThrown){
				swal({
					  title: "Error",
					  text: " Something went Wrong try again..  ",
					  icon: "error",
					  button: "OK",
					});
			},
		
			processData:false,
			contentType:false
		 })
	 })
	
})




</script>

<!-- Loading post using ajax -->
<script >
	function getPosts(cId ,temp){
		$("#loader").show();
		$("#post-container").hide();
		$(".c-link").removeClass('active');
		
	$.ajax({
			
			url:"load_posts.jsp",
			data:{cid: cId},
			success: function(data , textStatus ,jqXHR)
			{
				
				$("#loader").hide();
				$("#post-container").show();
				$("#post-container").html(data);
				$(temp).addClass('active');
				
			}
		})
	
	}
	function DoPost(pid){
		
		$.post("show_blog.jsp", {post_id: pid},function(data,status){
			
			
		});
	}
	
	
	$(document).ready(function(e){
		let allPostRef=$(".c-link")[0]
		getPosts(0 , allPostRef)
		
		
	})
	
	
/* 	function liked(){
		toggleClass("liked");
	} */
	


</script>


</html>