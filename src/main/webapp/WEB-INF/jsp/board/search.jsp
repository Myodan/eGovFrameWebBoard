<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<%@ include file="/WEB-INF/jsp/include/link.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
	<div class="container">
		<div class="card" style="margin-bottom: 16px">
			<div class="card-body">
				<h1 class="card-title mr-sm-2" style="display: inline-flex;">검색 결과</h1><h5 style="display: inline-flex;">(${searchPagingVO.total}개)</h5>
				<form method="post" action="/board/search.do" class="form-inline" style="display: inline-flex; float: right;">
					<select name="searchOption" class="custom-select mr-sm-2" id="inputGroupSelect01">
						<option value="TC" <c:if test="${searchPagingVO.searchOption eq 'TC'.toString() or searchOption eq null}">selected</c:if>>제목, 내용</option>
						<option value="T" <c:if test="${searchPagingVO.searchOption eq 'T'.toString()}">selected</c:if>>제목</option>
						<option value="C" <c:if test="${searchPagingVO.searchOption eq 'C'.toString()}">selected</c:if>>내용</option>
						<option value="A" <c:if test="${searchPagingVO.searchOption eq 'A'.toString()}">selected</c:if>>작성자</option>
					</select>
					<input name="keyword" class="form-control mr-sm-2" type="search" value="${searchPagingVO.keyword}" placeholder="검색어를 입력하세요!">
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
					<li class="page-item <c:if test="${!searchPagingVO.prev}">disabled</c:if>">
						<a class="page-link" href="#">&laquo;</a>
					</li>
					<c:forEach var="num" begin="${searchPagingVO.beginPage}" end="${searchPagingVO.endPage}">
						<li class="page-item <c:if test="${searchPagingVO.page eq num}">active</c:if>">
							<a class="page-link" href="?page=${num}&searchOption=${searchPagingVO.searchOption}&keyword=${searchPagingVO.keyword}">${num}</a>
						</li>
					</c:forEach>
					<li class="page-item <c:if test="${!searchPagingVO.next}">disabled</c:if>">
						<a class="page-link" href="#">&raquo;</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/script.jsp"%>
</body>
</html>