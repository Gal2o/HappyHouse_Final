<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">
	function identify() {
		if(document.getElementById("id").value == "") {
			alert("아이디 입력!!!");
		} else {
			document.getElementById("loginform").action = "${root}/User.do?act=findpw";
			document.getElementById("loginform").submit();
		}
	}
</script>
<title>비밀번호찾기</title>
</head>
<body>
<header>
		<%@ include file = "../header.jsp" %>
	</header>
	<div class="box">
	<div class="container" align="center">
		<h3>비밀번호 찾기</h3>
		<div class="col-lg-6" align="center">
			<form id="loginform" method="post" action="">
			<input type ="hidden" name="act" value="findpw">
				<div class="form-group" align="left">
					<label for="">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</label>
					<input type="text" class="form-control" id="id" name="id" placeholder="">
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-dark" onclick="javascript: identify();">다음</button>
				</div>
			</form>
		</div>
	</div>
</div>
<footer>
		<%@ include file = "../footer.jsp" %>	
	</footer>
</body>
</html>