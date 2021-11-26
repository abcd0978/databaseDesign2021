<%@page import="java.net.http.HttpClient.Redirect"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	//session.setAttribute("userID", "901122-2222222");//디버그용
	//session.invalidate();
	
	String uid = (String)session.getAttribute("userID");
	String id = request.getParameter("card_id");
	userDAO udao = new userDAO();
	accountDAO adao = new accountDAO();
	ArrayList<accountDTO> accounts=null;
	
	if(udao.checkValid(uid)<1)
		response.sendRedirect("http://localhost:8090/DatabaseDesign/login.jsp");
	else
	{
		accounts = adao.selectAccounts(uid);
	}
		
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Bank System</title>
</head>
<body>
	<h1><a href = "/DatabaseDesign/client/index.jsp">명지은행</a></h1>
	<div>출금</div>
	<form method="post" action="/DatabaseDesign/withdraw">
			<%
		out.print(" <select name=\"account_id\"> ");
		out.print("<option value=\"\">계좌선택</option>");
			for(int i=0;i<accounts.size();i++)
				out.print("<option value=\""  +accounts.get(i).getAccount_id()+"\">"+accounts.get(i).getAccount_id()+"</option>");
		out.print("</select>");
		%>
		금액: <input type="text" name="amount">
		<button type="submit">제출</button>
	</form>
</body>
</html>