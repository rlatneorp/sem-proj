<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원 정보 수정</title>

<!-- timepicker 관련 링크-->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	
	
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	<br><br>
	<form method="post" action="${contextPath}/admin_Jibsa_Update.ad">
		<div class="row d-flex mb-5 justify-content-center">
			<input type="hidden" name="page" value="${page}">
			<input type="hidden" name="memberNo" value="${j.memberNo }">
<!-- 			<div class="col-3"></div> -->
			<div class="col-4 d-flex">
				<div class="row d-flex py-3 fs-6" id="divBox">
					<p class="col-12 fs-4 mb-5 fw-bold">${j.memberName } 집사님</p>
					<p class="col-4">이름</p>
					<div class="col-8 px-0"><input type="text" name="memberName" value="${j.memberName }"></div>
					
					<p class="col-4">성별</p>
					<div class="col-8 px-0">
						<c:if test="${j.jibsaGender eq 'F'}">
							<label class="me-2">F</label><input type="radio" name="jibsaGender" value="F">
							<label class="me-2">M</label><input type="radio" name="jibsaGender" value="M" checked>
						</c:if>
						<c:if test="${j.jibsaGender eq 'M'}">
							<label>F</label><input type="radio" name="jibsaGender" value="F" checked>
							<label>M</label><input type="radio" name="jibsaGender" value="M">
						</c:if>
					</div>
					
					<p class="col-4">생년월일</p>
					<div class="col-8 px-0">
						<input type="text" name="jibsaRrn" value="${j.jibsaRrn}">
					</div>
					
					<p class="col-4">흡연여부</p><p class="col-2">${j.isSmoking }</p>
					<input type="hidden" name="isSmoking" value="${j.isSmoking}">
					<button type="button" class="col-1 rounded">Y</button>
					<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>
					
					<p class="col-4">경력사항</p><textarea class="col-8 mb-3" name="workCareer" style="height: 100px;">${j.workCareer }</textarea>
					
					<div class="container mb-3">
						<p class="mb-2">근무 가능 시간</p>
						<div id="box">
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
							<br>
						</div>
					</div>
					
					
					
					
					
					
					
					<p class="col-4">근무가능지역</p><textarea class="col-8" name="availableArea" style="height: 80px;">${j.availableArea }</textarea>
					<p class="col-4">지원동기</p><textarea class="col-8" name="motive" style="height: 200px;">${j.motive }</textarea>
					
					<p class="col-4">희망시급</p>
					<div class="col-8 px-0">
						<input type="number" name="expectedSalary" value="${j.expectedSalary}">
					</div>
					
					<p class="col-4">오픈카톡방</p>
					<div class="col-8 px-0">
						<input type="text" name="chatAddress" value="${j.chatAddress}">
					</div>
					
					<p class="col-4">프리미엄가입여부</p><p class="col-2">${j.isPrimium }</p>
					<input type="hidden" name="isPrimium" value="${j.isPrimium}">
					<button type="button" class="col-1 rounded">Y</button>
					<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>

					<p class="col-4">프리미엄가입날짜</p>
					<div class="col-8 px-0">
						<input type="date" name="primiumPaymentDate" value="${j.primiumPaymentDate}">
					</div>

					<p class="col-4">프리미엄종료날짜</p>
					<div class="col-8 px-0">
						<input type="date" name="primiumEndDate" value="${j.primiumEndDate}">
					</div>
					
					<p class="col-4">분류</p>
					<div class="col-8 px-0">
						<c:if test="${j.isTrainer eq 'Y'}">
							<label for="jibsa" class="me-2">집사</label><input type="radio" name="isTrainer" value="N" id="jibsa" class="me-3">
							<label for="trainer" class="me-2">훈련사</label><input type="radio" name="isTrainer" value="Y" id="trainer" checked>
						</c:if>
						<c:if test="${j.isTrainer eq 'N'}">
							<label for="jibsa" class="me-2">집사</label><input type="radio" name="isTrainer" value="N" id="jibsa" class="me-3" checked>
							<label for="trainer" class="me-2">훈련사</label><input type="radio" name="isTrainer" value="Y" id="trainer">
						</c:if>
					</div>
					
					<p class="col-4">집사활동여부</p><p class="col-2">${j.jibsaStatus }</p>
					<input type="hidden" name="jibsaStatus" value="${j.jibsaStatus}">
					<button type="button" class="col-1 rounded">Y</button>
					<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>
										
				</div>
			</div>
			
			<div class="col-3">
				<div class="card mb-5" style="border: 5px solid rgb(26, 188, 156); border-radius: 20px;">
					<img src="${ contextPath }/resources/image/logo.png">
				</div>
			</div>
<!-- 			<div class="col-2"></div> -->
			
		</div>
					
		<div class="container text-center">
			<button type="button" onclick="inputTime()" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">수정하기</button>
			<button type="button" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;" onclick="history.back()">뒤로가기</button>
		</div>
	</form>
	
	<br>
	<br><br><br><br><br><br><br>
	<%@ include file="../common/bottom.jsp"%>
	

	<script>
		$('.timepicker').timepicker({
			timeFormat: 'HH:mm',
		    interval: 30,
		    minTime: '0',
		    maxTime: '23:30',
		    startTime: '00:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
	
	
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
			console.log(t);
			document.getElementsByTagName('form')[0].submit();
		}
		

// 		버튼 입력
		const btns = document.getElementById('divBox').querySelectorAll('button');
		for(const i in btns){
			btns[i].addEventListener('click', function(){
				if(i%2 == 0){
					console.log(btns[i].innerText);
					this.previousElementSibling.value = btns[i].innerText;
					this.previousElementSibling.previousElementSibling.innerText = btns[i].innerText;
				}else{
					console.log(btns[i].innerText);
					this.previousElementSibling.previousElementSibling.value = btns[i].innerText;
					this.previousElementSibling.previousElementSibling.previousElementSibling.innerText = btns[i].innerText;
				}
			})
		}
	</script>








	
</body>
</html>