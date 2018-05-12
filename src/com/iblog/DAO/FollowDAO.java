package com.iblog.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.iblog.model.User;

public class FollowDAO extends DBDAO {
	private static FollowDAO rDAO;
	
	private FollowDAO(){
		super("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/iblog3?characterEncoding=utf8&useSSL=true","root","123456");
	}
	
	public static FollowDAO getInstance(){
		if(rDAO==null){
			rDAO = new FollowDAO();
		}
		return rDAO;
	}
	
	public void addFollow(String userID, String followID){
		String sql = "insert into follow(userID,followID) value('"
					+ userID + "','" + followID + "');";
		try{
			insert(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return;
	}
	
	public void deleteFollow(String userID, String followID){
		String sql = "delete from follow where userID = '"
					+ userID + "' and followID = '" + followID + "';";
		try{
			delete(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return;
	}
	
	public ArrayList<User> viewFollow(String userID,String pagenumber){
		String sql = "select user.userID, nickname, registertime from user, follow"
					+ " where follow.followID = user.userID and follow.userID = '"
					+ userID + "'";
		int first;
		first = (Integer.parseInt(pagenumber)-1)*10;
		sql += " limit "+ first + ",10;";
		ArrayList<User> users = new ArrayList<User>();
		User user = null;
		try{
			ResultSet rs = query(sql);
			while(rs.next()){
				user = new User();
				user.setUserID(rs.getString(1));
				user.setNickname(rs.getString(2));
				user.setRegistertime(rs.getTimestamp(3));
				users.add(user);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return users;
	}
	
	public ArrayList<User> viewFan(String userID,String pagenumber){
		String sql = "select user.userID, nickname, registertime from user, follow"
					+ " where follow.userID = user.userID and follow.followID = '"
					+ userID + "'";
		int first;
		first = (Integer.parseInt(pagenumber)-1)*10;
		sql += " limit "+ first + ",10;";
		ArrayList<User> users = new ArrayList<User>();
		User user = null;
		try{
			ResultSet rs = query(sql);
			while(rs.next()){
				user = new User();
				user.setUserID(rs.getString(1));
				user.setNickname(rs.getString(2));
				user.setRegistertime(rs.getTimestamp(3));
				users.add(user);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return users;
	}
	
	public int countFollow(String userID){
		String sql = "select count(followID) from follow where follow.userID = '"
					+ userID + "';";
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
	
	public int countFan(String userID){
		String sql = "select count(userID) from follow where follow.followID = '"
					+ userID + "';";
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
}
