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
	cardDAO cdao = new cardDAO();
	cardDTO card=null;
	ArrayList<cardLogDTO> cardLogs=null;
	userDTO user;
	int card_id=0;
	String name="";
	if(udao.checkValid(uid)<1)
		response.sendRedirect("http://localhost:8090/DatabaseDesign/login.jsp");
	else
	{
		card_id = Integer.parseInt(id);
		user = udao.select(uid);
		name = user.getName();
		card = cdao.selectCard(card_id);
		cardLogs = cdao.selectCardLogs(card_id);
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
<h1><a href = "http://localhost:8090/DatabaseDesign/client/index.jsp">명지은행</a></h1>
	<div>카드상세: </div>
	<table class="table table-hover">
		<th>카드번호</th>
		<th>발급일자</th>
		<th>사용한도</th>
		<th>체크/신용</th>
		<th>연결된 계좌번호</th>
		<%
			out.print("<tr>");                                                   
			out.print("<td>"+card.getCard_id()+"</td>");
			out.print("<td>"+card.getIssue_date()+"</td>");
			out.print("<td>"+card.getLimit()+"</td>");
			out.print("<td>"+card.getType()+"</td>");
			out.print("<td>"+card.getAccount_id()+"</td>");
			out.print("</tr>");
		%>
	</table>
	<br>
	<table class="table table-hover">
		<th>결제일</th>
		<th>금액</th>
		<%
		for(int i=0;i<cardLogs.size();i++)
		{
			cardLogDTO temp = cardLogs.get(i);
			out.print("<tr>");                                                  
			out.print("<td>"+temp.getPayment_date()+"</td>");
			out.print("<td>"+temp.getAmount()+"</td>");
			out.print("</tr>");
		}
		%>
	</table>
</body>
</html>