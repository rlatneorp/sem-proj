<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
		<div class="col-4 d-flex mx-auto">
			<div class="row d-flex py-3 fs-6">
				<p class="col-12 fs-4 mb-5 fw-bold">${jp.jibsaName} 집사님</p>
				<p class="col-3">성별</p><p class="col-9">
					<c:if test="${jibsa.jibsaGender eq 'M' }">남성</c:if>
					<c:if test="${jibsa.jibsaGender eq 'F' }">여성</c:if>
				</p>
				<p class="col-3">나이</p><p class="col-9 age">${fn:substring(jibsa.jibsaRrn,0,4)}</p>
				<p class="col-3">흡연여부</p>
					<p class="col-9">
						<c:if test="${ jibsa.isSmoking eq 'N'}">비흡연자</c:if>
						<c:if test="${ jibsa.isSmoking eq 'Y'}">흡연자</c:if>
					</p>
				<p class="col-3">경력사항</p><p class="col-9">${jibsa.workCareer }</p>
				<p class="col-3">근무가능시간</p>
				
				<div class="col-9 row workTimeBox mb-4">
					<p class="col-4 my-0">월요일</p><c:set var="t" value="${jp.availableHourArr[1]}"/>
					<c:if test="${t eq '00000000' }">
						<span class="col-8">휴무</span>
					</c:if>
					<c:if test="${t ne '00000000' }">
						<span class="col-8">${fn:substring(t,0,2)}:${fn:substring(t,2,4)}~${fn:substring(t,4,6)}:${fn:substring(t,6,8)}</span>
					</c:if>

					<p class="col-4 my-0">화요일</p><c:set var="t" value="${jp.availableHourArr[2]}"/>
					<c:if test="${t eq '00000000' }">
						<span class="col-8">휴무</span>
					</c:if>
					<c:if test="${t ne '00000000' }">
						<span class="col-8">${fn:substring(t,0,2)}:${fn:substring(t,2,4)}~${fn:substring(t,4,6)}:${fn:substring(t,6,8)}</span>
					</c:if>
					
					<p class="col-4 my-0">수요일</p><c:set var="t" value="${jp.availableHourArr[3]}"/>
					<c:if test="${t eq '00000000' }">
						<span class="col-8">휴무</span>
					</c:if>
					<c:if test="${t ne '00000000' }">
						<span class="col-8">${fn:substring(t,0,2)}:${fn:substring(t,2,4)}~${fn:substring(t,4,6)}:${fn:substring(t,6,8)}</span>
					</c:if>

					<p class="col-4 my-0">목요일</p><c:set var="t" value="${jp.availableHourArr[4]}"/>
					<c:if test="${t eq '00000000' }">
						<span class="col-8">휴무</span>
					</c:if>
					<c:if test="${t ne '00000000' }">
						<span class="col-8">${fn:substring(t,0,2)}:${fn:substring(t,2,4)}~${fn:substring(t,4,6)}:${fn:substring(t,6,8)}</span>
					</c:if>

					<p class="col-4 my-0">금요일</p><c:set var="t" value="${jp.availableHourArr[5]}"/>
					<c:if test="${t eq '00000000' }">
						<span class="col-8">휴무</span>
					</c:if>
					<c:if test="${t ne '00000000' }">
						<span class="col-8">${fn:substring(t,0,2)}:${fn:substring(t,2,4)}~${fn:substring(t,4,6)}:${fn:substring(t,6,8)}</span>
					</c:if>

					<p class="col-4 my-0">토요일</p><c:set var="t" value="${jp.availableHourArr[6]}"/>
					<c:if test="${t eq '00000000' }">
						<span class="col-8">휴무</span>
					</c:if>
					<c:if test="${t ne '00000000' }">
						<span class="col-8">${fn:substring(t,0,2)}:${fn:substring(t,2,4)}~${fn:substring(t,4,6)}:${fn:substring(t,6,8)}</span>
					</c:if>

					<p class="col-4 my-0">일요일</p><c:set var="t" value="${jp.availableHourArr[0]}"/>
					<c:if test="${t eq '00000000' }">
						<span class="col-8">휴무</span>
					</c:if>
					<c:if test="${t ne '00000000' }">
						<span class="col-8">${fn:substring(t,0,2)}:${fn:substring(t,2,4)}~${fn:substring(t,4,6)}:${fn:substring(t,6,8)}</span>
					</c:if>

				</div>
				
				<p class="col-3">근무가능지역</p><p class="col-9">${jibsa.availableArea }</p>
				<p class="col-3">희망 시급</p><p class="col-9"><fmt:formatNumber value="${jibsa.expectedSalary }" pattern="###,###,###"/>원</p>
				
			</div>
		</div>
		
		<div class="col-4">
			<div class="card" style="border: 5px solid rgb(26, 188, 156); border-radius: 20px;">
				<c:if test="${image eq null}">
					<img src="${ contextPath }/resources/image/logo.png">
				</c:if>
				<c:if test="${image ne null}">
					<img src="${image.imagePath}/${image.renameName}">
				</c:if>
			</div>
<!-- 			<div class="container text-center mt-5"> -->
<!-- 				<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">매칭하기</button> -->
<!-- 			</div> -->
		</div>
		
		<br><br><br><br><br><br><br><br><br>
	
	</div>
	
	
	
	<%@ include file="../common/bottom.jsp"%>
	
	<script>
		window.onload = () =>{
			
			const age = document.getElementsByClassName('age')[0];
			const today = new Date().getFullYear();
			
			const result = today - age.innerText + 1;
			age.innerText = result +" 세";
			
		}
	</script>
</body>
</html>