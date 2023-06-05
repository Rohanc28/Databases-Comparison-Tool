package com.project;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcConnection {

	// function to check if the provided username and password are valid for
	// connecting to the database
	public static boolean checkDatabase(String username, String password, String databaseName, String urlInput) {
	    try {
	        // initialize connection parameters
	        String url = urlInput;

	        // create connection
	        Connection connection = DriverManager.getConnection(url, username, password);

	        // if connection is successful, check if the database exists
	        if (connection != null) {
	            System.out.println("Connection to oracle successful");

	            // get database metadata
	            DatabaseMetaData metadata = connection.getMetaData();

	            // check if database exists
	            ResultSet resultSet = metadata.getCatalogs();
	            System.out.println(resultSet);
	            while (resultSet.next()) {
	                String db = resultSet.getString(1);
	                System.out.println(db);
	                if (db.equals(databaseName)) {
	                    System.out.println("Database found");
	                    connection.close();
	                    return true;
	                }
	            }
	            System.out.println("Database not found");
	            connection.close();
	            return false;
	        }
	    } catch (Exception e) {
	        // if connection fails, return false
	        System.out.println("Connection failed");
	        e.printStackTrace();
	    }
	    return false;
	}


	public static void printTables(String username, String password, String databaseName, String urlInput) {
		if (checkDatabase(username, password, databaseName, urlInput)) {
			String url = urlInput + databaseName;
			try {
				Connection conn = DriverManager.getConnection(url, username, password);
				DatabaseMetaData md = conn.getMetaData();
				ResultSet rs = md.getTables(null, null, "%", null);
				while (rs.next()) {
					String tableName = rs.getString(3);
					String tableType = rs.getString(4);
					if (tableType.equalsIgnoreCase("TABLE")) {
						System.out.println(tableName);
					}
				}
				conn.close();
			} catch (SQLException e) {
				System.out.println("Error printing tables: " + e.getMessage());
			}
		} else {
			System.out.println("Cannot print tables: database does not exist or user does not have access.");
		}
	}

	public static void main(String[] args) {
		String username = "system";
		String password = "Oracle4321";
		String urlInput = "jdbc:oracle:thin:@localhost:1521:xe";

		String databaseName = "XE";

		if (checkDatabase(username, password, databaseName, urlInput)) {
			System.out.println("Database " + databaseName + " exists and user has access.");
			System.out.println("Tables:");
			printTables(username, password, databaseName, urlInput);
		} else {
			System.out.println("Database " + databaseName + " does not exist or user does not have access.");
		}
	}
}