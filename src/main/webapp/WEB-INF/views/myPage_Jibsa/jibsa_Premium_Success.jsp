<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<title>매칭 성공</title>

<style>
  .matching-info {
    width: 500px;
    margin: 30px auto;
    border: 1.5px solid rgb(26, 188, 156);
    padding: 30px ;
    text-align: center;
    border-radius: 20px;
   
  }
  
  .matching-info h2 {
    font-size: 25px;
    margin-bottom: 10px;
    font-weight: bold;
  }
  
  .matching-info p {
    font-size: 16px;
    margin-bottom: 5px;
  }
  
</style>


</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<div class="mb-5"></div>
	<div class="container mb-5">
	
		<div class="d-flex justify-content-center row mb-5">
			<div class="d-flex col-5 row">
				<h1 class="col-12">결제 성공!</h1>
				<h5 class="col-12">프리미엄 결제가 완료되었습니다.</h5>
			</div>
		</div>
	</div>
	
	<div class="matching-info mb-5">
		<h2>프리미엄 결제 내역</h2>
		<br>
		<div class="row">
			
			<p class="col-4 text-start">구독기간</p>
			<p class="col-8 text-start">${ date } 개월</p><br/><br/>
			<p class="col-4 text-start">프리미엄 시작일</p>
			<p class="col-8 text-start">${ jibsaInfo.primiumPaymentDate }</p><br/><br/>
			<p class="col-4 text-start">프리미엄 종료일</p>
			<p class="col-8 text-start">${ jibsaInfo.primiumEndDate }</p><br/><br/>
		</div>
		<br>
	</div>
	<div class="col-12 d-flex justify-content-center">
		<button onclick="location.href='${contextPath}/jibsa_Main.js'" class="shadow m-bg-color rounded-2 border-0 fs-7 fw-bold text-white me-2" style="width: 100px; height: 40px;">확인</button>
	</div>
	

</body>
</html>