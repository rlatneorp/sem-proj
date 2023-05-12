<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기게시판 관리</title>
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
					 <h4 style="margin-right: 58%;"><b>후기 게시판 관리</b></h4>
					    <br><br>
					    <div class="tablediv">
						    <table class="table">
						    	<thead>
						    	<tr>
						    		<th>글번호</th>
						    		<th>분류</th>
						    		<th>제목</th>
						    		<th>작성자</th>
						    		<th>작성일</th>
						    		<th>조회수</th>
						    		<th>선택</th>
						    	</tr>
						    	</thead>
						    	<tbody>
						    	<tr>
						    		<td>1</td>
						    		<td >매칭 후기</td>
						    		<td>너무 만족하고 너무 친절하세요!!!</td>
						    		<td>강건강(kangabc)</td>
						    		<td>2023-04-17(월)</td>
						    		<td>25</td>
							        <td>
								        <input type="checkbox" class="select-checkbox">
								    </td>
						    	</tr>
						    	
						    	<tr>
						    		<td>12</td>
						    		<td >매칭 후기</td>
						    		<td>너무 만족하고 너무 친절하세요!!!</td>
						    		<td>강건강(kangabc)</td>
						    		<td>2023-04-17(월)</td>
						    		<td>125</td>
						    		<td>
								        <input type="checkbox" class="select-checkbox">
								    </td>
						    	</tr>
						    	
						    	<tr>
						    		<td>22</td>
						    		<td >매칭 후기</td>
						    		<td>너무 만족하고 너무 친절하세요!!!</td>
						    		<td>강건강(kangabc)</td>
						    		<td>2023-04-17(월)</td>
						    		<td>225</td>
						    		<td>
								        <input type="checkbox" class="select-checkbox">
								    </td>
						    	</tr>
						    	
						    	<tr>
						    		<td>33</td>
						    		<td >매칭 후기</td>
						    		<td>너무 만족하고 너무 친절하세요!!!</td>
						    		<td>강건강(kangabc)</td>
						    		<td>2023-04-17(월)</td>
						    		<td>325</td>
						    		<td>
								        <input type="checkbox" class="select-checkbox">
								    </td>
						    	</tr>
						    	
						    	<tr>
						    		<td>44</td>
						    		<td >매칭 후기</td>
						    		<td>너무 만족하고 너무 친절하세요!!!</td>
						    		<td>강건강(kangabc)</td>
						    		<td>2023-04-17(월)</td>
						    		<td>425</td>
						    		<td>
								        <input type="checkbox" class="select-checkbox">
								    </td>
						    	</tr>
						    	
						    	<tr>
						    		<td>55</td>
						    		<td>구매 후기</td>
						    		<td>너무 만족하고 너무 친절하세요!!!</td>
						    		<td>강건강(kangabc)</td>
						    		<td>2023-04-17(월)</td>
						    		<td>525</td>
						    		<td>
								        <input type="checkbox" class="select-checkbox">
								    </td>
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