<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>workTime</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,500,0,0" />
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="mb-5">
	</div>
	
	<div class="text-center">
		<div class="card shadow mb-4 mainBox">
			<div class="card-body text-start p-5">
				<div>
					<p class="fs-2 mb-5 fw-bold">마이페이지</p>
					
					<div class="container px-0 mb-5 mx-0">
						<p class="px-2 fs-5 fw-bold">스케줄 변경</p>
					</div>
					
					<div class="container px-2 mb-5 mx-0">
						<c:if test="${empty image}">
							<img src="${contextPath}/resources/image/logo.png" alt="로딩실패" width="72" height="72" class="rounded-circle image-block me-2">
						</c:if>
						<c:if test="${!empty image}">
							<img src="${contextPath}/resources/uploadFiles/${image.renameName}" alt="로딩실패" width="48" height="48" class="rounded-circle image-block me-2">
						</c:if>
						<div class="d-inline-block align-middle">
							<div class="row">
								<span class="fs-5 fw-bold">${mc.memberName}</span>
								<span class="fs-6">${mc.animalName} - ${mc.animalKind}</span>
							</div>
						</div>
					</div>
					
					
					<div class="mb-1 text-top">
						<form method="post" action="${ contextPath }/jibsa_Schedule_Update.js">
							<input type="hidden" name="matchingNo" value="${mc.matchingNo}">
							<div class="container mb-3">
								<p class="mb-4 fs-5 fw-bold">일정 변경하기</p>
								
								<div class="shadow w-100 card px-4 py-3 text-center mb-3">
									<span class="fs-5">
										${fn:substring(mc.startDate,0,10)} ${fn:substring(mc.startDate,11,13)}:${fn:substring(mc.startDate,13,15)}
										~ ${fn:substring(mc.endDate,11,13)}:${fn:substring(mc.endDate,13,15)}
									</span>
								</div>
								<div class="mb-3 text-center">
									<span class="material-symbols-rounded m-color opacity-50" style="font-size: 60px;">arrow_circle_down</span>
								</div>
								
								
								<div class="shadow rounded-3 px-3 py-5 text-center mb-5 row" style="border: 1px solid rgba(0,0,0,0.2);">
									
									<h5>시작 시간</h5>
									<div class="col-2"></div>
									<label for="date" class="col-3">날짜:</label>
									<input type="date" class="date col-4 rounded" style="height:30px;" required value="${fn:substring(mc.startDate,0,10) }">
									<input type="hidden" name="startDate">
									<div class="col-3"></div>
									<div class="col-3"></div>
									<div class="col-9 errorBox px-0 text-start"></div>
									<br>
									
									<div class="col-2"></div>
									<label for="time" class="col-3">시간:</label>
							       	<input class="timepicker text-center d-flex rounded card time col-4" style="height:30px;" name="startTime" value="${fn:substring(mc.startDate,11,13)}:${fn:substring(mc.startDate,13,15)}">
									<div class="col-3"></div>
									<div class="col-3"></div>
									<div class="col-9 errorBox px-0 text-start"></div>
								    <br><br>
								    
								    <h5>종료 시간</h5>
									<div class="col-2"></div>
									<label for="date" class="col-3">날짜:</label>
									<input type="date" class="date col-4 rounded" style="height:30px;" readonly value="${fn:substring(mc.endDate,0,10)}">
									<input type="hidden" name="endDate">
									<div class="col-3"></div>
									<div class="col-5"></div>
									<div class="col-12"></div>
									<br>
									
									<div class="col-2"></div>
									<label for="time" class="col-3">시간:</label>
									<input class="timepicker text-center d-flex rounded card time col-4" style="height:30px;" name="endTime" value="${fn:substring(mc.endDate,11,13)}:${fn:substring(mc.endDate,13,15)}">
									<div class="col-3"></div>
									<div class="col-3"></div>
									<div class="col-9 errorBox px-0 text-start"></div>
									<div class="col-3"></div>
									<div class="col-9 errorBox px-0 text-start"></div>

								</div>
							</div>
							
							
							<div class="container text-center">
								<button type="button" onclick="formSubmit()" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 120px; height: 40px;">변경요청하기</button>
								<button onclick="location.href='${contextPath}/jibsa_Manage_Schedule.js'" type="button" class="cancelModal shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 120px; height: 40px;">뒤로가기</button>
							</div>
						</form>
						
					</div>
			    </div>
			</div>
		</div>
	</div>
	
		
	<script>
		$(document).ready(function(){
			$( "#datepicker" ).datepicker();

			$('input.timepicker').timepicker({
	            timeFormat: 'HH:mm',
	            interval: 30,
	            startTime: '00:00',
	            dynamic: false,
	            dropdown: true,
	            scrollbar: true
	        });
		});
		
		window.onload = () =>{
			const dates = document.getElementsByClassName('date');
			const times = document.getElementsByClassName('time');
			const d = new Date(Date.now());
			const eBoxs = document.getElementsByClassName('errorBox');
			
			
// 			날짜선택 input: blur이벤트 추가
			dates[0].addEventListener('blur', dateBlur);
			
			function dateBlur(){
				setTimeout(() => {
					const dv = new Date(dates[0].value);
					let sDay = (dv.getFullYear())*10000 + (dv.getMonth()+1)*100 + (dv.getDate());
					
					let today = (d.getFullYear())*10000 + (d.getMonth()+1)*100 + (d.getDate());
					
					if(sDay <= today){
						eBoxs[0].innerText = "날짜는 내일날짜부터 선택가능합니다.";
						eBoxs[0].style.display = "block";
						eBoxs[0].style.color = "red";
					}else{
						eBoxs[0].innerText = "";
// 						eBoxs[0].style.display = "none";
					}
					
					dates[1].value = dates[0].value;	
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
						eBoxs[1].innerHTML = "시간은 30분단위로 선택가능합니다.";
						eBoxs[1].style.display = "block";
						eBoxs[1].style.color = "red";
					}else{
						eBoxs[1].innerText = "";
					}
					if(eT % 100 != 30 && eT % 100 != 0){
						eBoxs[2].innerHTML = "시간은 30분단위로 선택가능합니다.";
						eBoxs[2].style.display = "block";
						eBoxs[2].style.color = "red";
					}else{
						eBoxs[2].innerText = "";
					}
					
// 					내용 오류시 오류박스 내용설정 (종료시간 > 시작시간)
					if(sT >= eT){
						eBoxs[3].innerHTML = "종료시간값은 시작시간보다 커야합니다.";
						eBoxs[3].style.color = "red";
						eBoxs[3].style.display = "block";
					}else{
						eBoxs[3].innerText = "";
						eBoxs[3].style.display = "none";
					}
				}, 100);
			}

		}
		
		function formSubmit(){
			const dates = document.getElementsByClassName('date');
			const times = document.getElementsByClassName('time');
			
			const startDate = document.getElementsByName('startDate')[0];
			const startTime = document.getElementsByName('startTime')[0];
			const endDate = document.getElementsByName('endDate')[0];
			const endTime = document.getElementsByName('endTime')[0];
			
			const eBoxs = document.getElementsByClassName('errorBox');
			
// 			날짜 데이터 검토
			if(eBoxs[0].innerText == ""){
//	 			시간 데이터 검토
				if(eBoxs[1].innerText == "" && eBoxs[2].innerText == "" && eBoxs[3].innerText == ""){
//						값을 대입하고, form을 submit()하는 함수 실행
					inputTime();
				}m
			}
			
//			값을 대입하고, form을 submit()하는 함수
			function inputTime(){
//				시작날짜값 대입
				startDate.value = dates[0].value;
//				시작요일값 대입
				startDate.value += new Date(dates[0].value).getDay();
//				시작시간값 대입
				startDate.value += times[0].value.substring(0,2) + times[0].value.substring(3,5);
						
//				종료날짜값 대입
				endDate.value = dates[1].value;
//				종료요일값 대입
				endDate.value += new Date(dates[1].value).getDay();
//				종료시간값 대입
				endDate.value += times[1].value.substring(0,2) + times[1].value.substring(3,5);
				
				console.log("폼 넘긴다!");
				document.getElementsByTagName('form')[0].submit();
			}
		}
		
	</script>
	
</body>
</html>