<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 수정</title>
<style>
	#reviewForm{
		width: 700px;
		margin: 0 auto;
		text-align: left;
	}
	#subbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 10px;
	 	width: 100px;
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
	        		<h4 style="margin-right: 560px;"><b>후기 작성하기</b></h4>
	        		<br><br>
		        	<form method="post" id="reviewForm">
<!-- 				        <div class="form-group"> -->
<!-- 				              <label for="exampleFormControlInput1">제목</label><br><br> -->
<!-- 				            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" value="저희 코코가 너무 좋아해요"> -->
<!-- 				        </div> -->
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea1">내용</label><br><br>
				            <textarea class="form-control" id="exampleFormControlTextarea1" name="contents" rows="10" style="resize: none">집사님께서 산책을 너무 잘해주셨어요!! 저희 코코 오자마자 기절했답니다 ㅋㅋㅋ
				            </textarea>
				        </div>
				        <br><br>
				    </form>
				    <button id="subbtn" onclick="location.href='reservation.jsp';">수정하기</button>
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