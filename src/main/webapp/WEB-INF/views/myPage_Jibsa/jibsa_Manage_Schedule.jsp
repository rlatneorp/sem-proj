<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>집사나라</title>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<!-- 	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"> -->
<!-- 	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,500,0,0" /> -->
<!-- 	<script src="//code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- 	<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
	
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="mb-5">
	</div>
	
	<div class="text-center">
		<div class="card shadow mb-4 mainBox" style="width: 1000px">
			<div class="card-body text-start p-5">
				<div>
					<p class="fs-2 mb-5 fw-bold">마이페이지</p>
					
					<div class="container px-0 mb-5 mx-0">
						<p class="px-2 fs-5 fw-bold">스케줄 변경</p>
					</div>
					
					<c:forEach items="${matchingList}" var="mc" varStatus="st">
						<div class="container row px-2 pb-2 mb-3 mx-0 border-bottom">
<!-- 							<img src="https://github.com/mdo.png" alt="mdo" width="72" height="72" class="rounded-circle image-block me-3"> -->
							<div class="col-1 px-0 d-flex align-items-center">
								<span>${mc.matchingNo}</span>
							</div>
							<div class="d-inline-block align-middle col-2">
								<div>
									<span class="fs-5 fw-bold mb-2">${mc.memberName}</span>
								</div>
								<div>
									<span class="fs-6">${mc.animalName}</span>
									<span class="fs-6">${mc.animalKind}</span>
								</div>
							</div>
							<div class="col-4 row">
								<span class="fs-6 col-12">${fn:substring(mc.startDate,0,10)} ${fn:substring(mc.startDate,11,13)}:${fn:substring(mc.startDate,13,15)}</span>
								<span class="fs-6 col-12">~${fn:substring(mc.endDate,0,10)} ${fn:substring(mc.endDate,11,13)}:${fn:substring(mc.endDate,13,15)}</span>
								<span class="fs-6 col-12">${fn:substring(mc.matchingPlace,0,16)}</span>
							</div>
							<div class="col-1 d-flex align-items-center">
								<p class="isEnd"></p>
							</div>
							
							<div class="col-2 d-flex align-items-center px-0">
								<button onclick="location.href='${ contextPath }/jibsa_Modify_Schedule.js?mcNo=${mc.matchingNo}'" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 90px; height: 40px;">상세보기</button>
							</div>
							<div class="col-2 d-flex align-items-center px-0">
								<button type="button" class="cancelModal shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 90px; height: 40px;">취소하기</button>
							</div>
						</div>
						
						<div class="fade modal modalChoice" tabindex="-1" role="dialog">
							<div class="modal-dialog" role="document">
					    		<div class="modal-content rounded-3 shadow">
					      			<div class="modal-body p-4 text-center">
					        			<h3 class="mb-5">정말로 취소하시겠습니까?</h3>
					        			<div class="text-start ms-3">
						        			<p class="mb-0">${mc.memberName}</p>
						        			<p class="mb-0">${mc.animalName} - ${mc.animalKind}</p>
						        			<p class="mb-0">${fn:substring(mc.startDate,0,10)} ${fn:substring(mc.startDate,11,13)}:${fn:substring(mc.startDate,13,15)}</span>
											<p class="mb-0">~${fn:substring(mc.endDate,0,10)} ${fn:substring(mc.endDate,11,13)}:${fn:substring(mc.endDate,13,15)}</span>
						        			<p class="mb-5">${fn:substring(mc.matchingPlace,0,25)}</p>
						        			<p class="mb-0">취소 후 해당 매칭은 복구할 수 없습니다.</p>
					        			</div>
					      			</div>
					      			<div class="modal-footer flex-nowrap p-0">
					        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="location.href='${contextPath}/jibsa_Cancel_Matching.js?mcNo=${mc.matchingNo}'">
					        				<strong>네</strong>
					        			</button>
					        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
					      			</div>
					    		</div>
					  		</div>
						</div>
											
					</c:forEach>
					
					
					<!-- 페이징 -->
					<%@ include file="../common/paging.jsp" %>
					<div class="text-center">
						<button type="button" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;" onclick="location.href='${contextPath}/jibsa_Main.js'">뒤로가기</button>
					</div>
			    </div>
			</div>
		</div>
	</div>
	

	
	<script>
		window.onload = () =>{
			const cancelModals = document.getElementsByClassName('cancelModal');
			for(const i in cancelModals){
				if(cancelModals[i] != null && cancelModals[i].type == "button"){
					cancelModals[i].addEventListener('click', ()=>{
						$('.modalChoice').eq(i).modal('show');
					})
				}
			}
		}
			
	</script>
	

</body>
</html>