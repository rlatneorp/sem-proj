<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myPage</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,700,0,0" />
<style>
	#img{
  		width: 400px; height: 250px; border: 1px solid gray;
  	}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="mb-5">
	</div>
	
	<div class="text-center">
		<div class="card shadow mb-4 d-inline-block mainBox">
			<div class="card-body text-start p-5">
				<div>
					<p class="fs-2 mb-5 fw-bold">집사 마이페이지</p>
					
					<div class="container px-0 mb-3 mx-0">
						<p class="px-2 fs-5 fw-bold">정보 수정하기</p>
					</div>
					
					<form method="post" action="${ contextPath }/jibsaUpdateInfo.js">
						<div class="container mb-4">
						<p class="fs-5">프로필 수정</p>
						<div id="img" style=""></div>
    					<input type="file" class="input px-2 fs-7" style="width: 400px; color: rgba(0,0,0,0.8); cursor: pointer;" id="formFile">
    					</div>
						<input type="hidden" name="memberNo" value="${ loginUser.memberNo }">
						<div class="container mb-4">
							<p class="fs-5">이름</p>
							<input type="text" name="memberName" value="${ loginUser.memberName }" class="input px-2 fs-7" style="width: 200px; color: rgba(0,0,0,0.8);" readonly>
						</div>
						<div class="container mb-4">
							<p class="fs-5">이메일</p>
							<input type="text" name="memberEmail" value="${ loginUser.memberEmail }" class="input px-2 fs-7" style="width: 200px; color: rgba(0,0,0,0.8);">
						</div>
						<div class="container mb-4">
							<p class="fs-5">연락처</p>
							<input type="text" name="memberPhone" value="${ loginUser.memberPhone }" class="input px-2 fs-7" style="width: 200px; color: rgba(0,0,0,0.8);">
						</div>
						<div class="container mb-5">
							<p class="fs-5">주소</p>
							<input type="text" name="memberAddress" value="${ loginUser.memberAddress }" class="input px-2 fs-7 w-100" style="color: rgba(0,0,0,0.8);">
						</div>
						<hr>
						<br>
						<div class="container mb-4">
							<div class="mb-3">
								<p class="fs-5">경력</p>
								<p class="fs-6">경력사항</p>
							</div>
							<textarea class="w-100 input" style="height: 200px;" name="workCareer">${ jibsaInfo.workCareer }</textarea>
						</div>
						
						<div class="container mb-4">
							<p class="fs-5">자격증</p>
							<p style="font-size: 12px;">ex. 반려동물 관리사 1급 - 한국 반려동물 협회</p>
							<button type="button" class="w-25 btn btn-outline-success" id="addFile">+ 추가</button>
							<br><br>
							<div id="fileArea">
								<div class="mb-3 adddd">
									<input type="text" name="license" style="width: 400px;" value="${ jibsaInfo.license }">
								</div>
							</div>
							
								
						</div>
						
						<div class="container mb-5">
							<p class="mb-2 fs-5">오픈카톡방 등록</p>
							<input type="text" name="chatAddress" placeholder="오픈카톡방 url을 입력하세요" class="input input-text px-2 fs-7" value="${ jibsaInfo.chatAddress }">
						</div>
						
						<div class="container text-center">
							<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;">수정하기</button>
							<button type="button" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;" onclick="location.href='${contextPath}/jibsa_Main.js'">뒤로가기</button>
						</div>
					</form>
				</div>
		    </div>
		</div>
	</div>
	<script>
		const add = document.getElementById('addFile');
		const area = document.querySelector('#fileArea');
		
		add.addEventListener('click', () => {
			// node 이용
			const newDiv = document.createElement('div');
			newDiv.classList.add('mb-3');
			newDiv.innerHTML = '<input type="text" name="motive" style="width: 400px;">';
			
			fileArea.append(newDiv)
		});
		
		const input = document.getElementById('formFile');
		const imgDiv = document.getElementById('img');
	
		input.addEventListener('change', function() {
		  const file = this.files[0];
		  if (!file.type.startsWith('image/')){ 
		    alert('이미지 파일을 선택하세요.'); 
		    return;
		  }
		  const reader = new FileReader();
		  reader.onload = function() {
		    const img = new Image();
		    img.style.width = '400px';
		    img.style.height = '247px';
		    img.src = reader.result;
		    imgDiv.innerHTML = '';
		    imgDiv.appendChild(img);
		  }
		  reader.readAsDataURL(file);  
		});
		
		
	</script>
</body>
</html>