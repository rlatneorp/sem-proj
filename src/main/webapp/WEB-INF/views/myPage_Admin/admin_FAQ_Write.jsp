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
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	<div class="toggled">
        <div>
	    	<div class="container-fluid">
	        	<div class="container text-center">
	        		<h4 style="margin-right: 630px;"><b>글 쓰기</b></h4>
	        		<br><br>
		        	<form method="post" id="writeForm" action="admin_FAQ_Insert.ad">
		        		<input type="hidden" name="page" value="${page}">
				        <div class="form-group">
				              <label for="exampleFormControlInput1">제목</label><br><br>
				            <input type="text" class="form-control" name="faqTitle" required>
				        </div>
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea1">내용</label><br><br>
				            <textarea class="form-control" name="faqContent" rows="10" style="resize: none" required></textarea>
				        </div>
				        <br>
				        
				        <div id="divBox" class="row mb-4">
						    <p class="col-2">활성화여부</p><p class="col-2">Y</p>
							<input type="hidden" name="faqStatus" value="Y">
							<button type="button" class="col-1 rounded">Y</button>
							<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>
						</div>
				        
					    <div class="container text-center">
							<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">등록하기</button>
							<button  type="button" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white" style="width: 100px; height: 40px;" onclick="history.back()">뒤로가기</button>
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
		const btns = document.getElementById('divBox').querySelectorAll('button');
		for(const i in btns){
			btns[i].addEventListener('click', function(){
				if(i%2 == 0){
					console.log(btns[i].innerText);
					this.previousElementSibling.value = btns[i].innerText;
					this.previousElementSibling.previousElementSibling.innerText = btns[i].innerText;
				}else{
					console.log(btns[i].innerText);
					this.previousElementSibling.previousElementSibling.value = btns[i].innerText;
					this.previousElementSibling.previousElementSibling.previousElementSibling.innerText = btns[i].innerText;
				}
			})
		}
	</script>
	
</body>
</html>