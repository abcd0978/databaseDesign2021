package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DBConnection;
import dto.*;

public class cardDAO 
{
	//카드 사용
	public int useCard(int card_id,int amount, String info) throws ClassNotFoundException, SQLException//오류:-1, 잔고부족:-2, 한도초과:-3 성공:1
	{
			Connection con = DBConnection.getConnection();
			PreparedStatement psmt;
			ResultSet rs;
			con.setAutoCommit(false);
			String sql = "select * from card,account where card_id = ? and card.account_id = account.account_id;";
			psmt = con.prepareStatement(sql);
			psmt.setInt(1,card_id);
			psmt.execute();
			rs = psmt.getResultSet();
			if(!rs.next())
			{
				System.out.println("27번줄");
				return -1;
			}
				
			int curbalance = rs.getInt("balance");
			int accountId = rs.getInt("account_id");
			String userId = rs.getString("user_id");
			if(curbalance < amount)
				return -2;
				
			if(rs.getInt("usage_limit")<amount)
				return -3;
				
			int aftertrans = curbalance - amount;
			try {
				String sql2 = "update account set balance = ? where account_id = ? ;";
				psmt = con.prepareStatement(sql2);
				psmt.setInt(1,aftertrans);
				psmt.setInt(2, accountId);
				psmt.execute();
				System.out.println("account업데아트ok");
				String sql3 ="insert into account_log(date,amount,type,info,account_id)"+
				" values(now(), ?, 0, ? , ? );";
				psmt = con.prepareStatement(sql3);
				psmt.setInt(1, amount);
				psmt.setString(2, info);
				psmt.setInt(3, accountId);
				psmt.execute();
				System.out.println("account_log업데아트ok");
				String sql4 = "insert into card_log(user_id,card_id,payment_date,amount) values( ?, ?, now(), ?);";
				psmt = con.prepareStatement(sql4);
				psmt.setString(1, userId);
				psmt.setInt(2, card_id);
				psmt.setInt(3, amount);
				psmt.execute();
				System.out.println("card_log업데아트ok");
				psmt.close();
				rs.close();
				con.commit();
			}
			catch(SQLException e)
			{
				con.rollback();
				e.printStackTrace();
				System.out.println("롤백함");
				return -1;
			}
			con.setAutoCommit(true);//다시 오토커밋으로 돌려놓음
		return 1;
	}
	//한명의 사람이 가진 모든 카드 반환
	public ArrayList<cardDTO> selectCards(String user_id) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select * from card, (select account_id from account where user_id = ?) as acc where"
				+ " card.account_id = acc.account_id;";
		psmt = con.prepareStatement(sql);
		psmt.setString(1,user_id);
		psmt.execute();
		rs = psmt.getResultSet();
		ArrayList<cardDTO> result = new ArrayList<cardDTO>();
		while(rs.next())
		{
			cardDTO temp = new cardDTO();
			temp.setAccount_id(rs.getInt("account_id"));
			temp.setCard_id(rs.getInt("card_id"));
			temp.setIssue_date(rs.getString("issue_date"));
			temp.setLimit(rs.getInt("usage_limit"));
			temp.setType(rs.getString("type"));
			result.add(temp);
		}
		psmt.close();
		rs.close();
		return result;
	}
	//카드 하나 찾기
	public cardDTO selectCard(int card_id) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select * from card where card_id = ? ;";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1,card_id);
		psmt.execute();
		rs = psmt.getResultSet();
		if(!rs.next())
			return null;
		cardDTO result = new 
				cardDTO(rs.getInt("card_id"), rs.getString("issue_date"),rs.getInt("usage_limit"),
						rs.getString("type"),rs.getInt("account_id"));
		return result;
	}
	//카드 사용내역 찾기
	public ArrayList<cardLogDTO> selectCardLogs(int card_id) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select * from card_log where card_id = ? ;";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1,card_id);
		psmt.execute();
		rs = psmt.getResultSet();
		ArrayList<cardLogDTO> result= new ArrayList<cardLogDTO>();
		while(rs.next())
		{
			 cardLogDTO temp = new cardLogDTO(rs.getString("user_id"), rs.getInt("card_id"),rs.getString("payment_date"),
							rs.getInt("amount"),rs.getInt("card_log_id"));
			 result.add(temp);
		}
		return result;
	}
}
