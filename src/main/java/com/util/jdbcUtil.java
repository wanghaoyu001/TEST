package com.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class jdbcUtil {
	private static String url;
	private static String user;
	private static String password;
	private static String driverclass;
	static{
		//从文件中读取输入流
		InputStream fis=jdbcUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
		//创建properties对象
		Properties info=new Properties();
		//从流中加载数据
		try {
			info.load(fis);
			driverclass=info.getProperty("driverclass");
			url=info.getProperty("url");
			user=info.getProperty("user");
			password=info.getProperty("password");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Connection getConn() {
		Connection conn=null;
		try {
			//数据库驱动加载
			Class.forName(driverclass);
			//2.使用驱动管理器类获取数据库连接对象
			conn=DriverManager.getConnection(
					url,
					user,
					password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}
}
