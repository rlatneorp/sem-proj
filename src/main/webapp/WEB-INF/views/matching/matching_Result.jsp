<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<style>
	.profile {
	  display: flex;
	  align-items: center;
	  justify-content: space-between;
	  position: relative;
	}
	
	.profile img {
	  width: 100px;
	  height: 100px;
	  object-fit: cover;
	  margin-right: 20px;
	}
	
	.profile h2 {
	  font-size: 1.5rem;
	  font-weight: bold;
	  margin-bottom: 0; /* margin-bottom 제거 */
	}
	
	.profile p {
	  font-size: 1rem;
	  margin-bottom: 10px;
	}
	
	.profile .info {
	  display: flex;
	  flex-direction: column;
	  justify-content: center;
	  position: absolute;
	  left: 120px;
	  top: 0;
	  bottom: 0;
	  margin-left: 30px;
	}
	
	.profile .button {
	  background-color: rgb(26, 188, 156);
	  color: white;
	  border: none;
	  border-radius: 20px;
	  font-size: 1rem;
	  padding: 10px 20px;
	  position: absolute;
	  right: 0; /* 버튼 오른쪽에 위치시키기 */
	  bottom: 0;
	}

	
	.row.parent {
 		 padding: 10px;
	}
	.row {
			border: 0.5px solid rgb(26, 188, 156);
			padding: 40px;
			margin: 30px;
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
	
	<div class="container">
	<select>
	  <option selected>평점순으로 보기</option>
	  <option value="1">후기 많은 순으로 보기</option>
	  <option value="2">이름 순으로 보기</option>
	</select>
	</div>
	
	<div class="container text-left">
	
		<c:forEach items="${jpList}" var="j">
		  <div class="row">
		    <div class="profile">
			  <img src="${contextPath}/resources/image/logo.png">
			  <div class="info">
			    <h2>${j.jibsaName}</h2>
			    <p>${j.profileTitle}<br>
			    	나이 : 아직모름 <br>
			    	지원 동기 : 추가해야함<br>
			    	평점 : ${j.jibsaAvgRating}
			    </p>
			  </div>
			  <button onclick="location.href='${contextPath}/matching_Success.mc?jNo=${j.memberNo}'">매칭하기</button>
			</div>
		  </div>
		</c:forEach>
	
		<div class="container text-center">
			<br><br>
			<h4>마음에 드는 집사가 없다면</h4>
			<br>
			<button onclick="location.href='${contextPath}/matching_Main.mc'">다시 찾아보기</button>
			<br><br><br><br>
		
		</div>
	</div>
</body>
</html>