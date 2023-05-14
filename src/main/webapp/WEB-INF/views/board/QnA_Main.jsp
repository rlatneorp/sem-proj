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

 .trash {display:inline-block; border: 1px solid lightgray; border-radius: 10px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
 			margin-left: 72%; width: 42px; height: 42px; justify-content: center; align-items: center;}

img {margin-left: 6.5px; margin-top: 6px; width: 27px; height: 27px;}

.area {border: 1px solid lightgray; padding: 25px; margin-left: auto; margin-right: auto; width: 50%;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center;}
			
th {background-color: #eee;}

h4 { display: inline-block; margin-left: 25%; font-weight: 700;}

#btn {display: absolute; background-color: white; color: black; border: 1px solid lightgray; width: 145px; height: 34px;
			border-radius: 10px; margin-left: 560px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);}
			
#btn2 {display: absolute; background-color: white; color: black; border: 1px solid lightgray; width: 145px; height: 34px;
			border-radius: 10px; margin-left: 500px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);}

#btn a { text-decoration: none; color: black; }
			
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
	
	<h2>고객센터 관리</h2>
	
	<br><br><br><br><br>
	
	<h4>1:1문의 관리</h4>
	<button id="btn"><a href="${ contextPath }/qna_List.bo">전체 내역 보기</a></button>
	
	<br><br>
		
	<div class="area" id="area3">
		<table class="table">
			<thead>
				<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ qList }" var ="q">
					<tr>
						<th scope="row">${ q.qnaNo }</th>
						<td><a href="${ contextPath }/QnA_detail.me?bId="${q.qnaNo }>${q.qnaTitle }</a></td>
						<td>${q.memberName }</td>
						<td>${q.questionDate }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>		
	</div>

	<br><br><br><br><br><br>
	
	<h4>자주 묻는 질문 관리</h4>
	<button id="btn2">전체 내역 보기</button>
	
	<br><br>
	
	<div class="area" id="area3">
		<table class="table">
			<thead>
				<tr>
					<th scope="col">글번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">작성일</th>
				</tr>
			</thead>
			<tbody>
  				<c:forEach items="${ fList }" var = "f">
					<tr>
						<th scope="row">${f.faqNo }</th>
						<td>${f.faqTitle }</td>
						<td>${f.faqWriter }</td>
						<td>${f.faqCreateDate }</td>
					</tr>
  				
  				</c:forEach>
		</table>		
	</div>
	
	<br><br><br><br><br><br><br><br>
	
	
	
	
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
</script>
</html>