<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<form method="post" action="jibsaMain.js">
								<div class="container mb-3">
									<p class="mb-4 fs-6 fw-bold">근무 가능 시간</p>
									
									
									<div id="cloneBox">
										<div class="d-flex d-inline-block align-items-center justify-content-start">
											<label for="wd1" class="d-flex d-inline-block">월요일</label>
											<input type="checkbox" id="wd1" name="workDay1" class="ms-1 me-4 checkBox d-flex" style="width: 19px; height: 19px;">
											<label for="startTime1" class="d-flex d-inline-block me-1">시작시간</label>
											<input id="startTime1" class="timepicker text-center col-3 d-flex rounded card me-2" value="00:00">
											<label for="endTime1" class="d-flex d-inline-block me-1">종료시간</label>
											<input id="endTime1" class="timepicker text-center col-3 d-flex rounded card" value="00:00">
										</div>
										<br><br>
									</div>
								</div>
								
								
								<div class="d-flex mx-2">
									<div id="calBox" class="d-inline-block me-2">
										<div id="datepicker"></div>
									</div>
									
									<div id="resultBox" class="d-inline-block overflow-auto mb-5 border rounded-2 py-1 px-2" style="width: 250px; height: 300px;"></div>
								</div>
								
								
								<div class="container text-center">
									<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">등록하기</button>
								</div>
								
							</form>
						</div>
					</div>
				</div>
		    </div>
		</div>
	</div>
	
	<script>
		window.onload = function(){
// 			const cBox = document.getElementById('cloneBox');
			
// 			for(i = 1; i < 7; i++){
				
// 				switch(i){
// 				case 1:  a="'wd2'>화"; b="'wd2'"; c="2"; break;
// 				case 2:  a="'wd3'>수"; b="'wd3'"; c="3"; break;
// 				case 3:  a="'wd4'>목"; b="'wd4'"; c="4"; break;
// 				case 4:  a="'wd5'>금"; b="'wd5'"; c="5"; break;
// 				case 5:  a="'wd6'>토"; b="'wd6'"; c="6"; break;
// 				default: a="'wd7'>일"; b="'wd7'"; c="7"; break;
// 				}
// 				cBox.innerHTML += 	"<div>"
// 										+"<label for="+a+"요일</label>"
// 										+"<input type='checkbox' id="+b+" name='workDay"+c+"' class='ms-1 me-4 checkBox'> "
// 										+"<div class='d-inline-block'>"+cBox.querySelector('div').querySelector('div').innerHTML+"</div>";
					
// 				cSelect = cBox.querySelectorAll('div')[i].querySelectorAll('select');
// 				cLabel = cBox.querySelectorAll('div')[i].querySelector('label');
				
// 				cSelect[0].name = "startHour"+(i);
// 				cSelect[1].name = "startMinute"+(i);
// 				cSelect[2].name = "endHour"+(i);
// 				cSelect[3].name = "endMinute"+(i);
// 			}
			
// 			console.log( cBox.querySelector('input') );
			
			
			
			
		}
		
		const calBox = document.getElementById('calBox');
		calBox.addEventListener('mouseenter', function(){
			const cal = document.getElementById('datepicker');
			const aArr = cal.querySelectorAll('table')[0].querySelectorAll('a');
			for(var i of aArr){
				i.addEventListener('click', function() {
					const resultBox = document.getElementById('resultBox');
					const date = this.parentElement;
					
		 			resultBox.innerText += date.getAttribute('data-year')+"년 "+date.getAttribute('data-month')+"월 "+this.innerText+"일\n";
		 			
		 		});
			}
		})
			
	</script>
	
	
	
	
</body>
</html>