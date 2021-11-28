<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/template/header.jsp"/>
	<form method="post" action="./login">
		<table>
			<tr>
				<td id="title">아이디</td>
				<td>
					<input type="text" name="id">
				</td>
			</tr>
			<tr>
				<td id="title">비밀번호</td>
				<td>
					<input type="password" name="pw">
				</td>
			</tr>
			</table>
			<input class ="btn btn-primary" type="submit" value="로그인"/>
	</form>
	<a href="/join.jsp"><button class="btn btn-danger" type="button">가입</button></a>
</body>
</html>