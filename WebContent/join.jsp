<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/template/header.jsp"/>
	<form action="/join" method="post">
		<label class="form-label" for="name">이름</label>
		<input type="text" class="form-control" id="name" name="name" placeholder="홍길동">
		<label class="form-label" for="userID">주민번호</label>
		<input type="text" class="form-control" id="userID" name="user_id">
		<label class="form-label" for="address">주소</label>
		<input type="text" class="form-control" id="address" name="address">
		<label class="form-label" for="birth">생년월일</label>
		<input type="date" class="form-control" id="birth" value="2021-12-01" name="birth">
		<label class="form-label" for="email">이메일</label>
		<input type="email" class="form-control" id="email" name="email">
		<label class="form-label" for="phone">전화번호</label>
		<input type="text" class="form-control" id="phone" name="phone">
		<label class="form-label" for="job">직업</label>
		<input type="text" class="form-control" id="job" name="job">
		<label class="form-label" for="password">비밀번호</label>
		<input type="password" class="form-control" id="password" name="password">
		<label class="form-label" for="isClient">고객여부</label>
		<input type="checkbox" id="isClient" name="is_client" checked>
		<input class="btn btn-primary" type="submit" value="가입">
	</form>
</body>
</html>