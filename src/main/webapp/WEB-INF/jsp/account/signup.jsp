<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@ include file="/WEB-INF/jsp/include/link.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/include/nav.jsp"%>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<h1 class="card-title">회원가입</h1>
				<form id="signup" method="POST">
					<div class="form-group">
						<label for="username"><strong>사용자 이름</strong></label> <input name="username" id="username" class="form-control" type="text" placeholder="사용자 이름을 입력해주세요!" required pattern="^[a-zA-Z0-9]{5,20}$">
						<small id="usernameHelpBlock" class="form-text text-muted">
							계정이름은 영문 대, 소문자와 숫자가 포함된 5~20자의 사용자 이름이여야 합니다.
						</small>
					</div>
					<div class="form-group">
						<label for="password"><strong>암호</strong></label>
						<input name="password" id="password" class="form-control" type="password" placeholder="암호를 입력해주세요!" required pattern="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\W)(?=\S+$).{8,30}" style="margin-bottom: 5px;">
						<input name="passwordCheck" id="password-check" class="form-control" type="password" placeholder="암호를 재 입력해주세요!" required pattern="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\W)(?=\S+$).{8,30}">
						<small id="passwordHelpBlock" class="form-text text-muted">
							비밀번호는 영문 대, 소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8~30자의 비밀번호여야 합니다.
						</small>
					</div>
					<c:if test="${error ne null}">
						<div class="alert alert-danger" role="alert">
							<c:out value="${error}"></c:out>
						</div>
					</c:if>
					<button type="submit" class="btn btn-dark">가입</button>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/jsp/include/script.jsp"%>
</body>
</html>