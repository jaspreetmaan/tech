<%@page import="java.io.File"%>
<%@page import="com.mysql.cj.jdbc.ha.ReplicationMySQLConnection"%>
<%@page import="com.tech.blog.enities.User"%>
<%@page import="com.tech.blog.Dao.LikeDao"%>
<%@page import="com.tech.blog.enities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.Dao.PostDao"%>
<%

	User user =(User) session.getAttribute("CurrentUser");
	if(user == null)
	{
		response.sendRedirect("login-page.jsp");
	}
	
	 	
	 
%>
<%
								LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
								
						
						%>
<%
		Thread.sleep(1000);
		int cid = Integer.parseInt(request.getParameter("cid"));
	
		PostDao d=new PostDao(ConnectionProvider.getConnection());
		ArrayList<Post> posts = null;
		if(cid==0)
		{
		 posts = d.getAllPosts();
		}
		else
		{
			posts = d.getPostByCatId(cid);
		}
		{
			if(posts.size()==0)
			{
				out.println("<h3 class='display-3 text-center'>No Post in this Catagory</h3>");
				return;
			}
		}
		for(Post p:posts)
		{
			
			
		



%>
 


	<div class="col-md-8 mt-2">
	

	
	
	
			<div class="card">
			
			  		<img class="card-img-top" src="blog_pics/<%=p.getPic()%>" alt="not-found" >
				<div class="card-body">
			
					<b><%= p.getTitle() %></b>
					<p><%= p.getContent() %></p>	
					
				</div>
					<div class="card-footer bg-white text-center">
						
						<a href="show_blog.jsp?post_id=<%= p.getPid() %> " class="btn btn-outline-primary btn-sm">Read More</a>
						<a href="#!" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o" ></i><span> 5</span></a>
						<a href="#!" id="like-btn-<%=p.getPid()%>" class="btn btn-outline-primary btn-sm <%if(ld.isLikedByUser(p.getPid(),user.getId())){out.print("liked");}%>"  onclick="doLike(<%=p.getPid()%>,<%= user.getId() %>)" ><i class="fa fa-thumbs-o-up" ></i><span class="post<%=p.getPid()%>"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
					
					
					</div>
								
			
			
			</div> 
		</div> 
		
	
	
	

<% 
		}
		
%>
