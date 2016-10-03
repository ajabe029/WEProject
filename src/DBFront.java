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
	
	public static int register(String firstname, String lastname, String username, String password, String email, String confirmPassword){
		Connection conn = null;
		PreparedStatement regStmt = null;
		int rowsEffected = 0;
		
		try{
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url+dbName, userName, dbpassword);
			
			regStmt = conn.prepareStatement("INSERT INTO Users(username, password, firstname, lastname, email, status) VALUES (?,?,?,?,?,?)");
			System.out.println(username);
			regStmt.setString(1, username);
			regStmt.setString(2, password);
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
			prepstmt.setString(2, pass);

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
}