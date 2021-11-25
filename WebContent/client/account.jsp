<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	int acId = Integer.parseInt(request.getParameter("id"));
	
	session.setAttribute("userID", "901122-2222222");//디버그용
	//session.invalidate();
	String uid = (String)session.getAttribute("userID");
	userDAO udao = new userDAO();
	accountDAO adao = new accountDAO();
	accountDTO account=null;
	ArrayList<accountLogDTO> accountLogs=null;
	if(udao.checkValid(uid)<1)
		response.sendRedirect("http://localhost:8090/DatabaseDesign/login.jsp");
	else
	{
		account = adao.selectAccount(acId);
		accountLogs = adao.selectAccountLogs(acId);
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
	<!-- 계좌 상세 조회  -->
	<h1><a href = "http://localhost:8090/DatabaseDesign/client/index.jsp">명지은행</a></h1>
	<div>계좌 상세조회</div>
	<table class="table table-hover">
		<th>계좌번호</th>
		<th>잔고</th>
		<th>개설일자</th>
		<th>예금/적금</th>
		<th>카드신청여부</th>
		<%
		out.print("<tr>");
		out.print("<td>"+account.getAccount_id()+"</td>");
		out.print("<td>"+account.getBalance()+"</td>");
		out.print("<td>"+account.getOpen_date()+"</td>");
		
		if(account.getType()==0)
		{
			out.print("<td>예금</td>");
		}
		else if(account.getType()==1)
		{
			out.print("<td>적금</td>");
		}
		
		if(account.isIs_request())
		{
			out.print("<td>yes</td>");
		}
		else if(!account.isIs_request())
		{
			out.print("<td>no</td>");
		}
		
		out.print("</tr>");
		%>
	</table>
	<br>
	<table class="table table-hover">
		<th>유형</th>
		<th>금액</th>
		<th>날짜</th>
		<th>info</th>
		<%
			for(int i=0;i<accountLogs.size();i++)
			{
				accountLogDTO temp = accountLogs.get(i);
				out.print("<tr>");
				if(!temp.isType())//출금시
					out.print("<td style=\"color:red\">출금</td>");
				else
					out.print("<td style=\"color:blue\">입금</td>");
				
				if(!temp.isType())//출금시
				{
					out.print("<td style=\"color:red\">"+temp.getAmount()+"</td>");
				}
				else
				{
					out.print("<td style=\"color:blue\">"+temp.getAmount()+"</td>");
				}
				out.print("<td>"+temp.getDate()+"</td>");
				out.print("<td>"+temp.getInfo()+"</td>");
				out.print("</tr>");
			}
		%>
	</table>
</body>
</html>