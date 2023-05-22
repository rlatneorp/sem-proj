<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>workTime</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	
	<script>
		$(document).ready(function(){
			$('input.timepicker').timepicker({
	            timeFormat: 'HH:mm',
	            interval: 30,
	            startTime: '00:00',
	            dynamic: false,
	            dropdown: true,
	            scrollbar: true
	        });
		});
	</script>
	
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="mb-5">
	</div>
	
	<div class="text-center">
		<div class="card shadow mb-4 d-inline-block">
			<div class="card-body text-start p-5 mainBox">
				<div>
					<p class="fs-2 mb-5 fw-bold">마이페이지</p>
					
					<div class="container px-0 mb-5 mx-0">
						<p class="px-2 fs-5 fw-bold">나의 근무시간</p>
					</div>
					
					
					<div class="mx-0">			
						<div class="mb-1 d-inline-block text-top">
							<form method="post" action="jibsa_WorkTime_Update.js">
								<div class="container mb-3">
									<p class="mb-4 fs-6 fw-bold">근무 가능 시간</p>
									
									
									<div id="box">
										<input type="hidden" name="memberNo" value="${j.memberNo}">
										<input type="hidden" name="availableHour" value="">
										<div class="d-flex d-inline-block align-items-center justify-content-start">
											<label class="d-flex d-inline-block">월요일</label>
											<input type="checkbox" name="workDay" class="ms-1 me-4 checkBox d-flex" style="width: 19px; height: 19px;">
											<label class="d-flex d-inline-block me-1">시작시간</label>
											<input name="startTime" class="timepicker text-center col-3 d-flex rounded card me-2" value="${sArr[1]}">
											<label class="d-flex d-inline-block me-1">종료시간</label>
											<input name="endTime" class="timepicker text-center col-3 d-flex rounded card" value="${eArr[1]}">
										</div>
										<div class="d-flex d-inline-block align-items-center justify-content-start">
											<label class="d-flex d-inline-block">화요일</label>
											<input type="checkbox" name="workDay" class="ms-1 me-4 checkBox d-flex" style="width: 19px; height: 19px;">
											<label class="d-flex d-inline-block me-1">시작시간</label>
											<input name="startTime" class="timepicker text-center col-3 d-flex rounded card me-2" value="${sArr[2]}">
											<label class="d-flex d-inline-block me-1">종료시간</label>
											<input name="endTime" class="timepicker text-center col-3 d-flex rounded card" value="${eArr[2]}">
										</div>
										<div class="d-flex d-inline-block align-items-center justify-content-start">
											<label class="d-flex d-inline-block">수요일</label>
											<input type="checkbox" name="workDay" class="ms-1 me-4 checkBox d-flex" style="width: 19px; height: 19px;">
											<label class="d-flex d-inline-block me-1">시작시간</label>
											<input name="startTime" class="timepicker text-center col-3 d-flex rounded card me-2" value="${sArr[3]}">
											<label class="d-flex d-inline-block me-1">종료시간</label>
											<input name="endTime" class="timepicker text-center col-3 d-flex rounded card" value="${eArr[3]}">
										</div>
										<div class="d-flex d-inline-block align-items-center justify-content-start">
											<label class="d-flex d-inline-block">목요일</label>
											<input type="checkbox" name="workDay" class="ms-1 me-4 checkBox d-flex" style="width: 19px; height: 19px;">
											<label class="d-flex d-inline-block me-1">시작시간</label>
											<input name="startTime" class="timepicker text-center col-3 d-flex rounded card me-2" value="${sArr[4]}">
											<label class="d-flex d-inline-block me-1">종료시간</label>
											<input name="endTime" class="timepicker text-center col-3 d-flex rounded card" value="${eArr[4]}">
										</div>
										<div class="d-flex d-inline-block align-items-center justify-content-start">
											<label class="d-flex d-inline-block">금요일</label>
											<input type="checkbox" name="workDay" class="ms-1 me-4 checkBox d-flex" style="width: 19px; height: 19px;">
											<label class="d-flex d-inline-block me-1">시작시간</label>
											<input name="startTime" class="timepicker text-center col-3 d-flex rounded card me-2" value="${sArr[5]}">
											<label class="d-flex d-inline-block me-1">종료시간</label>
											<input name="endTime" class="timepicker text-center col-3 d-flex rounded card" value="${eArr[5]}">
										</div>
										<div class="d-flex d-inline-block align-items-center justify-content-start">
											<label class="d-flex d-inline-block">토요일</label>
											<input type="checkbox" name="workDay" class="ms-1 me-4 checkBox d-flex" style="width: 19px; height: 19px;">
											<label class="d-flex d-inline-block me-1">시작시간</label>
											<input name="startTime" class="timepicker text-center col-3 d-flex rounded card me-2" value="${sArr[6]}">
											<label class="d-flex d-inline-block me-1">종료시간</label>
											<input name="endTime" class="timepicker text-center col-3 d-flex rounded card" value="${eArr[6]}">
										</div>
										<div class="d-flex d-inline-block align-items-center justify-content-start">
											<label class="d-flex d-inline-block">일요일</label>
											<input type="checkbox" name="workDay" class="ms-1 me-4 checkBox d-flex" style="width: 19px; height: 19px;">
											<label class="d-flex d-inline-block me-1">시작시간</label>
											<input name="startTime" class="timepicker text-center col-3 d-flex rounded card me-2" value="${sArr[0]}">
											<label class="d-flex d-inline-block me-1">종료시간</label>
											<input name="endTime" class="timepicker text-center col-3 d-flex rounded card" value="${eArr[0]}">
										</div>
										<br><br>
									</div>
								</div>
								
								
								<div class="container text-center">
									<button type="button" onclick="inputTime()" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">등록하기</button>
									<button type="button" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;" onclick="location.href='${contextPath}/jibsa_Main.js'">뒤로가기</button>
								</div>
								
							</form>
						</div>
					</div>
				</div>
		    </div>
		</div>
	</div>
	
	<script>
			
		
// 		근무 가능 시간 관련 데이터

//		페이지 열릴 때 데이터		
		window.onload = () =>{
			const workDays = document.getElementsByName('workDay');
			const startTimes = document.getElementsByName('startTime');
			const endTimes = document.getElementsByName('endTime');

			for(let i = 0; i < 7; i++){
				if(startTimes[i].value != "00:00" || endTimes[i].value != "00:00"){
					workDays[i].checked = true;
				}else{
					workDays[i].checked = false;
				}
			}
		}

		function inputTime(){
			const workDays = document.getElementsByName('workDay');
			const startTimes = document.getElementsByName('startTime');
			const endTimes = document.getElementsByName('endTime');
			
			let t = document.getElementsByName('availableHour')[0];
			
// 			일요일 정보 - 0번째 순서로 입력 후 for문(월~토)
			if(workDays[6].checked){
				t.value = startTimes[6].value.substring(0,2)+startTimes[6].value.substring(3,5);
				t.value += endTimes[6].value.substring(0,2)+endTimes[6].value.substring(3,5);
			}else{
				t.value = "00000000";
			}
			
			for(let i = 0; i < 6; i++){
				
				if(t.value != ""){
					t.value += ","
				}
				
				if(workDays[i].checked){
					t.value += startTimes[i].value.substring(0,2)+startTimes[i].value.substring(3,5);
					t.value += endTimes[i].value.substring(0,2)+endTimes[i].value.substring(3,5);
				}else{
					t.value += "00000000";
				}
			}
			
			document.getElementsByTagName('form')[0].submit();
		}
	</script>
	
</body>
</html>