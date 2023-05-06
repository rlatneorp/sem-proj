<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<style>
	#ebtn{
	  background: rgb(26, 188, 156);
	  color: white;
	  padding: 10px;
	  border: none;
	  border-radius: 10px;
	  margin-left: 160px;
  }
  .sel{
  	font-size: 20px;
  	font-weight: bold;
  }
  .edit{
  	width: 650px;
  	height: 500px;
  	border-radius: 10px;
  	box-shadow: 0px 0px 14px gray;
  	margin-left: 200px;
  	display: flex;
    justify-content: center;
    align-items: center;
  }
  .editForm{margin-right: 30px; text-align: left;}
  input{width: 400px; height: 35px;}
  #wbtn{
  	font-size: 10px;
  	background: rgb(26, 188, 156);
	color: white;
	padding: 5px;
	border: none;
	border-radius: 10px;
	margin-left: 450px;
  }
  #btn {display: inline-block; background-color: #1abc9c; color:white; border: none; width:120px; height: 40px;
			border-radius: 50px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); margin-left: 880px;}
			
	#modal { width: 320px; height: 180px; border: 1px solid #eee; padding: 50px; margin: auto; display: none;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center; background-color: white;
			 position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;}
	
	#btn3 { background-color: #1abc9c; color:white; border: none; width: 100px; height: 35px;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2); }
			
	#btn4 { background-color: lightgray; color:white; border: none; width: 100px; height: 35px;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);}}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/sideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
					   <h4 style="margin-right: 58%;"><b>나의 정보</b></h4>
					   <h6 style="margin-right: 40%;">서비스 제공을 위해 정보를 입력해주세요!</h6><br>
					      	<div class="edit">
					      		<form class="editForm">
					      			<p class="sel">1. 이름</p>
    							  	<input type="text" name="name" placeholder="이름"/>
    							  	<br><br>
    							  	<p class="sel">2. 연락처</p>
    							  	<input type="text" name="phone" placeholder="연락처">
    							  	<br><br>
    							  	<p class="sel">3. 찾아갈 주소</p>
    							  	<input type="text" name="address" placeholder="주소">
    							  	<br><br><br>
    							  	<button type="button" id="ebtn" onclick="location.href='userInfo.jsp'">등록하기</button>
					      		</form>
					      	</div>
					      	<br>
					      	<button id="wbtn">회원 탈퇴</button>
					      </div>
					    </div>
					</div>
	            </div>
	            <div id="modal">
				<h5>정말로 탈퇴하시겠습니까?</h5><br>
				<button type="submit" id="btn3">탈퇴하기</button>&nbsp;
				<button id="btn4">취소하기</button>
				</div>
				
				<br><br><br><br>
				
				<script>
					
					document.getElementById('wbtn').addEventListener('click', () => {
						document.getElementById('modal').style.display = 'block';
					});
					
					document.getElementById('btn4').addEventListener('click', () => {
						document.getElementById('modal').style.display = 'none';
					});
					
				</script>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		<footer>
			<%@ include file="../common/bottom.jsp" %>
		</footer>
</body>
</html>