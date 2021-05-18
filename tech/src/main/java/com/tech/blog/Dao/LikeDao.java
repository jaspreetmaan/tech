package com.tech.blog.Dao;
import java.sql.*;
import java.util.ArrayList;

import com.tech.blog.enities.Likes;
import com.tech.blog.enities.User;
public class LikeDao {
	Connection con;
	
	public LikeDao(Connection con) {
		
		this.con = con;
	}

	public boolean insertLike(int pid , int uid)
	{
		boolean f=false;
		try {
			String q="insert into likes (pid,uid) values (?,?)";
			PreparedStatement p = con.prepareStatement(q);
			p.setInt(1, pid);
			p.setInt(2, uid);
			p.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return f;
		
	}
	public int countLikeOnPost(int pid)
	{
		int count=0;
				String q="select count(*) from likes where pid=?";
				try {
					PreparedStatement p = con.prepareStatement(q);
					p.setInt(1,pid);
					ResultSet set = p.executeQuery();
					if(set.next())
					{
						count = set.getInt("count(*)");
					}
					
					
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}
				
				
				return count;
	}
	public boolean isLikedByUser(int pid , int uid)
	{
		boolean f=false;
		
		
				try {
					String q="select * from likes where pid=? and uid=?";
					PreparedStatement p = con.prepareStatement(q);
					p.setInt(1, pid);
					p.setInt(2, uid);
					ResultSet set =p.executeQuery();
					if(set.next()) {
						f=true;
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
				
				return f;
	}
	public boolean deleteLike(int pid , int uid)
	{
			boolean f=false;
			
			try {
				String q= " delete from likes where pid=? and uid =? ";
				PreparedStatement p = con.prepareStatement(q);
				p.setInt(1, pid);
				p.setInt(2, uid);
					p.executeUpdate();
					f=true;
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			
			return f;
	}
	public ArrayList<Likes> whoLikeThisPost(int pid){
		ArrayList<Likes> ulist = new ArrayList<Likes>();
		
		try {
			String q = "select uid from likes where pid=?";
			PreparedStatement p = con.prepareStatement(q);
			p.setInt(1, pid);
			ResultSet set = p.executeQuery();
			
			while(set.next())
			{
				int uid = set.getInt("uid");
				Likes likeList = new Likes(uid);
				ulist.add(likeList);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		
		return ulist;
	}
	
		
}
