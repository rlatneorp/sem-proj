<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>
	#box{
		width: 700px;
		height: 250px;
		margin: 0 auto;
		text-align: left;
		border: 1px solid rgb(224, 224, 224);
	}
	#listbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 5px;
	 	width: 50px;
	}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/sideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
	        	<br>
					 <h4 style="margin-right: 700px;"><b>자주 묻는 질문</b></h4>
					 <br>
					 <hr>
					 <br>
					 <div id="box">
					 	<div style="padding-top: 20px;">
					 		&nbsp;&nbsp;&nbsp;&nbsp;예약은 어디에서 하나요?
					 	</div>
					 	<hr>
					 	<br>
					 	<div>
	        				&nbsp;&nbsp;&nbsp;&nbsp;저희 집사나라 사이트에 로그인 하신 후 반려동물 등록과 보호자 추가 정보를 입력하고, <br>
	        				&nbsp;&nbsp;&nbsp;&nbsp;집사매칭에서 원하는 서비스 선택 후 맞는 집사를 선택하시면 됩니다^^
	        			</div>
					 </div>
					 <br>
					 <button onclick="location.href='serviceCenter.jsp';" style="margin-left: 650px;" id="listbtn">목록</button>
				</div>
			</div>
	    </div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
		<footer>
			<%@ include file="../common/bottom.jsp" %>
		</footer>
</body>
</html>