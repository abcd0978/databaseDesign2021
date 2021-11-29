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
	ArrayList<cardDTO> cards = null;
	userDTO user=null;
	int card_id=0;
	if(udao.checkValid(uid)<1)
		response.sendRedirect("/login.jsp");
	else
	{
		user = udao.select(uid);
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
	<!-- 카드 상세 조회 -->
	<h1><a href = "/client/index.jsp">명지은행</a></h1>
	<div>카드 사용</div>
	<form method="post" action="/usecard">
		<%
		out.print("카드선택");
	out.print(" <select name=\"card_id\"> ");
		out.print("<option value=\"\">카드번호</option>");
	for(int i=0;i<cards.size();i++)
		out.print("<option value=\""  +cards.get(i).getCard_id()+"\">"+cards.get(i).getCard_id()+"</option>");
	out.print("</select>");
	%>
		금액: <input type="text" name="amount">
		info: <input type="text" name="info">
		<button type="submit">제출</button>
	</form>
</body>
</html>