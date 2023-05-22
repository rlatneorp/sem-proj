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
	#upbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 10px;
	 	width: 100px;
	}
	#debtn{
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
	        		<h4 style="margin-right: 560px;"><b>후기 수정하기</b></h4>
	        		<br><br>
		        	<form method="post" id="reviewForm">
		        		<br>
				        <div class="form-group">
				            <label for="exampleFormControlInput1">평점</label><br><br>
				            <input type="range" min="0" max="5" oninput="updateRangeValue(this.value)" step="0.5" name="reviewRating" value="${ b.reviewRating }">
				            &nbsp;&nbsp;&nbsp;<span id="range">${ b.reviewRating }</span>
				        </div>
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea1">내용</label><br><br>
				            <textarea class="form-control" id="exampleFormControlTextarea1" name="reviewContent" rows="10" style="resize: none">${ b.reviewContent }</textarea>
				        </div>
				        <input type="hidden" value="${ matchingNo }" name="matchingNo">
				        <br><br><br>
				        <div style="margin-left: 200px;">
					    	<button id="upbtn">수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    	<button id="debtn">삭제하기</button>
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
		<script>
		  function updateRangeValue(value) {
		    document.getElementById("range").textContent = value;
		  }
		  
		  const update = document.getElementById('upbtn');
		  const deleteb = document.getElementById('debtn');
		  const form = document.getElementById('reviewForm');
		  
		  update.addEventListener('click', () => {
			  form.action = '${contextPath}/updateReview.me';
			  form.submit();
		  });
		  
		  deleteb.addEventListener('click', () => {
			  const confirmed = confirm('정말 삭제하시겠습니까?');
              if (confirmed) {
              	form.action = '${contextPath}/deleteReview.me';
			  	form.submit();
              }
			  
		  });
		</script>
</body>
</html>