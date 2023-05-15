<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap"  rel="stylesheet">
<title>집사 상세후기</title>
<style>
	body {font-family: 'Noto Sans KR', sans-serif;}
	.container:nth-of-type(3) {
	  display: flex;
	  align-items: center;
	}
	
	
	.col:nth-child(2) {
	  width: 70%;
	}
	
	.review {
	  display: flex;
	  align-items: flex-start;
	  justify-content: space-between;
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
	  margin-left:20px;
	}
	
	.review p {
	  font-size: 1rem;
	  margin-bottom: 10px;
	  margin-top: 20px;
	  margin-left:20px;
	}
	
	.review .info {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  text-align: center;
	  margin-left: 20px;
	  width: 60%;
	}
	
	.row {
		border: 0.5px solid rgb(26, 188, 156);
		padding: 18px;
		margin: 10px;
		border-radius: 30px;
	}
	
	p {
	   display: -webkit-box;
	   -webkit-line-clamp: 4;
	   -webkit-box-orient: vertical;
	   overflow: hidden;
	   text-overflow: ellipsis;
	   max-height: 120px; /* line-height와 font-size를 곱한 값을 입력합니다. */
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
    
    .col:nth-child(3) .images {
	  padding-left: 60px;
	}
	
	.col:first-child .images {
	  padding-right: 1px;
	}
	
	#comment input[name="search"] {
	  width: 600px; /* 늘리고자 하는 너비 값 입력 */
	}
</style>

</head>
<body>

	<div class="container text-center">
	  <c:forEach items="list" var="r">
		<br>
		<h1>${r.jibsaName } 집사 후기</h1>
		<h5>(${r.matchingPlace } / 평균 평점 : ${r.reviewRating })</h5>
		
	
	
	<div class="container" style="display: flex; align-items: center;">
		<div class="col" style="width:50px">
			<div class="images">
           		<img src="images/arrow_back.png">
        	</div>
		</div>
		<div class="col">
			<div class="row" style="width:900px" >
			  	<div class="col">
				    <div class="review">
						  <div class="profile">
							  <img src="images/eunbee1.jpg">
							  <div class="username">${r.memberName } 회원님</div>
						  </div>
						  <div class="info">
							  <h2>${r.jibsaName } 집사</h2>
						  </div>
					</div>
				</div>
				<hr><br><br>
				<textarea cols="50" rows="10" style="resize: none;" name = "content" >
					 ${r.reviewContent }
				</textarea>
				
				<hr><br><hr><br>
				
				<h3>집사 COMMENT</h3>
				<br>
				<p>${ r.jibsaComment }</p>
				<br><hr><br>
				
				
				
				<form>
				  <div id=comment>
				    <label>댓글 : </label>
					<input type="text" placeholder="댓글을 입력해주세요" name="search" >
					<input type="submit" value = "글쓰기">
				  </div>
				</form>
			</div>
			<br>
			<div style="display: flex; align-items: center;">
				<button>모든 후기 보기</button>
			</div>
		</div>	
		
			<div class="col" style="width:50px">
				<div class="images">
	           		<img src="images/arrow_forward.png">
	        	</div>
			</div>
			</div>
		</c:forEach>
	</div>
	
	

</body>
</html>