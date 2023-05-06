<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>집사나라</title>
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
						<img src="https://github.com/mdo.png" alt="mdo" width="72" height="72" class="rounded-circle image-block me-3">
						<div class="d-inline-block align-middle col-3">
							<div>
								<span class="fs-5 fw-bold mb-2">홍길동</span>
							</div>
							<div>
								<span class="fs-6">고양이</span>
							</div>
						</div>
						
						<div class="d-inline-block me-5">
							<a href="${ contextPath }/jibsaModifySchedule.js">
								<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">조율하기</button>
							</a>
						</div>
						
						<div class="d-inline-block me-5">
							<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">취소하기</button>
						</div>
					</div>
					
					<div class="container px-2 mb-5 mx-0">
						<img src="https://github.com/mdo.png" alt="mdo" width="72" height="72" class="rounded-circle image-block me-3">
						<div class="d-inline-block align-middle  col-3">
							<div>
								<span class="fs-5 fw-bold mb-2">남나눔씨</span>
							</div>
							<div>
								<span class="fs-6">강얼지</span>
							</div>
						</div>
						
						<div class="d-inline-block me-5">
							<a href="${ contextPath }/jibsaModifySchedule.js">
								<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">조율하기</button>
							</a>
						</div>
						
						<div class="d-inline-block me-5">
							<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">취소하기</button>
						</div>
					</div>
					
					<div class="container px-2 mb-5 mx-0">
						<img src="https://github.com/mdo.png" alt="mdo" width="72" height="72" class="rounded-circle image-block me-3">
						<div class="d-inline-block align-middle  col-3">
							<div>
								<span class="fs-5 fw-bold mb-2">사진이</span>
							</div>
							<div>
								<span class="fs-6">똑같네</span>
							</div>
						</div>
						
						<div class="d-inline-block me-5">
							<a href="${ contextPath }/jibsaModifySchedule.js">
								<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">조율하기</button>
							</a>
						</div>
						
						<div class="d-inline-block me-5">
							<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">취소하기</button>
						</div>
					</div>
					
					
					
			    </div>
			</div>
		</div>
	</div>
	
	

</body>
</html>