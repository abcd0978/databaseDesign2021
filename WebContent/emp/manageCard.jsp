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
	<div class="container">
		<h1>명지은행</h1>
		<div class="row">
			<h2 class="col">카드 관리</h2>
		</div>
<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("utf-8");
	
	String manage_type = request.getParameter("manage_type");
	String card_id = request.getParameter("card_id");
	
	if(manage_type.equals("delete")) {
		
	}
%>
	</div>
</body>
</html>