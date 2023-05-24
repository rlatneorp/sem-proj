<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
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
		        	<form method="post">
		        		<select name="qnaCategory">
		        			<option>${q.qnaCategory }</option>
		        		</select>
		        		<br><br>
				        <div class="form-group">
				              <label for="exampleFormControlInput1">제목</label><br><br>
				            <input type="text" class="form-control" id="exampleFormControlInput1" name="qnaTitle" value="${q.qnaTitle }" readonly>
				        </div>
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea1">내용</label><br><br>
				            <textarea class="form-control" id="exampleFormControlTextarea1" name="qnaContent" rows="10" style="resize: none" readonly>${q.qnaContent }</textarea>
				        </div>
				        <br>
				        <div class="form-group">
				            <label for="exampleFormControlTextarea2">답변내용</label><br><br>
				            <textarea class="form-control" id="exampleFormControlTextarea2" name="qnaAnswer" rows="10" style="resize: none" readonly>${q.qnaAnswer }</textarea>
				        </div>
				    </form>
				    <button class="subbtn" onclick="location.href='member_QnA_Edit.me?qId=${q.qnaNo}';">수정하기</button>
				    <button class="subbtn" type="button" id="deleteModal">삭제하기</button>
	        	</div>
			</div>
	    </div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	
	<div class="modal fade" tabindex="-1" role="dialog" id="modalChoice">
		<div class="modal-dialog" role="document">
    		<div class="modal-content rounded-3 shadow">
      			<div class="modal-body p-4 text-center">
        			<h3 class="mb-0">정말로 삭제하시겠습니까?</h3>
        			<p class="mb-0">삭제 후 해당 글은 복구할 수 없습니다.</p>
      			</div>
      			<div class="modal-footer flex-nowrap p-0">
        			<button type="button" class="btn btn-lg btn-link fs-6 text-decoration-none col-6 m-0 rounded-0 border-end" onclick="location.href='${contextPath}/member_QnA_delete.me?qId='+btoa(${q.qnaNo})">
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
		}
	</script>
	
	
	
	<footer>
		<%@ include file="../common/bottom.jsp" %>
	</footer>
	
	
</body>
</html>