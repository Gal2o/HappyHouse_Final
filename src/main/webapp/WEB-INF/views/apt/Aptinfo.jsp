<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<title>아파트 정보</title>
</head>
<body>
	<header>
		<%@ include file = "../header.jsp" %>
	</header>
	<div class = "box">
		<div class="container" align="center">
			<h3>아파트 정보</h3>
			<div class="info">
				<div class="apt-img apt-inline">
					<img src="${root}/img/${aptdeal.img}" alt="그림 없음">
				</div>
				<div class="apt-table apt-inline">
					<table class="table">
						<tr>
							<td><strong>주택명</strong></td>
							<td>${aptdeal.aptName}</td>
						</tr>
						<tr>
							<td><strong>거래금액</strong></td>
							<td>${aptdeal.dealAmount}</td>
						</tr>
						<tr>
							<td><strong>월세금액</strong></td>
							<c:if test="${aptdeal.rentMoney == null }">
							<td>없음</td>
							</c:if>
							<c:if test="${aptdeal.rentMoney != null }">
							<td>${aptdeal.rentMoney}</td>
							</c:if>
						</tr>
						<tr>
							<td><strong>건축연도</strong></td>
							<td>${aptdeal.dealYear}</td>
						</tr>
						<tr>
							<td><strong>전용면적</strong></td>
							<td>${aptdeal.area}</td></tr>
						<tr>
							<td><strong>거래일</strong></td>
							<td>${aptdeal.dealDay}</td>
						</tr>
						<tr>
							<td><strong>법정동</strong></td>
							<td>${aptdeal.dong}</td>
						</tr>
						<tr>
							<td><strong>지번</strong></td>
							<td>${aptdeal.jibun}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>