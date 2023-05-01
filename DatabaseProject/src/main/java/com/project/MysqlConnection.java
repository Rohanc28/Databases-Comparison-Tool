package com.project;
import java.sql.*;

public class MysqlConnection {
	static final String DB_URL1 = "jdbc:mysql://localhost/mysql_test_db";
    static final String DB_URL2 = "jdbc:mysql://localhost/mysql_test2_db";
    static final String USER = "root";
    static final String PASS = "admin";

    public static void main(String[] args) {
        Connection conn1 = null;
        Connection conn2 = null;
        Statement stmt1 = null;
        Statement stmt2 = null;
        ResultSet rs1 = null;
        ResultSet rs2 = null;

        try {
            // Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Open connections to both databases
            conn1 = DriverManager.getConnection(DB_URL1, USER, PASS);
            conn2 = DriverManager.getConnection(DB_URL2, USER, PASS);

            // Execute an inner join query on tables in both databases
            stmt1 = conn1.createStatement();
            stmt2 = conn2.createStatement();
            String sql = "SELECT * FROM mysql_test_db.employee " +
                         "INNER JOIN mysql_test2_db.employee " +
                         "ON mysql_test_db.employee.emp_id = mysql_test2_db.employee.emp_id";
            rs1 = stmt1.executeQuery(sql);
            rs2 = stmt2.executeQuery(sql);

            // Process the result set
            while (rs1.next()) {
                System.out.println("Employee ID: " + rs1.getInt("emp_id"));
                System.out.println("First Name: " + rs1.getString("first_name"));
                System.out.println("Last Name: " + rs1.getString("last_name"));
                System.out.println("Email: " + rs1.getString("email"));
                System.out.println("Hire Date: " + rs1.getDate("hire_date"));
                System.out.println("-------------------------------");
            }
        } catch (SQLException se) {
            // Handle errors for JDBC/SQL
            se.printStackTrace();
        } catch (Exception e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            // Close resources in reverse order
            try {
                if (rs2 != null) {
                    rs2.close();
                }
                if (stmt2 != null) {
                    stmt2.close();
                }
                if (conn2 != null) {
                    conn2.close();
                }
                if (rs1 != null) {
                    rs1.close();
                }
                if (stmt1 != null) {
                    stmt1.close();
                }
                if (conn1 != null) {
                    conn1.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}
