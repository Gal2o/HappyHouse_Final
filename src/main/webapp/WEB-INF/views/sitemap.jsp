<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<title>사이트맵</title>
</head>
<body>
	<header>
	<%@ include file = "header.jsp" %>
	</header>
	
	<div class="box" align="center">
		<div class="container" align="center">
			<h3>사이트맵</h3>
			<table class="table table-site">
					<tr><th class ="thead-light" >공지사항</th></tr>
					<tr><td><a href="${root}/main.do?act=list&pg=1&key=&word=">공지사항목록</a></td></tr>
			</table>
			<table class="table table-site">
				<tr><th class ="thead-light">관심지역</th></tr>
				<tr><td><a href="${root}/Apt.do?act=barea&pg=1">상권 정보</a></td></tr>
				<tr><td><a href="${root}/Apt.do?act=earea&pg=1">환경 정보</a></td></tr>
			</table>
			<table class="table table-site">
				<tr><th class ="thead-light" >회원</th></tr>
				<tr><td><a href="${root}/User.do?act=mvjoin">회원가입</a></td></tr>
				<tr><td><a href="${root}/User.do?act=mvlogin">로그인</a></td></tr>
				<tr><td><a href="${root}/User.do?act=mvinfo">회원정보</a></td></tr>
			</table>
		</div>
	</div>
		<footer>
		<%@ include file = "../footer.jsp" %>	
	</footer>
</body>
</html>