package com.project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;


public class MysqlConnection {
	private static final Logger logger = LogManager.getLogger(MysqlConnection.class);

	private static MysqlConnection instance = null;
	private static Connection connection = null;

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
			logger.error("not working " + e.getMessage());
			throw e;
		}
	}

	// SINGLETON PROCESS
	public static MysqlConnection getInstance(String DB_URL, String DB_USER, String DB_PASSWORD) throws SQLException {
		if (instance == null) {
			instance = new MysqlConnection(DB_URL, DB_USER, DB_PASSWORD);
		}
		return instance;
	}

	// if connection has been created it will return connection
	public static Connection getConnection() {
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
	@SuppressWarnings("resource")
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

			// Check if the first database and table exist
			// System.out.println("DB_1 + TABLE SUCCESS");
			// logger.info("DB_1 CHECK SUCCESS");

			statement = connection.createStatement();
			statement.executeUpdate("USE " + DB_2 + ";");
			statement = connection.createStatement();
			resultSet = statement.executeQuery("SELECT * FROM " + tableName);

			// Check if the second database and table exist
			// System.out.println("DB_2 + TABLE SUCCESS");

			flag = true;
			System.out.println("Both databases connected succesfully");
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
				// if (connection != null) {
				// connection.close();
				// }

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

}