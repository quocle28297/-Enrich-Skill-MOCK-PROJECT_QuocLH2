package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
	static Connection conn = null;

	public static Connection getConnect() {
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				conn = DriverManager
						.getConnection("jdbc:sqlserver://localhost:1433;databaseName=onlineshopping;user=sa;password=123456");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("loi JDBC");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
				System.out.println("Loi Driver");
			}
			return conn;
		}
}
