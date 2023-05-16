<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<style>
	#reviewForm{
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
	        		<div style="width: 700px" class="d-inline-block text-start mb-5">
	        			<h4><b>1:1문의내용</b></h4>
	        		</div>
	        		<br>
		        	<form method="post" id="reviewForm" action="${contextPath}/admin_QNA_Update.ad">
		        		<input type="hidden" name="page" value="${page}">
		        		<input type="hidden" name="qnaNo" value="${q.qnaNo}">
				        <div class="form-group row mb-5">
				            <label class="col-2 mb-2">작성자</label><b class="col-10">${q.memberName}(${q.memberId})</b><br>
				            <label class="col-2 mb-2">문의일자</label><b class="col-10">${q.questionDate}</b>
				            <label class="col-2 mb-2">분류</label><b class="col-10">${q.qnaCategory}</b>
				        </div>
				        <div class="form-group mb-5">
				            <label >제목</label><br><br>
				            <input type="text" class="form-control" name="qnaTitle" value="${q.qnaTitle}" readonly>
				        </div>
				        <div class="form-group mb-5">
				            <label>문의내용</label><br><br>
				            <textarea class="form-control" name="qnaContent" rows="10" style="resize: none" readonly>${q.qnaContent}</textarea>
				        </div>
				        <div class="form-group mb-5">
				            <label>답변내용</label>
				            <label>
					            <c:if test="${answerDate ne ''}">&nbsp&nbsp${q.answerDate}</c:if>
				            </label><br><br>
				            <textarea class="form-control" name="qnaAnswer" rows="10" style="resize: none">${q.qnaAnswer}</textarea>
				        </div>
					    <div id="divBox" class="row mb-5">
						    <p class="col-2">활성화여부</p><p class="col-1">${q.qnaStatus}</p>
							<input type="hidden" name="qnaStatus" value="${q.qnaStatus}">
							<button type="button" class="col-1 rounded">Y</button>
							<button type="button" class="col-1 rounded">N</button><p class="col-4"></p>
						</div>
					    
						
						<div class="container text-center">
							<button class="shadow m-bg-color rounded-2 border-0 fs-6 fw-bold text-white me-2" style="width: 100px; height: 40px;">작성하기</button>
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
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4 text-center">
        			<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
        			<p class="mb-0">삭제 후 해당 글은 복구할 수 없습니다.</p>
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="location.href='${contextPath}/admin_FAQ_Delete.ad?fId='+btoa(${f.faqNo})">
        				<strong>네</strong>
        			</button>
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0" data-bs-dismiss="modal">아니오</button>
      			</div>
    		</div>
  		</div>
	</div>	
	
	<script>
		window.onload = () =>{
			const deleteModal = document.getElementById('deleteModal');
			if(deleteModal != null){
				deleteModal.addEventListener('click', ()=>{
					$('#modalChoice').modal('show');
				})
			}
		
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