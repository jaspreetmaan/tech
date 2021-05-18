package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
private static Connection con;
public static Connection getConnection()
{
	try {
		if(con==null)
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techBlog","root","Bigshark@12");
			
		}
		
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return con;
}
}
