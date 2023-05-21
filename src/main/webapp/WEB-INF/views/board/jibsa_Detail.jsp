<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap"  rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
	<title>집사 프로필보기</title>
<style>
body {font-family: 'Noto Sans KR', sans-serif;}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<br><br>
	<div class="row d-flex mb-5">
<!-- 		<div class="col-2"></div> -->
		<div class="col-4 d-flex mx-auto">
			<div class="row d-flex py-3 fs-6">
				<p class="col-12 fs-4 mb-5 fw-bold">${jp.jibsaName}집사님</p>
				<p class="col-3">성별</p><p class="col-9">
					<c:if test="${jibsa.jibsaGender eq 'M' }">남성</c:if>
					<c:if test="${jibsa.jibsaGender eq 'Y' }">여성</c:if>
				</p>
				<p class="col-3">나이</p><p class="col-9 age">${fn:substring(jibsa.jibsaRrn,0,4)}</p>
				<p class="col-3">흡연여부</p>
					<p class="col-9">
						<c:if test="${ jibsa.isSmoking eq 'N'}">비흡연자</c:if>
						<c:if test="${ jibsa.isSmoking eq 'Y'}">흡연자</c:if>
					</p>
<%-- 				<p class="col-3">매칭횟수</p><p class="col-9">${jibsa.workCount }</p> --%>
				<p class="col-3">경력사항</p><p class="col-9">${jibsa.workCareer }</p>
<%-- 				<p class="col-3">이동수단</p><p class="col-9">${jibsa.vehicle }</p> --%>
				<p class="col-3">근무가능시간</p>
<%-- 				<p class="col-9">${jibsa.availableHour }</p> --%>
				<div class="col-9 row workTimeBox">
				${jp.availableHourArr[1]}
					<p class="col-4 my-0">월요일</p><c:set var="t" value="${jp.availableHourArr[1]}"/>
					<c:if test="${t eq '00000000' }">
						<span class="col-8">휴무</span>
					</c:if>
					<c:if test="${t ne '00000000' }">
						<span class="col-8">${fn:substring(t,0,2)}:${fn:substring(t,2,4)}~${fn:substring(t,4,6)}:${fn:substring(t,6,8)}</span>
					</c:if>
				</div>
				
				
<%-- 				<p class="col-3">근무가능횟수</p><p class="col-9">${jibsa.availableTime }</p> --%>
				<p class="col-3">근무가능지역</p><p class="col-9">${jibsa.availableArea }</p>
				<p class="col-3">시급</p><p class="col-9">${jibsa.expectedSalary }원</p>
				
			</div>
		</div>
		
		<div class="col-4">
			<div class="card" style="border: 5px solid rgb(26, 188, 156); border-radius: 20px;">
				<img src="${ contextPath }/resources/image/logo.png">
			</div>
			<div class="container text-center mt-5">
				<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">매칭하기</button>
			</div>
		</div>
<!-- 		<div class="col-2"></div> -->
		
		<br><br><br><br><br><br><br><br><br>
	
	</div>
	
	
	
	<%@ include file="../common/bottom.jsp"%>
	
	<script>
		window.onload = () =>{
// 			const cards = document.querySelectorAll('.card');
// 			for(card of cards){
// 				const mId = card.children[0].value;
// 				console.log(mId);
// 				card.addEventListener('click', function(){
// 					location.href="${contextPath}/jibsa_Detail.bo?mId="+mId+"&page="+${pi.currentPage};
// 				})
// 			}
			
			const age = document.getElementsByClassName('age')[0];
			const today = new Date().getFullYear();
			
			const result = today - age.innerText + 1;
			age.innerText = result +" 세";
			
			
			
			
			
			
			
			
		}
	</script>
</body>
</html>