<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myPage</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,700,0,0" />
	
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="mb-5">
	</div>
	
	<div class="text-center">
		<div class="card shadow mb-4 d-inline-block mainBox">
			<div class="card-body text-start p-5">
				<div>
					<p class="fs-2 mb-5 fw-bold">집사 정보 수정</p>
					
					<div class="container px-0 mb-3 mx-0">
						<p class="px-2 fs-5 fw-bold">정보 수정하기</p>
					</div>
					
					<form method="post" action="${ contextPath }/adminMain.ad">
						<div class="container mb-5 mx-0">
						<a href="#" class="d-block link-dark text-decoration-none mb-3">
							<img src="https://github.com/mdo.png" alt="mdo" width="72" height="72" class="rounded-circle image-block me-2">
							<span class="fs-5 fw-bold">홍길동 집사님</span>
						</a>
						</div>
						
						<div class="container mb-4">
							<p class="fs-5">이름</p>
							<input type="text" value="홍길동" class="input px-2 fs-7" style="width: 200px; color: rgba(0,0,0,0.8);">
						</div>
						<div class="container mb-4">
							<p class="fs-5">이메일</p>
							<input type="text" value="hoggd@gmail.com" class="input px-2 fs-7" style="width: 200px; color: rgba(0,0,0,0.8);">
						</div>
						<div class="container mb-4">
							<p class="fs-5">연락처</p>
							<input type="text" value="010-1234-5678" class="input px-2 fs-7" style="width: 200px; color: rgba(0,0,0,0.8);">
						</div>
						<div class="container mb-5">
							<p class="fs-5">주소</p>
							<input type="text" value="서울시 중구 남대문로 1 KH정보" class="input px-2 fs-7 w-100" style="color: rgba(0,0,0,0.8);">
						</div>
						<hr>
						<br>
						
						<div class="container mb-4">
							<div class="mb-3">
								<p class="fs-5">경력</p>
								<p class="fs-6">경력사항</p>
								<input type="number" min="0" value="3" step="1" class="input me-2">
								<span class="me-2">년</span>
								<input type="number" min="0" value="3" step="1" class="input me-2">
								<span class="">개월</span>
							</div>
							<textarea class="w-100 input" style="height: 200px;">KH정보교육원에서 코코와 치즈를 3년간 돌봐왔습니다. 코코와 치즈는 학생들에게 많은 사랑을 받았구요. 저는 기부니가 좋았습니다.
							</textarea>
						</div>
						
						<div class="container mb-4">
							<p class="fs-5">자격증</p>
							<div class="d-flex justify-content-between mb-4" id="lisence">
								<div class="rounded-5 d-flex justify-content-center align-items-center hover-cursor-pointer" style="background: rgba(0,0,0,0.1); width: 100px; height: 100px;">
									<span class="material-symbols-rounded m-color d-flex">add_circle</span>
								</div>
								<div class="rounded-5 d-flex justify-content-center align-items-center hover-cursor-pointer" style="background: rgba(0,0,0,0.1); width: 100px; height: 100px;">
									<span class="material-symbols-rounded text-white d-flex">photo_library</span>
								</div>
								<div class="rounded-5 d-flex justify-content-center align-items-center hover-cursor-pointer" style="background: rgba(0,0,0,0.1); width: 100px; height: 100px;">
									<span class="material-symbols-rounded text-white d-flex">photo_library</span>
								</div>
								<div class="rounded-5 d-flex justify-content-center align-items-center hover-cursor-pointer" style="background: rgba(0,0,0,0.1); width: 100px; height: 100px;">
									<span class="material-symbols-rounded text-white d-flex">photo_library</span>
								</div>
								<div class="rounded-5 d-flex justify-content-center align-items-center hover-cursor-pointer" style="background: rgba(0,0,0,0.1); width: 100px; height: 100px;">
									<span class="material-symbols-rounded text-white d-flex">photo_library</span>
								</div>
							</div>
						</div>
						
						<div class="container mb-5">
							<p class="mb-2 fs-5">오픈카톡방 등록</p>
							<input type="text" placeholder="오픈카톡방 url을 입력하세요" class="input input-text px-2 fs-7">
						</div>
						
						<div class="container text-center">
							<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">수정하기</button>
						</div>
					</form>
				</div>
		    </div>
		</div>
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>