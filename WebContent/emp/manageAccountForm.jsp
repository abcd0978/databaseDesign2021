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
	
	String account_id = request.getParameter("account_id");
	
	
	String validSql = "select count(*) from account where account_id=?";
	pstmt = conn.prepareStatement(validSql);
	pstmt.setString(1, account_id);
	rs = pstmt.executeQuery();
	rs.next();
	
	boolean isExist = true;
	if(rs.getInt(1) == 0) isExist = false;
	
	if(!isExist) {
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">잘못된 계좌번호 입니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<button 
				type="button" 
				class="col btn btn-primary"
				onClick="location.href='/DatabaseDesign/emp/'"
				style="text-align:center"
			>
				메인 페이지
			</button>
			<h2 class="col"></h2>
		</div>
<% 
	}else{
		String selectQuery = "select type, balance, is_request, name from account join user on account.user_id = user.user_id where account.account_id = ?";
		pstmt = conn.prepareStatement(selectQuery);
		pstmt.setString(1, account_id);
		rs = pstmt.executeQuery();
		rs.next();
		
		String owner = rs.getString("name");
		int balance = rs.getInt("balance");
		String type = rs.getInt("type") == 0 ? "예금" : "적금";
		boolean is_request = rs.getBoolean("is_request");
%>
		<div class="row">
			<h3 class="col-2">소유자</h3>
			<h4 class="col"><%=owner%></h4>
		</div>
		<div class="row">
			<h3 class="col-2">계좌 번호</h3>
			<h4 class="col"><%=account_id%></h4>
		</div>
		<div class="row">
			<h3 class="col-2">잔액</h3>
			<h4 class="col"><%=balance%> 원</h4>
		</div>
		<div class="row">
			<h3 class="col-2">계좌 종류</h3>
			<h4 class="col"><%=type%></h4>
		</div>
<%
		// 연결된 카드들
%>		
		<form method="delete" action="manageAccount.jsp">
			<input type="hidden" name="manage_type" value="delete">
			<input type="hidden" name="account_id" value="<%=account_id%>">
			<button type="button" class="btn btn-primary"  onClick="location.href='/DatabaseDesign/emp/'">메인페이지</button>
<%
		if(!is_request) {		
%>
			<input type="submit" class="btn btn-danger" value="삭제">
<%
		}	
%>
		</form>
	</div>
<%
	}
%>
</body>
</html>