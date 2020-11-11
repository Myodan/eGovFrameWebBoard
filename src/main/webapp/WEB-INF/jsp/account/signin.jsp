<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/jsp/include/link.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">로그인</h1>
				<form id="signin" method="POST">
					<div class="form-group">
						<label for="username"><strong>사용자 이름</strong></label>
						<input name="username" id="username" class="form-control" type="text" placeholder="사용자 이름을 입력해주세요!" required>
					</div>
					<div class="form-group">
						<label for="password"><strong>암호</strong></label>
						<input name="password" id="password" class="form-control" type="password" placeholder="암호를 입력해주세요!" required style="margin-bottom: 5px;">
					</div>
					<button type="submit" class="btn btn-dark">로그인</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/script.jsp"%>
</body>
</html>