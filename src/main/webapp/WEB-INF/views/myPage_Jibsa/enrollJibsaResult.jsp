<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<title>지원 완료</title>

<style>
  .container{
  	text-align: center;
  	
  }
  .apply-info {
    width: 500px;
    margin: 30px auto;
    border: 1.5px solid rgb(26, 188, 156);
    padding: 30px ;
    text-align: center;
    border-radius: 20px;
  }
  
  .apply-info h2 {
    font-size: 25px;
    margin-bottom: 10px;
    font-weight: bold;
  }
  
  .apply-info p {
    font-size: 16px;
    margin-bottom: 5px;
  }
  
  .apply-info button {
    background-color: rgb(26, 188, 156);
    color: white;
    border: none;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 20px;
  }
  
</style>


</head>
<body>
<jsp:include page="../common/top.jsp"/>
	<div class="container">
	  
		<br><br><br>
		<h1>지원이 완료되었습니다!</h1>
		<br>
		<h3> 지원해 주신 것에 진심으로 감사드립니다.  </h3>
		<br>
	</div>
	
	<div class="apply-info">
	  <br>
	  <p>지원 결과는 진행절차가 진행되는 대로 </p>
	  <p>기재하신 연락처를 통해 통지해 드리겠습니다.</p>
	  
	  <br>
	  <button onclick="location.href='${ contextPath }/home.do'">홈 화면으로 가기</button>
	</div>
	<br><br><br><br><br>
	
	
<jsp:include page="../common/bottom.jsp"/>
</body>
</html>