<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="util.DBConnection"%>
<%@ page import="dao.*"%>

<!DOCTYPE html>
<html>
<jsp:include page="/template/header.jsp"/>
<body>
<%
	//임시 session 설정
	session.setAttribute("userID","901111-1111111");
	
	// session check
	String user_id = (String) session.getAttribute("userID");
	if(userDAO.checkEmpValid(user_id) == false) {
		response.sendRedirect("http://localhost:8080/DatabaseDesign/login.jsp");
		return;
	}

	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
		
	String selectQuery = "select * from user where user_id=?";
	pstmt = conn.prepareStatement(selectQuery);
	pstmt.setString(1, user_id);
	rs = pstmt.executeQuery();
	rs.next();
	
	String name = rs.getString("name");
	String address = rs.getString("address");
	String birth = rs.getString("birth");
	String email = rs.getString("email");
	String phone = rs.getString("phone");
%>
	<div class="container">
		<h1>명지은행</h1>
		<div class="row">
			<h2 class="col">개인정보관리(직원)</h2>
		</div>
		<form method="put" action="manageUser.jsp">
			<input type="hidden" name="user_id" value="<%=user_id%>">
			<div class="row">
				<h3 class="col-2">이름</h3>
				<div class="col">
					<input name="name" value="<%=name%>">
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">주소</h3>
				<div class="col">
					<input type="text" name="address" value="<%=address%>" size="50"/>
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">생일</h3>
				<div class="col">
					<input type="date" name="birth" value="<%=birth%>"/>
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">이메일</h3>
				<div class="col">
					<input type="email" name="email" value="<%=email%>" required/>
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">전화번호</h3>
				<div class="col">
					<input name="phone" value="<%=phone%>"/>
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