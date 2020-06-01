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
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/style.css">
		<title>회원 정보</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
			<script type="text/javascript">
			function gomain(){
				location.href="${root}/index.jsp";
			}
			
			function revise(){
				document.location.href = "${root}/User.do/revise";
			}
			
			function del(){
				document.location.href = "${root}/User.do/delete";
			}
			</script>
</head>
<body>
<header>
	<%@ include file = "../header.jsp" %>
	</header>
	<div class="box">
		<div class="container">
			<c:if test="${userlist.size() != 0}">
				<c:forEach var="user" items="${userlist}">
					<div class="container" align="center">
						<div class="col-lg-6" align="center">
							<h3>회원 정보 확인</h3>
								<div class="form-group" align="left">
									<label for="name"><strong>이름</strong></label>
									<div>${user.name}</div>
								</div>
								<div class="form-group" align="left">
									<label for=""><strong>아이디</strong></label>
									<div>${user.id}</div>
								</div>
								<div class="form-group" align="left">
									<label for=""><strong>주소</strong></label><br>
									<div>${user.address}</div>
								</div>
								<div class="form-group" align="left">
									<label for="tel"><strong>전화번호</strong></label>
									<div>${user.phone}</div>
									</div>
						</div>
						<div class="form-group" align="center">
							<button type="button" class="btn btn-dark" onclick="javascript:revise();">수정하기</button>
							<button type="button" class="btn btn-warning" onclick="javascript:del();">탈퇴하기</button>
							<button type="button" class="btn btn-dark" onclick="javascript:gomain();">메인으로</button>
						</div>
						</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<footer>
		<%@ include file = "../footer.jsp" %>	
	</footer>
</body>
</html>