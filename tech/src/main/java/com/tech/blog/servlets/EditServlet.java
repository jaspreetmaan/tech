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

import com.tech.blog.Dao.UserDao;
import com.tech.blog.enities.Message;
import com.tech.blog.enities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String userEmail = request.getParameter("user_email");
		Part part = request.getPart("image");
		
		String imageName= part.getSubmittedFileName();
		
		//get the user from session
		HttpSession session= request.getSession();
		User user =(User) session.getAttribute("CurrentUser");
		user.setEmail(userEmail);
		String oldFile = user.getProfie();
		user.setProfie(imageName);
		
		// update database
		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = userDao.updateUser(user);
		if(ans)
		{
			
			
			
	
	
			String path = "/home/jass/eclipse-workspace/m/src/main/webapp/profile/"+user.getProfie();
			String pathOldFile = "/home/jass/eclipse-workspace/m/src/main/webapp/profile/"+oldFile;
				if(!pathOldFile.equals("default.png"))
					Helper.deleteFile(pathOldFile);
				
				
				if(Helper.savefile(part.getInputStream(), path))
				{
					Message m = new Message("Update Successfully","success","alert-success");
					session.setAttribute("msg", m);
					
				}
				else
				{
					Message m = new Message("Update Failed","failed","alert-danger");
					session.setAttribute("msg", m);
					
				}
				response.sendRedirect("profile.jsp");
			}
	
	}

}
