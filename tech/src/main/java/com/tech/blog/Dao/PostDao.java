package com.tech.blog.Dao;
import java.awt.List;
import java.sql.*;
import java.util.ArrayList;

import com.tech.blog.enities.Category;
import com.tech.blog.enities.Post;
public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		this.con =con;
		
	}
	
	public ArrayList <Category> getAllCategories(){
		
			ArrayList<Category> list= new ArrayList<Category>();
			
			try {
				
				String q="select * from catagory";
				Statement st= con.createStatement();
				ResultSet set = st.executeQuery(q);
				
				
				while(set.next())
				{
					int cid=set.getInt("cid");
					String name = set.getString("name");
					String description = set.getString("description");
					Category c= new Category(cid,name, description);
					list.add(c);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
			
			
			return list;
	}
	public boolean savePost(Post p) {
		boolean f=false;
		
		try {
			
			String q= "insert into posts(title,content,code,pic,cid,uid) values (?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1,p.getTitle());
			ps.setString(2,p.getContent());
			ps.setString(3,p.getCode());
			ps.setString(4,p.getPic());
			ps.setInt(5,p.getCid());
			ps.setInt(6,p.getUid());
			ps.executeUpdate();
			f=true;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		
		return f;
	}
	//get all the post
	
	public ArrayList <Post> getAllPosts()
	{
			ArrayList<Post> list = new ArrayList<Post>();
			//fetch all the post
			 try {
				 String q = "select * from posts order by Pid desc";
				 PreparedStatement p = con.prepareStatement(q);
			
				 ResultSet set =p.executeQuery();
				 while(set.next()) {
					 int pid=set.getInt("Pid");
					 String pTitle =set.getString("title");
					 String pContent =set.getString("description");
					 String pCode =set.getString("code");
					 String pPic =set.getString("picture");
					 Timestamp date = set.getTimestamp("pDate");
					 int CatId = set.getInt("catid");
					 int userId = set.getInt("uid");
					 Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, CatId, userId);
					 
					 
					 list.add(post);
				 }
				
			} catch (Exception e) {
		
				e.printStackTrace();
			}
			
			
			
			return list;
	}
	//fetch post by catagory
	
	public ArrayList<Post> getPostByCatId(int catId){
		
		ArrayList<Post> list = new ArrayList<Post>();
		 try {
			 String q = "select * from posts where catid=?";
			 PreparedStatement p = con.prepareStatement(q);
			 p.setInt(1, catId);
			 ResultSet set =p.executeQuery();
			 while(set.next()) {
				 int id=set.getInt("pid");
				 String title =set.getString("title");
				 String content =set.getString("description");
				 String code =set.getString("code");
				 String pic =set.getString("picture");
				 Timestamp date = set.getTimestamp("postedOn");
				 int cid = set.getInt("cid");
				 int uid = set.getInt("uid");
				 Post post = new Post(id, title, content, code, pic, date, cid, uid);
				 
				 list.add(post);
			 }
			
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		 return list;
	}
	
	public Post getPostByPid(int pid) {
		Post post =null;
		
		try {
			 post = new Post();
			String q = "select * from posts where pid=?";
			PreparedStatement pst = con.prepareStatement(q);
			pst.setInt(1, pid);
			ResultSet set = pst.executeQuery();
			while(set.next())
			{
			post.setTitle(set.getString("title"));
			post.setContent(set.getString("description"));
			post.setCode(set.getString("code"));
			post.setPic(set.getString("picture"));
			post.setDate(set.getTimestamp("postedOn"));
			post.setCid(set.getInt("cid"));
			post.setUid(set.getInt("uid"));
			}
			
		
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		return post;
		
		
	}
	
}
