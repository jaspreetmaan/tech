<%@page import="com.tech.blog.enities.Likes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.Dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="org.apache.catalina.startup.ConnectorCreateRule"%>
<%@page import="com.tech.blog.Dao.UserDao"%>
<%@page import="com.tech.blog.enities.User"%>
<%@page import="com.tech.blog.enities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.Dao.PostDao"%>
<%

	User user =(User) session.getAttribute("CurrentUser");
	if(user == null)
	{
		response.sendRedirect("login-page.jsp");
	}
	
	 	
	 
%>
<% int pid= Integer.parseInt(request.getParameter("post_id")); 

PostDao post = new PostDao(ConnectionProvider.getConnection());
		

		Post p = post.getPostByPid(pid);
		if(p==null)
		{
		out.println("no Values");
		return;
		}
		
		 UserDao dao=new  UserDao(ConnectionProvider.getConnection());
		 
		 		
		%>
			
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= p.getTitle() %></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	
	.post-title{
	
			font-weight:100;
			color:white;
			font-size:30px
			
	}
	.post-content{
		font-weight:100;
		font-size:25px;
	}
	.post-date{
		font-style: italic ;
		
		
		
	}
	.user-info{
		font-size: 20px;
		font-weight: 100;
	}
	.row-user{
		border: 1px solid #e2e2e2;
		padding-top: 15px
	}
	body{
		background: url("img/dynamic.jpg");
		background-size:cover;
		background-attachment: fixed;
	}
	pre, code{
    white-space:pre-line;
    background: #f6f6f6;
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
				
					<div class="container">
					<div class="row my-4">
					<div class=" col-md-8 offset-md-2 ">
							<div class="card mb-3">
						 
						  <div class="card-header primary-background">
						  
						  	 <h5 class=" post-title" ><%= p.getTitle() %></h5>
						  </div>
						  <div class="card-body">
						  
						    <img class="card-img-top" src="blog_pics/<%=p.getPic()%>" width="250px" alt="Card image cap">
						    	<div class="row my-3 row-user">
						    		<div class="col-md-8">
						    		<p class="user-info"> Posted by<a href="#" data-toggle="modal" data-target="#profileModal">
						    		
						    					<% if (user.getId()==dao.getUserByUid(p.getUid()).getId())
						    					{
						    						out.println("You");
						    						
						    					}
						    					else
						    					{
						    						out.println(dao.getUserByUid(p.getUid()).getName());
						    					}
						    					
						    					%>
						    		
						    		
						    		 </a>  </p>
						    		</div>
						    		<div class="col-md-4">
						    			<small class="post-date">  On <%=DateFormat.getDateInstance().format(p.getDate()) %> </small>
						    		</div>
						    	
						    	</div>
						    
						    
						    <p class="post-content"><%= p.getContent() %></p>
						    <br>
						    <div class="post-code">
						    <pre><code>
						   			<%= p.getCode() %>
						    </code></pre>
						    		</div>				    
					
						  </div>
						  		<div class="card-footer">
						  		<%
								LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
								
						
						%>
						  			<a href="#!" class="btn-sm"  data-toggle="modal" data-target="#lModal" ><span id="post<%=pid%>" > <%= ld.countLikeOnPost(pid) %></span> Likes </a><br>
						  				    <a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o" ></i><span> 5</span></a>
										<a href="#!" id="like-btn-<%=pid%>" class="btn btn-outline-primary btn-sm <%if(ld.isLikedByUser(pid,user.getId())){out.print("liked");}%>"  onclick="doLike(<%=pid%>,<%= user.getId() %>)" ><i class="fa fa-thumbs-o-up" ></i><span class="post<%=pid%>"><%= ld.countLikeOnPost(pid) %></span></a>
			
						  		
						  		</div>
						</div>
						</div>
					
					
					
					</div>
					</div>
					
					
	<!-- user profile modal -->
	<% 
	User userd = dao.getUserByUid(p.getUid());
	
	
	
	
	%>
	
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> Posted By</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="container text-center">
        <img  alt="notfound" src="profile/<%= userd.getProfie() %> " width="140px" height="140px"  style="border-radius:50%;">
        </div>
        	 <table class="table">
			  <tbody>
				<tr>
			      <th scope="row">Name :</th>
			      <td><%= userd.getName() %></td>
			       
			    </tr>
			
			    <tr>
			      <th scope="row">Email :</th>
			      <td><%= userd.getEmail() %></td>
			       
			    </tr>
			    <tr>
			      <th scope="row">Gender :</th>
			      <td><%= userd.getGender() %></td>
			     
			    </tr>
			      <tr>
			      <th scope="row">Joined on :</th>
			      <td><%= DateFormat.getDateInstance().format(userd.getRdate()) %></td>
			     
			    </tr>
			  </tbody>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>

<!-- End of user profile modal -->	


<!-- show likes modal -->

<div class="modal fade" id="lModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"> <%= ld.countLikeOnPost(pid) %> Likes </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      Like by <br>
      <table>
      	<tbody>
       		<%  ArrayList <Likes> uid =  ld.whoLikeThisPost(pid); 
       			for(Likes ul:uid)
       			{
        		%>
        			<% User ulist = dao.getUserByUid(ul.getUid()); %>
        		<tr>
			      <th scope="row"><img  alt="notfound" src="profile/<%=ulist.getProfie() %> " width="35px" height="35px"  style="border-radius:50%;"></th>
			      <td><a href="#!">  <%=  ulist.getName() %></a></td>
			       
			    </tr>
       		  
       
       		
       		<%} %>
       	</tbody>		
       </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

      </div>
    </div>
  </div>
</div>

<!-- End of show like modal -->
<div class="modal fade" id="lkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
			
					
</body>


<script src=" 	https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
<script type="text/javascript" >
		
	
		

</script>
</html>