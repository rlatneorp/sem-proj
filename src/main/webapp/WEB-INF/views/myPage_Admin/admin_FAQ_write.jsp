<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<style>
	#writeForm{
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
	 	margin-left: 300px;
	}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
	        		<h4 style="margin-right: 630px;"><b>글 쓰기</b></h4>
	        		<br><br>
		        	<form method="post" id="writeForm">
				        <div class="form-group">
				              <label for="exampleFormControlInput1">제목</label><br><br>
				            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" required>
				        </div>
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea1">내용</label><br><br>
				            <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="10" style="resize: none" required></textarea>
				        </div>
				        <br>
					    <button class="subbtn">등록하기</button>
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