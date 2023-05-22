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
	#subbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 10px;
	 	width: 100px;
	 	margin-left: 300px;
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
		        	<form method="post" id="reviewForm" action="${ contextPath }/insertReview.me">
		        		<br>
				        <div class="form-group">
				            <label for="exampleFormControlInput1">평점</label><br><br>
				            <input type="range" min="0" max="5" oninput="updateRangeValue(this.value)" step="0.5" name="reviewRating" value="0">
				            &nbsp;&nbsp;&nbsp;<span id="range"></span>
				        </div>
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea1">내용</label><br><br>
				            <textarea class="form-control" id="exampleFormControlTextarea1" name="reviewContent" rows="10" style="resize: none"></textarea>
				        </div>
				        <input type="hidden" value="${ matchingNo }" name="matchingNo">
				        <br><br>
				    <button id="subbtn">등록하기</button>
				    </form>
	        	</div>
			</div>
	    </div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
		<footer>
			<%@ include file="../common/bottom.jsp" %>
		</footer>
		<script>
		  function updateRangeValue(value) {
		    document.getElementById("range").textContent = value;
		  }
		</script>
</body>
</html>