<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Bank System</title>
</head>
<body>
	<!-- 카드 상세 조회 -->
	<h1><a href = "http://localhost:8090/DatabaseDesign/client/index.jsp">명지은행</a></h1>
	<div>카드 사용</div>
	<form method="post" action="/DatabaseDesign/usecard">
		카드번호: <input type="text" name="card_id">
		금액: <input type="text" name="amount">
		info: <input type="text" name="info">
		<button type="submit">제출</button>
	</form>
</body>
</html>