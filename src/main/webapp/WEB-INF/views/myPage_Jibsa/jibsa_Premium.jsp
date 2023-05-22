<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<style>
	* {font-family: 'Noto Sans KR', sans-serif;}

	body {text-align: center; margin-left: auto; margin-right: auto;}
	
	.title {margin-left: 450px; font-weight: 700;}
	.subtitle {margin-left: 450px;}
	
	.area {border: 1px solid lightgray; padding: 20px; 
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center;
			margin-left: auto; margin-right: auto; width: 780px; height: 100px; display: flex; align-items: center; justify-content: center;}
			
	.purchase {background-color: #1abc9c; color:white; border: none; width:110px; height: 40px;
			border-radius: 50px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);}
			
	.purchase:active {background-color: white; color:#1abc9c; border: 1px solid #1abc9c; width:110px; height: 40px;
			border-radius: 50px;}
			
	.purchase2 {margin-left: 350px;}
	
	#payment {text-align: left; padding: 30px;}
	
	#btn {margin-left: 380px;}
	
	h4 {display: inline-block; display: flex; align-items: center;}
	
	
</style>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<br>
	<h2 class="title">마이페이지</h2><br>
	<h4 class="title">프리미엄 결제</h4><br><br>
	<h5 class="subtitle">검색 상단에 올라가는 혜택이!</h5><br>
	<span class="subtitle">원하는 프리미엄 결제 개월 수를 선택해주세요</span><br><br><br>
	
	<div class="area">
		<h4>1개월 12000원</h4>
		<button id="card1" class="purchase purchase2" onclick="12000won">구매하기</button>
	</div><br>
	
	<div class="area">
		<h4>3개월 35000원</h4>
		<button id="card2" class="purchase purchase2" onclick="35000won">구매하기</button>
	</div><br>
	
	<div class="area">
		<h4>6개월 68000원</h4>
		<button  id="card3" class="purchase purchase2" onclick="68000won">구매하기</button><br>
	</div><br><br>
	
	<h4 class="subtitle">결제수단</h4><br><br>
	
	<div class="area" id="payment">
  		<button onclick="requestPay()">결제하기</button><br>
	</div><br>
	
	<br><br><br>
	<br><br><br>
	<br><br><br>

<script>
const card1 = document.querySelector('#card1');
	card1.addEventListener('click', ()=>{
	 
	})

const userCode = "imp14397622";
IMP.init(userCode);

function 12000won() {
  IMP.request_pay({
    pg: "tosspayments",
    pay_method: "card",
    merchant_uid: "test_lhyeosfv",
    name: "집사나라 결제창",
    amount: 12000,
    buyer_tel: "010-0000-0000",
    m_redirect_url: "http://localhost:8085/jsnr/",
  });
}

function 35000won() {
	  IMP.request_pay({
	    pg: "tosspayments",
	    pay_method: "card",
	    merchant_uid: "test_lhyeosfv",
	    name: "집사나라 결제창",
	    amount: 35000,
	    buyer_tel: "010-0000-0000",
	    m_redirect_url: "http://localhost:8085/jsnr/",
	  });
	}
	
function 68000won() {
	  IMP.request_pay({
	    pg: "tosspayments",
	    pay_method: "card",
	    merchant_uid: "test_lhyeosfv",
	    name: "집사나라 결제창",
	    amount: 68000,
	    buyer_tel: "010-0000-0000",
	    m_redirect_url: "http://localhost:8085/jsnr/",
	  });
	}	
</script>
</body>
</html>