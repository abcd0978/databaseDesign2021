<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
			<h3 class="col-2">이름</h3>
			<h4 class="col"><%=name%> 직원</h4>
		</div>
		<div class="row">
			<h3 class="col-2">주소</h3>
			<h4 class="col"><%=address%></h4>
		</div>
		<div class="row">
			<h3 class="col-2">생일</h3>
			<h4 class="col"><%=birth%></h4>
		</div>
		<div class="row">
			<h3 class="col-2">이메일</h3>
			<h4 class="col"><%=email%></h4>
		</div>
		<div class="row">
			<h3 class="col-2">전화번호</h3>
			<h4 class="col"><%=phone%></h4>
		</div>
		<div>
			<button type="button" class="btn btn-primary" onClick="location.href='/emp/createAccountForm.jsp'">계좌 생성</button>
			<button type="button" class="btn btn-primary" onClick="manageAccount()">계좌 관리</button>
			<button type="button" class="btn btn-primary" onClick="location.href='/emp/createCardForm.jsp'">카드 생성</button>
			<button type="button" class="btn btn-primary" onClick="manageCard()">카드 관리</button>
			<button type="button" class="btn btn-primary" onClick="location.href='/emp/manageUserForm.jsp'">개인정보관리</button>
			<form method="get" action="/logout">
				<input type="submit" class="btn btn-danger" value="로그아웃">
			</form>
		</div>
	</div>
</body>
<script>
	function manageCard() {
		let card_id = ""
		
		while(card_id === ""){
			card_id = window.prompt("카드번호를 입력하세요")
		}
		
		if(card_id != null) {
			let url = "/emp/manageCardForm.jsp?card_id="+card_id
			location.href= url
		}
	}
	
	function manageAccount() {
		let account_id = ""
		
		while(account_id === ""){
			account_id = window.prompt("계좌번호를 입력하세요")
		}
		
		if(account_id != null) {
			let url = "/emp/manageAccountForm.jsp?account_id="+account_id
			location.href= url
		}
	}
</script>	
</html>