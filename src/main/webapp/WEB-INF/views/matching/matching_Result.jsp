<%@page import="org.springframework.web.bind.annotation.RequestAttribute"%>
<%@page import="semi.project.jsnr.matching.model.vo.Matching" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<style>

	.profile {
			border: 0.5px solid rgb(26, 188, 156);
			border-radius: 30px;
	}
	
	button {
	  background-color: rgb(26, 188, 156);
	  color: white;
	  border: none;
	  border-radius: 20px;
	  font-size: 1rem;
	  padding: 10px 20px;
	}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<div class="container">
	  
		<br><br><br>
		<h1>매칭 결과</h1>
		<br>
		<h5>원하는 조건과 딱 맞는 집사님들을 소개합니다!</h5>
		<br>
		
	
	</div>
	
	<div class="container text-end mb-5">
	<select>
	  <option selected>평점순으로 보기</option>
	  <option value="1">후기 많은 순으로 보기</option>
	  <option value="2">이름 순으로 보기</option>
	</select>
	</div>
	
	<div class="container text-left">
	
		<c:forEach items="${jpList}" var="jp">
		<c:set value="${mc}" var="mc" scope="session"/>
		  <div class="row mb-5">
		    <div class="profile row py-5 px-5">
		    	<div class="col-3">
					<img src="${contextPath}/resources/image/logo.png" class="w-100">
		    	</div>
				<div class="info col-3">
					<h4>${jp.jibsaName}</h4>
					<p>${jp.profileTitle}<br>
						나이 : 아직모름 <br>
						지원 동기 : 추가해야함<br>
						평점 : ${jp.jibsaAvgRating}
					</p>
				</div>
				<div class="col-3 row workTimeBox">
					<h4 class="col-12">근무 가능시간</h4>
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
				<div class="col-1"></div>
				<div class="col-2 d-flex justify-content-end align-items-center">
					<button onclick="location.href='${contextPath}/matching_Success.mc?jNo=${j.memberNo}'" class="shadow m-bg-color rounded-2 border-0 fs-7 fw-bold text-white me-2" style="width: 100px; height: 40px;">매칭하기</button>
				</div>
			</div>
		  </div>
		</c:forEach>
	
		<div class="container text-center">
			<br><br>
			<h4>마음에 드는 집사가 없다면</h4>
			<br>
			
			<button onclick="location.href='${contextPath}/matching_Main.mc'" class="shadow m-bg-color rounded-2 border-0 fs-7 fw-bold text-white me-2" style="width: 120px; height: 40px;">다시 찾기</button>
			<br><br><br><br>
		
		</div>
	</div>
	<script>
		window.onload = () =>{
			const wTBs = document.getElementsByClassName('workTimeBox');
			for(const wTB of wTBs){
				const spans = wTB.querySelectorAll('span')
				for(const i in spans){
					if(spans[i].innerText == "00:00~00:00"){
						spans[i].innerText = "휴무";
					}
				}
				
			}
		}
	
	</script>
</body>
</html>