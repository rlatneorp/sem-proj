<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>myPage</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20,400,0,0" />
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	<div class="mb-5">
	</div>
	
	<div class="text-center">
		<div class="card shadow mb-4 d-inline-block mainBox">
			<div class="card-body text-start p-5">
				<div>
					<p class="fs-2 fw-bold">마이페이지</p>
					
					<div class="container px-0 mb-5 mx-0">
					<a href="#" class="d-block link-dark text-decoration-none mb-4">
						<img src="https://github.com/mdo.png" alt="mdo" width="48" height="48" class="rounded-circle image-block me-2">
						<span class="text-small fw-bold">홍길동 집사님</span>
					</a>
					</div>
					
					
					<div class="container px-2 mb-4 mx-0">			
						<p class="mb-3 fs-6 fw-bold">가능시간</p>
						<a href="${ contextPath }/jibsaWorkTime.js" class="text-decoration-none ">
						<div class="mb-1 col-6 d-inline-block text-top">
							<p class="fs-7 d-inline-block text-decoration-none align-middle text-dark">시간 정하기</p>
						</div>
						<div class="col-5 d-inline-block text-end">
							<span class="material-symbols-rounded d-inline-block text-decoration-none m-color">chevron_right</span>
						</div>
						</a>
					</div>
					
					<div class="container px-2 mb-4 mx-0">			
						<p class="mb-3 fs-6 fw-bold">스케줄 관리</p>
						<a href="${ contextPath }/jibsaManagementSchedule.js" class="text-decoration-none">
						<div class="col-6 d-inline-block text-top">
							<p class="fs-7 d-inline-block text-decoration-none align-middle text-dark">회원 스케줄 관리</p>
						</div>
						<div class="col-5 d-inline-block text-end">
							<span class="material-symbols-rounded d-inline-block text-decoration-none m-color">chevron_right</span>
						</div>
						</a>
					</div>
					
					<div class="container px-2 mb-4 mx-0">			
						<p class="mb-3 fs-6 fw-bold">집사정보</p>
						<a href="${ contextPath }/jibsaModifyInfo.js" class="text-decoration-none">
						<div class="col-6 d-inline-block text-top">
							<p class="fs-7 d-inline-block text-decoration-none align-middle text-dark">정보 수정하기</p>
						</div>
						<div class="col-5 d-inline-block text-end">
							<span class="material-symbols-rounded d-inline-block text-decoration-none m-color">chevron_right</span>
						</div>
						</a>
					</div>
					
					<div class="container px-2 mb-4 mx-0">			
						<p class="mb-3 fs-6 fw-bold">후기현황</p>
						<a href="${ contextPath }/review.js" class="text-decoration-none">
						<div class="col-6 d-inline-block text-top">
							<p class="fs-7 d-inline-block text-decoration-none align-middle text-dark">후기 조회</p>
						</div>
						<div class="col-5 d-inline-block text-end">
							<span class="material-symbols-rounded d-inline-block text-decoration-none m-color">chevron_right</span>
						</div>
						</a>
					</div>
					
					<div class="container px-2 mb-5 mx-0">			
						<p class="mb-3 fs-6 fw-bold">결제</p>
						<a href="${ contextPath }/premium.js" class="text-decoration-none">
						<div class="col-6 d-inline-block text-top">
							<p class="fs-7 d-inline-block text-decoration-none align-middle text-dark">프리미엄 결제하기</p>
						</div>
						<div class="col-5 d-inline-block text-end h-100">
							<span class="material-symbols-rounded d-inline-block text-decoration-none m-color">chevron_right</span>
						</div>
						<div class="col-12">
							<p class="fs-8 text-black text-opacity-50">프리미엄 혜택을 누릴 수 있습니다.</p>
						</div>
						</a>
					</div>
					
					<div class="container px-2 mb-4 mx-0">			
						<p class="mb-3 fs-6 fw-bold">고객센터</p>
						<a href="${ contextPath }/personal.js" class="text-decoration-none">
						<div class="col-6 d-inline-block text-top">
							<p class="fs-7 d-inline-block text-decoration-none align-middle text-dark">1:1 문의</p>
						</div>
						<div class="col-5 d-inline-block text-end">
							<span class="material-symbols-rounded d-inline-block text-decoration-none m-color">chevron_right</span>
						</div>
						</a>
						<a href="${ contextPath }/#" class="text-decoration-none">
						<div class="col-6 d-inline-block text-top">
							<p class="fs-7 d-inline-block text-decoration-none align-middle text-dark">자주하는 질문</p>
						</div>
						<div class="col-5 d-inline-block text-end">
							<span class="material-symbols-rounded d-inline-block text-decoration-none m-color">chevron_right</span>
						</div>
						</a>
					</div>
	
					<div class="container px-2 mb-4 mx-0">			
						<p class="mb-3 fs-6 fw-bold">집사에서 회원으로</p>
						<a href="${ contextPath }/#" class="text-decoration-none">
						<div class="col-6 d-inline-block text-top">
							<p class="fs-7 d-inline-block text-decoration-none align-middle text-dark">회원으로 전환</p>
						</div>
						<div class="col-5 d-inline-block text-end">
							<span class="material-symbols-rounded d-inline-block text-decoration-none m-color">Autorenew</span>
						</div>
						</a>
					</div>
					
					<div class="container px-2 mb-4 mx-0">			
						<a href="${ contextPath }/secession.js" class="text-decoration-none">
						<div class="col-6 d-inline-block text-top">
							<p class="fs-7 d-inline-block text-decoration-none align-middle text-dark text-opacity-50">파트너 탈퇴</p>
						</div>
						<div class="col-5 d-inline-block text-end h-100">
							<span class="material-symbols-rounded d-inline-block text-decoration-none m-color">chevron_right</span>
						</div>
						</a>
					</div>
				</div>
		    </div>
		</div>
	
	</div>
	
	
	
	
	
</body>
</html>