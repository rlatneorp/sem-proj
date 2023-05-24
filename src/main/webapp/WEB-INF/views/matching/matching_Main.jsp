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
    
	.colbox.parent {
 		 padding: 10px;
	}
	.colbox {
		border: 0.5px solid rgb(26, 188, 156);
		padding: 40px;
		margin: 30px;
		border-radius: 30px;
	}
	b{
		color: red;
	}
    
</style>

</head>
<body class="">
	<%@ include file="../common/top.jsp" %>
<!-- 	session에 로그인 정보 없을 때 -->
	<c:if test="${loginUser eq null}">
		<div class="container">
			<br><br><br>
			<div class="text-center">
				<h1>먼저 로그인을 해주세요!</h1>
				<br>
				<h5>매칭에는 로그인과 반려동물 등록이 필요해요!</h5>
				<br><br>
			    <button onclick="location.href='${contextPath}/loginView.do'" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">로그인</button>
			</div>
		</div>
	</c:if>
	
<!-- 	session에 로그인 정보 있고 -->
<!-- 	등록 동물이 없을 때 -->
	<c:if test="${loginUser.animalCount eq 0}">
		<div class="container">
			<br><br><br>
			<div class="text-center">
				<h1>먼저 반려동물 등록을 해주세요!</h1>
				<br>
				<h5>매칭에는 반려동물 등록이 필요해요!</h5>
				<br><br>
				<button onclick="location.href='${contextPath}/member_Pet_Insert.me'" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 120px; height: 40px;">반려동물 등록</button>
			</div>
		</div>
	</c:if>
	
<!-- 	session에 로그인 정보 있을 때 -->
	<c:if test="${loginUser ne null && loginUser.animalCount ne 0}">
		<div class="mx-auto">
			<div class="d-flex justify-content-center row">
				<div class="container text-center">
					<br><br><br>
					<h1>집사 매칭</h1>
					<br>
					<h5>우리 가족에게 딱 맞는 집사를 찾아보세요!</h5>
					<b>*</b> 필수 입력값
					<br><br>
				</div>
			</div>
		</div>
		<form method="get" action="${contextPath}/matching_Result.mc" class="d-flex justify-content-center w-100">
			<div class="container d-flex justify-content-center text-left m-0">
				<div class="row d-flex justify-content-center">
			    	<div class="col-3 row colbox mx-3">
						<h4>희망 이용 시간</h4>
							<div class="col-12 errorBox" style="display: none"></div>
							<label for="date" class="col-3">날짜:</label>
							<input type="date" class="date col-7 rounded" style="height:30px;" required>
							<input type="hidden" name="startDate">
							<div class="col-2"><b>*</b></div>
							<br>
							<div class="col-12 errorBox" style="display: none"></div>
							<label for="time" class="col-3">시간:</label>
				          	<input class="timepicker text-center d-flex rounded card time col-7" style="height:30px;" name="startTime" value="00:00">
							<div class="col-2"><b>*</b></div>
						<br><br>
						<h4>희망 종료 시간</h4>
							<label for="date" class="col-3">날짜:</label>
							<input type="date" class="date col-7 rounded" style="height:30px;" readonly>
							<input type="hidden" name="endDate">
							<div class="col-2"></div>
							<br>
							<div class="col-12 errorBox" style="display: none"></div>
							<div class="col-12 errorBox" style="display: none"></div>
							<label for="time" class="col-3">시간:</label>
				          	<input class="timepicker text-center d-flex rounded card time col-7" style="height:30px;" name="endTime" value="00:00">
							<div class="col-2"><b>*</b></div>
						<br><br>
			    	</div>
			    	<div class="col-3 row colbox mx-3">
						<h4>매칭을 원하는 동물</h4>
						<c:if test="${aList == null}"><h6>먼저 동물을 등록해주세요</h6><br><br></c:if>
						<c:if test="${aList != null}">
			      			<div class="mb-4">
								<c:forEach items="${aList}" var="a" varStatus="i">
									<c:if test="${a.isStatus eq 'Y'}">
									<div class="d-flex align-items-center" style="height: 40px;">
										<input class="d-flex form-check-input me-2 my-0" type="radio" name="animalNo" id="${a.animalNo}" value="${a.animalNo}" <c:if test="${i.index eq 0}">checked</c:if>>
										<label class="d-flex form-check-label" for="${a.animalNo}">${a.animalName}(${a.animalKind})</label>
									</div>
									</c:if>					    		
					  			</c:forEach>
				  			</div>
						</c:if>
						<div class="mb-4">
							<h4>원하는 서비스</h4>
							<select name="serviceType" class="rounded" style="height:30px;">
								<option value="방문 돌봄">방문 돌봄</option>
								<option value="방문 훈련">방문 훈련</option>
							</select>
					    </div>
				      	<div>
							<h4>원하는 집사님 성별</h4>
							<input class="form-check-input" type="radio" name="wantJibsaGender" id="male" value="M" required>
							<label class="form-check-label" for="male">남성</label><br>
							<input class="form-check-input" type="radio" name="wantJibsaGender" id="female" value="F" checked required>
							<label class="form-check-label" for="female">여성</label><br><br>
				    	</div>
				    </div>
				    <div class="col-3 row colbox mx-3">
						<div>
							<h4>매칭 지역</h4>
							<div class="search-container">
