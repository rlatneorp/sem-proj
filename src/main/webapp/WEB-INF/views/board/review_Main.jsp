<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap"  rel="stylesheet">
<title>이용 후기</title>
<style>
	.review {
	  display: flex;
	  align-items: flex-start;
	  width: 400px;
	  height: 200px;
	}
	
	.review .profile {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  margin-right: 10px;
	}
	
	.review img {
	  width: 100px;
	  height: 100px;
	  object-fit: cover;
	  margin-right:1px;
	  border-radius: 50%;
	}
	
	.jibsaName {
	  font-size: 1.5rem;
	  font-weight: bold;
	  margin-bottom: 0; /* margin-bottom 제거 */
	}
	.review div{
	  font-size: 20px;
	}
	
	.review a {
	  font-size: 1rem;
	  margin-bottom: 10px;
	  margin-top: 20px;
	  margin-left:20px;
	}
	
	.row.parent {
 		 padding: 3px;
	}
	.col{
			border: 0.5px solid rgb(26, 188, 156);
			padding: 30px;
			margin: 10px;
			border-radius: 30px;
			display: inline-block;
	}
	.reviewContent {
	   display: -webkit-box;
	   -webkit-line-clamp: 4;
	   -webkit-box-orient: vertical;
	   overflow: hidden;
	   text-overflow: ellipsis;
	   max-height: 120px; /* line-height와 font-size를 곱한 값을 입력합니다. */
	   color: rgb(51, 51, 51); text-decoration: none; 
 	}
 	
 	.userName {
	  background-color: rgb(26, 188, 156);
	  color: white;
	  font-size: 1rem;
	  padding: 5px;
	  border-radius: 5px;
	  margin-top: 10px;
	}
	
	button {
		background-color: rgb(26, 188, 156);
		color: white;
		text-align: center;
		font-size: 1.7rem;
		padding: 0.7rem 1.5rem;
		background-color: rgb(26, 188, 156);
		border-radius: 20px; /* 둥근 모서리 크기 */
		border: none; /* 외각선 제거 */
		margin: 0 auto;
	}
	button.search-button {
        padding: 0.3rem 0.5rem; /* 패딩값 조정 */
        font-size: 1rem; /* 폰트 크기 조정 */
        border-radius: 10px; /* 둥근 모서리 크기 */
    }
	
	body{font-family: 'Noto Sans KR', sans-serif;}
	.marginLeft{margin-Left: 310px;}
	.matchingNo{display:none;}
	.jibsaNo{display:none;}
</style>
</head>
<body>
<%@ include file="../common/top.jsp" %>
<div class="marginLeft">
	<div class="container">
	  
		<br><br><br>
		<h1>이용 후기</h1>
		
	
	<div class="container">
	<select name="sortBy" id="sort">>
	  <option selected>---------------------------</option>
	  <option value="1">평점 높은 순으로 보기</option>
	  <option value="2">조회수 많은 순으로 보기</option>
	  <option value="3">이름 순으로 보기</option>
	</select>
	</div>
	  
	<div class="container text-left">
	  <div class="row">
	  <article id="reviewList">
		<c:forEach items="${ list }" var="n">
		  	<div class="col" style="cursor: pointer;">
		    	<div class="review">
					<div class="profile">
						 <img src="resources/image/profile.png"> 
						 <div class="userName">${ n.memberName }</div>
					</div>
					<div class="info">
					    <div class="jibsaName">${ n.jibsaName }</div>
					    <div class="reviewContent">${ n.reviewContent }</div>
					  	<div class="jibsaNo">${ n.jibsaNo }</div>
					  	<div class="matchingNo">${ n.matchingNo }</div>
					</div>
				</div>
			</div>	
		</c:forEach>
	 	</article>
	  	</div>
	  </div>
	</div>
	</div>
	
	  <div class="row">
			<div class="pagingArea" align="center">
		<!-- 		이전 버튼-->
				<c:url value="${loc}" var="blistBack">
				  <c:param name="sortBy" value="${sortBy}" />
				  <c:param name="page" value="${pi.currentPage - 1}" />
				  <c:if test="${condition != null}">
				    <c:param name="condition" value="${condition}" />
				    <c:param name="value" value="${value}" />
				  </c:if>
				</c:url>
				<a href="${blistBack}">[이전]</a>

		<!-- 		숫자 버튼-->
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					  <c:url value="${loc}" var="blistNum">
					    <c:param name="sortBy" value="${sortBy}" />
					    <c:param name="page" value="${p}" />
					    <c:if test="${condition != null}">
					      <c:param name="condition" value="${condition}" />
					      <c:param name="value" value="${value}" />
					    </c:if>
					  </c:url>
					  <a href="${blistNum}">${p}</a>
					</c:forEach>

		
		
		
		<!-- 		다음 버튼-->
			<c:url value="${loc}" var="blistNext">
			  <c:param name="sortBy" value="${sortBy}" />
			  <c:param name="page" value="${pi.currentPage + 1}" />
			  <c:if test="${condition != null}">
			    <c:param name="condition" value="${condition}" />
			    <c:param name="value" value="${value}" />
			  </c:if>
			</c:url>
			<a href="${blistNext}">[다음]</a>

			<div id="searchArea" align="center">
			  <label>검색조건</label>
				  <select id="searchCondition">
				    <option value="petsitter" <c:if test="${condition == 'petsitter'}">selected</c:if>>집사이름</option>
				    <option value="animalCategory" <c:if test="${condition == 'animalCategory'}">selected</c:if>>동물종류</option>
				  </select>
				  <input type="search" id="searchValue" value="<c:if test='${!empty value}'>${value}</c:if>">
				  <button class="search-button">검색하기</button>
				  <br><br><br>
				</div>

	  </div>
<%@ include file="../common/bottom.jsp" %>

<script>
window.onload=()=>{
	
		const searchButton = document.querySelector('.search-button');
	 	searchButton.addEventListener('click', () => {
		    const searchCondition = document.querySelector('#searchCondition').value;
		    const searchValue = document.querySelector('#searchValue').value;
		    const sortBy = document.querySelector('#sort').value;
	
		    location.href = `${contextPath}/reviewList.bo?sortBy=${sortBy}&condition=${searchCondition}&value=${searchValue}`;
		});
	
		
		const reviewContent = document.querySelector('article');
		const reviewDiv = reviewContent.querySelectorAll('.col');
		 
		for(const div of reviewDiv){
			div.addEventListener('click', ()=>{
				const mId = div.querySelector('.matchingNo').innerText;
				const userName = div.querySelector('.userName').innerText;
				location.href='${ contextPath }/review_Detail.bo?mId='+ mId + '&userName=' + userName + '&page=' + ${pi.currentPage};
			 
			}); 
		}
		const sort = document.querySelector('#sort');
		sort.addEventListener('change', () => {
			const sortBy = sort.options[sort.selectedIndex].value;
		    location.href = '${contextPath}/reviewList.bo?sortBy=' + sortBy;
		});
		
}
</script>
 </body>
</html>