<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>집사와 훈련사 조회 페이지</title>
	<style>
		
		.container {
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		}
		
		.filter {
		  display: flex;
		  flex-wrap: wrap;
		  justify-content: flex-end;
		  align-items: center;
		  width: 100%;
		  margin-bottom: 20px;
		}
		
		.filter-group {
			display: flex;
			align-items: center;
			margin-bottom: 10px;
		}
		
		.filter button, #sort-select {
		  margin-right: 10px;
		}
		
		.filter button {
	    background-color: rgb(26, 188, 156);
	    color: white;
	    border: none;
	    padding: 10px 20px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	    border-radius: 10px;
	  }
		
		.profiles {
		  display: grid;
		  grid-template-columns: repeat(3, 1fr);
		  grid-gap: 20px;
		  justify-items: center;
		  align-items: center;
		}
		
		.profile {
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  width: 250px;
		  padding: 10px;
		  border: 2px solid #ddd;
		  border-radius: 15px;
		}
		
		.profile img {
		  width: 100%;
		  height : 100%;
		  max-width: 200px;
		  max-height: 200px;
		  object-fit: cover;
		  object-position: center;
		  border-radius: 50%;
		}
		
		.profile p.name {
		  font-weight: bold;
		  font-size: 20px;
		  margin-bottom: 5px;
		}
		
		.profile .info {
		  display: flex;
		  flex-direction: column;
		  align-items: flex-start;
		  width: 100%;
		}
		
		.profile .info p {
		  margin: 5px 0;
		}
		
		.title::before {
	    content: "●";
	    font-size: 10px;
	    margin-right: 10px;
		}
		
	</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	<div class="container">
		<br><br><br>
		<h1>훈련사 / 집사 lIST</h1>
		<br>
		<h5>집사나라의 파트너를 소개합니다!</h5>
		<br>
	</div>
	
	<div class="container mb-5">
		<div class="filter">
			<div class="filter-group">
				<button id="trainer-btn">훈련사</button>
				<button id="butler-btn">집사</button>
			</div>
			<div class="filter-group">
				<select id="sort-select">
			   		<option value="price-low">금액 낮은 순</option>
			   		<option value="reviews-high">후기 많은 순</option>
			 	</select>
			</div>
		</div>
		<div class="profiles">
	  		<div class="profile">
	    		<img src="${ contextPath }/resources/image/logo.png">
	    		<p class="name">댕통령집사님</p>
	    		<div class="info">
		      		<p class="e title local">활동 지역 : 서울시 강동구</p>
		      		<p class="e title pay">시간당 금액 : 12,000</p>
		      		<p class="e title career">경력사항 : </p>
		      		<p class="e title reviews">후기 : 30개</p>
		    	</div>
			</div>
			<div class="profile">
		    	<img src="${ contextPath }/resources/image/logo.png">
		    	<p class="name">댕통령집사님</p>
		   	 	<div class="info">
					<p class="e title local">활동 지역 : 서울시 강동구</p>
					<p class="e title pay">시간당 금액 : 12,000</p>
					<p class="e title career">경력사항 : </p>
					<p class="e title reviews">후기 : 30개</p>
	    		</div>
	  		</div>
		  	<div class="profile">
		    	<img src="${ contextPath }/resources/image/logo.png">
	    		<p class="name">댕통령집사님</p>
			    <div class="info">
			      	<p class="e title local">활동 지역 : 서울시 강동구</p>
			      	<p class="e title pay">시간당 금액 : 12,000</p>
			      	<p class="e title career">경력사항 : </p>
			      	<p class="e title reviews">후기 : 30개</p>
			    </div>
		  	</div>
		  	<div class="profile">
		    	<img src="${ contextPath }/resources/image/logo.png">
		    	<p class="name">댕통령집사님</p>
			    <div class="info">
			      	<p class="e title local">활동 지역 : 서울시 강동구</p>
			      	<p class="e title pay">시간당 금액 : 12,000</p>
		      		<p class="e title career">경력사항 : </p>
		 			<p class="e title reviews">후기 : 30개</p>
			    </div>
		  	</div>
		  	<div class="profile">
			    <img src="${ contextPath }/resources/image/logo.png">
			    <p class="name">댕통령집사님</p>
			    <div class="info">
			      	<p class="e title local">활동 지역 : 서울시 강동구</p>
			      	<p class="e title pay">시간당 금액 : 12,000</p>
			      	<p class="e title career">경력사항 : </p>
			      	<p class="e title reviews">후기 : 30개</p>
			    </div>
		  	</div>
		  	<div class="profile">
			    <img src="${ contextPath }/resources/image/logo.png">
			    <p class="name">댕통령집사님</p>
			    <div class="info">
			      	<p class="e title local">활동 지역 : 서울시 강동구</p>
			      	<p class="e title pay">시간당 금액 : 12,000</p>
			      	<p class="e title career">경력사항 : </p>
			      	<p class="e title reviews">후기 : 30개</p>
			    </div>
		  	</div>
		</div>
	</div>
	
	
	
	<%@ include file="../common/bottom.jsp"%>
</body>
