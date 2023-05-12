<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
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

	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
					 <h4 style="margin-right: 58%;"><b>회원 관리</b></h4>
					    <br><br>
					    <div class="tablediv">
						    <table class="table">
						    	<thead>
						    	<tr>
						    		<th>회원 번호</th>
						    		<th>이름</th>
						    		<th>아이디</th>
						    		<th>등록 동물 수</th>
						    		<th>가입 날짜</th>
						    		<th>신고내역</th>
						    	</tr>
						    	</thead>
						    	<tbody>
						    	<tr>
						    		<td>1255</td>
						    		<td >장현지</td>
						    		<td>kkkkkk</td>
						    		<td>2</td>
						    		<td>2023-04-17(월)</td>
						    		<td>신고됨</td>
						    	</tr>
						    	<tr>
						    		<td>1255</td>
						    		<td >이환희</td>
						    		<td>kkkkkk</td>
						    		<td>2</td>
						    		<td>2023-04-17(월)</td>
						    		<td></td>
						    	</tr>
						    	<tr>
						    		<td>1255</td>
						    		<td >엄수민</td>
						    		<td>kkkkkk</td>
						    		<td>2</td>
						    		<td>2023-04-17(월)</td>
						    		<td></td>
						    	</tr>
						    	<tr>
						    		<td>1255</td>
						    		<td >신다온</td>
						    		<td>kkkkkk</td>
						    		<td>2</td>
						    		<td>2023-04-17(월)</td>
						    		<td></td>
						    	</tr>
						    	<tr>
						    		<td>1255</td>
						    		<td >김수대</td>
						    		<td>kkkkkk</td>
						    		<td>2</td>
						    		<td>2023-04-17(월)</td>
						    		<td>신고됨</td>
						    	</tr>
						    	</tbody>
					    	</table>
					    </div>
					</div>
	            </div>
	        </div>
	    <br><br><br><br><br><br><br><br><br><br><br><br><br>
		
</body>
</html>