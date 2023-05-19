<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap"  rel="stylesheet">
	<title>집사 프로필보기</title>
<style>
body {font-family: 'Noto Sans KR', sans-serif;}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<br><br>
	<div class="row d-flex mb-5">
		<div class="col-2">
		</div>
		<div class="col-4 d-flex">
			<div class="row d-flex py-3 fs-6">
				<p class="col-12 fs-4 mb-5 fw-bold">${jp.jibsaName}집사님</p>
				<p class="col-3">성별</p><p class="col-9">${jibsa.jibsaGender }</p>
				<p class="col-3">나이</p><p class="col-9">${jibsa.jibsaRrn}나이로 수정요망</p>
				<p class="col-3">흡연여부</p>
					<p class="col-9">
						<c:if test="${ jibsa.isSmoking eq 'N'}">비흡연자</c:if>
						<c:if test="${ jibsa.isSmoking eq 'Y'}">흡연자</c:if>
					</p>
<%-- 				<p class="col-3">매칭횟수</p><p class="col-9">${jibsa.workCount }</p> --%>
				<p class="col-3">경력사항</p><p class="col-9">${jibsa.workCareer }</p>
<%-- 				<p class="col-3">이동수단</p><p class="col-9">${jibsa.vehicle }</p> --%>
				<p class="col-3">근무가능시간</p><p class="col-9">${jibsa.availableHour }</p>
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
		<div class="col-2">
		</div>
		
		<br><br><br><br><br><br><br><br><br>
	
	</div>
	
	
	
	<%@ include file="../common/bottom.jsp"%>
	
	<script>
		window.onload = () =>{
			const cards = document.querySelectorAll('.card');
			for(card of cards){
				const mId = card.children[0].value;
				console.log(mId);
				card.addEventListener('click', function(){
					location.href="${contextPath}/jibsa_Detail.bo?mId="+mId+"&page="+${pi.currentPage};
				})
			}
			
			
			
			
			
			
			
			
			
			
			
			
		}
	</script>
</body>
</html>