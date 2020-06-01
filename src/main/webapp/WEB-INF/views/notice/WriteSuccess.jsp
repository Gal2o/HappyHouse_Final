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
<title>글 등록</title>
</head>
<body>
<header>
		<%@ include file = "../header.jsp" %>
</header>
	<div class="box" align="center">
		<div class="col-lg-6" align="center">
			<div class="jumbotron">
				<h1>글작성 성공!</h1>      
			</div>  
			<p><a href="${root}/main.do?act=list&pg=1&key=&word=">글목록</a></p>
		</div>
	</div>
</body>
</html>