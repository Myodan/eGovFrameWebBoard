<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="margin-bottom: 16px">
	<div class="container">
		<a class="navbar-brand" href="/">게시판</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/board/list.do">목록</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<c:if test="${username eq null}">
					<li class="nav-item"><a class="nav-link" href="/account/signin.do">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="/account/signup.do">회원가입</a></li>
				</c:if>
				<c:if test="${username ne null}">
					<li class="nav-item"><a class="nav-link" href="/account/myaccount.do">[${username}]</a></li>
					<li class="nav-item"><a class="nav-link" href="/account/signout.do">로그아웃</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>