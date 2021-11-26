package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	public String selectUid(String email,String pw) {
		String result = null;
		Connection conn;
		try {
			conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT user_id FROM user WHERE email = ? AND password = ?");
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("user_id");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
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
	
	public boolean insert(userDTO dto) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		String sql = "INSERT INTO user (user_id, name, address, birth, email, phone, job, is_client, password) VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? );";
		psmt = con.prepareStatement(sql);
		psmt.setString(1,dto.getUser_id());
		psmt.setString(2,dto.getName());
		psmt.setString(3,dto.getAddress());
		psmt.setDate(4,convertDate(dto.getBirth().toString()));
		psmt.setString(5,dto.getEmail());
		psmt.setString(6,dto.getPhone());
		psmt.setString(7,dto.getJob());
		psmt.setBoolean(8, dto.getIs_client());
		psmt.setString(9, dto.getPassword());
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
				rs.getDate("birth"),rs.getString("email"),rs.getString("phone"),
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
	public boolean update(userDTO dto) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "update user set name = ? , address = ? , birth = ? , email = ? , phone = ? , job = ? WHERE user_id = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setString(1,dto.getName());
		psmt.setString(2,dto.getAddress());
		psmt.setDate(3,dto.getBirth());
		psmt.setString(4,dto.getEmail());
		psmt.setString(5,dto.getPhone());
		psmt.setString(6,dto.getJob());
		psmt.setString(7, dto.getUser_id());
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
		String sql = "select * from user where user_id = ? ;";
		psmt = con.prepareStatement(sql);
		psmt.setString(1, uid);
		psmt.execute();
		rs = psmt.getResultSet();
		if(!rs.next())
			return -1;
		boolean result = rs.getBoolean("is_client");
		return result == true ? 1 : 0;
	}
	
	private java.sql.Date convertDate(String d) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			return new java.sql.Date(format.parse(d).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
