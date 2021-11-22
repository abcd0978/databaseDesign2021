package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.*;
import dto.accountDTO;
import dto.accountLogDTO;
import java.util.ArrayList;

public class accountDAO {
	//계좌들조회
	public ArrayList<accountDTO> selectAccounts(String user_id) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select * from account where user_id = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setString(1,user_id);
		psmt.execute();
		
		rs = psmt.getResultSet();
		ArrayList<accountDTO> result = new ArrayList<accountDTO>();
		while(rs.next())
		{
			accountDTO temp = new accountDTO();
			temp.setAccount_id(rs.getInt("account_id"));
			temp.setBalance(rs.getInt("balance"));
			temp.setIs_request(rs.getBoolean("is_request"));
			temp.setOpen_date(rs.getString("open_date"));
			temp.setUser_id(rs.getString("user_id"));
			temp.setType(rs.getInt("type"));
			result.add(temp);
		}
		rs.close();
		psmt.close();
		return result;
	}
	//입출금내역 조회
	public ArrayList<accountLogDTO> selectAccountLogs(int account_id) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select * from account_log where account_id = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1,account_id);
		psmt.execute();
		rs = psmt.getResultSet();
		ArrayList<accountLogDTO> result = new ArrayList<accountLogDTO>();
		while(rs.next())
		{
			accountLogDTO temp = new accountLogDTO();
			temp.setAccount_id(rs.getInt("account_id"));
			temp.setAmount(rs.getInt("amount"));
			temp.setType(rs.getBoolean("type"));
			temp.setInfo(rs.getString("info"));
			temp.setAccount_log_id(rs.getString("account_log_id"));
			temp.setDate(rs.getString("date"));
			result.add(temp);
		}
		rs.close();
		psmt.close();
		return result;
	}
	//특정계좌반환
	public accountDTO selectAccount(int account_id) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select * from account where account_id = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1,account_id);
		psmt.execute();
		rs = psmt.getResultSet();
		if(!rs.next())
			return null;
		accountDTO result;
		result = new accountDTO(rs.getInt("account_id"), 
				rs.getInt("type"), rs.getInt("balance"), 
				rs.getBoolean("is_request"), rs.getString("open_date"), rs.getString("user_id"));
		rs.close();
		psmt.close();
		return result;
	}
	//송금(가능,불가능여부 반환)
	public int sendMoney(int sender_account_id, int receiver_account_id,int send_amount, int receive_amount, String info) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select balance from account where account_id = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1,sender_account_id);
		psmt.execute();
		rs = psmt.getResultSet();
		int currentBal=rs.getInt("balance");
		psmt.close();
		rs.close();
		if(currentBal < send_amount)//현재 가지고있는 돈보다 더 많이 보내려고 한다면,
			return -1;
		String sql2 = "update account set balance = ? where account_id = ?;";
		psmt = con.prepareStatement(sql2);
		psmt.setInt(1,currentBal-send_amount);
		psmt.setInt(2,sender_account_id);
		psmt.execute();
		psmt.close();
		String sql3 = "update account set balance = balance + ? where account_id = ?;";
		psmt = con.prepareStatement(sql3);
		psmt.setInt(1, receive_amount);
		psmt.setInt(2, receiver_account_id);
		psmt.execute();
		psmt.close();
		return 1;
	}
	//입금
	public Boolean deposit(int account_id, int amount) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "update account set balance = balance + ? where account_id = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1, amount);
		psmt.setInt(2, account_id);
		boolean result = psmt.execute();
		psmt.close();
		return result;
	}
	//출금 (가능,불가능여부반환)
	public int withdraw(int account_id, int amount) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select balance from account where account_id = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1,account_id);
		psmt.execute();
		rs = psmt.getResultSet();
		int currentBal = rs.getInt("balance");
		psmt.close();
		rs.close();
		if(currentBal < amount)//가지고있는 돈보다 더 많은돈을 출금하려고 할때
			return -1;
		String sql2 = "update account set balance = balance - ? where account_id = ?;";
		psmt = con.prepareStatement(sql2);
		psmt.setInt(1,amount);
		psmt.setInt(2, account_id);
		psmt.execute();
		return 1;
	}
	
}
