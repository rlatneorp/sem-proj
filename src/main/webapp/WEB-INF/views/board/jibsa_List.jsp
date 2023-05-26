<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>집사와 훈련사 조회 페이지</title>
	<style>
		.card:hover{
			cursor: pointer;
			background: rgba(26, 188, 156, 0.7);
		}
	</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<div class="container text-center rounded mb-5">
		<br><br><br>
		<h1>집사 / 훈련사</h1>
		<br>
		<h5>집사나라의 파트너를 소개합니다!</h5>
		<br>
	</div>
	
	<div class="container text-center mb-5">
		<div class="filter d-flex  mb-5" style="margin-left: 780px;">
			<div class="filter-group d-flex">
				<button onclick="location.href='${contextPath}/jibsa_List.bo?searchType=0'" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">전체</button>
				<button onclick="location.href='${contextPath}/jibsa_List.bo?searchType=3'" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">추천</button>
				<button onclick="location.href='${contextPath}/jibsa_List.bo?searchType=1'" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">집사</button>
				<button onclick="location.href='${contextPath}/jibsa_List.bo?searchType=2'" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">훈련사</button>
			</div>
		</div>
		
		<div class="row d-flex justify-content-center">
			<c:forEach items="${ jpList }" var="jp">
				<div class="card col-3 mx-3 mb-4" style="width: 350px; height: 400px;">
					<input type="hidden" value="${ jp.memberNo }">
			  		<div class="card-body row d-flex justify-content-center">
			  			<div class="col-12" style="height:180px;">
			  				<c:if test="${jp.image eq null}">
				    			<img src="${ contextPath }/resources/image/logo.png" class="w-75" style="border-radius: 10px;">
			  				</c:if>
			  				<c:if test="${jp.image ne null}">
				    			<img src="${contextPath}/resources/uploadFiles/${ jp.image.renameName}" width="200" height="150" style="border-radius: 10px;">
			  				</c:if>
			    		</div>
			    		<p class="col-12 name mb-2">${ jp.jibsaName } 집사님</p>
			    		<p class="col-12 text-end">
			    			<c:if test="${ jp.isPrimium eq 'Y'}"><b style="color: red;">★추천★</b></c:if>
			    		</p>
			    		<div class="text-black me-2 mx-0 px-0">
				    		<div class="row px-0 text-start" style="height: 50px;">
				    			<span class="col-4 ps-3">활동지역</span>
				    			<span class="col-8 px-0">${ jp.availableArea }</span>
			    			</div>
			    			<div class="row px-0 text-start">
				    			<span class="col-4 ps-3">시급</span>
				    			<span class="col-8 px-0">
				    				<fmt:formatNumber type="number" pattern="###,###,###" value="${ jp.expectedSalary }"></fmt:formatNumber>
				    				원
				    			</span>
			    			</div>
			    			<div class="text-end">
				    			<span class="px-0">
				    				평점
				    				<c:if test="${jp.jibsaAvgRating eq 0.0}">-</c:if>
				    				<c:if test="${jp.jibsaAvgRating ne 0.0}">${jp.jibsaAvgRating}</c:if>
				    			</span>
			    			</div>
				    	</div>
					</div>
				</div>
				
			</c:forEach>
		</div>
		<%@ include file="../common/paging.jsp" %>
	</div>
	
	<br><br><br><br><br><br><br>
	<hr>
	
	
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