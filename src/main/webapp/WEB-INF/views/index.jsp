<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<title>HappyHouse</title>
</head>
<body>
	<h3>${msg}</h3>
	<!-- 상단바  -->
	<header>
	<%@ include file = "header.jsp" %>
	</header>
	
	<!-- 메인  -->
	<div class="main-area">
		<div class="main-img">
			<h1>Happy House</h1>
		</div>
	</div>
	
	<!-- 지역 선택 및 지도 -->
	<%@ include file = "select.jsp" %>
	
	<!-- 푸터 -->
	<footer>
		<%@ include file = "footer.jsp" %>	
	</footer>
</body>
</html>