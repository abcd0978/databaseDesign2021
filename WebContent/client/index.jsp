<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	session.setAttribute("userID", "901122-2222222");//디버그용
	String uid = (String)session.getAttribute("userID");
	userDAO useracc = new userDAO();
	userDTO user = useracc.select(uid);
	String info_name="";
	String info_add="";
	String info_birth="";
	String info_email="";
	String info_num="";
	String info_job="";
	if(uid==null)
		response.sendRedirect("http://localhost:8090/DatabaseDesign/login.jsp");
	else
	{
		info_name = user.getName();
		info_add = user.getAddress();
		info_birth = user.getBirth();
		info_email = user.getEmail();
		info_num = user.getPhone();
		info_job = user.getJob();
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
	<h1>
		명지은행
	</h1>
	<div id="infos">
		<h3 id="info_name">
		이름: <%=info_name %>
		</h3>
		<h3 id="info_add">
		주소: <%=info_add %>
		</h3>
		<h3 id="info_birth">
		생일: <%=info_birth %>
		</h3>
		<h3 id="info_email">
		이메일: <%=info_email %>
		</h3>
		<h3 id="info_num">
		전화번호: <%=info_num %>
		</h3>
		<h3 id="info_job">
		직업: <%=info_job %>
		</h3>
	</div>
	<div id="buttons">
		<button id="cl_account" type="button" class="btn btn-primary" onclick="location.href='http://localhost:8090/DatabaseDesign/client/accounts.jsp'">
		계좌조회
		</button>
		<button id="cl_send" type="button" class="btn btn-primary" onclick="location.href='http://localhost:8090/DatabaseDesign/client/send.jsp'">
		송금
		</button>
		<button id="cl_depo" type="button" class="btn btn-primary" onclick="location.href='http://localhost:8090/DatabaseDesign/client/input.jsp'">
		입금
		</button>
		<button id="cl_witd" type="button" class="btn btn-primary" onclick="location.href='http://localhost:8090/DatabaseDesign/client/output.jsp'">
		출금
		</button>
		<button id="cl_card" type="button" class="btn btn-primary" onclick="location.href='http://localhost:8090/DatabaseDesign/client/cards.jsp'">
		카드조회
		</button>
		<button id="cl_uscard" type="button" class="btn btn-primary" onclick="location.href='http://localhost:8090/DatabaseDesign/client/cardUsage.jsp'">
		카드사용
		</button>
		<button id="cl_pinfo" type="button" class="btn btn-primary" onclick="location.href='http://localhost:8090/DatabaseDesign/client/manageUser.jsp'">
		개인정보관리
		</button>
	</div>
</body>
</html>