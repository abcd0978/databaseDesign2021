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
<%
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String user_id = request.getParameter("user_id");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
		
	// id 임시
	String updateQuery = "update user set name = ?, address = ?, birth = ?, email = ?, phone = ? where user_id = ?";
	
	pstmt = conn.prepareStatement(updateQuery);
	pstmt.setString(1, name);
	pstmt.setString(2, address);
	pstmt.setString(3, birth);
	pstmt.setString(4, email);
	pstmt.setString(5, phone);
	pstmt.setString(6, user_id);
	pstmt.executeUpdate();		
%>
	<div class="container">
		<h1>명지은행</h1>
		<div class="row">
			<h2 class="col">개인정보관리(직원)</h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">수정 완료</h2>
			<h2 class="col"></h2>
		</div>
		<div style="text-align:center">
			<button type="button" class="btn btn-primary"  onClick="location.href='/DatabaseDesign/emp/'">메인페이지</button>
		</div>
	</div>
</body>
</html>