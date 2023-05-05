<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>workTime</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(document).ready(function(){
			$( "#datepicker" ).datepicker();

// 			$('#calBox').on('mouseover', function(){
// 				const date = $('#datepicker').find('table').find('a');
				
// 				console.log('on');
// 				console.log(date);
// 			})
		});
		
	</script>
	
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="mb-5">
	</div>
	
	<div class="text-center">
		<div class="card shadow mb-4 d-inline-block">
<!-- 		<div class="card-header py-3"> -->
<!-- 		<h6 class="m-0 font-weight-bold text-primary">Custom Text Color Utilities</h6> -->
<!-- 		</div> -->
			<div class="card-body text-start p-5 mainBox">
				<div>
					<p class="fs-2 mb-5 fw-bold">마이페이지</p>
					
					<div class="container px-0 mb-5 mx-0">
						<p class="px-2 fs-5 fw-bold">나의 근무시간</p>
					</div>
					
					
					<div class="mx-0">			
						<div class="mb-1 d-inline-block text-top">
							<form method="post" action="myPage.mp">
								<div class="container mb-3">
									<p class="mb-4 fs-6 fw-bold">근무 가능 시간</p>
									
									<div>
										<span class="d-inline-block col-2">출근시간 : </span>
										<select name="startHour" class="input">
											<option>0</option>
											<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
											<option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
											<option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option>
											<option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option>
										</select>
										<p class="d-inline-block ms-1">시</p>
										
										<select name="startMinute" class="input">
											<option>00</option><option>10</option>
											<option>20</option><option>30</option>
											<option>40</option><option>50</option>
										</select>
										<p class="d-inline-block ms-1">분</p>
									</div>

									<div>
										<span class="d-inline-block col-2">퇴근시간 : </span>
										<select name="endHour" class="input">
											<option>0</option>
											<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
											<option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
											<option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option>
											<option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option>
										</select>
										<p class="d-inline-block ms-1">시</p>
										<select name="endMinute" class="input">
											<option>00</option><option>10</option>
											<option>20</option><option>30</option>
											<option>40</option><option>50</option>
										</select>
										<p class="d-inline-block ms-1">분</p>
									
									</div>
								</div>
								
								<div class="container mb-4">
									<p class="mb-4 fs-6 fw-bold">근무 가능 요일</p>
									<label for="wd1">월요일</label><input type="checkbox" id="wd1" name="workDay" class="ms-1 me-2 checkBox">
									<label for="wd2">화요일</label><input type="checkbox" id="wd2" name="workDay" class="ms-1 me-2 checkBox">
									<label for="wd3">수요일</label><input type="checkbox" id="wd3" name="workDay" class="ms-1 me-2 checkBox">
									<label for="wd4">목요일</label><input type="checkbox" id="wd4" name="workDay" class="ms-1 me-2 checkBox">
									<label for="wd5">금요일</label><input type="checkbox" id="wd5" name="workDay" class="ms-1 me-2 checkBox">
									<label for="wd6">토요일</label><input type="checkbox" id="wd6" name="workDay" class="ms-1 me-2 checkBox">
									<label for="wd7">일요일</label><input type="checkbox" id="wd7" name="workDay" class="ms-1 me-2 checkBox">
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
	
	<script>
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