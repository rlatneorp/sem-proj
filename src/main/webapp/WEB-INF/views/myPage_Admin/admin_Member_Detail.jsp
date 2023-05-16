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
	<form method="post" action="${contextPath}/admin_Member_Update.ad">
		<div class="row d-flex mb-5">
			<input type="hidden" name="page" value="${page}">
			<input type="hidden" name="memberNo" value="${m.memberNo }">
			<div class="col-3"></div>
			<div class="col-4 d-flex">
				<div class="row d-flex py-3 fs-6" id="divBox">
					<p class="col-12 fs-4 mb-5 fw-bold">${m.memberName } 회원님</p>
					<p class="col-4">아이디</p><p class="col-8">${m.memberId }</p>
					<p class="col-4">이름</p><p class="col-8"><input type="text" name="memberName" value="${m.memberName }"></p>
					<p class="col-4">이메일</p><p class="col-8"><input type="text" name="memberEmail" value="${m.memberEmail }"></p>

					<p class="col-4">관리자여부</p><p class="col-2">${m.isAdmin }</p>
					<input type="hidden" name="isAdmin" value="${m.isAdmin }">
					<button type="button" class="col-1 rounded">Y</button>
					<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>

					<p class="col-2">집사여부</p>
					<div class="col-2" id="applyCheck">
						<c:if test="${m.applyJibsa eq 'Y'}">(신청완료)</c:if>
						<c:if test="${m.applyJibsa eq 'N'}">(신청대기)</c:if>
					</div>
					<p class="col-2">${m.isJibsa }</p>
					<input type="hidden" name="isJibsa" value="${m.isJibsa }">
					<c:if test="${m.applyJibsa eq 'Y'}">
						<button type="button" class="col-1 rounded">Y</button>
					</c:if>
					<c:if test="${m.applyJibsa eq 'N'}">
						<button type="button" class="col-1 rounded"></button>
					</c:if>
					<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>

					<p class="col-4">활동여부</p><p class="col-2">${m.memberStatus }</p>
					<input type="hidden" name="memberStatus" value="${m.memberStatus }">
					<button type="button" class="col-1 rounded">Y</button>
					<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>

					<p class="col-4">가입날짜</p><p class="col-8">${m.enrollDate}</p>
					<p class="col-4">탈퇴날짜</p><p class="col-8">${m.exitDate}</p>
					<p class="col-4">신고접수</p><p class="col-8">${m.blackList}</p>
					<p class="col-4">전화번호</p><p class="col-8"><input type="text" name="memberPhone" value="${m.memberPhone }"></p>
					<p class="col-4">주소</p><p class="col-8"><input type="text" name="memberAddress" value="${m.memberAddress }"></p>
					<p class="col-4">등록 동물 수</p><p class="col-8">${m.animalCount }</p>
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
		const aCk = document.getElementById('applyCheck').innerText;
		for(const i in btns){
			btns[i].addEventListener('click', function(){
				if(i == 2 && aCk == "(신청대기)"){
					
				} else{
					if(i%2 == 0){ 
						console.log(btns[i].innerText);
						this.previousElementSibling.value = btns[i].innerText;
						this.previousElementSibling.previousElementSibling.innerText = btns[i].innerText;
					}else{
						console.log(btns[i].innerText);
						this.previousElementSibling.previousElementSibling.value = btns[i].innerText;
						this.previousElementSibling.previousElementSibling.previousElementSibling.innerText = btns[i].innerText;
					}
				}
			})
		}
			
		
	</script>








	
</body>
</html>