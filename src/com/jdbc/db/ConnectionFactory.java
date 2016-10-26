package com.jdbc.db;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class ConnectionFactory {
    //static reference to itself
	private static ConnectionFactory conn = new ConnectionFactory();
	public static final String url = "jdbc:mysql://localhost:3306/";
	public static final String dbName = "irecipe";
	public static final String driver = "com.mysql.jdbc.Driver";
	public static final String userName = "root";
	public static final String dbpassword = "soccer";
     
    //private constructor
    private ConnectionFactory() {
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
     
    private Connection createConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(url+dbName, userName, dbpassword);
        } catch (SQLException e) {
            System.out.println("ERROR: Unable to Connect to Database.");
        }
        return connection;
    }   
     
    public static Connection getConnection() {
        return conn.createConnection();
    }
}