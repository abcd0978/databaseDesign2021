package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBConnection;
import dto.*;
public class userDAO 
{
	private Connection con=null;
	public userDAO()
	{
		try {
			this.con = DBConnection.getConnection();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public boolean insert(String user_id, String name, String address, String birth, String email, String phone,String job, boolean is_client, String password) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		String sql = "INSERT INTO table_name (user_id, name, address, birth, email, phone, job, is_client, password) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? );";
		psmt = con.prepareStatement(sql);
		psmt.setString(1,user_id);
		psmt.setString(2,name);
		psmt.setString(3,address);
		psmt.setString(4,birth);
		psmt.setString(5,email);
		psmt.setString(6,phone);
		psmt.setString(7,job);
		psmt.setBoolean(8, is_client);
		psmt.setString(9, password);
		boolean result = psmt.execute();
		psmt.close();
		return result;
	}
	public userDTO select(String user_id) throws SQLException
	{
		PreparedStatement psmt;
		ResultSet rs;
		userDTO result;
		String sql = "select * from user where user_id = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, user_id);
		psmt.execute();
		rs = psmt.getResultSet();
		if(!rs.next())
			return null;
		result = new userDTO(
				rs.getString("user_id"),rs.getString("name"),rs.getString("address"),
				rs.getString("birth"),rs.getString("email"),rs.getString("phone"),
				rs.getString("job"),rs.getBoolean("is_client"),rs.getString("password"));
		return result;
			
	}
	//개인정보 관리
	public boolean update(String name, String address, String birth, String email, String phone,String job) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "update user set name = ? , address = ? , birth = ? , email = ? , phone = ? , job = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setString(1,name);
		psmt.setString(2,address);
		psmt.setString(3,birth);
		psmt.setString(4,email);
		psmt.setString(5,phone);
		psmt.setString(6,job);
		boolean result = psmt.execute();
		psmt.close();
		return result;
	}
	public boolean delete(String user_id) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select * from account where user_id = ? ;";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, user_id);
		psmt.execute();
		if(psmt.getResultSet()!=null)
			return false;
		String sql2 = "delete from user where user_id = ? ;";
		psmt = con.prepareStatement(sql2);
		psmt.setString(1, user_id);
		boolean result = psmt.execute();
		return result;		
	}
	public int checkValid(String uid) throws SQLException, ClassNotFoundException//-1은 null 1은 client, 0은 emp
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select is_client from account where user_id = ? ;";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.execute();
		rs = psmt.getResultSet();
		if(!rs.next())
			return -1;
		int result = rs.getInt("is_client");
		return result;		
	}
}
