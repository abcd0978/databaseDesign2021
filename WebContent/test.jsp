<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>connection test</title>
</head>
<%
	Connection conn = null;
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
	}catch(ClassNotFoundException cnfe) {
		cnfe.printStackTrace();
		out.println("=!= 드라이버 로딩 실패 =!=");
	}
	
	try {
		String jdbcUrl = "jdbc:mysql://db.ctbroze.com:3310/dbd";
		String userId = "dbd2021";
		String userPass = "dbd2021";
		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
		out.println("=O= 접속 성공 =O=");
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println(e);
		out.println("=!= 커낵션 설정에 실패 =!=");
	}

%>
</html>