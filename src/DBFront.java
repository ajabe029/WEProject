import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBFront {
	private static String url = "jdbc:mysql://localhost:3306/";
	private static String dbName = "irecipe";
	private static String driver = "com.mysql.jdbc.Driver";
	private static String userName = "root";
	private static String dbpassword = "soccer";
	private static String salt = "RaNdOm$G3NeRateD%Sa1t$#@%324325^%$#^4";
	
	public static int register(String firstname, String lastname, String username, String password, String email, String confirmPassword){
		Connection conn = null;
		PreparedStatement regStmt = null;
		int rowsEffected = 0;
		
		try{
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url+dbName, userName, dbpassword);
			
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
			
			
			regStmt = conn.prepareStatement("INSERT INTO Users(username, password, firstname, lastname, email, status) VALUES (?,?,?,?,?,?)");
			regStmt.setString(1, username);
			regStmt.setString(2, md5Encrypt(password + salt));
			regStmt.setString(3, firstname);
			regStmt.setString(4, lastname);
			regStmt.setString(5, email);
			regStmt.setString(6, "null");
			
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
	
	public static int updateInfo(String firstname, String lastname, String email, String username, String oldUsername){
		Connection conn = null;
		PreparedStatement regStmt = null;
		int rowsEffected = 0;
		
		try{
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url+dbName, userName, dbpassword);
			
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
		Connection conn = null;
		PreparedStatement prepstmt = null;
		ResultSet result = null;

		
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url + dbName, userName, dbpassword);
			
			// Prepared statement
			prepstmt = conn.prepareStatement("SELECT * FROM Users WHERE username=? AND password=?");
			prepstmt.setString(1, username);
			prepstmt.setString(2, md5Encrypt(pass + salt));

			result = prepstmt.executeQuery();
			status = result.next();

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
}