<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Bank System</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("utf-8");
	
	String user_id = request.getParameter("user_id");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	}catch(ClassNotFoundException cnfe) {
		cnfe.printStackTrace();
		System.out.println("=!= 드라이버 로딩 실패 =!=");
	}
	try {
		String jdbcUrl = "jdbc:mysql://db.ctbroze.com:3310/dbd";
		String userId = "dbd2021";
		String userPass = "dbd2021";
		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
		
		// id 임시
		String sql = "update user set name = ?, address = ?, birth = ?, email = ?, phone = ? where user_id = ?";
		
		pstmt = conn.prepareStatement(sql);
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
			<h2 class="col">개인정보관리</h2>
		</div>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col">수정 완료</h2>
			<h2 class="col"></h2>
		</div>
<%		
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println(e);
	}
%>
		<div>
			<button type="button" class="btn btn-primary"  onClick="location.href='/DatabaseDesign/emp/'">메인페이지</button>
		</div>
	</div>
</body>
</html>