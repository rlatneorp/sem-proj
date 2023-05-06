<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >

	input[type=radio]:checked {
	  background-color: rgb(26, 188, 156);
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
    
	.col.parent {
 		 padding: 10px;
	}
	.col {
			border: 0.5px solid rgb(26, 188, 156);
			padding: 40px;
			margin: 30px;
			border-radius: 30px;
		}
    
</style>

</head>
<body>
	<div class="container ">
	  
		<br><br><br>
		<h1>집사 매칭</h1>
		<br>
		<h5>우리 가족에게 딱 맞는 집사를 찾아보세요!</h5>
		<br>
	
	</div>
	
	<div class="container text-left">
	  <div class="row">
	    <div class="col">
	      <h4>희망 이용 시간</h4>
			<label for="date">날짜:</label>
			<input type="date" id="date" name="date">
			<br>		
			<label for="time">시간:</label>
			<input type="time" id="time" name="time">
	      <br><br>
	      <h4>희망 종료 시간</h4>
	        <label for="date">날짜:</label>
			<input type="date" id="date" name="date">
			<br>		
			<label for="time">시간:</label>
			<input type="time" id="time" name="time">
	        <br>
	    </div>
	    <div class="col">
	      <h4>매칭을 원하는 동물</h4>
	      <input class="form-check-input" type="radio" name="animalradio" id="exampleRadios1" value="강아지" >
	      <label class="form-check-label" for="exampleRadios1">
	          강아지
	      </label><br>
	      
	      <input class="form-check-input" type="radio" name="animalradio" id="exampleRadios2" value="고양이">
		  <label class="form-check-label" for="exampleRadios2">
		      고양이
		  </label><br>
		  
		  <input class="form-check-input" type="radio" name="animalradio" id="exampleRadios2" value="기타">
		  <label class="form-check-label" for="exampleRadios2">
		      기타
		  </label><br><br><br>
		  
	      <h4>원하는 서비스</h4>
			<select name="option">
			<option value="option1">방문 돌봄</option>
			<option value="option2">방문 훈련</option>
			</select>
	      
	    </div>
	    <div class="col">
	      <h4>원하는 집사님 성별</h4>
	      <input class="form-check-input" type="radio" name="genderRadios" id="male" value="남성" >
	      <label class="form-check-label" for="exampleRadios1">
	          남성
	      </label><br>
	      
	      <input class="form-check-input" type="radio" name="genderRadios" id="female" value="여성">
		  <label class="form-check-label" for="exampleRadios2">
		      여성
		  </label><br><br>
	      <h4>매칭할 지역</h4>
	      <div class="search-container">
			<form action="/search">
			<input type="text" placeholder="지역을 입력하세요" name="search">
			<button class="search-button"  type="button">검색</button>
			</form>
			</div>
	      
	      <br><br>
	      <form action="jsp/matching/matching2.jsp">
			  <div class="d-flex justify-content-center">
			    <button type="button">찾아보기</button>
			  </div>
		  </form>
	    </div>
	  </div>
	</div>
</body>
</html>