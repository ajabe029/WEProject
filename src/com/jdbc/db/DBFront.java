package com.jdbc.db;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.user.*;

public class DBFront {
	
	public static String salt = "RaNdOm$G3NeRateD%Sa1t$#@%324325^%$#^4";
	
	public static int register(String firstname, String lastname, String username, String password, String email, String confirmPassword){
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement regStmt = null;
		int rowsEffected = 0;
		
		try{
			//Class.forName(driver).newInstance();
			
			if(username.trim().isEmpty()){
				return 0;
			}
			if(password.trim().isEmpty()){
				return 0;
			}
			
			if(email.trim().isEmpty()){
				return 0;
			}
			
			if(firstname.trim().isEmpty()){
				return 0;
			}
			
			if(lastname.trim().isEmpty()){
				return 0;
			}
			
			if(confirmPassword.trim().isEmpty()){
				return 0;
			}
			if(confirmPassword.compareTo(password) != 0){
				return 0;
			}
			
			
			regStmt = conn.prepareStatement("INSERT INTO Users(username, password, firstname, lastname, email, status, user_type) VALUES (?,?,?,?,?,?,?)");
			regStmt.setString(1, username);
			regStmt.setString(2, md5Encrypt(password + salt));
			regStmt.setString(3, firstname);
			regStmt.setString(4, lastname);
			regStmt.setString(5, email);
			regStmt.setString(6, "null");
			regStmt.setString(7, "0");
			
			rowsEffected =  regStmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (regStmt != null) {
				try {
					regStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return rowsEffected;
	}
	
	public static int reportBug(String name, String category, String description, String username){
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement regStmt = null;
		int rowsEffected = 0;
		
		try{
			//Class.forName(driver).newInstance();
			//conn = DriverManager.getConnection(url+dbName, userName, dbpassword);
			
			regStmt = conn.prepareStatement("INSERT INTO Issues(name, category, description, status, user_id) SELECT ?,?,?,?,users.user_id FROM users WHERE username=?");
			regStmt.setString(1, name);
			regStmt.setString(2, category);
			regStmt.setString(3, description);
			regStmt.setString(4, "0");
			regStmt.setString(5, username);
			
			rowsEffected =  regStmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (regStmt != null) {
				try {
					regStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return rowsEffected;
	}
	
	public static int addRecipe(String username, String name, String description, String prepTime, String cookTime, String[] steps, String[] ingredients, String[] ingredientsQuantities, String[] ingredientsQUnits){
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement regStmt = null;
		int rowsaffected = 0;
		ResultSet result = null;
		
		try{
			
			regStmt = conn.prepareStatement("INSERT INTO Recipes(name, description, preptime, cooktime) VALUES (?,?,?,?)");
			regStmt.setString(1, name);
			regStmt.setString(2, description);
			regStmt.setString(3, prepTime);
			regStmt.setString(4, cookTime);
			regStmt.executeUpdate();
			
			regStmt = conn.prepareStatement("SELECT LAST_INSERT_ID()");
			result = regStmt.executeQuery();
			result.next();
			String recipeid = result.getString(1);
			
			for(int j = 0; j < steps.length; j++){
				regStmt = conn.prepareStatement("INSERT INTO Steps(recipe_id, step_index, steptext) VALUES (?,?,?)");
				regStmt.setString(1, recipeid);
				regStmt.setInt(2, j);
				regStmt.setString(3, steps[j]);
				regStmt.executeUpdate();
			}
			
			for(int i = 0; i < ingredients.length; i++){
				regStmt = conn.prepareStatement("INSERT INTO Recipe_Ingredients(recipe_id, ingredient_id, amount_required, units) VALUES (?,?,?,?)");
				regStmt.setString(1, recipeid);
				regStmt.setString(2, ingredients[i]);
				regStmt.setString(3, ingredientsQuantities[i]);
				regStmt.setString(4, ingredientsQUnits[i]);
				regStmt.executeUpdate();
			}
			
			regStmt = conn.prepareStatement("INSERT INTO User_Recipes(recipe_id, user_id) SELECT ?,users.user_id FROM users WHERE username=?");
			regStmt.setString(1, recipeid);
			regStmt.setString(2, username);
			rowsaffected = regStmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (regStmt != null) {
				try {
					regStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(result != null){
				try{
					result.close();
				}catch (SQLException e){
					e.printStackTrace();
				}
			}
		}
		return rowsaffected;
	}
	
	public static int updateInfo(String firstname, String lastname, String email, String username, String oldUsername){
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement regStmt = null;
		int rowsEffected = 0;
		
		try{
			//Class.forName(driver).newInstance();
			//conn = DriverManager.getConnection(url+dbName, userName, dbpassword);
			
			/*
			if(confirmPassword.compareTo(password) != 0){
				return 0;
			}
			*/
			
			
			regStmt = conn.prepareStatement("UPDATE Users SET firstname=?, lastname=?, email=?, username=? WHERE username=?");
			regStmt.setString(1, firstname);
			regStmt.setString(2, lastname);
			regStmt.setString(3, email);
			regStmt.setString(4, username);
			regStmt.setString(5, oldUsername);
			
			rowsEffected =  regStmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (regStmt != null) {
				try {
					regStmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return rowsEffected;
	}
	
	public static boolean validate(String username, String pass) {		
		boolean status = false;
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement prepstmt = null;
		ResultSet result = null;
		
		try {
			
			// Prepared statement
			prepstmt = conn.prepareStatement("SELECT * FROM Users WHERE username=? AND password=?");
			prepstmt.setString(1, username);
			prepstmt.setString(2, md5Encrypt(pass + salt));

			result = prepstmt.executeQuery();
			status = result.next();
			UserDAO userDao = new UserDAO();
			User user = new User();
			user = userDao.getUser(result.getInt("user_id"));

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (prepstmt != null) {
				try {
					prepstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (result != null) {
				try {
					result.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return status;
	}
	
	public static String md5Encrypt(String input){
		
		String MD5 = null;
		
		if(input == null) return null;
		
		try{
		
		MessageDigest message = MessageDigest.getInstance("MD5");
		
		message.update(input.getBytes(), 0, input.length());
		
		MD5 = new BigInteger(1, message.digest()).toString(16);
		
		} catch (NoSuchAlgorithmException ex){
			ex.printStackTrace();
		}
		
		return MD5;
		
	}
	
	public static int getUserType(String username, String pass){
		int userType = 0;
		Connection conn = ConnectionFactory.getConnection();
		PreparedStatement prepstmt = null;
		ResultSet result = null;
		
		try {
			
			// Prepared statement
			prepstmt = conn.prepareStatement("SELECT * FROM Users WHERE username=? AND password=?");
			prepstmt.setString(1, username);
			prepstmt.setString(2, md5Encrypt(pass + salt));

			result = prepstmt.executeQuery();
			while(result.next()){
				userType = result.getInt("user_type");
			}

		} catch (Exception e) {
			System.out.println(e);
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (prepstmt != null) {
				try {
					prepstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (result != null) {
				try {
					result.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return userType;
	}

}