package com.project;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DatabaseDAO {

	public static List<List<List<String>>> getTablesData(String databaseName1, String databaseName2, String tableName)
			throws SQLException {
		
		TableData.clearInstance();
		TableData tableData = TableData.getInstance();
		List<List<List<String>>> tablesData = new ArrayList<>();
		try {
			Connection conn1 = MysqlConnection.getConnection();
			Statement statement1 = conn1.createStatement();
			System.out.println(" databaseName 1 = " + databaseName1 + " databaseName 2 = " + databaseName2 + " tableName = " + tableName);
			statement1.executeUpdate("USE " + databaseName1 + " ;");

			ResultSetMetaData rsmd1 = statement1.executeQuery("SELECT * FROM " + tableName + " ;").getMetaData();
			int columnCount1 = rsmd1.getColumnCount();

			List<String> columnNames1 = new ArrayList<>();
			for (int i = 1; i <= columnCount1; i++) {
				columnNames1.add(rsmd1.getColumnName(i));
			}

			List<List<String>> tableData1 = new ArrayList<>();
			tableData1.add(columnNames1);

			ResultSet resultSet1 = statement1.executeQuery("SELECT * FROM " + tableName);
			List<List<String>> rowsData1 = getDataFromResultSet(resultSet1, columnCount1);
			tableData1.addAll(rowsData1);

			tablesData.add(tableData1);

			Connection conn2 = MysqlConnection.getConnection();
			Statement statement2 = conn2.createStatement();
			statement2.execute("USE " + databaseName2);

			ResultSetMetaData rsmd2 = statement2.executeQuery("SELECT * FROM " + tableName).getMetaData();
			int columnCount2 = rsmd2.getColumnCount();
			List<String> columnNames2 = new ArrayList<>();
			for (int i = 1; i <= columnCount2; i++) {
				columnNames2.add(rsmd2.getColumnName(i));
			}

			List<List<String>> tableData2 = new ArrayList<>();
			tableData2.add(columnNames2);

			ResultSet resultSet2 = statement2.executeQuery("SELECT * FROM " + tableName);
			List<List<String>> rowsData2 = getDataFromResultSet(resultSet2, columnCount2);
			tableData2.addAll(rowsData2);

			tablesData.add(tableData2);
			
			tableData.setData(tablesData);
			
			resultSet1.close();
			resultSet2.close();
			statement1.close();
			statement2.close();

		} catch (SQLException e) {
			System.out.println("Error: retrieving Table Data failed: \n"  );
			e.printStackTrace();
		}

		return tablesData;
	}

	private static List<List<String>> getDataFromResultSet(ResultSet resultSet, int columnCount) throws SQLException {
		List<List<String>> DataTableData = new ArrayList<>();

		while (resultSet.next()) {
			List<String> rowData = new ArrayList<>();
			for (int i = 1; i <= columnCount; i++) {
				String columnData = String.valueOf(resultSet.getObject(i));
				rowData.add(columnData);
			}
			DataTableData.add(rowData);
		}

		return DataTableData;
	}
}

