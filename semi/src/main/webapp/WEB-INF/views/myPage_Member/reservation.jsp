<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 관리</title>
<style>
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
	#reviewbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 5px;
	}
	td{height: 50px;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/sideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
					 <h4 style="margin-right: 58%;"><b>예약 관리</b></h4>
					 <h6 style="margin-right: 48%;">나의 예약 현황을 살펴보세요!</h6><br>
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
						    		<td onclick="location.href='reserDetail.jsp';" class="detail">방문 돌봄</td>
						    		<td>2023-04-17(월)</td>
						    		<td>10:00~18:00</td>
						    		<td>치즈</td>
						    		<td>예약중</td>
						    	</tr>
						    	<tr>
						    		<td>1187</td>
						    		<td>훈련</td>
						    		<td>2023-04-16(토)</td>
						    		<td>10:00~18:00</td>
						    		<td>코코</td>
						    		<td><button id="reviewbtn" onclick="location.href='review.jsp';">작성하기</button></td>
						    	</tr>
						    	<tr>
						    		<td>1125</td>
						    		<td>산책</td>
						    		<td>2023-04-15(금)</td>
						    		<td>10:00~18:00</td>
						    		<td>코코</td>
						    		<td class="detail" onclick="location.href='reviewDetail.jsp';">후기수정</td>
						    	</tr>
						    	<tr>
						    		<td>1112</td>
						    		<td>산책</td>
						    		<td>2023-04-06(토)</td>
						    		<td>10:00~18:00</td>
						    		<td>코코</td>
						    		<td class="detail">후기수정</td>
						    	</tr>
						    	<tr>
						    		<td>1110</td>
						    		<td>훈련</td>
						    		<td>2023-04-01(화)</td>
						    		<td>10:00~18:00</td>
						    		<td>코코</td>
						    		<td class="detail">후기수정</td>
						    	</tr>
						    	</tbody>
					    	</table>
					    </div>
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