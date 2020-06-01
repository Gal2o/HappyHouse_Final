<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
			function back(){
				document.location.href = "${root}/User.do?act=mvinfo";
			}
			
			function del(){
				document.location.href = "${root}/User.do?act=del";
			}
	</script>
</head>
<body>
<div class="container">
  <div class="jumbotron">
    <h1>탈퇴하시겠습니까?</h1>      
  </div>  
  <div class="form-group" align="center">
		<button type="button" class="btn btn-primary" onclick="javascript:back();">돌아가기</button>
		<button type="button" class="btn btn-warning" onclick="javascript:del();">탈퇴하기</button>
    </div>
</div>
</body>
</html>