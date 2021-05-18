package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.Dao.UserDao;
import com.tech.blog.enities.Message;
import com.tech.blog.enities.User;
import com.tech.blog.helper.ConnectionProvider;


public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		PrintWriter out = response.getWriter();
		
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		
		
		User u=dao.getUserByEmailAndPassword(email, password);
		if(u==null)
		{
			// Error
//			out.println("Invalid Details..try again");
//			out.println(email +" /n"+ password); 
			Message msg = new Message("Invalid Details ! try with another","error","alert-danger");
			HttpSession s = request.getSession();
			s.setAttribute("msg",msg); 
			response.sendRedirect("login-page.jsp");
		}
		else
		{
			//login success
			HttpSession session = request.getSession();
			session.setAttribute("CurrentUser", u);
			response.sendRedirect("profile.jsp");
		}
	}

}
