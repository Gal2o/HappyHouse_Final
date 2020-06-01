<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 지역 설정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript">

$(document).ready(function() {
	$("#registerBtn").click(function() {
		if($("#sido").val() == 0){
			alert("도 / 광역시를 입력하세요.");
			return;
		} else if($("#gugun").val() == 0){
			alert("구 / 군을 입력하세요.");
			return;
		} else if($("#dong").val() == 0){
			alert("동을 입력하세요.")
			return;
		} else{
			$("#favorite").attr("action", "${root}/Apt.do?act=setarea").submit();
		}
	});
});

function back(){
	document.location.href = "${root}/index.jsp";
}

</script>
</head>
<body>
<script>
		let colorArr = ['table-primary','table-success','table-danger'];
		$(document).ready(function(){
			$.get("${pageContext.request.contextPath}/SelectBoxController"
				,{command:"sido"}
				,function(data, status){
					$.each(data, function(index, vo) {
						$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");
					});//each
				}//function
				, "json"
			);//get
		});//ready
		
		$(document).ready(function(){
			$("#sido").change(function() {
				$.get("${pageContext.request.contextPath}/SelectBoxController"
						,{command:"gugun", sido:$("#sido").val()}
						,function(data, status){
							$("#gugun").empty();
							$("#gugun").append('<option value="0">선택</option>');
							$.each(data, function(index, vo) {
								$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
							});//each
						}//function
						, "json"
				);//get
			});//change
			
			$("#gugun").change(function() {
				$.get("${pageContext.request.contextPath}/SelectBoxController"
						,{command:"dong", gugun:$("#gugun").val()}
						,function(data, status){
							$("#dong").empty();
							$("#dong").append('<option value="0">선택</option>');
							$.each(data, function(index, vo) {
								$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
							});//each
						}//function
						, "json"
				);//get
			});//change
			
			$("#dong").change(function() {
				$.get("${pageContext.request.contextPath}/SelectBoxController"
						,{command:"apt", dong:$("#dong").val()}
						,function(data, status){
							$("#searchResult").empty();
							$.each(data, function(index, vo) {
								let str = "<tr class="+colorArr[index%3]+">"
								+ "<td>" + vo.no + "</td>"
								+ "<td>" + vo.dong + "</td>"
								+ "<td>" + vo.AptName + "</td>"
								+ "<td>" + vo.jibun + "</td>"
								+ "<td>" + vo.code
								+ "</td><td id='lat_"+index+"'></td><td id='lng_"+index+"'></td></tr>";
								$("tbody").append(str);
								$("#searchResult").append(vo.dong+" "+vo.AptName+" "+vo.jibun+"<br>");
							});//each
							geocode(data);
						}//function
						, "json"
				);//get
			});//change
		});//ready
</script>

	<header>
	<%@ include file = "../header.jsp" %>
	</header>
	
	<div class="box">
	<div class="container" align="center">
		<div class="col-lg-6" align="center">
		<h2 align="left">관심 지역 설정</h2><br>
			<form id="favorite" method="post" action="">
			<input type="hidden" name="act" id="act" value="">
				<div class="form-group" align="left">
					<select class="form-control" align="left" name="sido" id="sido">
						<option value="0">도 / 광역시</option>
					</select><br>
					
					<select class="form-control" align="left" name="gugun" id="gugun">
						<option value="0">구 / 군</option>
					</select><br>
					
					<select class="form-control" align="left" name="dong" id="dong">
						<option value="0">동</option>
					</select><br>
				</div>
				
				<div class="form-group" align="center">
					<button type="reset" class="btn btn-dark" onclick="javascript:back();">취소</button>
					<button type="button" class="btn btn-warning" id="registerBtn">확인</button>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>