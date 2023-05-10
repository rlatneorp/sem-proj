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
										<div>
										
											<label for="wd1">월요일</label><input type="checkbox" id="wd1" name="workDay1" class="ms-1 me-4 checkBox">
											<div class="d-inline-block">
												<input type="time">
												<select name="startHour1" class="input" style="width: 50px;">
													<option>0</option>
													<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
													<option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
													<option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option>
													<option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option>
												</select>
												<p class="d-inline-block ms-1">시</p>
												
												<select name="startMinute1" class="input" style="width: 50px;">
													<option>00</option><option>10</option>
													<option>20</option><option>30</option>
													<option>40</option><option>50</option>
												</select>
												<p class="d-inline-block ms-1">분</p>
												
												<span class="d-inline-block"> ~ </span>
												<select name="endHour1" class="input" style="width: 50px;">
													<option>0</option>
													<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
													<option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
													<option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option>
													<option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option>
												</select>
												<p class="d-inline-block ms-1">시</p>
												<select name="endMinute1" class="input" style="width: 50px;">
													<option>00</option><option>10</option>
													<option>20</option><option>30</option>
													<option>40</option><option>50</option>
												</select>
												<p class="d-inline-block ms-1">분</p>
											</div>
										</div>
										
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
			const cBox = document.getElementById('cloneBox');
			
			for(i = 1; i < 7; i++){
				
				switch(i){
				case 1:  a="'wd2'>화"; b="'wd2'"; c="2"; break;
				case 2:  a="'wd3'>수"; b="'wd3'"; c="3"; break;
				case 3:  a="'wd4'>목"; b="'wd4'"; c="4"; break;
				case 4:  a="'wd5'>금"; b="'wd5'"; c="5"; break;
				case 5:  a="'wd6'>토"; b="'wd6'"; c="6"; break;
				default: a="'wd7'>일"; b="'wd7'"; c="7"; break;
				}
				cBox.innerHTML += 	"<div>"
										+"<label for="+a+"요일</label>"
										+"<input type='checkbox' id="+b+" name='workDay"+c+"' class='ms-1 me-4 checkBox'> "
										+"<div class='d-inline-block'>"+cBox.querySelector('div').querySelector('div').innerHTML+"</div>";
					
				cSelect = cBox.querySelectorAll('div')[i].querySelectorAll('select');
				cLabel = cBox.querySelectorAll('div')[i].querySelector('label');
				
				cSelect[0].name = "startHour"+(i);
				cSelect[1].name = "startMinute"+(i);
				cSelect[2].name = "endHour"+(i);
				cSelect[3].name = "endMinute"+(i);
			}
			
			console.log( cBox.querySelector('input') );
			
			
			
			
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