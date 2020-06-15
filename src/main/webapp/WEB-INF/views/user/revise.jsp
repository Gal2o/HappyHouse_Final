<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
	padding-top:50px;
}
</style>
<title>회원 정보 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">
$(document).ready(function() {
	var tel2 = document.getElementById("tel2");
	var tel3 = document.getElementById("tel3");
	
	var phoneInfo = "${userinfo.phone}".split("-");
	$("#tel1").val(phoneInfo[0]).prop("selected", true);
	tel2.setAttribute("value", phoneInfo[1]);
	tel3.setAttribute("value", phoneInfo[2]);
	
	$("#reviseBtn").click(function() {
		
		if($("#name").val() == "") {
			alert("이름 입력!!!");
			return;
		} else if($("#password").val() == "") {
			alert("비밀번호 입력!!!");
			return;
		} else if($("#password").val() != $("#pwdcheck").val()) {
			alert("비밀번호를 확인해 주세요!!!");
			return;
		} else if($("#tel2").val() == "" || $("#tel3").val() == "") {
			alert("전화번호 입력!!!");
			return;
		} else if($("#address").val() == "") {
			alert("주소 입력!!!");
			return;
		} else {
			
			$("#memberform").attr("action", "${root}/User.do/revise").submit();
		}
	});
});

function back(){
	document.location.href = "${root}/User.do/info";
}
</script>
</head>
<body>
	<header>
	<%@ include file = "../header.jsp" %>
	</header>
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
			<form id="memberform" method="post" action="">
				<div class="form-group" align="left">
					<label for="name">이름</label>
					<input type="text" class="form-control" value="${userinfo.name}" id="name" name="name" placeholder="">
				</div>
				<input type="hidden" class="form-control" id="id" name="id" value="${userinfo.id }">
				<div class="form-group" align="left">
					<label for="">비밀번호</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="">비밀번호 확인</label>
					<input type="password" class="form-control" id="pwdcheck" name="pwdcheck" placeholder="">
				</div>
				<div class="form-group" align="left">
					<label for="tel">전화번호</label>
					<div id="tel" class="custom-control-inline">
					<select class="form-control" id="tel1" name="tel1">
						<option value="010">010</option>
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="032">032</option>
						<option value="041">041</option>
						<option value="051">051</option>
						<option value="061">061</option>
					</select> _
					<input type="text" class="form-control" id="tel2" name="tel2" placeholder=""> _
					<input type="text" class="form-control" id="tel3" name="tel3" placeholder="">
					</div>
				</div>
				<div class="form-group" align="left">
					<label for="">주소</label><br>
					<input type="text" class="form-control" value="${userinfo.address}" id="address" name="address" placeholder="">
				</div>
				<div class="form-group" align="center">
					<button type="button" class="btn btn-primary" onclick="javascript:back();">돌아가기</button>
					<button type="button" class="btn btn-primary" id="reviseBtn">수정하기</button>
					<button type="reset" class="btn btn-warning">초기화</button>
				</div>
			</form>
		</div>
	</div>
	<footer>
		<%@ include file = "../footer.jsp" %>	
	</footer>
</body>
</html>