<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>workTime</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,500,0,0" />
	<script src="//code.jquery.com/jquery-1.12.4.js"></script>
	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
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
<!-- 					<a href="#" class="d-block link-dark text-decoration-none mb-4"> -->
						<img src="https://github.com/mdo.png" alt="mdo" width="72" height="72" class="rounded-circle image-block me-3">
						<div class="d-inline-block align-middle">
							<div>
								<span class="fs-5 fw-bold mb-2">홍길동</span>
							</div>
							<div>
								<span class="fs-6">고양이</span>
							</div>
						</div>
<!-- 					</a> -->
					</div>
					
					
					<div class="mb-1 text-top">
						<form method="post" action="${ contextPath }/managementSchedule.mp">
							<div class="container mb-3">
								<p class="mb-4 fs-5 fw-bold">변경요청 보내기</p>
								
								<div class="shadow w-100 card px-4 py-3 text-center mb-3">
									<span class="fs-6">2023년 4월 12일(수요일) - 12시 30분 ~ 17시 00분</span>
								</div>
								<div class="mb-3 text-center">
									<span class="material-symbols-rounded m-color opacity-50" style="font-size: 60px;">arrow_circle_down</span>
								</div>
								
								
								
								
								<div class="shadow rounded-3 w-100 px-5 py-5 text-center mb-5" style="border: 1px solid rgba(0,0,0,0.2);">
									<select name="year" class="input">
										<option>2023</option>
										<option>2024</option>
									</select>
									<p class="d-inline-block ms-1">년</p>
									<select name="month" class="input">
										<option>1</option><option>2</option><option>3</option><option selected>4</option>
										<option>5</option><option>6</option><option>9</option><option>8</option>
										<option>9</option><option>10</option><option>11</option><option>12</option>
									</select>
									<p class="d-inline-block ms-1">월</p>
									<select name="month" class="input">
										<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
										<option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option selected>12</option>
										<option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option>
										<option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option>
										<option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option>
										<option>31</option>
									</select>
									<p class="d-inline-block ms-1">일</p>
									<br><br>
									
									
									
									
									<div class="text-center">
										<span class="d-inline-block">시작시간 : </span>
										<select name="startHour" class="input">
											<option>0</option>
											<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
											<option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option selected>12</option>
											<option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option>
											<option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option>
										</select>
										<p class="d-inline-block ms-1">시</p>
										
										<select name="startMinute" class="input">
											<option>00</option><option>10</option>
											<option>20</option><option selected>30</option>
											<option>40</option><option>50</option>
										</select>
										<p class="d-inline-block ms-1">분</p>
									</div>

									<div class="text-center">
										<span class="d-inline-block">종료시간 : </span>
										<select name="endHour" class="input">
											<option>0</option>
											<option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option>
											<option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option>
											<option>13</option><option>14</option><option>15</option><option>16</option><option selected>17</option><option>18</option>
											<option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option>
										</select>
										<p class="d-inline-block ms-1">시</p>
										<select name="endMinute" class="input">
											<option selected>00</option><option>10</option>
											<option>20</option><option>30</option>
											<option>40</option><option>50</option>
										</select>
										<p class="d-inline-block ms-1">분</p>
									</div>

								</div>
							</div>
							
							
							<div class="container text-center">
								<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">요청하기</button>
							</div>
						</form>
						
					</div>
			    </div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>