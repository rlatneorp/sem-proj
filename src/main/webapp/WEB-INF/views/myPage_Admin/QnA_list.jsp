<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			    <tr>
			      <th scope="row">001</th>
			      <td>회원</td>
			      <td><a href="${ contextPath }/QnA_detail.me">문의합니다</a></td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>답변 완료</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			    <tr>
			      <th scope="row">001</th>
			      <td>집사</td>
			      <td>문의합니다</td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>미답변</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			     <tr>
			      <th scope="row">001</th>
			      <td>회원</td>
			      <td>문의합니다</td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>답변 완료</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			    <tr>
			      <th scope="row">001</th>
			      <td>집사</td>
			      <td>문의합니다</td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>미답변</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			     <tr>
			      <th scope="row">001</th>
			      <td>회원</td>
			      <td>문의합니다</td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>답변 완료</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			    <tr>
			      <th scope="row">001</th>
			      <td>집사</td>
			      <td>문의합니다</td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>미답변</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			    <tr>
			      <th scope="row">001</th>
			      <td>회원</td>
			      <td>문의합니다</td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>답변 완료</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			    <tr>
			      <th scope="row">001</th>
			      <td>집사</td>
			      <td>문의합니다</td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>미답변</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			    <tr>
			      <th scope="row">001</th>
			      <td>회원</td>
			      <td>문의합니다</td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>답변 완료</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			    <tr>
			      <th scope="row">001</th>
			      <td>집사</td>
			      <td>문의합니다</td>
			      <td>강건강(user01)</td>
			      <td>2023 - 04 - 22</td>
			      <td>미답변</td>
			      <td><input type="checkbox"/></td>
			    </tr>
			  </tbody>
			</table>		
		</div>

	<br><br><br>
	
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="#"aria-label="Previous">
				<span aria-hidden="true">&laquo;</span></a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>
	
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