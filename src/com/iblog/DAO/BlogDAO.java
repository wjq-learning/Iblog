package com.iblog.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.iblog.model.Blog;

public class BlogDAO extends DBDAO {
	private static BlogDAO bDAO;
	
	private BlogDAO(){
		super("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/iblog3?characterEncoding=utf8&useSSL=true","root","123456");
	}
	
	public static BlogDAO getInstance(){
		if(bDAO==null){
			bDAO = new BlogDAO();
		}
		return bDAO;
	}
	
	public int add(String userID, String content){
		String sql1 = "insert into blog(userID,newstime,content,hits)"
					+ " values('" + userID+"',now(),"+"'"+content+"',0)";
		String sql2 = "select max(blogID) from blog";
		int newBlogID = 0;
		try{
			insert(sql1);
		}catch(Exception ex){
			ex.printStackTrace();
			return 0;
		}
		try{
			ResultSet rs = query(sql2);
			if(rs.next()){
				newBlogID = rs.getInt(1);
			}
		}catch(Exception ex){
			ex.printStackTrace();
			return 0;
		}
		return newBlogID;
	}
	
	public ArrayList<Blog> view(){
		String sql = "select blogID,blog.userID,newstime,content,hits,user.nickname from blog,user"
					+ " where blog.userID=user.userID order by newstime desc limit 0,10;";
		ArrayList<Blog> blogs = new ArrayList<Blog>();
		Blog blog = null;
		try{
			ResultSet rs = query(sql);
			while (rs.next()) {
				blog = new Blog();
				blog.setBlogID(rs.getInt(1));
				blog.setUserID(rs.getString(2));
				blog.setNewstime(rs.getTimestamp(3));
				blog.setContent(rs.getString(4));
				blog.setHits(rs.getInt(5));
				blog.setNickname(rs.getString(6));
				blogs.add(blog);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return blogs;
	}
	
	public ArrayList<Blog> view(String userID, String searchName, String beginTime, String endTime, String pagenumber){
		int first;
		first = (Integer.parseInt(pagenumber)-1)*10;
		String sql = " select blogID,blog.userID,newstime,content,hits,user.nickname from blog,user"
					+ " where blog.userID=user.userID";
		if(!userID.equals("")){
			sql = sql + " and user.userID='" + userID + "'";
		}
		if(!searchName.equals("")){
			sql = sql + " and user.nickname='" + searchName + "'";
		}
		if(!beginTime.equals("")){
			sql = sql + " and newstime>='" + beginTime + "'";
		}
		if(!endTime.equals("")){
			sql = sql + " and newstime<='" + endTime + "23:59:59'";
		}
		sql += " order by newstime desc limit "+ first + ",10;";
		ArrayList<Blog> blogs = new ArrayList<Blog>();
		Blog blog = null;
		try{
			ResultSet rs = query(sql);
			while (rs.next()) {
				blog = new Blog();
				blog.setBlogID(rs.getInt(1));
				blog.setUserID(rs.getString(2));
				blog.setNewstime(rs.getTimestamp(3));
				blog.setContent(rs.getString(4));
				blog.setHits(rs.getInt(5));
				blog.setNickname(rs.getString(6));
				blogs.add(blog);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return blogs;
	}
	
	
	public int countBlog(){
		String sql = "select count(*) from blog";
		int count = 0;
		try{
			ResultSet rs = query(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return count;
	}
	
	public int countBlog(String userID, String searchName, String beginTime, String endTime){
		String sql = " select count(blogID) from blog,user"
				+ " where blog.userID=user.userID";
		if(!userID.equals("")){
			sql = sql + " and user.userID='" + userID + "'";
		}
		if(!searchName.equals("")){
			sql = sql + " and user.nickname='" + searchName + "'";
		}
		if(!beginTime.equals("")){
			sql = sql + " and newstime>='" + beginTime + "'";
		}
		if(!endTime.equals("")){
			sql = sql + " and newstime<='" + endTime + "23:59:59'";
		}
		int count = 0;
		try{
			ResultSet rs = query(sql);
			if(rs.next()){
				count = rs.getInt(1);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return count;
	}
	
	public void deleteBlog(int blogID){
		String sql = "delete from blog where blogID = "
					+ blogID + ";";
		try{
			delete(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return;
	}
	
	public Blog viewByID(int blogID){
		Blog blog = null;
		String sql = " select blogID,blog.userID,newstime,content,hits,user.nickname from blog,user"
				+ " where blog.userID=user.userID and blogID = " + blogID
				+ ";";
		try{
			ResultSet rs = query(sql);
			if(rs.next()){
				blog = new Blog();
				blog.setBlogID(rs.getInt(1));
				blog.setUserID(rs.getString(2));
				blog.setNewstime(rs.getTimestamp(3));
				blog.setContent(rs.getString(4));
				blog.setHits(rs.getInt(5));
				blog.setNickname(rs.getString(6));
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return blog;
	}
	
	public void click(int blogID){
		String sql = " update blog set hits = hits + 1 where blogID = "
					+ blogID + ";";
		try{
			update(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return;
	}
}
