<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>글 등록</title>
<script type="text/javascript">
  function writeNotice() {
	if(document.getElementById("subject").value == "") {
		alert("제목을 입력해주세요.");
		return;
	} else if(document.getElementById("content").value == "") {
		alert("내용을 입력해주세요.");
		return;
	} else {
	  	document.getElementById("writeform").action = "${root}/main.do";
	  	document.getElementById("writeform").submit();
	}
  }
</script>
</head>
<body>
<header>
		<%@ include file = "../header.jsp" %>
</header>
	<div class="box">
		<div class="container" align="center">
			<h3>글을 등록해주세요.</h3> 
			<div class="col-lg-6" align="center">
			<form id="writeform" method="post" action="">
				<input type="hidden" name="act" id="act" value="write">
				<div class="form-group">
					<label for="subject">제목</label>
					<input type="text" class="form-control" id="subject" name="subject">
				</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="15" id="content" name="content"></textarea>
				</div>
				<button type="button" class="btn btn-dark" onclick="javascript:writeNotice();">등록</button>
				<button type="reset" class="btn btn-warning">취소</button>
			</form>
			</div>
		</div>
	</div>
</body>
</html>