<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/style.css">
		<title>거래정보</title>
		<script type="text/javascript">
			function searchAll(){
				location.href ="${root}/Apt.do/list";
			}
			function searchApt() {
				if( $(":checkbox[name='aptdeal']:checked").length == 0){
					alert("최소 1 개 이상을 체크하세요.");
					return;
				}
				document.getElementById("searchform").action = "${root}/Apt.do/list";
				document.getElementById("searchform").submit();
			}
			function pageMove(pg) { 
				document.getElementById("pg").value=pg;
				document.getElementById("pageform").action = "${root}/Apt.do/list";
				document.getElementById("pageform").submit();
			}
		</script>
	</head>
	<body>
		<header>
			<%@ include file = "../header.jsp" %>
		</header>
		<div class="box" align="center">
			<form name="pageform" id="pageform" method="GET" action="">
				<input type="hidden" name="pg" id="pg" value="">
				<input type="hidden" name="key" id="key" value="${key}">
				<input type="hidden" name="word" id="word" value="${word}">
				<c:forEach items="${aptdeal}" var="arr">
					<input type="hidden" name="aptdeal" id="aptdeal" value="${arr}">	
				</c:forEach>
			</form>
			<div class="container" align="center">
			<div>
				<form id="searchform" method="get" action="">
					<input type="hidden" name="pg" id="pg" value="1">
					<table class="table table-borderless"> 
						<tr class="custom-control custom-checkbox" align="right">
							<td>
							<c:if test='${aptdeal.contains("1")}'> 
								<input type="checkbox" class="custom-control-input" id="1" name="aptdeal" value="1" checked="checked"/>
							</c:if>
							<c:if test='${!aptdeal.contains("1")}'> 
								<input type="checkbox" class="custom-control-input" id="1" name="aptdeal" value="1"/>
							</c:if>
								<label class="custom-control-label" for="1">아파트 매매</label>
							</td>
							<td>
								<c:if test='${aptdeal.contains("2")}'> 
								<input type="checkbox" class="custom-control-input" id="2" name="aptdeal" value="2" checked="checked"/>
							</c:if>
							<c:if test='${!aptdeal.contains("2")}'> 
								<input type="checkbox" class="custom-control-input" id="2" name="aptdeal" value="2"/>
							</c:if>
				   				<label class="custom-control-label" for="2">다세대,주택 매매</label>
							</td>
							<td>
							<c:if test='${aptdeal.contains("3")}'> 
								<input type="checkbox" class="custom-control-input" id="3" name="aptdeal" value="3" checked="checked"/>
							</c:if>
							<c:if test='${!aptdeal.contains("3")}'> 
								<input type="checkbox" class="custom-control-input" id="3" name="aptdeal" value="3"/>
							</c:if>
			   					<label class="custom-control-label" for="3">아파트 전월세</label>
							</td>
							<td>
							<c:if test='${aptdeal.contains("4")}'> 
								<input type="checkbox" class="custom-control-input" id="4" name="aptdeal" value="4" checked="checked"/>
							</c:if>
							<c:if test='${!aptdeal.contains("4")}'> 
								<input type="checkbox" class="custom-control-input" id="4" name="aptdeal" value="4"/>
							</c:if>
			   					<label class="custom-control-label" for="4">다세대,주택 전월세</label>
							</td>
						</tr>
						<tr class="form-inline">
							<td>
							<select class="form-control" name="key" id="key">
								<option value="all" selected="selected">--all--</option>
								<option value="aptName">아파트명</option>
								<option value="dong">동</option>
							</select>
							<input type="text" class="form-control" placeholder="검색어 입력." name="word" id="word">
							<button type="button" class="btn btn-dark" onclick="javascript:searchApt();">검색</button>
				   			</td>
				   		</tr>
				   	</table>
				</form>
			</div>
			<div style="width:100%; height:500px;">
			   	<table class="table apt-list">
					<thead class ="thead-dark">
						<tr>
							<th>번호</th>
							<th>동</th>
							<th>아파트이름</th>
							<th>거래금액</th>
							<th>거래종류</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${aptdeals.size() != null}">
						<c:forEach var="aptdeal" items="${aptdeals}">
							<tr style="cursor:pointer" onclick="window.open('${root}/Apt.do/view?no=${aptdeal.no}');" >
								<td>${aptdeal.no}</td>
								<td>${aptdeal.dong}</td>
								<td>${aptdeal.aptName}</td>
					        	<td>${aptdeal.dealAmount}</td>
					        	<td>${aptdeal.type}</td>
							</tr>
					        <tr></tr>
				  		</c:forEach>
					  </c:if>
					  <c:if test="${aptdeals.size() == null }">
					  	<script>searchAll();</script>
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
	
	<footer>
		<%@ include file = "../footer.jsp" %>	
	</footer>
</body>