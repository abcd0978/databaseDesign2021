<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>
<%@ page import="util.DBConnection"%>
<%@ page import="dao.*"%>

<!DOCTYPE html>
<html>
<jsp:include page="/template/header.jsp"/>
<body>
<%	
	// session check
	String user_id = (String) session.getAttribute("userID");
	if(userDAO.checkEmpValid(user_id) == false) {
		response.sendRedirect("/index.jsp");
		return;
	}
%>	
	<div class="container">
		<h1>명지은행</h1>
		<div class="row">
			<h2 class="col">계좌 생성</h2>
		</div>
<%
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String accountOwnerId = request.getParameter("user_id");
	int type = Integer.parseInt(request.getParameter("type"));
	
	// 사용자가 있는지 확인
	String validQuery = "select count(*) from user where user_id=?";
	pstmt = conn.prepareStatement(validQuery);
	pstmt.setString(1, accountOwnerId);
	rs = pstmt.executeQuery();

	boolean isExist = true;
	if(rs.next()) { 
		isExist = rs.getInt(1) == 0 ? false : true;   
	}
	
	if(!isExist) {
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">등록되지 않은 고객입니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">계좌를 생성할 수 없습니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<button 
				type="button" 
				class="col btn btn-primary"
				onClick="location.href='/emp/'"
				style="text-align:center"
			>
				메인페이지
			</button>
			<h2 class="col"></h2>
		</div>
<%
	}else{
		int balance = 0;
		boolean is_request = false;
		Timestamp open_date = new Timestamp(System.currentTimeMillis());
		
		String insertQuery = "insert into account(type, balance, is_request, open_date, user_id) values(?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(insertQuery);
		pstmt.setInt(1, type);
		pstmt.setInt(2, balance);
		pstmt.setBoolean(3, is_request);
		pstmt.setTimestamp(4, open_date);
		pstmt.setString(5, accountOwnerId);
		pstmt.executeUpdate();
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">계좌를 생성하였습니다.</h2>
			<h2 class="col"></h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<button 
				type="button" 
				class="col btn btn-primary"
				onClick="location.href='/emp/'"
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