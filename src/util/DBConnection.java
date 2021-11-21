package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	protected static Connection con = null;
	private DBConnection()
	{}
	public static Connection getConnection() throws SQLException, ClassNotFoundException
	{
		if(con==null)
		{
				Class.forName("com.mysql.cj.jdbc.Driver");
				String jdbcUrl = "jdbc:mysql://db.ctbroze.com:3310/dbd";
				String userId = "dbd2021";
				String userPass = "dbd2021";
				con = DriverManager.getConnection(jdbcUrl, userId, userPass);
				System.out.println("dbconnected");
		}
		return con;
	}
	public static void close() throws SQLException
	{
		if(con!=null)
		{
			if(!con.isClosed())
				con.close();
		}
	}
}

