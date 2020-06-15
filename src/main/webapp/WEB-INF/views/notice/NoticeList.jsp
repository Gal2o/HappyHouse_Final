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
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript">
	function pageMove(pg) { 
		document.getElementById("pg").value=pg;
		document.getElementById("pageform").action = "${root}/notice.do/list";
		document.getElementById("pageform").submit();
	}
</script>
<title>공지사항</title>
</head>
<body>
	<header>
		<%@ include file = "../header.jsp" %>
	</header>
	
	<form name="pageform" id="pageform" method="GET" action="">
		<input type="hidden" name="act" id="act" value="list">
		<input type="hidden" name="pg" id="pg" value="">
		<input type="hidden" name="key" id="key" value="${key}">
		<input type="hidden" name="word" id="word" value="${word}">
	</form>
	
	<div class="box">
	<div class="container" align="center">
		<h3>공지사항</h3>
		<table class="table table-borderless">
			<tr>
				<c:if test="${userinfo.id=='admin'}">
					<td align="right"><button type="button" class="btn btn-link" onclick='location.href="${root}/notice.do/write"'>글작성</button></td>
				</c:if>
			</tr>
		</table>
		
		<form id="searchform" method="get" class="form-inline" action="${root}/notice.do/list">
			<input type="hidden" name="pg" id="pg" value="1">
			<table class="table table-borderless">
				<tr>
	  				<td align="right">
						<select class="form-control" name="key" id="key">
							<option value="all" selected="selected">전체</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="text" class="form-control" placeholder="검색어 입력" name="word" id="word" value="${word}">
						<button type="submit" class="btn btn-dark">검색</button>
					</td>
	  			</tr>
	  		</table>
	  	</form>
	  	
		<table class="table" style="text-align:center;">
			<thead class ="thead-dark">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${notices.size() != 0}">
				<c:forEach var="notice" items="${notices}">
					<tr>
						<td>${notice.no}</td>
						<td><a href="${root}/notice.do/view?no=${notice.no}">${notice.subject}</a> </td>
			        	<td>${notice.id}</td>
			        	<td>${notice.regtime}</td>
					</tr>
				</c:forEach>
			</c:if>
			</tbody>
		</table>
		
		<c:if test="${notices.size() == 0}">
	  		<table class="table">
	    	<tbody>
	      		<tr class="table-active" align="center">
					<td>작성된 글이 없습니다.</td>
	      		</tr>
	    	</tbody>
	  		</table>
	  	</c:if>
	  	
	  	<table>
			<tr>
				<td>${navigation.navigator}</td>
			</tr>
	  	</table>
	</div>
	</div>
	
	<footer>
		<%@ include file = "../footer.jsp" %>	
	</footer>
</body>
</html>