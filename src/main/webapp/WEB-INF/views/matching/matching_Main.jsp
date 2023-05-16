<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- timepicker 관련 링크-->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<style >

	input[type=radio]:checked {
	  background-color: rgb(26, 188, 156);
	}
	button.look-button {
		background-color: rgb(26, 188, 156);
		color: white;
		text-align: center;
		font-size: 1.2rem;
		padding: 0.5rem 1.5rem;
		background-color: rgb(26, 188, 156);
		border-radius: 20px; /* 둥근 모서리 크기 */
		border: none; /* 외각선 제거 */
		margin: 0 auto;
	}
	button.search-button {
		background-color: rgb(26, 188, 156);
		color: white;
		border: none;
		text-align: center;
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
	<%@ include file="../common/top.jsp" %>
	<div class="container ">
	  
		<br><br><br>
		<h1>집사 매칭</h1>
		<br>
		<h5>우리 가족에게 딱 맞는 집사를 찾아보세요!</h5>
		<br>
	
	</div>
	<form method="get" action="${contextPath}/matching_Result.mc">
	<div class="container text-left">
	  <div class="row">
	    <div class="col row">
		      <h4>희망 이용 시간</h4>
				<label for="date" class="col-3">날짜:</label>
				<input type="date" name="startDay" class="date col-5">
				<div class="col-4"></div>
				<br>
				<label for="time" class="col-3">시간:</label>
	          	<input class="timepicker text-center d-flex rounded card time col-5" style="height:30px;" name="startTime" value="00:00">
				<div class="col-4"></div>
		      <br><br>
		      <h4>희망 종료 시간</h4>
				<label for="date" class="col-3">날짜:</label>
				<input type="date" name="endDay" class="date col-5">
				<div class="col-4"></div>
				<br>
				<label for="time" class="col-3">시간:</label>
	          	<input class="timepicker text-center d-flex rounded card time col-5" style="height:30px;" name="endTime" value="00:00">
				<div class="col-4"></div>
		      <br><br>
	    </div>
	    <div class="col">
	      <h4>매칭을 원하는 동물</h4>
	      <input class="form-check-input" type="radio" name="animalKind" id="exampleRadios1" value="강아지" >
	      <label class="form-check-label" for="exampleRadios1">강아지</label><br>
	      
	      <input class="form-check-input" type="radio" name="animalKind" id="exampleRadios2" value="고양이">
		  <label class="form-check-label" for="exampleRadios2">고양이</label><br>
		  
		  <input class="form-check-input" type="radio" name="animalKind" id="exampleRadios3" value="기타">
		  <label class="form-check-label" for="exampleRadios3">기타</label><br><br><br>
		  
	      <h4>원하는 서비스</h4>
			<select name="serviceType">
			<option value="care">방문 돌봄</option>
			<option value="training">방문 훈련</option>
			</select>
	      
	    </div>
	    <div class="col">
	      <h4>원하는 집사님 성별</h4>
	      <input class="form-check-input" type="radio" name="wantJibsaGender" id="male" value="M" >
	      <label class="form-check-label" for="male">
	          남성
	      </label><br>
	      <input class="form-check-input" type="radio" name="wantJibsaGender" id="female" value="F">
		  <label class="form-check-label" for="female">
		      여성
		  </label><br><br>
	      <h4>매칭할 지역</h4>
	      <div class="search-container">
			<input type="text" placeholder="지역을 입력하세요" name="wantMatchingPlace">
			<button class="search-button" type="button">검색</button>
			</div>
	      
	      <br><br>
			  <div class="d-flex justify-content-center">
			    <button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">찾아보기</button>
			  </div>
	    </div>
	  </div>
	</div>
	</form>
	
	
	<script>
		$('.timepicker').timepicker({
			timeFormat: 'HH:mm',
		    interval: 30,
		    minTime: '0',
		    maxTime: '23:30',
	//		    defaultTime: '${ex}',
		    startTime: '00:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
		
	</script>
	
	
</body>
</html>