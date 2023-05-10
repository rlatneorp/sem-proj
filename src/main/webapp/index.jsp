<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<!--  상단 -->
	<%@ include file="WEB-INF/views/common/top.jsp"%>
	
	<!-- 로그인 기능 구현 전 임시 링크 -->
	<div style="margin: 50px; border: 1px solid gray;">
		<h3>로그인 기능 구현 전 임시 링크</h3>
		<ul>
			<li><a href="myPage.me">회원 마이페이지</a></li>
			<li><a href="jibsaMain.js">집사 마이페이지</a></li>
			<li><a href="adminMain.ad">관리자 마이페이지</a></li>
			<li><a href="jibsaList.js">집사 리스트</a></li>
		</ul>
	</div>
<!-- 로그인 이후 상단 -->
<%-- 	<%@ include file="WEB-INF/views/login/afterLogin.jsp"%> --%>
<!--                       상단 필요한 부분            -->
<!-- 로그인 전 상단 킬때만 씀 -->
<%-- 	<%@ include file="WEB-INF/views/user/joinNotice.jsp"%> --%>
<%-- 	<%@ include file="WEB-INF/views/user/join.jsp"%> --%>
<!--                      상단 굳이 필요없는 부분        -->
<!-- 회원가입 -->
<!-- 로그인 창 -->
<%-- 	<%@ include file="WEB-INF/views/user/login.jsp"%> --%>
<!-- 아이디 비번 찾고 비번 재설정 결과 -->
<%-- 	<%@ include file="WEB-INF/views/user/foundId.jsp"%> --%>
<%-- 	<%@ include file="WEB-INF/views/user/foundPwd.jsp"%> --%>
<%-- 	<%@ include file="WEB-INF/views/user/pwdReSetting.jsp"%> --%>
<%-- 	<%@ include file="WEB-INF/views/user/foundIdResult.jsp"%> --%>
<!-- 매칭 -->
<%-- 	<%@ include file="WEB-INF/views/matching/matching1.jsp"%> --%>
<%-- 	<%@ include file="WEB-INF/views/matching/matching2.jsp"%> --%>
<%-- 	<%@ include file="WEB-INF/views/matching/matching3.jsp"%> --%>
	<%@ include file="WEB-INF/views/home/home.jsp" %>

<!--  하단은 항상 켜놓기 -->
	<%@ include file="WEB-INF/views/common/bottom.jsp"%>
</body>
</html> 
