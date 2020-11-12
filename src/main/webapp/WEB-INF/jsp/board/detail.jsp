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
				<h5 class="card-title"><c:out value="${board.title}"/> - <c:out value="${board.author}"/></h5>
				<p class="card-text">
					<small class="text-muted"><fmt:formatDate value="${board.createdDate}" pattern="yy.MM.dd HH:mm" /></small>
				</p>
				<p class="card-text"><c:out value="${board.content}"/></p>
			</div>
		</div>
		<a class="btn btn-dark" href="/board/list.do?page=${page}" role="button" style="display: inline-flex;">목록</a>
	</div>
	<%@ include file="/WEB-INF/jsp/include/script.jsp"%>
</body>
</html>