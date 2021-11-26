<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DBConnection"%>

<!DOCTYPE html>
<html>
<jsp:include page="/template/header.jsp"/>
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
	</div>
</body>
</html>