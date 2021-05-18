package com.tech.blog.Dao;
import java.sql.*;

import com.tech.blog.enities.User;
public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	// method to insert user to data base;
	public boolean saveUser(User user)
	{
		boolean f=false;
		try {
			
			String query="insert into user(name,email,password,gender,about,dob) values(?,?,?,?,?,?)";
			PreparedStatement pstmt= this.con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3,user.getPassword());
			pstmt.setString(4,user.getGender());
			pstmt.setString(5,user.getAbout());
			pstmt.setDate(6, user.getDob());	
			pstmt.executeUpdate();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	// authentication by email and password
	public  User getUserByEmailAndPassword(String email , String password) {
		User user=null;
		try {
			
			String query = "select * from user where email=? and password=?";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1,email);
			pstmt.setString(2,password);
			ResultSet set=pstmt.executeQuery();
			while(set.next())
			{
				user=new User();
//				String name = set.getString("name");
				user.setName(set.getString("name"));
				user.setId(set.getInt("id"));
				user.setPassword(set.getString("password"));
				user.setEmail(set.getString("email"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setProfie(set.getString("profile"));
				user.setRdate(set.getTimestamp("rdate"));
				
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return user;
	}
	public boolean updateUser(User user) {
		boolean f=false;
		try {
			String query="update user set email=? , profile=? where id=?";
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1,user.getEmail());
			p.setString(2,user.getProfie());
			p.setInt(3,user.getId());
			p.executeUpdate();
			f=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	public User getUserByUid(int uid)
	{
			User user = null;
			
			try {
				user = new User();
				String q ="Select * from user where id=?";
				PreparedStatement pst = con.prepareStatement(q);
				pst.setInt(1, uid);
				ResultSet set =  pst.executeQuery();
				while(set.next())
				{
					user=new User();
//					String name = set.getString("name");
					user.setName(set.getString("name"));
					user.setId(set.getInt("id"));
					user.setPassword(set.getString("password"));
					user.setEmail(set.getString("email"));
					user.setGender(set.getString("gender"));
					user.setAbout(set.getString("about"));
					user.setProfie(set.getString("profile"));
					user.setRdate(set.getTimestamp("rdate"));
					
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			
			
			return user;
	}
	
}
