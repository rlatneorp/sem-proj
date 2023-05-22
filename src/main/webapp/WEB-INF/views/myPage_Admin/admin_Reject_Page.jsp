<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접근 제한</title>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<div class="text-center">
		<br>
		<h3>관리자 권한이 필요합니다.</h3>
		<br>
		<h4>관리자로 로그인해주세요.</h4>
		<br>
		<button onclick="location.href='${contextPath}/loginView.do'" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">로그인</button>
	</div>
</body>
</html>