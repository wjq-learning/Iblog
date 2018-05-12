package com.iblog.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.iblog.model.Reply;

public class ReplyDAO extends DBDAO {
private static ReplyDAO rDAO;
	
	private ReplyDAO(){
		super("com.mysql.jdbc.Driver","jdbc:mysql://localhost:3306/iblog3?characterEncoding=utf8&useSSL=true","root","123456");
	}
	
	public static ReplyDAO getInstance(){
		if(rDAO == null){
			rDAO = new ReplyDAO();
		}
		return rDAO;
	}
	
	public void add(int blogID, String userID, String content){
		String sql = "insert into reply(blogID, userID, replytime, content)"
					+ " value(" + blogID + ",'" + userID + "',now(),'"
					+ content + "');";
		try{
			insert(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return;
	}
	
	public ArrayList<Reply> view(int blogID, String pagenumber){
		String sql = "select replyID, blogID, reply.userID, replytime, content, user.nickname from reply,user"
					+ " where reply.userID=user.userID and blogID = "
					+ blogID + " order by replytime desc";
		int first;
		first = (Integer.parseInt(pagenumber)-1)*10;
		sql += " limit "+ first + ",10;";
		ArrayList<Reply> replys = new ArrayList<Reply>();
		Reply reply = null;
		try{
			ResultSet rs = query(sql);
			while(rs.next()){
				reply = new Reply();
				reply.setReplyID(rs.getInt(1));
				reply.setBlogID(rs.getInt(2));
				reply.setUserID(rs.getString(3));
				reply.setReplytime(rs.getTimestamp(4));
				reply.setContent(rs.getString(5));
				reply.setNickname(rs.getString(6));
				replys.add(reply);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return replys;
	}
	
	public int countReply(int blogID){
		String sql = "select count(replyID) from reply where blogID = "
					+ blogID + ";";
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
	
	public void deleteReply(int replyID){
		String sql = "delete from reply where replyID = "
					+ replyID + ";";
		try{
			delete(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return;
	}
}
