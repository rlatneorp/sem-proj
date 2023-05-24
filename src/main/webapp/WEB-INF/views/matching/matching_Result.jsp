<%@page import="org.springframework.web.bind.annotation.RequestAttribute"%>
<%@page import="semi.project.jsnr.matching.model.vo.Matching" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	<div class="container text-left">
	
		<c:forEach items="${jpList}" var="jp" varStatus="s">
		<c:set value="${mc}" var="mc" scope="session"/>
		  <div class="row mb-5">
		    <div class="profile row py-5 px-5">
		    	<div class="col-3">
					 <img src="${contextPath}/resources/uploadFiles/${iList[s.index].renameName}" class="w-100" width="200px" height="250px">
		    	</div>
				<div class="info col-4 row">
					<h4 class="col-12">${jList[s.index].memberName}</h4>
					<p class="col-12 mb-1"><b>- ${fn:substring(jp.profileTitle,0,20)} -</b></p>	
					<span class="col-4">나이</span>
					<span class="col-8 age">${fn:substring(jList[s.index].jibsaRrn,0,4)}</span>
					<span class="col-4">성별</span>
					<span class="col-8">
						<c:if test="${jList[s.index].jibsaGender eq 'F'}">여성</c:if>
						<c:if test="${jList[s.index].jibsaGender eq 'M'}">남성</c:if>
					</span>
					<span class="col-4">자격증</span>
					<span class="col-8">
						<c:if test="${jList[s.index].license eq null}">-</c:if>
						<c:if test="${jList[s.index].license ne null}">${jList[s.index].license}</c:if>
					</span>
					<span class="col-4">평점</span>
					<span class="col-8">
						<c:if test="${jp.jibsaAvgRating eq 0.0}">-</c:if> 
						<c:if test="${jp.jibsaAvgRating ne 0.0}">${jp.jibsaAvgRating}</c:if> 
					</span>
					<span class="col-4">희망시급</span>
					<span class="col-8">
						<fmt:formatNumber type="number" pattern="###,###,###" value="${jList[s.index].expectedSalary}"/>원
					</span>
					<span class="col-4">흡연여부</span>
					<span class="col-8">
						<c:if test="${jList[s.index].isSmoking eq 'Y'}">흡연자</c:if>
						<c:if test="${jList[s.index].isSmoking eq 'N'}">비흡연자</c:if>
					</span>
					
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
				<div class="col-2 d-flex justify-content-end align-items-center">
					<button onclick="location.href='${contextPath}/matching_Success.mc?jNo=${jp.memberNo}'" class="shadow m-bg-color rounded-2 border-0 fs-7 fw-bold text-white me-2" style="width: 100px; height: 40px;">매칭하기</button>
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
			const age = document.getElementsByClassName('age');
			const year = new Date().getFullYear();
			
			for(const i in age){
				age[i].innerText = year - age[i].innerText+1+"세";
			}
		}
		
	
	</script>
</body>
</html>