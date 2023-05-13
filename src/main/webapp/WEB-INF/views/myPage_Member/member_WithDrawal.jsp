<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<style>
	#box{
		margin: 0 auto;
	}
	#wbtn{
		background: rgb(244, 244, 244);
	 	color: black;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 10px;
	 	margin-right: 10px;
	}
	#cancel{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 10px;
	 	margin-left: 10px;
	}
	#img{
		width: 250px;
		height: 250px;
	}
	button{margin: 0 auto;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/sideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
					 <h4 style="margin-right: 700px;"><b>회원 탈퇴</b></h4>
					 <hr>
					 <div id="box">
					 	<img src="../../img/logo.png" id="img"><br><br><br>
					 	<h4>홍길동님이 홍길동님께서 집사나라를 탈퇴 하신다니 아쉽네요!</h4>
						<h4>항상 행복하시길 바라며 나중에 다시 뵙길 바라요!</h4>
					 </div>
					 <br><br>
					 <button onclick="location.href='${contextPath}';" id="wbtn">탈퇴하기</button>
					 <button onclick="location.href='userInfo.jsp';" id="cancel">취소하기</button>
				</div>
			</div>
	    </div>
	</div>
</body>
</html>