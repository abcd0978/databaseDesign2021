<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<title>Bank System</title>
</head>
<body>
	<div class="container">
		<h1>명지은행</h1>
		<div class="row">
			<h2 class="col">계좌 생성</h2>
		</div>
		<form method="put" action="createAccount.jsp">
			<div class="row">
				<h3 class="col-2">사용자 ID</h3>
				<div class="col">
					<input name="user_id" required>
				</div>
			</div>
			<div class="row">
				<!-- 1.예금 2.적금  -->
				<h3 class="col-2">계좌 종류</h3>
				<div class="col">
					<select name ="type" style="width:100px">
						<option value="0">예금</option>
						<option value="1">적금</option>
					</select>
				</div>
			</div>
			<div>
				<button type="button" class="btn btn-primary"  onClick="location.href='/DatabaseDesign/emp/'">메인페이지</button>
				<input type="submit" class="btn btn-primary" value="생성">
			</div>
		</form>
	</div>
</body>
</html>