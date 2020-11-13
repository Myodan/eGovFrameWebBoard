<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 - <c:out value="${board.title}"/></title>
<%@ include file="/WEB-INF/jsp/include/link.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
	<div class="container">
		<div class="card" style="margin-bottom: 16px">
			<div class="card-body">
				<h5 class="card-title">${board.title}</h5>
				<p class="card-text">
					<small class="text-muted">작성자: ${board.author}</small><br>
					<small class="text-muted">게시일: <fmt:formatDate value="${board.createdDate}" pattern="yy.MM.dd HH:mm" /></small>
				</p>
				<p class="card-text"><c:out value="${board.content}"/></p>
				<p class="card-text">
					<small class="text-muted">조회수: ${board.views}</small>
				</p>
				<a class="btn btn-dark mr-sm-2" href="/board/list.do?page=${page}" role="button" style="display: inline-flex; float: left;">목록</a>
				<c:if test="${username eq board.author}">
					<form action="/board/delete.do" method="post">
						<input name="id" type="hidden" value="<c:out value="${board.id}" />">
						<input name="page" type="hidden" value="<c:out value="${page}" />">
						<button id="delete-btn" type="submit" class="btn btn-dark" style="display: inline-flex; float: right;">삭제</button>
					</form>
					<a class="btn btn-dark mr-sm-2" href="/board/edit.do?id=${board.id}&page=${page}" role="button" style="display: inline-flex; float: right;">수정</a>				
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/script.jsp"%>
</body>
</html>