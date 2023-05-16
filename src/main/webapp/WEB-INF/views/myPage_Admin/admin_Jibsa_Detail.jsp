<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>회원 정보 수정</title>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	<br><br>
	<form method="post" action="${contextPath}/admin_Jibsa_Update.ad">
		<div class="row d-flex mb-5">
			<input type="hidden" name="page" value="${page}">
			<input type="hidden" name="memberNo" value="${j.memberNo }">
			<div class="col-3"></div>
			<div class="col-4 d-flex">
				<div class="row d-flex py-3 fs-6" id="divBox">
					<p class="col-12 fs-4 mb-5 fw-bold">${j.memberName } 집사님</p>
					<p class="col-4">이름</p>
					<div class="col-8 px-0"><input type="text" name="memberName" value="${j.memberName }"></div>
					
					<p class="col-4">성별</p>
					<div class="col-8 px-0">
						<c:if test="${j.jibsaGender eq 'F'}">
							<label>F</label><input type="radio" name="jibsaGender" value="F">
							<label>M</label><input type="radio" name="jibsaGender" value="M" checked>
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
					
					<p class="col-4">경력사항</p><textarea class="col-8" name="workCareer" style="height: 100px;">${j.workCareer }</textarea>
					<p class="col-4">근무가능시간</p><input class="col-8" type="time" name="availableHour" value="${availableHour}">
					<p class="col-4">근무가능지역</p><textarea class="col-8" name="availableArea" style="height: 80px;">${j.availableArea }</textarea>
					<p class="col-4">지원동기</p><textarea class="col-8" name="motive" style="height: 200px;">${j.motive }</textarea>
					
					<p class="col-4">희망시급</p>
					<div class="col-8 px-0">
						<input type="number" name="exptectedSalary" value="${j.exptectedSalary}">
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
			<div class="col-2"></div>
			
		</div>
					
		<div class="container text-center">
			<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">수정하기</button>
			<button type="button" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;" onclick="history.back()">뒤로가기</button>
		</div>
	</form>
	
	<br>
	<br><br><br><br><br><br><br>
	<%@ include file="../common/bottom.jsp"%>
	

	<script>
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