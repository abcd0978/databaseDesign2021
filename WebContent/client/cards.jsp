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
	cardDAO cdao = new cardDAO();
	ArrayList<cardDTO> cards=null;
	userDTO user;
	String name="";
	if(udao.checkValid(uid)<1)
		response.sendRedirect("/DatabaseDesign/login.jsp");
	else
	{
		user = udao.select(uid);
		name = user.getName();
		cards = cdao.selectCards(uid);
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
	<!-- 카드 목록 -->
	<h1><a href = "/DatabaseDesign/client/index.jsp">명지은행</a></h1>
	<div id = "who"><%=name%>님의 카드 리스트</div>
	<table  class="table table-hover">
		<th>상세보기</th>
		<th>체크/신용</th>
		<th>계좌번호</th>
		<%
		for(int i=0;i<cards.size();i++)
		{
			cardDTO temp = cards.get(i);
			out.print("<tr>");
			out.print("<td> <button id=\"goaccount\" type=\"button\" class=\"btn btn-primary\" onclick=\"location.href=\'http://localhost:8090/DatabaseDesign/client/card.jsp?card_id="+temp.getCard_id()+"\'\">"+temp.getCard_id()+"번 카드 보기</button> </td>");                                                                    
			out.print("<td>"+temp.getType()+"</td>");
			out.print("<td>"+temp.getAccount_id()+"</td>");
			out.print("</tr>");
		}
		%>
	</table>
</body>
</html>