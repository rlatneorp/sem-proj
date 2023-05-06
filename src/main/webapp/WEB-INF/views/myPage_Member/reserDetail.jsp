<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세페이지</title>
<style>
	td{height: 50px;}
	.table thead tr th{background: rgba(224, 224, 224, 0.51);}
	.tablediv{
		width: 800px;
		text-align: center;
		display: block;
		margin: 0 auto;
	}
	.detail{
		cursor: pointer;
	}
	.detail:hover{text-decoration: underline;}
	.jibsa{
		 width: 800px;
		 margin: 0 auto;
		 text-align: left;
	}
	#connect{cursor: pointer;}
	#connect:hover{text-decoration: underline;}
	#listbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 5px;
	 	width: 50px;
	}
	#cancelbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 10px;
	 	width: 130px;
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
					 <h4 style="margin-right: 620px;"><b>예약 상세페이지</b></h4>
					 <h6 style="margin-right: 570px;">나의 예약 현황을 살펴보세요!</h6><br>
					    <br><br>
					    <div class="tablediv">
						    <table class="table">
						    	<thead>
						    	<tr>
						    		<th>예약 번호</th>
						    		<th>예약 서비스</th>
						    		<th>예약 날짜</th>
						    		<th>예약 시간</th>
						    		<th>매칭 반려동물</th>
						    		<th>후기 작성</th>
						    	</tr>
						    	</thead>
						    	<tbody>
						    	<tr>
						    		<td>1255</td>
						    		<td>방문 돌봄</td>
						    		<td>2023-04-17(월)</td>
						    		<td>10:00~18:00</td>
						    		<td>치즈</td>
						    		<td>예약중</td>
						    	</tr>
						    	</tbody>
					    	</table>
					    </div>
					    <br><br>
					    <div class="jibsa">
						    <h4><b>매칭 집사</b></h4> <br>
						    <img src="https://github.com/mdo.png" alt="mdo" width="48" height="48" class="rounded-circle image-block">
						    <span>강건강 집사님</span><br><br>
						    <span>
						    	안녕하세요. 저는 현재 웰시코기 두 아이를 반려중인 보호자입니다. 두 아이들과 함께한지는 6년입니다.
						    	노견인 아이도 있어 케어하는 방법을 잘 알고 있으며 일전에 지인의 강아지를 돌봐준 경험이 있어 아이들 특성에
						    	맞게 케어가 가능합니다. 분리불안이나 하울링이 있는 아이는 추가비용이 있을 수 있고, 입질있는 아이는 불가합니다.
						    	읽어주셔서 감사합니다.
						    </span>
					    </div>
					    <br><br>
					    <div class="jibsa">
					    	<h4><b>상담하기</b></h4><br>
					    	<span id="connect">카카오톡 오픈채팅방 연결하기</span>
					    </div>
					    <br><br>
					    <button onclick="location.href='reservation.jsp';" id="cancelbtn">매칭 취소하기</button><br><br>
					    <button onclick="location.href='reservation.jsp';" style="margin-left: 750px;" id="listbtn">목록</button>
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