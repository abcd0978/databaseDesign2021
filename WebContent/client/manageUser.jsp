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
	userDTO user=null;
	if(udao.checkValid(uid)<1)
		response.sendRedirect("/DatabaseDesign/login.jsp");
	else
	{
		user = udao.select(uid);
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
	<div>개인정보 관리</div>
	<form method="post" action="/DatabaseDesign/manage">
		이름: <input type="text" name="name" value="<%=user.getName()%>"> <br>
		주소: <input type="text" name="address" value="<%=user.getAddress()%>"> <br>
		생일: <input type="text" name="birth" value="<%=user.getBirth().toString()%>"> <br>
		이메일: <input type="text" name="email" value="<%=user.getEmail()%>"> <br>
		전화번호: <input type="text" name="num" value="<%=user.getPhone()%>"> <br>
		직업: <input type="text" name="job" value="<%=user.getJob()%>"> <br>
		<button type="submit">개인정보수정하기</button>
	</form>
	<br>
	<br>
	<button type="button" onclick="delet()">탈퇴 하기</button>
</body>
<script>
	async function delet()
	{
		var really = confirm("탈퇴하시겠습니까??");
		if(really)
		{
			await fetch("/DatabaseDesign/deleteu", {
				  method: "post",
				  headers: {
				    "Content-Type": "application/json",
				  },
				})
				  .then((response) => response.json())
				  .then((data) => {
					  if(data)
					  {
						  sessionStorage.clear();
						  window.location.href = '/DatabaseDesign/login.jsp';
					  }
				  });
		}
	}
</script>
</html>