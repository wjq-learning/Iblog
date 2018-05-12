package com.iblog.model;

import java.sql.Timestamp;

public class User {
	private String userID;
	private String nickname;
	private String password;
	private Timestamp registertime;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Timestamp getRegistertime() {
		return registertime;
	}
	public void setRegistertime(Timestamp registertime) {
		this.registertime = registertime;
	}
}
