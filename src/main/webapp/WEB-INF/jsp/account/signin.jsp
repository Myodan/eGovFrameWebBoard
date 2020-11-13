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
				<form id="signin" method="POST" onsubmit="formIntercept(this);">
					<div class="form-group">
						<label for="username"><strong>사용자 이름</strong></label>
						<input name="username" id="username" class="form-control" type="text" placeholder="사용자 이름을 입력해주세요!" required>
					</div>
					<div class="form-group">
						<label for="_password"><strong>암호</strong></label>
						<input name="_password" id="_password" class="form-control" type="password" placeholder="암호를 입력해주세요!" required style="margin-bottom: 5px;">
					</div>
					<input name="password" type="hidden" required>
					<c:if test="${error ne null}">
						<div class="alert alert-danger" role="alert">
							<c:out value="${error}"></c:out>
						</div>
					</c:if>
					<button type="submit" class="btn btn-dark">로그인</button>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function formIntercept( form ) {
			form.password.value = SHA256(form._password.value);
			form._password.value = '';
			form.submit();
		}
	</script>
	<%@ include file="/WEB-INF/jsp/include/script.jsp"%>
</body>
</html>