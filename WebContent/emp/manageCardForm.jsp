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
	<div class="container">
		<h1>명지은행</h1>
		<div class="row">
			<h2 class="col">카드 관리</h2>
		</div>
<%
	Connection conn = DBConnection.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String card_id = request.getParameter("card_id");
	
	String validSql = "select count(*), usage_limit, account_id from card where card_id=?";
	pstmt = conn.prepareStatement(validSql);
	pstmt.setString(1, card_id);
	rs = pstmt.executeQuery();
	
	boolean isExist = true;
	if(rs.next()) isExist = rs.getInt(1) == 0 ? false : true;   
	
	if(!isExist) {
%>
		<div class="row">
			<h2 class="col"></h2>
			<h2 class="col" style="text-align:center">잘못된 카드 ID 입니다.</h2>
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
				메인 페이지
			</button>
			<h2 class="col"></h2>
		</div>	
<%
		}else{
%>
			<form method="put" action="manageCard.jsp">
				<input type="hidden" name="manage_type" value="put">
				<input type="hidden" name="card_id" value="<%=card_id%>">
				<div class="row">
					<h3 class="col-2">연결된 계좌 번호</h3>
					<div class="col">
						<input type="number" name="account_id" value="<%=rs.getString("account_id") %>" required>
					</div>
				</div>
				<div class="row">
					<h3 class="col-2">한도</h3>
					<div class="col">
						<div class="col">
						<input type="number" min="100000" name="usage_limit" value="<%=rs.getString("usage_limit")%>" required>
					</div>
					</div>
				</div>
				<button type="button" class="btn btn-primary"  onClick="location.href='/DatabaseDesign/emp/'">메인페이지</button>
				<input type="submit" class="btn btn-primary" value="수정">
			</form>
			<form method="delete" action="manageCard.jsp">
				<input type="hidden" name="manage_type" value="delete">
				<input type="hidden" name="card_id" value="<%=card_id%>">
				<input type="submit" class="btn btn-danger" value="삭제">
			</form>
<%		
		}
%>
	</div>
</body>
</html>