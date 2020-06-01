<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<div class="header-area ">
	<div class="header-top_area">
		<c:if test="${userinfo == null}">
			<p>
			<a href="${root}/User.do?act=mvjoin">Sign Up</a> 
			<a href="${root}/User.do?act=mvlogin">Login</a>
			</p>
		</c:if>
		<c:if test="${userinfo != null}">
			<p>
				<a href="${root}/User.do?act=logout">Logout</a> 
				<a href="${root}/User.do?act=mvinfo">My Info</a>
			</p>
		</c:if>
	</div>
	<div class="main-header-area">
		<div class="header-left">
			<div class="logo">
				<a href="${root}/">
				<img src="${root}/img/logo.png" alt="" style="width:100px;">
				</a>
			</div>
		</div>
		<div class="header-right">
			<div class="main-menu">
				<nav>
					<ul id="navigation">
						<li><a href="${root}/notice.do/list">공지사항</a></li>
						<li><a href="${root}/sitemap.jsp">사이트맵</a></li>
						<li><a href="${root}/apt/AptList.jsp">거래정보</a></li>
						<c:if test="${userinfo != null}">
							<li><a href="${root}/Apt.do?act=barea&pg=1">상권 정보</a></li>
							<li><a href="${root}/Apt.do?act=earea&pg=1">대기오염 정보</a></li>
							<li><a href="${root}/Apt.do?act=mvsetarea">관심 지역 설정</a></li>
							<li><a href="${root}/Apt.do?act=mvsetarea">관심 지역 둘러보기</a></li>
						</c:if>
						<li><input type="text" placeholder="serach"></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>