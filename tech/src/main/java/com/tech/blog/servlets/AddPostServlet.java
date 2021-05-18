package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.Dao.PostDao;
import com.tech.blog.enities.Post;
import com.tech.blog.enities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@MultipartConfig
public class AddPostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter out = response.getWriter();
			String pTitle = request.getParameter("pTitle");
			String pContent = request.getParameter("pContent");
			String pcode = request.getParameter("pCode");
			Part part = request.getPart("pic");
			int cid=Integer.parseInt(request.getParameter("cid"));
			
			
			
			//getting current user
			
			HttpSession session = request.getSession();
			User user =(User) session.getAttribute("CurrentUser");
			out.println(part.getSubmittedFileName());
			Post p =new Post(pTitle, pContent, pcode, part.getSubmittedFileName(), null, cid,user.getId());
			
			PostDao dao = new PostDao(ConnectionProvider.getConnection());
			if(dao.savePost(p)) {
				
				String path = "home/jass/eclipse-workspace/m/src/main/webapp/blog_pics/"+part.getSubmittedFileName();
				Helper.savefile(part.getInputStream(), path);
				out.println("success");
				
			}
			else
			{
				out.println("failed");
			}
			
	}

}
