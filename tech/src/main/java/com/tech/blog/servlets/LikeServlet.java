package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.Dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

public class LikeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			 String operation= request.getParameter("operation");
			 Integer uid = Integer.parseInt(request.getParameter("uid"));
			 Integer pid = Integer.parseInt(request.getParameter("pid"));
			 
			
			 
		
				 
			 LikeDao dao = new LikeDao(ConnectionProvider.getConnection());
			
			
			  if(operation.equals("status"))
			 {
				 boolean f = dao.isLikedByUser(pid,uid);
			
				 if(f)
				 {
					 
					 dao.deleteLike(pid, uid);
					 
				 }
				 else
				 {
					
					dao.insertLike(pid,uid);
					 
				 
				 }
				
				 
			 }
			 int likes = dao.countLikeOnPost(pid);
			 response.getWriter().println(likes);
			 
	}

}
