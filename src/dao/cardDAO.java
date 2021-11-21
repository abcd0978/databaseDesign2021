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
		String sql = "select balance,limit from card,account where card_id = ?;";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1,card_id);
		psmt.execute();
		rs = psmt.getResultSet();
		if(!rs.next())
			return -1;
		int curbalance = rs.getInt("balance");
		if(curbalance < amount)
			return -2;
		if(rs.getInt("limit")<amount)
			return -3;
		int aftertrans = curbalance - amount;
		psmt.close();
		rs.close();
		String sql2 = "update account set balance = ? where account_id = "
				+ "(select account_id from card where card_id = ? );";
		psmt = con.prepareStatement(sql2);
		psmt.setInt(1,aftertrans);
		psmt.setInt(2, card_id);
		psmt.execute();
		psmt.close();
		return 1;
	}
	//한명의 사람이 가진 모든 카드 반환
	public ArrayList<cardDTO> selectCards(String user_id) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select * from card where user_id = ? ;";
		psmt = con.prepareStatement(sql);
		psmt.setString(1,user_id);
		psmt.execute();
		rs = psmt.getResultSet();
		if(!rs.next())
			return null;
		ArrayList<cardDTO> result = new ArrayList<cardDTO>();
		while(rs.next())
		{
			cardDTO temp = new cardDTO();
			temp.setAccount_id(rs.getInt("account_id"));
			temp.setCard_id(rs.getInt("card_id"));
			temp.setIssue_date(rs.getString("issue_date"));
			temp.setLimit(rs.getInt("limit"));
			temp.setType(rs.getString("type"));
			result.add(temp);
		}
		psmt.close();
		rs.close();
		return result;
	}
	//한 계좌에 딸린 카드하나 반환
	public cardDTO selectCard(int account_id) throws SQLException, ClassNotFoundException
	{
		Connection con = DBConnection.getConnection();
		PreparedStatement psmt;
		ResultSet rs;
		String sql = "select * from card where account_id = ? ;";
		psmt = con.prepareStatement(sql);
		psmt.setInt(1,account_id);
		psmt.execute();
		rs = psmt.getResultSet();
		if(!rs.next())
			return null;
		cardDTO result = new 
				cardDTO(rs.getInt("card_id"), rs.getString("issue_date"),rs.getInt("limit"),
						rs.getString("type"),rs.getInt("account_id"));
		return result;
	}
}
