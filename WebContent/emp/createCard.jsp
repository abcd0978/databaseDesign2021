<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>
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
			<h2 class="col">카드 생성</h2>
		</div>
<%
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("utf-8");
	
	int account_id = Integer.parseInt(request.getParameter("account_id"));
	int usage_limit = Integer.parseInt(request.getParameter("usage_limit"));
	String type = request.getParameter("type");
	Timestamp issue_date = new Timestamp(System.currentTimeMillis());

	// 존재하는 계좌인지 확인
	String validQuery = "select count(*) from account where account_id=?";
	pstmt = conn.prepareStatement(validQuery);
	pstmt.setInt(1, account_id);
	rs = pstmt.executeQuery();

	boolean isExist = true;
	if(rs.next()) { 
		isExist = rs.getInt(1) == 0 ? false : true;   
	}
	
	if(!isExist) {
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">잘못된 계좌 입니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">카드를 생성할 수 없습니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<button 
				type="button" 
				class="col btn btn-primary"
				onClick="location.href='/DatabaseDesign/emp/createCardForm.jsp'"
				style="text-align:center"
			>
				카드 생성 페이지
			</button>
			<h2 class="col"></h2>
		</div>
<%
		}else{
			String insertQuery = "insert into card(issue_date, usage_limit, type, account_id) values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(insertQuery);
			pstmt.setTimestamp(1, issue_date);
			pstmt.setInt(2, usage_limit);
			pstmt.setString(3, type);
			pstmt.setInt(4, account_id);
			pstmt.executeUpdate();
			
			String updateQuery = "update account set is_request = ? where account_id=?";
			pstmt = conn.prepareStatement(updateQuery);
			pstmt.setBoolean(1, true);
			pstmt.setInt(2, account_id);
			pstmt.executeUpdate();
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">카드를 생성하였습니다.</h2>
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
				메인페이지
			</button>
			<h2 class="col"></h2>
		</div>
<%		
		}
%>								
	</div>
</body>
</html>