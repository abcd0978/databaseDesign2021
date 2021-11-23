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
		<div>
			<button type="button" class="btn btn-primary" onClick="location.href='/DatabaseDesign/emp/createAccountForm.jsp'">계좌 생성</button>
			<button type="button" class="btn btn-primary" onClick="manageAccount()">계좌 관리</button>
			<button type="button" class="btn btn-primary" onClick="location.href='/DatabaseDesign/emp/createCardForm.jsp'">카드 생성</button>
			<button type="button" class="btn btn-primary" onClick="manageCard()">카드 관리</button>
			<button type="button" class="btn btn-primary" onClick="location.href='/DatabaseDesign/emp/manageUserForm.jsp'">개인정보관리</button>
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
			let url = "/DatabaseDesign/emp/manageCardForm.jsp?card_id="+card_id
			location.href= url
		}
	}
	
	function manageAccount() {
		let account_id = ""
		
		while(account_id === ""){
			account_id = window.prompt("계좌번호를 입력하세요")
		}
		
		if(account_id != null) {
			let url = "/DatabaseDesign/emp/manageAccountForm.jsp?account_id="+account_id
			location.href= url
		}
	}
</script>	
</html>