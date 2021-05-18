package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.enities.Message;


public class LogoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	HttpSession session = request.getSession();
	session.removeAttribute("CurrentUser");
		Message m = new Message("Logout Successfully","success","alert-success");
		session.setAttribute("msg", m);
		response.sendRedirect("login-page.jsp");
		
		
	}

}
