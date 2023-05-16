<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	#reviewBox{
		width: 700px;
		margin: 0 auto;
		text-align: left;
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
	        		<h4 style="margin-right: 490px;"><b>후기 게시판 관리</b></h4>
	        		<br>
	        		<form method="post" action="admin_Review_Update.ad" id="reviewBox" >
		        		<input type="hidden" name="page" value="${page}">
		        		<input type="hidden" name="matchingNo" value="${r.matchingNo}">
		        		<div class="form-group row mb-5">
				            <label class="col-2 mb-2">매칭번호</label><b class="col-10">${r.matchingNo}</b>
				            <label class="col-2 mb-2">작성자</label><b class="col-10">${r.memberName}</b><br>
				            <label class="col-2 mb-2">매칭동물</label><b class="col-10">${r.animalName}(${r.animalKind})</b><br>
				            <label class="col-2 mb-2">매칭시작</label><b class="col-10">${r.startDate}</b><br>
				            <label class="col-2 mb-2">매칭종료</label><b class="col-10">${r.endDate}</b><br>
				            <label class="col-2 mb-2">리뷰평점</label><b class="col-10">${r.reviewRating}</b><br>
				            <label class="col-2 mb-2">조회수</label><b class="col-10">${r.reviewCount}</b><br>
				        </div>
				        <div class="form-group">
				              <label for="exampleFormControlInput1">리뷰 내용 (${r.memberName})</label><br><br>
				            <textarea class="form-control" rows="10" style="resize: none" readonly>${r.reviewContent}</textarea>
				        </div>
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea1">집사 코멘트 (${r.jibsaName})</label><br><br>
				            <textarea class="form-control" rows="10" style="resize: none" readonly>${r.jibsaComment}</textarea>
				        </div>
				        <br>
   					    <div id="divBox" class="row mb-5">
						    <p class="col-2">활성화여부</p><p class="col-1">${r.reviewStatus}</p>
							<input type="hidden" name="reviewStatus" value="${r.reviewStatus}">
							<button type="button" class="col-1 rounded">Y</button>
							<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>
						</div>
						
						<div class="container text-center">
							<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">수정하기</button>
							<button type="button" class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;" onclick="history.back()">뒤로가기</button>
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
		window.onload = () =>{
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
		}
			
	</script>
	
	
	
		
	
	
</body>
</html>