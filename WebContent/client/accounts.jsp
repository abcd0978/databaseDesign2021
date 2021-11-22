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
	userDAO udao = new userDAO();
	accountDAO adao = new accountDAO();
	ArrayList<accountDTO> accounts = adao.selectAccounts(uid);
	userDTO user = udao.select(uid);
	String name="";
	if(user==null)
		response.sendRedirect("http://localhost:8090/DatabaseDesign/login.jsp");
	else
		name = user.getName();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Bank System</title>
</head>
<body>
	<!-- 계좌 리스트 -->
	<h1><a href = "http://localhost:8090/DatabaseDesign/client/index.jsp">명지은행</a></h1>
	<div id = "who"><%=name%>님의 계좌 리스트</div>
	<table id=accList border='1'>
		<th>상세보기</th>
		<th>계좌번호</th>
		<th>잔고</th>
		<%
		for(int i=0;i<accounts.size();i++)
		{
			accountDTO temp = accounts.get(i);
			out.print("<tr style=\"border:1px solid black;\">");
			out.print("<td style=\"border:1px solid black;\"> <button id=\"goaccount\" type=\"button\" class=\"btn btn-primary\" onclick=\"location.href=\'http://localhost:8090/DatabaseDesign/client/account.jsp?id="+temp.getAccount_id()+"\'\">보기</button> </td>");
			out.print("<td style=\"border:1px solid black;\">"+temp.getAccount_id()+"</td>");
			out.print("<td style=\"border:1px solid black;\">"+temp.getBalance()+"</td>");
			out.print("</tr>");
		}
		%>
	</table>
</body>
</html>