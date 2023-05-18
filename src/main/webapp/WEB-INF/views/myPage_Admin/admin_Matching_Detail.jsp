<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


<!-- timepicker 관련 링크-->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>


 
<style>
	#reviewBox{
		width: 700px;
		margin: 0 auto;
		text-align: left;
	}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
	        		<h4 style="margin-right: 490px;"><b>매칭 관리</b></h4>
	        		<br>
	        		<form method="post" action="admin_Matching_Update.ad" id="reviewBox">
		        		<input type="hidden" name="page" value="${page}">
		        		<input type="hidden" name="matchingNo" value="${mc.matchingNo}">
		        		<div class="form-group row mb-3">
				            <label class="col-2 mb-2">매칭번호</label><b class="col-10">${mc.matchingNo}</b>
				            <label class="col-2 mb-2">이용자</label><b class="col-10">${mc.memberName}</b><br>
				            <label class="col-2 mb-2">집사</label><b class="col-10">${mc.jibsaName}</b><br>
				            <label class="col-2 mb-2">매칭동물</label><b class="col-10">${mc.animalName}(${r.animalKind})</b><br>
				            
				            <input type="hidden" name="startDate">
				            <label class="col-2 mb-2">매칭시작</label><input type="date" name="startDay" class="col-3 date" value="${fn:substring(mc.startDate, 0, 10) }">
				            	<input class="timepicker text-center col-2 d-flex rounded card time" name="startTime" value="${fn:substring(mc.startDate, 11, 13)}:${fn:substring(mc.startDate, 13, 15)}">
				            	<div class="col-5"></div>
				            	
				            <input type="hidden" name="endDate">
				            <label class="col-2 mb-2">매칭종료</label><input type="date" name="endDay" class="col-3 date" value="${fn:substring(mc.endDate, 0, 10) }">
				            	<input class="timepicker text-center col-2 d-flex rounded card time" name="endTime" value="${fn:substring(mc.endDate, 11, 13)}:${fn:substring(mc.endDate, 13, 15)}">
				            	<div class="col-5"></div>
				            
				            <label class="col-2 mb-2">매칭장소</label><input type="text" name="matchingPlace" class="col-5" value="${mc.matchingPlace}"><div class="col-5"></div>
<%-- 				            <b class="col-10">${mc.matchingPlace}</b><br> --%>
				        </div>
   					    <div id="divBox" class="row mb-5">
						    <p class="col-2">활성화여부</p><p class="col-1">${mc.matchingStatus}</p>
							<input type="hidden" name="matchingStatus" value="${mc.matchingStatus}">
							<button type="button" class="col-1 rounded">Y</button>
							<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>
						</div>
						
						<div class="container text-center">
							<button type="button" onclick="inputTime()" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">수정하기</button>
							<button type="button" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;" onclick="history.back()">뒤로가기</button>
<%-- 							<a href="${contextPath}/admin.ad">임시링크</a> --%>
						</div>						
					</form>
	        	</div>
			</div>
	    </div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<footer>
		<%@ include file="../common/bottom.jsp" %>
	</footer>
	
	<script>
		window.onload = () =>{
// 			document.getElementsByClassName('date')[0].value = "${fn:substring(mc.startDate, 0, 10) }";
// 			document.getElementsByClassName('time')[0].value = "${fn:substring(mc.startDate, 11, 16) }";
// 			document.getElementsByClassName('date')[1].value = "${fn:substring(mc.endDate, 0, 10) }";
// 			document.getElementsByClassName('time')[1].value = "${fn:substring(mc.endDate, 11, 16) }";
			
			const btns = document.getElementById('divBox').querySelectorAll('button');
			for(const i in btns){
				btns[i].addEventListener('click', function(){
					if(i%2 == 0){
						this.previousElementSibling.value = btns[i].innerText;
						this.previousElementSibling.previousElementSibling.innerText = btns[i].innerText;
					}else{
						this.previousElementSibling.previousElementSibling.value = btns[i].innerText;
						this.previousElementSibling.previousElementSibling.previousElementSibling.innerText = btns[i].innerText;
					}
				})
			}
		}
		
// 		timepicker 관련 스크립트
		$('.timepicker').timepicker({
    		timeFormat: 'HH:mm',
		    interval: 30,
		    minTime: '0',
		    maxTime: '23:30',
// 		    defaultTime: '${ex}',
		    startTime: '00:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
		
		function inputTime(){
// 			시작시간 대입 (startDate)
			const startDay = document.getElementsByName('startDay')[0].value;
			const sDay = new Date(document.getElementsByName('startDay')[0].value).getDay();
			const startTime = document.getElementsByName('startTime')[0].value.substring(0,2)+document.getElementsByName('startTime')[0].value.substring(3,5);
			
			document.getElementsByName('startDate')[0].value = startDay + sDay + startTime; 
			
// 			종료시간 대입 (endDate)
			const endDay = document.getElementsByName('endDay')[0].value;
			const eDay = new Date(document.getElementsByName('endDay')[0].value).getDay();
			const endTime = document.getElementsByName('endTime')[0].value.substring(0,2)+document.getElementsByName('endTime')[0].value.substring(3,5);
			
			document.getElementsByName('endDate')[0].value = startDay + sDay + startTime; 
			
			document.getElementsByTagName('form')[0].submit();
		}
		
	</script>
	
	
	
		
	
	
</body>
</html>