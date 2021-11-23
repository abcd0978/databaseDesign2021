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
			<h2 class="col">카드 생성</h2>
		</div>
		<form method="put" action="createCard.jsp">
			<div class="row">
				<h3 class="col-2">계좌 번호</h3>
				<div class="col">
					<input type="number" name="account_id" required>
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">한도</h3>
				<div class="col">
					<div class="col">
					<input type="number" min="100000" name="usage_limit" required>
				</div>
				</div>
			</div>
			<div class="row">
				<h3 class="col-2">카드 종류</h3>
				<div class="col">
					<select name ="type" style="width:100px">
						<option value="check">체크</option>
						<option value="credit">신용</option>
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