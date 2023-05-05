<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  
  .matching-info button {
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
	<div class="container">
	  
		<br><br><br>
		<h1>매칭 성공!</h1>
		<br>
		<h5>집사와의 매칭의 성공했습니다.</h5>
		<br>
	</div>
	
	<div class="matching-info">
	  <h2>최종 매칭 내역</h2>
	  <br>
	  <p>2023년 4월 12일 오전 10시~오후1시</p>
	  <p>서울시 중구</p>
	  <p>강아지 방문 돌봄</p>
	  <p>배정집사 : 강건강</p>
	  <br>
	  <button onclick="window.open('https://openchat.example.com')">오픈채팅 연결</button>
	</div>
	
	

</body>
</html>