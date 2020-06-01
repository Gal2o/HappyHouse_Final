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
<title>대기오염 정보</title>
</head>
<script type="text/javascript">
		function searchArea() {
			document.getElementById("searchform").action = "${root}/Apt.do";
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
		<input type="hidden" name="act" id="act" value="earea">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	<div class = "box">
		<div class="container" align="center">
			<h3>대기오염 정보</h3>
			<form id="searchform" method="get" action="">
				<input type="hidden" name="act" id="act" value="earea">
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
			   	<table class="table earea-list">
					<thead class ="thead-dark">
						<tr>
							<th>번호</th>
							<th>환경정보 이름</th>
							<th>주소</th>
							<th>법정동</th>
							<th>타입</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${earea.size() != null}">
						<c:forEach var="area" items="${earea}">
							<tr>
								<td >${area.no}</td>
								<td>${area.name}</td>
					        	<td>${area.address}</td>
					        	<td>${area.dong}</td>
					        	<td>${area.type}</td>
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