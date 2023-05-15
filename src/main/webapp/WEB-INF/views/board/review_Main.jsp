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
	
	.review h2 {
	  font-size: 1.5rem;
	  font-weight: bold;
	  margin-bottom: 0; /* margin-bottom 제거 */
	  margin-left:20px;
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
 	
 	.username {
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
</style>
</head>
<body>
<%@ include file="../common/top.jsp" %>

	<div class="container-xxl">
	  
		<br><br><br>
		<h1>이용 후기</h1>
		
	
	<div class="container">
	<select>
	  <option selected>평점순으로 보기</option>
	  <option value="1">후기 많은 순으로 보기</option>
	  <option value="2">이름 순으로 보기</option>
	</select>
	</div>
	  
	<div class="container text-left" >
	  <div class="row">
	  <article>
		<c:forEach items="${ list }" var="n">
		  	<div class="col">
			    <div class="review">
				  <div class="profile">
					  <img src="resources/image/profile.png">
					  	<div class="username">${ n.memberName }</div>
					  	<div class="matchingNo">${ n.matchingNo }</div>
					  </div>
					  <div class="info">
					    <h2>${ n.jibsaName }</h2>
					    <a class="reviewContent" href="${ contextPath }/review_Detail.bo">${ n.reviewContent }</a>
					  </div>
					</div>
				</div>	
			</c:forEach>
	 	</article>
	  	</div>
	  </div>
	</div>
	
	  <div class="row">
		  				
			<div class="pagingArea" align="center">
		<!-- 		이전 버튼-->
					<br>
					<c:if test="${ pi.currentPage <= 1 }">
						<span class = 'disable'>[이전]</span>
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url value = "${loc }" var="blistBack">
							<c:param name="page" value="${ pi.currentPage -1 }"/>
							<c:if test="${ condition != null}">
								<c:param name = "condition" value = "${condition}"/>
								<c:param name = "value" value = "${value}"/>
							</c:if>
						</c:url>
						<a href="${ blistBack }">[이전]</a>
					</c:if>
		<!-- 		숫자 버튼-->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color ="red" size = "4"><b>[${p }]</b></font>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url value="${loc }" var="blistNum">
							
								<c:param name="page" value="${ p }"/>
								<c:if test="${ condition != null}">
									<c:param name = "condition" value = "${condition	}"/>
									<c:param name = "value" value = "${value}"/>
								</c:if>
							</c:url>
							<a href = "${ blistNum }">${ p }</a>
						</c:if>
					</c:forEach>
		
		
		
		<!-- 		다음 버튼-->
					<c:if test="${ pi.currentPage >=  pi.maxPage }">
						<span class = 'disable'>[다음]</span>
					</c:if>
					<c:if test="${ pi.currentPage <  pi.maxPage }">
						<c:url value = "${loc }" var="blistNext">
							<c:param name="page" value="${ pi.currentPage +1}"/>
							<c:if test="${ condition != null}">
								<c:param name = "condition" value = "${condition}"/>
								<c:param name = "value" value = "${value}"/>
							</c:if>
						</c:url>
						<a href="${ blistNext }">[다음]</a>
					</c:if>
				</div>
			
			<br>
			
			<div id = "searchArea" align = "center">
			
				<label>검색조건</label>
				<select >
					<option value ="petsitter"<c:if test="${condition == 'petsitter' }">selected</c:if>>집사이름</option>
					<option value="animalCategory"<c:if test="${condition == 'animalCategory' }">selected</c:if>>동물종류</option>
					
				</select>
				<input  type="search" value = "<c:if test='${!empty value }'>${ value }</c:if>">
				<button class="search-button">검색하기</button>
				<br><br><br>
			</div>	
			
	
	  </div>
<%@ include file="../common/bottom.jsp" %>

<script>
	window.onload=()=>{
		document.getElementById('searchArea').querySelector('button').addEventListener('click', function(){
		const value = this.previousElementSibling.value;
		const condition = this.previousElementSibling.previousElementSibling.value;
		
		location.href = '${contextPath}/search.bo?value='+value+'&condition='+condition;
		});		
		
		const reviewContent = document.querySelector('article');
		const reviewDiv = reviewContent.querySelectorAll('div');
		for(const divs of reviewDiv){
			divs.addEventListener('click', function(){
				const div = this;
				const mId = div[5].innerText;
				const writer = div[4].innerText;
				 
				location.href='${ contextPath }/review_Detail.bo?mId='+ mId + '&writer=' + writer + '&page=' + ${pi.currentPage}; 
			});
		}
	}

</script>
 </body>
</html>