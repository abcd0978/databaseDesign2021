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
			<h2 class="col">계좌 관리</h2>
		</div>		
<% 
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("utf-8");
	
	int account_id = Integer.parseInt(request.getParameter("account_id"));
	
	String selectQuery = "select count(*) from account where account_id=?";
	pstmt = conn.prepareStatement(selectQuery);
	pstmt.setInt(1, account_id);
	rs = pstmt.executeQuery();
	rs.next();
	
	boolean isExist = true;
	if(rs.getInt(1) == 0)isExist = false;   

	if(!isExist) {
%>	
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">잚못된 계좌 번호입니다.</h2>
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
		// 로그 삭제
		String deleteLogQuery = "delete from account_log where account_id=?";
		pstmt = conn.prepareStatement(deleteLogQuery);
		pstmt.setInt(1, account_id);
		pstmt.executeUpdate();
		
		// 계좌 삭제
		String deleteAccountQuery = "delete from account where account_id=?";
		pstmt = conn.prepareStatement(deleteAccountQuery);
		pstmt.setInt(1, account_id);
		pstmt.executeUpdate();
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">계좌가 삭제되었습니다.</h2>
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
%>
	</div>
</body>
</html>