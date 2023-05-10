package com.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;
import java.util.ArrayList;
import java.util.List;

public class MysqlConnection {
	private static final Logger logger = LogManager.getLogger(MysqlConnection.class);

	private static MysqlConnection instance = null;
	private Connection connection = null;

	// private static final String DB_URL = null;//"jdbc:mysql://localhost:3306/";

	public MysqlConnection(String DB_URL, String DB_USER, String DB_PASSWORD) throws SQLException {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
			System.out.println("CONNECTION SUCCESS");
			logger.info("connection success");
		} catch (ClassNotFoundException e) {
			logger.error("Error, couldn't connect " + e.getMessage());
			throw new SQLException("MYSQL Couldnt connect ", e);
		} catch (SQLException e) {
			logger.error("God please " + e.getMessage());
			throw e;
		}
	}

	public static MysqlConnection getInstance(String DB_URL, String DB_USER, String DB_PASSWORD) throws SQLException {
		if (instance == null) {
			instance = new MysqlConnection(DB_URL, DB_USER, DB_PASSWORD);
		}
		return instance;
	}

	// if connection has been created it will return connection
	public Connection getConnection() {
		return connection;
	}

	// closes db connection:
	// checks if connection exists, it is closed, else returns error
	public void closeConnection() {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// method to check if database received from formData exist + user accessible
	// and given table exists in both databases;
	public boolean checkDatabases(String DB_1, String DB_2, String tableName) {
		logger.info("Inside Mysql checkDatabase method");
		Statement statement = null;
		ResultSet resultSet = null;
		Connection connection = getConnection();
		boolean flag = false;
		try {
			statement = connection.createStatement();
			statement.executeUpdate("USE " + DB_1 + " ;");
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM " + tableName);

			// System.out.println("DB_1 + TABLE SUCCESS");
			// logger.info("DB_1 CHECK SUCCESS");

			statement = connection.createStatement();
			statement.executeUpdate("USE " + DB_2 + ";");
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM " + tableName);

			// System.out.println("DB_2 + TABLE SUCCESS");

			flag = true;
			// logger.info("success finding both db +table");
		} catch (SQLException e) {
			logger.error("couldn't check both db" + e);
			flag = false;
		} finally {
			// close the resources in a finally block
			try {
				if (resultSet != null) {
					resultSet.close();
				}
				if (statement != null) {
					statement.close();
				}
//				if (connection != null) {
//					connection.close();
//				}

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	public List<List<List<String>>>getTablesFromDatabases(String DB_1, String DB_2, String TableName) throws SQLException {
		List<List<List<String>>> tables = new ArrayList<>();
		Connection conn1 = getConnection();
		Statement stmt1 = conn1.createStatement();
		// Connect to first database
		try {
			stmt1.executeUpdate("USE " + DB_1 + " ;");
			ResultSet rs1 = stmt1.executeQuery("Select * from " + TableName + " ;");
			

			List<List<String>> tables1 = new ArrayList<>();
			// Retrieving the ResultSetMetaData object
			ResultSetMetaData rsmd = rs1.getMetaData();
			// getting the column type
			int column_count1 = rsmd.getColumnCount();
			
			while (rs1.next()) {
				List<String> row = new ArrayList<>();
				row.add(Integer.toString((rs1.getInt("emp_id"))));
				row.add((rs1.getString("first_name")));
				row.add((rs1.getString("last_name")));
				row.add((rs1.getString("email")));
				row.add((rs1.getString("hire_date")));
				
				tables1.add(row);
			}

			tables.add(tables1);

		} catch (SQLException e) {
			System.out.println("Table 1 could not be connected");
		}

		// Connect to second database
		try {
			
			stmt1.executeUpdate("USE " + DB_2 + " ;");
			ResultSet rs2 = stmt1.executeQuery("Select * from " + TableName + " ;");
			
			List<List<String>> tables2 = new ArrayList<>();
			// Retrieving the ResultSetMetaData object
			ResultSetMetaData rsmd = rs2.getMetaData();
			// getting the column type
			int column_count2 = rsmd.getColumnCount();
			
			while (rs2.next()) {
				List<String> row = new ArrayList<>();
				row.add(Integer.toString((rs2.getInt("emp_id"))));
				row.add((rs2.getString("first_name")));
				row.add((rs2.getString("last_name")));
				row.add((rs2.getString("email")));
				row.add((rs2.getString("hire_date")));
				
				tables2.add(row);
			}
			tables.add(tables2);
			System.out.println(tables);
		} catch (SQLException e) {
			System.out.println("Table 2 could not be connected");
		}

		return tables;
	}
}
//	public static void main(String[] args) { 
//  // Set up database connection details 
//  String dbUrl = "jdbc:mysql://localhost:3306/"; 
//  String dbUser = "root"; 
//  String dbPassword = "admin";
//  
//  // Create new instance of MysqlConnection 
//  try { MysqlConnection mysql =
//  MysqlConnection.getInstance(dbUrl, dbUser, dbPassword);
//  
//  // Test getConnection() method 
//  Connection conn = mysql.getConnection();
//  if (conn != null) { System.out.println("Connection is not null");}
//  
//  
//  // Test checkDatabases() method 
//  boolean flag = mysql.checkDatabases("mysql_test2_db", "mysql_test_db", "Employee"); 
//  if(flag) { 
//	  System.out.println("Both databases exist and table exists in both");
//  }
//  
//  // Test closeConnection() method mysql.closeConnection(); 
//  if(conn.isClosed()) 
//  { 
//	  System.out.println("Connection is closed"); 
//  } 
//  }catch (SQLException e) 
//  	{ 
//	  logger.error("couldn't check both db"+e);
//	  System.out.println("Error connecting to database: " + e.getMessage()); 
//	  } 
//  }
