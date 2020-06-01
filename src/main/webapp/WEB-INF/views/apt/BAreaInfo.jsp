<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>상권 정보</title>
</head>
<script type="text/javascript">
		function searchArea() {
			document.getElementById("searchform").action = "${root}/Apt.do/barea";
			document.getElementById("searchform").submit();
		}
		function pageMove(pg) { 
			document.getElementById("pg").value=pg;
			document.getElementById("pageform").action = "${root}/Apt.do";
			document.getElementById("pageform").submit();
		}
</script>
<body>
<header>
	<%@ include file = "../header.jsp" %>
</header>
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="barea">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class = "box">
		<div class="container" align="center">
			<h3>상권 정보</h3>
			<form id="searchform" method="get" action="${root}/Apt.do/barea">
				<input type="hidden" name="act" id="act" value="barea">
				<input type="hidden" name="pg" id="pg" value="1">
				<table class="table table-borderless">
					<tr class="form-inline">
						<td>
						<input type="text" class="form-control" placeholder="관심지역(동) 입력." name="word" id="word">
						<button type="button" class="btn btn-dark" onclick="javascript:searchArea();">검색</button>
			   			</td>
			   		</tr>
			   	</table>
			</form>
			<div style="width:100%; height:500px;">
			   	<table class="table barea-list">
					<thead class ="thead-dark">
						<tr>
							<th>번호</th>
							<th>상권 이름</th>
							<th>지역 이름</th>
							<th>소분류</th>
							<th>주소</th>
							<th>법정동</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${barea.size() != null}">
						<c:forEach var="area" items="${barea}">
							<tr>
								<td >${area.no}</td>
								<td>${area.shopname}</td>
								<td>${area.localname}</td>
					        	<td>${area.codename4}</td>
					        	<td>${area.jibuaddress}</td>
					        	<td>${area.dong}</td>
							</tr>
					        <tr></tr>
				  		</c:forEach>
					  </c:if>
				    </tbody>
				</table>
				<table>
					<tr>
						<td>${navigation.navigator}</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>