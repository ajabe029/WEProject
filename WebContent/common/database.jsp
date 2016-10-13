<%@ page import="java.sql.*" %>
<%
String url = "jdbc:mysql://localhost:3306/";
String dbName = "irecipe";
String driver = "com.mysql.jdbc.Driver";
String dbuserName = "root";
String dbpassword = "soccer";


Class.forName(driver).newInstance();
Connection connection = DriverManager.getConnection(url + dbName, dbuserName, dbpassword);
%>