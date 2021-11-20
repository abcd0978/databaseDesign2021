<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
		이름
		</h3>
		<h3 id="info_add">
		주소
		</h3>
		<h3 id="info_birth">
		생일
		</h3>
		<h3 id="info_email">
		이메일
		</h3>
		<h3 id="info_num">
		전화번호
		</h3>
		<h3 id="info_job">
		직업
		</h3>
	</div>
	<div id="buttons">
		<button id="cl_account" type="button" class="btn btn-primary">
		계좌조회
		</button>
		<button id="cl_send" type="button" class="btn btn-primary">
		송금
		</button>
		<button id="cl_depo" type="button" class="btn btn-primary">
		입금
		</button>
		<button id="cl_witd" type="button" class="btn btn-primary">
		출금
		</button>
		<button id="cl_card" type="button" class="btn btn-primary">
		카드조회
		</button>
		<button id="cl_uscard" type="button" class="btn btn-primary">
		카드사용
		</button>
		<button id="cl_pinfo" type="button" class="btn btn-primary">
		개인정보관리
		</button>
	</div>
</body>
</html>