package com.iblog.model;

import java.sql.Timestamp;

public class Blog {
	private int blogID;
	private String userID;
	private Timestamp newstime;
	private String content;
	private int hits;
	private String nickname;
	
	public int getBlogID() {
		return blogID;
	}
	public void setBlogID(int blogID) {
		this.blogID = blogID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public Timestamp getNewstime() {
		return newstime;
	}
	public void setNewstime(Timestamp newstime) {
		this.newstime = newstime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}
