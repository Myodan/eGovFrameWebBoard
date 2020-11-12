<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<%@ include file="/WEB-INF/jsp/include/link.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">게시글 작성</h1>
				<form id="signin" method="POST">
					<div class="form-group">
						<label for="title"><strong>제목</strong></label>
						<input name="title" id="title" class="form-control" type="text" required>
					</div>
					<div class="form-group">
						<label for="author"><strong>작성자</strong></label>
						<input name="author" id="author" class="form-control" type="text" value="${username}" required readonly>
					</div>
					<div class="form-group">
						<label for="content"><strong>내용</strong></label>
						<textarea name="content" id="content" class="form-control" required style="margin-bottom: 5px;"></textarea>
					</div>
					<button type="submit" class="btn btn-dark">작성</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/script.jsp"%>
</body>
</html>