package com.iblog.DAO;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.iblog.model.User;

public class UserDAO extends DBDAO {
	private static UserDAO uDAO;
	
	private UserDAO(){
		super("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/iblog3?characterEncoding=utf8&useSSL=true","root","123456");
	}
	
	public static UserDAO getInstance(){
		if(uDAO==null){
			uDAO = new UserDAO();
		}
		return uDAO;
	}
	
	public User login(String userID, String password){
		String sql = "select * from user where userID = '"
					+ userID + "' and password = '" + password + "';";
		User user = null;
		try{
			ResultSet rs;
			rs = query(sql);
			if(rs.next()){
				user = new User();
				user.setUserID(rs.getString("userID"));
				user.setNickname(rs.getString("nickname"));
				user.setPassword(rs.getString("password"));
				user.setRegistertime(rs.getTimestamp("registertime"));
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return user;
	}
	
	public boolean register(String userID, String nickname, String password){
		String sql = "insert into user(userID,nickname,password,registertime)"
					+ " value('" + userID + "','" + nickname + "','"
					+ password + "',now());";
		int result = 0;
		try{
			Statement stmt = getConn().createStatement();
			result = stmt.executeUpdate(sql);
//			System.out.println(result);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return result==1;
	}
	
	public User view(String userID){
		String sql = "select * from user where userID = '"
				+ userID +"';";
		User user = null;
		try{
			ResultSet rs;
			rs = query(sql);
			if(rs.next()){
				user = new User();
				user.setUserID(rs.getString("userID"));
				user.setNickname(rs.getString("nickname"));
				user.setRegistertime(rs.getTimestamp("registertime"));
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return user;
	}
	
	public int isFollowed(String userID, String followID){
		String sql = "select count(*) from follow where userID = '"
					+ userID + "' and followID = '" + followID + "';";
		int isFollowed = 0;
		try{
			ResultSet rs;
			rs = query(sql);
			if(rs.next()){
				isFollowed = rs.getInt(1);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return isFollowed;
	}
}
