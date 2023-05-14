<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<style>
* {font-family: 'Noto Sans KR', sans-serif;}

h2 {text-align: center; font-weight: 700;}

 .trash {display:inline-block; border: 1px solid lightgray; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
 			margin-left: 76%; width: 42px; height: 42px; justify-content: center; align-items: center;}

img {margin-left: 6.5px; margin-top: 6px; width: 27px; height: 27px;}

.area {border: 1px solid lightgray; padding: 35px; margin-left: auto; margin-right: auto; width: 57%;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center;}
			
th {background-color: #eee;}

.pagination { display: flex; justify-content: center; align-items: center; }

.pagination a { color: #1abc9c; }

.pagination a:hover {color: black;}

.area2 { display: flex; justify-content: center; align-items: center; }

select { width: 90px; height: 30px; }

#btn {background-color: white; color: black; border: 1px solid gray; width:70px; height: 32px;
			border-radius: 10px;}
			
</style>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<br>
	
	<div id="wrapper" class="toggled">
	    	<div id="page-content-wrapper">
	        	<div class="container text-center">
				  <div class="row align-items-center">
				  <jsp:include page="../common/adminSideBar.jsp"/>
				  </div>
				</div>
	    	</div>
		</div>
	
	<br>
	
	<h2>1:1문의 관리</h2>
	
	<br><br><br>
	
	<div class="trash">
	<img src="img/trash.png" id="img"/>
	</div>
	
	<br><br>
	
	<div class="area" id="area3">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">분류</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
					<th scope="col">답변상태</th>
					<th scope="col">선택</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ qList}" var="q">
					<tr>
						<th scope="row">${q.qnaNo }</th>
						<td>${q.qnaCategory }</td>
						<td><a href="${ contextPath }/QnA_detail.bo?bId=?"${q.qnaNo}>${q.qnaTitle}</a></td>
						<td>${q.memberName }</td>
						<td>${q.questionDate }</td>
						<td>
							<c:if test="${q.qnaAnswer eq null}">답변 대기</c:if>
							<c:if test="${q.qnaAnswer ne null}">답변 완료</c:if>
						</td>
						<td><input type="checkbox"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>		
	</div>

	<br><br>
	
	<div>
		<nav aria-label="Standard pagination example" style="float: center;">
			<ul class="pagination">
				<li class="page-item">
					<c:url var="goBack" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
					</c:url>
					<a class="page-link" href="${ goBack }" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:url var="goNum" value="${ loc }">
						<c:param name="page" value="${ p }"></c:param>
					</c:url>
					<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
				</c:forEach>
				<li class="page-item">
					<c:url var="goNext" value="${ loc }">
						<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
					</c:url>
					<a class="page-link" href="${ goNext }" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</nav>
	</div>
	
	<br><br>
	
	<div class="area2">
	<select>
	    <option value="title">제목</option>
	    <option value="member">분류</option>
	    <option value="replyStatus">답변상태</option>
	</select>

	&nbsp;&nbsp;&nbsp;<input type="text" size="15"/>&nbsp;&nbsp;&nbsp;
	
	<button type="submit" id="btn">조회</button>
	</div>
	
	<br><br><br><br><br><br><br><br><br>
	
	
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
</html>