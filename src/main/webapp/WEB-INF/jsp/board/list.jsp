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
				<h1 class="card-title mr-sm-2" style="display: inline-flex;">게시글 목록</h1><h5 style="display: inline-flex;">(${pagingVO.total}개)</h5>
				<form method="post" action="/board/search.do" class="form-inline" style="display: inline-flex; float: right;">
					<select name="searchOption" class="custom-select mr-sm-2" id="inputGroupSelect01">
						<option value="TC" selected>제목, 내용</option>
						<option value="T" >제목</option>
						<option value="C" >내용</option>
						<option value="A" >작성자</option>
					</select>
					<input name="keyword" class="form-control mr-sm-2" type="search" placeholder="검색어를 입력하세요!">
					<button class="btn btn-dark my-2 my-sm-0" type="submit">검색</button>
				</form>
				<table class="table table-sm">
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
								<td style="width: 55%"><a href="/board/detail.do?id=${board.id}&page=${pagingVO.page}"><c:out value="${board.title}" /></a></td>
								<td style="width: 15%">${board.views}</td>
								<td style="width: 15%">${board.author}</td>
								<td style="width: 15%"><fmt:formatDate value="${board.createdDate}" pattern="yy.MM.dd HH:mm" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul class="pagination" style="display: inline-flex; margin-bottom: 0;">
					<li class="page-item <c:if test="${!pagingVO.prev}">disabled</c:if>">
						<a class="page-link" href="?page=${pagingVO.beginPage - 1}">&laquo;</a>
					</li>
					<c:forEach var="num" begin="${pagingVO.beginPage}" end="${pagingVO.endPage}">
						<li class="page-item <c:if test="${pagingVO.page eq num}">active</c:if>">
							<a class="page-link" href="?page=${num}">${num}</a>
						</li>
					</c:forEach>
					<li class="page-item <c:if test="${!pagingVO.next}">disabled</c:if>">
						<a class="page-link" href="?page=${pagingVO.endPage + 1}">&raquo;</a>
					</li>
				</ul>
				<c:if test="${username ne null}">
					<a class="btn btn-dark" href="/board/post.do" role="button" style="display: inline-flex; float: right;">작성</a>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/script.jsp"%>
</body>
</html>