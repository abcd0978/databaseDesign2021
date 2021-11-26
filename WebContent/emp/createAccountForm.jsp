<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
%>	
	<div class="container">
		<h1>명지은행</h1>
		<div class="row">
			<h2 class="col">계좌 생성</h2>
		</div>
		<form method="put" action="createAccount.jsp">
			<div class="row">
				<h3 class="col-2">사용자 ID</h3>
				<div class="col">
					<input name="user_id" required>
				</div>
			</div>
			<div class="row">
				<!-- 0.예금 1.적금  -->
				<h3 class="col-2">계좌 종류</h3>
				<div class="col">
					<select name ="type" style="width:100px">
						<option value="0">예금</option>
						<option value="1">적금</option>
					</select>
				</div>
			</div>
			<div>
				<button type="button" class="btn btn-primary"  onClick="location.href='/DatabaseDesign/emp/'">메인페이지</button>
				<input type="submit" class="btn btn-primary" value="생성">
			</div>
		</form>
	</div>
</body>
</html>