<!-- 								<input type="text" placeholder="지역을 입력하세요" name="wantMatchingPlace" class="rounded mb-4"> -->
								<select name="wantMatchingPlace" class="mb-4">
									<option>강원도</option>
									<option>경상도</option>
									<option>광주</option>
									<option>대구</option>
									<option>대전</option>
									<option>부산</option>
									<option selected>서울</option>
									<option>수도권</option>
									<option>울산</option>
									<option>전라도</option>
									<option>제주도</option>
									<option>충청도</option>
								</select>
								
								<h4>매칭 장소<b>*</b></h4>
								<div class="col-12 errorBox" style="display: none">x</div>
								<textarea placeholder="정확한 주소를 입력하세요" name="matchingPlace" rows="4" class="w-100 rounded" required></textarea>
							</div>
						</div>
						<br><br>
						<div class="d-flex justify-content-center">
							<button type="button" onclick="inputTime(this)" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">찾아보기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</c:if>
	
	
	<br><br><br><br><br><br><br>
	<hr>
	
	
	<%@ include file="../common/bottom.jsp"%>
	
	
	<script>
		window.onload = () =>{
			
// 			희망 이용/종료 시간 (날짜 / 시간) - 오늘날짜, 현재시간+1시간 으로 설정

			const dates = document.getElementsByClassName('date');
			const times = document.getElementsByClassName('time');
			const d = new Date(Date.now());
			const eBoxs = document.getElementsByClassName('errorBox');
			const matchingPlace = document.getElementsByName('matchingPlace')[0];
			
// 			로드시 날짜 설정
			let tomorrow = "";
			let nextYear = (d.getFullYear()+1)+"-0"+(parseInt(d.getMonth())+1)+"-"+(d.getDate()+1);
			for(let i = 0; i < 2; i++){
				if(d.getMonth() < 9){
					tomorrow = d.getFullYear()+"-0"+(parseInt(d.getMonth())+1)+"-"+(d.getDate()+1);
				}else{
					tomorrow = d.getFullYear()+"-"+(parseInt(d.getMonth())+1)+"-"+(d.getDate()+1);
				}
				dates[i].value = tomorrow;
			}
			
// 			로드시 시간 설정
			if(d.getHours() < 8){
				times[0].value = "0"+(d.getHours()+1)+":00"
				times[1].value = "0"+(d.getHours()+2)+":00"
			}else if(d.getHours() < 9){
				times[0].value = "0"+(d.getHours()+1)+":00"
				times[1].value = (d.getHours()+2)+":00"
			}else if(d.getHours() < 22){
				times[0].value = (d.getHours()+1)+":00"
				times[1].value = (d.getHours()+2)+":00"
			}else{
				times[0].value = "00:00"
				times[1].value = "00:00"
			}
			
// 			희망 이용 시간 최소값 (다음날)로 설정
			dates[0].setAttribute("min", tomorrow);
			
// 			희망 이용 시간 최대값 (1년뒤)로 설정
			dates[0].setAttribute("max", nextYear);

// 			희망 이용시간 '날짜' == 희망 종료시간 '날짜'  이벤트 추가
			dates[0].addEventListener('blur', function(){
				dates[1].value = dates[0].value;
			})
			
// 			날짜선택 input: blur이벤트 추가
			dates[0].addEventListener('blur', dateBlur);
// 			dates[1].addEventListener('blur', dateBlur);
			
			function dateBlur(){
				setTimeout(() => {
					const dv = new Date(dates[0].value);
					let sDay = (dv.getFullYear())*10000 + (dv.getMonth()+1)*100 + (dv.getDate());
					
					let today = (d.getFullYear())*10000 + (d.getMonth()+1)*100 + (d.getDate());
					
					if(sDay <= today){
						eBoxs[0].innerText = "날짜는 다음날부터 선택가능합니다.";
						eBoxs[0].style.display = "block";
						eBoxs[0].style.color = "red";
					}else{
						eBoxs[0].innerText = "";
						eBoxs[0].style.display = "none";
					}
						
				}, 100);
			}
			
			
// 			시간선택 input: blur이벤트 추가
			times[0].addEventListener('blur', timeBlur);
			times[1].addEventListener('blur', timeBlur);
			
			function timeBlur(){
				setTimeout(() => {
					let sT = (times[0].value.substring(0,2) + times[0].value.substring(3,5))*1;
					let eT = (times[1].value.substring(0,2) + times[1].value.substring(3,5))*1;
					
// 					내용 오류시 오류박스 내용설정 (30분단위 선택)
					if(sT % 100 != 30 && sT % 100 != 0){
						eBoxs[1].innerText = "시간은 30분단위로 선택가능합니다.";
						eBoxs[1].style.display = "block";
						eBoxs[1].style.color = "red";
					}else{
						eBoxs[1].innerText = "";
						eBoxs[1].style.display = "none";
					}
					if(eT % 100 != 30 && eT % 100 != 0){
						eBoxs[2].innerText = "시간은 30분단위로 선택가능합니다.";
						eBoxs[2].style.display = "block";
						eBoxs[2].style.color = "red";
					}else{
						eBoxs[2].innerText = "";
						eBoxs[2].style.display = "none";
					}
					
// 					내용 오류시 오류박스 내용설정 (종료시간 > 시작시간)
					if(sT >= eT){
						eBoxs[3].innerHTML = "종료시간값은 시작시간보다<br>커야합니다.";
						eBoxs[3].style.color = "red";
						eBoxs[3].style.display = "block";
					}else{
						eBoxs[3].innerText = "";
						eBoxs[3].style.display = "none";
					}
				}, 100);
			}
			
// 			매칭 장소 공란일 시 에러박스 출력
			matchingPlace.addEventListener('blur', matchingBlur);
			
			function matchingBlur(){
				setTimeout(()=>{
					if(matchingPlace.value == ""){
						eBoxs[4].innerText = "상세한 매칭 장소를 입력해주세요.";
						eBoxs[4].style.color = "red";
						eBoxs[4].style.display = "block";
					}else{
						eBoxs[4].innerText = "";
						eBoxs[4].style.display = "none";
					}
				}, 100)
			}
		}

		
