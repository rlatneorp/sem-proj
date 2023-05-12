<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<style>
	#reviewForm{
		width: 700px;
		margin: 0 auto;
		text-align: left;
	}
	.subbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 10px;
	 	margin: 20px;
	}
	.btn{margin-left: 190px;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
	        		<h4 style="margin-right: 490px;"><b>자주 묻는 질문 관리</b></h4>
	        		<br>
		        	<form method="post" id="reviewForm">
				        <div class="form-group">
				              <label for="exampleFormControlInput1">제목</label><br><br>
				            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" value="고양이도 이용할 수 있나요?">
				        </div>
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea1">내용</label><br><br>
				            <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="10" style="resize: none">당연합니다. 고양이를 키우시는 고객님의 경우, 방문 돌봄 서비스를 많이 이용하십니다.</textarea>
				        </div>
				        <br>
				        <div class="btn">
						    <button class="subbtn">수정하기</button>
						    <button class="subbtn">삭제하기</button>
					    </div>
				    </form>
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