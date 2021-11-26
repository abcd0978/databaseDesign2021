<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>
<%@ page import="util.DBConnection"%>

<!DOCTYPE html>
<html>
<jsp:include page="/template/header.jsp"/>
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

	// 유효한 계좌인지 확인(존재하는지 OR 예금 계좌인지)
	String validQuery = "select count(*), type from account where account_id=?";
	pstmt = conn.prepareStatement(validQuery);
	pstmt.setInt(1, account_id);
	rs = pstmt.executeQuery();
	rs.next();
	
	boolean validAccountId = true;
	if(rs.getInt(1) == 0 || rs.getInt(2) == 1) { 
		validAccountId = false;   
	}
	
	if(!validAccountId) {
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