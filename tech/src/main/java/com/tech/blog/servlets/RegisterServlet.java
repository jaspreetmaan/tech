package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.Dao.UserDao;
import com.tech.blog.enities.User;
import com.tech.blog.helper.ConnectionProvider;
@MultipartConfig
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	PrintWriter out = response.getWriter();
	String check = request.getParameter("check");
	if(check == null)
	{
		out.println("box not Checked");
		}
	else {
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		String gender = request.getParameter("gender");
		String about = request.getParameter("about");
		String dob=request.getParameter("dob");
//		System.out.println("date is"+dob);
		
		  SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
		  Date date=null;
		try {
			date = format.parse(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  java.sql.Date sqldate = new java.sql.Date(date.getTime());
		 
		
	
		
		/*create user object and set all data to that object*/
//		User user = new User(name,email,password,gender,about,date1);
		User user = new User(name, email, password, gender, about, sqldate);
		
		/* Create user Dao object */
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		if(dao.saveUser(user))
		{
			out.print("done");
		}
		else
		{
			out.println("error");
		}
	}

}
}
