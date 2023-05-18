<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<title>매칭 성공</title>

<style>
  .matching-info {
    width: 500px;
    margin: 30px auto;
    border: 1.5px solid rgb(26, 188, 156);
    padding: 30px ;
    text-align: center;
    border-radius: 20px;
   
  }
  
  .matching-info h2 {
    font-size: 25px;
    margin-bottom: 10px;
    font-weight: bold;
  }
  
  .matching-info p {
    font-size: 16px;
    margin-bottom: 5px;
  }
  
</style>


</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<div class="mb-5"></div>
	<div class="container mb-5">
	
		<div class="d-flex justify-content-center row mb-5">
			<div class="d-flex col-5 row">
				<h1 class="col-12">매칭 성공!</h1>
				<h5 class="col-12">집사와의 매칭의 성공했습니다.</h5>
			</div>
		</div>
	</div>
	
	<div class="matching-info mb-5">
		<h2>최종 매칭 내역</h2>
		<br>
		<div class="row">
			<p class="col-4 text-start">매칭된 아이</p>
			<p class="col-8 text-start">${a.animalName}</p>
			<p class="col-4 text-start">배정집사</p>
			<p class="col-8 text-start">${j.memberName}</p>
			<p class="col-4 text-start">집사 성별</p>
			<p class="col-8 text-start">
				<c:if test="${j.jibsaGender eq 'F'}">여성</c:if>
				<c:if test="${j.jibsaGender eq 'M'}">남성</c:if>
			</p>
			<p class="col-4 text-start">예상 비용</p>
			<p class="col-8 text-start">
				<fmt:formatNumber type="number" pattern="###,###,###" value=
					"${(fn:substring(mc.endDate,11,13)-fn:substring(mc.startDate,11,13))*j.expectedSalary}"/>원
			</p>
			<p class="col-4 text-start">시작시간</p>
			<p class="col-8 text-start">${fn:substring(mc.startDate,0,10)} ${fn:substring(mc.startDate,11,13)}:${fn:substring(mc.startDate,13,15)}</p>
			<p class="col-4 text-start">종료시간</p>
			<p class="col-8 text-start">${fn:substring(mc.endDate,0,10)} ${fn:substring(mc.endDate,11,13)}:${fn:substring(mc.endDate,13,15)}</p>
			<p class="col-4 text-start">매칭 장소</p>
			<p class="col-8 text-start">${mc.matchingPlace}</p>
			<p class="col-4 text-start">서비스 종류</p>
			<p class="col-8 text-start">
				<c:if test="${mc.serviceType eq 'care' }">방문 돌봄</c:if>
				<c:if test="${mc.serviceType eq 'training' }">방문 훈련</c:if>
			</p>
		</div>
		<br>
		<button onclick="window.open('${j.chatAddress}')" class="shadow m-bg-color rounded-2 border-0 fs-7 fw-bold text-white me-2" style="width: 120px; height: 40px;">오픈채팅 연결</button>
	</div>
	<div class="col-12 d-flex justify-content-center">
		<button onclick="location.href='${contextPath}'" class="shadow m-bg-color rounded-2 border-0 fs-7 fw-bold text-white me-2" style="width: 100px; height: 40px;">확인</button>
	</div>
	

</body>
</html>