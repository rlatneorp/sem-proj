<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap"  rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
	  display:inline-block;
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
	
	
	#starRating{
	  font-variation-settings:
	  'FILL' 1,
	  'wght' 700,
	  'GRAD' 200,
	  'opsz' 48;
	 color: rgb(98, 182, 183);
	 font-size: 30px;  
	}
	.star{
	 vertical-align: top; display:inline-block;
	}
	.pagingBtnBefore{
	 color: gray;
	}
	.pagingBtnAfter{
	 color: black;
	}
	.pagingBtnNum{
	 color:rgb(98, 182, 183);
	}
	
	#searchCondition{
	color: black;
	}
</style>
</head>
<body>
<%@ include file="../common/top.jsp" %>
<div class="marginLeft">
	<div class="container">
	  
		<br><br><br>
		<h1 style="text-align: center; margin-left: -300px;">이용 후기</h1><br>
		<h5 style="text-align: center; margin-left: -300px;">집사나라 서비스를 이용한 고객분들의 이용후기 입니다</h5>
		<br><br><br>
	<div class="container text-left">
	  <div class="row">
	  <article id="reviewList">
		<c:forEach items="${ list }" var="n" varStatus="st">
		  	<div class="col" style="cursor: pointer;">
		    	<div class="review">
					<div class="profile">
						<c:if test="${empty imgList[st.index]}">
							<img src="resources/image/logo.png"> 
						</c:if>
						<c:if test="${!empty imgList[st.index]}">
							<img src="resources/uploadFiles/${imgList[st.index].renameName}"> 
						</c:if>
						 <div class="userName">${ n.memberName }</div>
					</div>
					<div class="info">
					    <div class="jibsaName">${ n.jibsaName } 집사</div><br>
					  	<div class="star">
						  	<c:forEach begin="1" end="${n.reviewRating}">
						  	<span class="material-symbols-outlined" id="starRating" style="font-size: 30px;">star</span>
						  	</c:forEach>
						</div>
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
	<br><br>
	  <div class="row">
			<div class="pagingArea" align="center">
		<!-- 		이전 버튼 -->
				<c:url value="${loc}" var="blistBack">
				  <c:param name="sortBy" value="${sortBy}" />
				  <c:param name="page" value="${pi.currentPage - 1}" />
				  <c:if test="${condition != null}">
				    <c:param name="condition" value="${condition}" />
				    <c:param name="value" value="${value}" />
				  </c:if>
				</c:url>
				<a href="${blistBack}" class="pagingBtnBefore">[이전]</a>

		<!-- 		숫자 버튼 -->
					<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
					  <c:url value="${loc}" var="blistNum">
					    <c:param name="sortBy" value="${sortBy}" />
					    <c:param name="page" value="${p}" />
					    <c:if test="${condition != null}">
					      <c:param name="condition" value="${condition}" />
					      <c:param name="value" value="${value}" />
					    </c:if>
					  </c:url>
					  <a href="${blistNum}" class="pagingBtnNum">${p}</a>
					</c:forEach>

		<!-- 		다음 버튼 -->
			<c:url value="${loc}" var="blistNext">
			  <c:param name="sortBy" value="${sortBy}" />
			  <c:param name="page" value="${pi.currentPage + 1}" />
			  <c:if test="${condition != null}">
			    <c:param name="condition" value="${condition}" />
			    <c:param name="value" value="${value}" />
			  </c:if>
			</c:url>
			<a href="${blistNext}" class="pagingBtnAfter">[다음]</a>

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
			</div>
<%@ include file="../common/bottom.jsp" %>

<script>
window.onload=()=>{
	
		const searchButton = document.querySelector('.search-button');
	 	searchButton.addEventListener('click', () => {
		    const condition = document.querySelector('#searchCondition').value;
		    const value = document.querySelector('#searchValue').value;
		    	location.href = '${contextPath}/search.bo?condition='+condition+ '&value=' +value;
			
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
			const condition = document.querySelector('#searchCondition').value;
		    const value = document.querySelector('#searchValue').value;
		    	location.href = '${contextPath}/reviewList.bo?sortBy=' + sortBy;
		    
		});
		
}
</script>
 </body>
</html>