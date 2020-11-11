<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<%@ include file="/WEB-INF/jsp/include/link.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
	<div class="container">
		<div class="card" style="margin-bottom: 16px">
			<div class="card-body">
				<h1 class="card-title" style="display: inline-flex;">게시글 목록</h1>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">제목</th>
							<th scope="col">조회수</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td style="width: 55%"><a href=""><c:out value="${board.title}" /></a></td>
								<td style="width: 15%"><c:out value="${board.views}" /></td>
								<td style="width: 15%"><c:out value="${board.author}" /></td>
								<td style="width: 15%"><fmt:formatDate value="${board.createdDate}" pattern="yy.MM.dd HH:mm" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul class="pagination" style="display: inline-flex; margin-bottom: 0;">
					<li class="page-item"><a class="page-link" href="#" aria-label="Previous">&laquo;</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#" aria-label="Next">&raquo;</a></li>
				</ul>
				<c:if test="${username ne null}">
					<div style="display: inline-flex; float: right;">
						<a class="btn btn-dark" href="#" role="button">작성</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/script.jsp"%>
</body>
</html>