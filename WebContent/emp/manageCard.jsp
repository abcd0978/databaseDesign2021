<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DBConnection"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Bank System</title>
</head>
<body>
	<div class="container">
		<h1>명지은행</h1>
		<div class="row">
			<h2 class="col">카드 관리</h2>
		</div>
		
<% 
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("utf-8");
	
	String manage_type = request.getParameter("manage_type");
	String card_id = request.getParameter("card_id");
	
	// 입력된 card_id가 존재하는지 확인하기 위해서 조회 
	String selectQuery = "select count(*), account_id from card where card_id=?";
	pstmt = conn.prepareStatement(selectQuery);
	pstmt.setInt(1, Integer.parseInt(card_id));
	rs = pstmt.executeQuery();
	rs.next();
	
	boolean isExist = true;
	if(rs.getInt(1) == 0) isExist = false;   

	if(!isExist) {
%>	
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">존재하지 않는 카드입니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<button 
				type="button" 
				class="col btn btn-primary"
				onClick="location.href='/DatabaseDesign/emp'"
				style="text-align:center"
			>
				메인 페이지
			</button>
			<h2 class="col"></h2>
		</div>
<%
	}else if(manage_type.equals("delete")) {
		int account_id = rs.getInt(2);
		
		// 카드 delete;
		String deleteQuery = "delete from card where card_id = ?";
		pstmt = conn.prepareStatement(deleteQuery);
		pstmt.setInt(1,Integer.parseInt(card_id));
		pstmt.executeUpdate();
		
		// 계좌에 연결된 카드가 없으면 account의 is_request = false
		String checkQuery = "select count(*) from card where account_id=?";
		pstmt = conn.prepareStatement(checkQuery);
		pstmt.setInt(1, account_id);
		rs = pstmt.executeQuery();
		rs.next();
		
		if(rs.getInt(1) == 0) {
			System.out.println(rs.getInt(1));
			String updateQuery = "update account set is_request = ? where account_id = ?";
			pstmt = conn.prepareStatement(updateQuery);
			pstmt.setBoolean(1, false);
			pstmt.setInt(2, account_id);
			pstmt.executeUpdate();
		}
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">카드가 삭제되었습니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<button 
				type="button" 
				class="col btn btn-primary"
				onClick="location.href='/DatabaseDesign/emp'"
				style="text-align:center"
			>
				메인 페이지
			</button>
			<h2 class="col"></h2>
		</div>
<%
	}else{
		int account_id = Integer.parseInt(request.getParameter("account_id"));
		int usage_limit = Integer.parseInt(request.getParameter("usage_limit"));
		
		// 입력된 account_id가 존재하는지 확인
		String checkQuery = "select count(*) from account where account_id=?";
		pstmt = conn.prepareStatement(checkQuery);
		pstmt.setInt(1, account_id);
		rs = pstmt.executeQuery();
		rs.next();
		
		if(rs.getInt(1) == 0) {
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">존재하지 않는 계좌입니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<button 
				type="button" 
				class="col btn btn-primary"
				onClick="location.href='/DatabaseDesign/emp/manageCardForm.jsp?card_id=<%=card_id%>'"
				style="text-align:center"
			>
				계좌 관리 페이지
			</button>
			<h2 class="col"></h2>
		</div>
<%
		} else {
			// 계좌 정보 업데이트
			String updateQuery = "update card set account_id = ?, usage_limit = ? where card_id = ?";
			pstmt = conn.prepareStatement(updateQuery);
			pstmt.setInt(1, account_id);
			pstmt.setInt(2, usage_limit);
			pstmt.setInt(3, Integer.parseInt(card_id));
			pstmt.executeUpdate();
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">계좌 정보가 수정되었습니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<button 
				type="button" 
				class="col btn btn-primary"
				onClick="location.href='/DatabaseDesign/emp'"
				style="text-align:center"
			>
				메인 페이지
			</button>
			<h2 class="col"></h2>
		</div>
<%			
		}
	}
%>
	</div>
</body>
</html>