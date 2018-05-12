package com.iblog.DAO;


import java.sql.*;


public class DBDAO {

	private static DBDAO dbDAO;
	private Connection conn;
	private String driver;
	private String url;
	private String username;
	private String pass;

	protected DBDAO(){
		this.setDriver("com.mysql.jdbc.Driver");
		this.setUrl("jdbc:mysql://localhost:3306/iblog3?characterEncoding=utf8&useSSL=true");
		this.setUsername("root");
		this.setPass("123456");
		try {
			Class.forName(driver).newInstance();
		} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			setConn(DriverManager.getConnection(url,username,pass));
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected DBDAO(String driver, String url, String username, String pass){
		this.setDriver(driver);
		this.setUrl(url);
		this.setUsername(username);
		this.setPass(pass);
		try {
			Class.forName(driver).newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			setConn(DriverManager.getConnection(url,username,pass));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static DBDAO getInstance(){
		if (dbDAO == null)
		{
			dbDAO = new DBDAO();
		}
		return dbDAO;
	}
	public static DBDAO getInstance (String driver, String url, String username, String pass) throws Exception{
		if (dbDAO == null)
		{
			dbDAO = new DBDAO(driver,url,username,pass);
		}
		return dbDAO;
	}


	public void getConnection() throws Exception
	{
		if (conn == null)
		{
			Class.forName(this.driver);
			conn = DriverManager.getConnection(this.url, this.username, this.pass);
		}
	}

	public ResultSet query(String sql) throws Exception
	{
		getConnection();
		Statement stmt = conn.createStatement();

		try
		{
			ResultSet rs = stmt.executeQuery(sql);
			return rs;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;	
	}

	public int update(String sql) throws Exception
	{
		getConnection();
		Statement stmt = conn.createStatement();
		int res = 0;
		try
		{
			res = stmt.executeUpdate(sql);
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return res;
	}

	public int delete(String... sqls) throws Exception
	{
		int num = sqls.length;
		conn.setAutoCommit(false);
		int res = 0;
		try
		{
			Statement stmt = conn.createStatement();
			String sql;
			for (int i=0;i<num;i++)
			{
				sql = sqls[i];
				res += stmt.executeUpdate(sql);
			}
			conn.commit();
		}
		catch (Exception e)
		{
			conn.rollback();
		}
		return res;
	}

	public int insert(String... sqls) throws Exception
	{
		int num = sqls.length;
		conn.setAutoCommit(false);
		int res = 0;
		try
		{
			Statement stmt = conn.createStatement();
			String sql;
			for (int i=0;i<num;i++)
			{
				sql = sqls[i];
				res += stmt.executeUpdate(sql);
			}
			conn.commit();
		}
		catch (Exception e)
		{
			conn.rollback();
		}
		return res;
	}
	
	public int update(String... sqls) throws Exception
	{
		int num = sqls.length;
		conn.setAutoCommit(false);
		int res = 0;
		try
		{
			Statement stmt = conn.createStatement();
			String sql;
			for (int i=0;i<num;i++)
			{
				sql = sqls[i];
				res += stmt.executeUpdate(sql);
			}
			conn.commit();
		}
		catch (Exception e)
		{
			conn.rollback();
		}
		return res;
	}
	//setter & getter
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	
}
