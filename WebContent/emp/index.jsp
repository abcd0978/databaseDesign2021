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
		String sql = "select * from user where user_id='901111-1111111'";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		rs.next();
%>
		<div class="container">
			<h1>명지은행</h1>
			<div class="row">
				<h3 class="col-2">이름</h3>
				<h4 class="col"><%=rs.getString("name")%> 직원</h4>
			</div>
			<div class="row">
				<h3 class="col-2">주소</h3>
				<h4 class="col"><%=rs.getString("address")%></h4>
			</div>
			<div class="row">
				<h3 class="col-2">생일</h3>
				<h4 class="col"><%=rs.getString("birth")%></h4>
			</div>
			<div class="row">
				<h3 class="col-2">이메일</h3>
				<h4 class="col"><%=rs.getString("email")%></h4>
			</div>
			<div class="row">
				<h3 class="col-2">전화번호</h3>
				<h4 class="col"><%=rs.getString("phone")%></h4>
			</div>
<%		
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println(e);
	}
%>
			<div>
				<button type="button" class="btn btn-primary">계좌 생성</button>
				<button type="button" class="btn btn-primary">계좌 관리</button>
				<button type="button" class="btn btn-primary">카드 생성</button>
				<button type="button" class="btn btn-primary">카드 관리</button>
				<button type="button" class="btn btn-primary" onClick="location.href='/DatabaseDesign/emp/manageUserForm.jsp'">개인정보관리</button>
			</div>
		</div>
</body>
</html>