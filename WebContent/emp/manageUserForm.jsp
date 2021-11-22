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
		
	// id 임시
	String selectQuery = "select * from user where user_id='901111-1111111'";
	
	pstmt = conn.prepareStatement(selectQuery);
	rs = pstmt.executeQuery();
	rs.next();
%>
	<div class="container">
		<h1>명지은행</h1>
		<div class="row">
			<h2 class="col">개인정보관리(직원)</h2>
		</div>
		<form method="put" action="manageUser.jsp">
			<input type="hidden" name="user_id" value="<%=rs.getString("user_id")%>">
			<div class="row">
				<h3 class="col-2">이름</h3>
				<div class="col">
					<input name="name" value="<%=rs.getString("name")%>">
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">주소</h3>
				<div class="col">
					<input type="text" name="address" value="<%=rs.getString("address")%>" size="50"/>
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">생일</h3>
				<div class="col">
					<input type="date" name="birth" value="<%=rs.getString("birth")%>"/>
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">이메일</h3>
				<div class="col">
					<input type="email" name="email" value="<%=rs.getString("email")%>" required/>
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">전화번호</h3>
				<div class="col">
					<input name="phone" value="<%=rs.getString("phone")%>"/>
				</div>
			</div>
			<div>
				<button type="button" class="btn btn-primary"  onClick="location.href='/DatabaseDesign/emp/'">메인페이지</button>
				<input type="submit" class="btn btn-primary" value="수정">
			</div>
		</form>
	</div>
</body>
</html>