// 		찾아보기 버튼 클릭 ( form submit )
// 		총 5개의 errorBox의 값이 모두 ""이면
		function inputTime(btn){
			const dates = document.getElementsByClassName('date');
			const times = document.getElementsByClassName('time');
			
			const startDate = document.getElementsByName('startDate')[0];
			const startTime = document.getElementsByName('startTime')[0];
			const endDate = document.getElementsByName('endDate')[0];
			const endTime = document.getElementsByName('endTime')[0];
			
			const eBoxs = document.getElementsByClassName('errorBox');
			
			const matchingPlace = document.getElementsByName('matchingPlace')[0];
			
			
// 			날짜 데이터 검토
			if(eBoxs[0].innerText == ""){
//	 			시간 데이터 검토
				if(eBoxs[1].innerText == "" && eBoxs[2].innerText == "" && eBoxs[3].innerText == ""){
// 					매칭장소 데이터 검토
					if(matchingPlace.value != ""){
// 						값을 대입하고, form을 submit()하는 함수 실행
						formSubmit();
					}else{
						eBoxs[4].innerText = "상세한 매칭 장소를 입력해주세요";
						eBoxs[4].style.color = "red";
						eBoxs[4].style.display = "block";
					}
				}
			}
			
// 			값을 대입하고, form을 submit()하는 함수
			function formSubmit(){
				
// 				시작날짜값 대입
				startDate.value = dates[0].value;
// 				시작요일값 대입
				startDate.value += new Date(dates[0].value).getDay();
// 				시작시간값 대입
				startDate.value += times[0].value.substring(0,2) + times[0].value.substring(3,5);
						
// 				종료날짜값 대입
				endDate.value = dates[1].value;
// 				종료요일값 대입
				endDate.value += new Date(dates[1].value).getDay();
// 				종료시간값 대입
				endDate.value += times[1].value.substring(0,2) + times[1].value.substring(3,5);
				
				document.getElementsByTagName('form')[0].submit();
			}
		}
		
	
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