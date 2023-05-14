<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
<style>
	Form{
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
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/sideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
	        		<h4 style="margin-right: 600px;"><b>문의 하기</b></h4>
	        		<br><br>
		        	<form method="post" action="member_QnA_Insert.me">
		        		<input type="hidden" name="memberNo" value="${loginUser.memberNo }">
		        		<select name="qnaCategory">
	        				<option selected>문의</option>
	        				<option>신고</option>
		        		</select>
		        		<br><br>
				        <div class="form-group">
			              	<label for="exampleFormControlInput1">제목</label><br><br>
			            	<input type="text" class="form-control" id="exampleFormControlInput1" name="qnaTitle" placeholder="제목을 작성해주세요.">
				        </div>
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea1">내용</label><br><br>
				            <textarea class="form-control" id="exampleFormControlTextarea1" name="qnaContent" rows="10" style="resize: none"></textarea>
				        </div>
				        <div class="text-center">
				    		<button class="subbtn">문의하기</button>
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