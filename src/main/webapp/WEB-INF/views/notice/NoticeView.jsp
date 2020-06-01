<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="/css/style.css">
<title>공지사항</title>
</head>
<body>
	<header>
		<%@ include file = "../header.jsp" %>
	</header>
	<div class="box">
		<div class="container" align="center">
			<h3>공지사항</h3>
			<table class="table table-notice1" style="text-align:center;">
				<thead class ="thead-dark">
					<tr>
						<th>번호</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${notice.no}</td>
				        <td>${notice.id}</td>
				        <td>${notice.regtime}</td>
					</tr>
					<tr></tr>
		    	</tbody>
		    </table>
		    <table class="table-notice2">
		  		<tr height="100px">
		  			<th class ="thead-light">제목</th>
		  			<td colspan="2">${notice.subject}</td>
		  		</tr>
		  		<tr height="400px">
		  			<th class ="thead-light">내용</th>
		  			<td colspan="2">${notice.content}</td>
		  		</tr>
		  	</table>
		  		<table class="table" style="width:900px">
		  		<c:if test="${userinfo.id == 'admin'}">
					<tr class="table-light">
						<td style="text-align:right">
							<a href="${root}/notice.do/modify?no=${notice.no}" class="btn btn-outline-dark">수정</a>
							<a href="${root}/notice.do/delete?no=${notice.no}" class="btn btn-outline-dark">삭제</a>
						</td>
					</tr>
				</c:if>
		  	</table>
		  </div>
	  </div>
	  
	<footer>
		<%@ include file = "../footer.jsp" %>	
	</footer>
</body>
</html>