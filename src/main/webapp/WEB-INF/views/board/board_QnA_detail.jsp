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
* { font-family: 'Noto Sans KR', sans-serif; }

.area { margin-left: 400px; justify-content: center; align-items: center; width: 60%; }

.btn {display: inline-block; background-color: white; color: black; border: 1px solid lightgray; width: 90px; height: 90px;
			border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); margin-left: 30px; margin-bottom: 110px;}

.trash {display:inline-block; border: 1px solid lightgray; border-radius: 10px; box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
 		margin-left: 970px; width: 42px; height: 42px; justify-content: center; align-items: center; }

img {margin-left: 6.5px; margin-top: 6px; width: 27px; height: 27px;}

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

<div class="area">
<h2>1:1문의 관리</h2>

<br><br>

답변 완료

<br><br>

<h4>문의합니다.</h4>

<br>

강건강(user01) &nbsp; | &nbsp; 2023 - 05 - 06

<div class="trash">
	<img src="img/trash.png" id="img"/>
</div>

<br><hr><br>

안녕하세요 저는 얼마전에 프리미엄 가입을 했으나 환불을 요청하고 싶습니다~ 어쩌구 저쩌구
안녕하세요 저는 얼마전에 프리미엄 가입을 했으나 환불을 요청하고 싶습니다~ 어쩌구 저쩌구
안녕하세요 저는 얼마전에 프리미엄 가입을 했으나 환불을 요청하고 싶습니다~ 어쩌구 저쩌구
안녕하세요 저는 얼마전에 프리미엄 가입을 했으나 환불을 요청하고 싶습니다~ 어쩌구 저쩌구
안녕하세요 저는 얼마전에 프리미엄 가입을 했으나 환불을 요청하고 싶습니다~ 어쩌구 저쩌구
안녕하세요 저는 얼마전에 프리미엄 가입을 했으나 환불을 요청하고 싶습니다~ 어쩌구 저쩌구
안녕하세요 저는 얼마전에 프리미엄 가입을 했으나 환불을 요청하고 싶습니다~ 어쩌구 저쩌구
안녕하세요 저는 얼마전에 프리미엄 가입을 했으나 환불을 요청하고 싶습니다~ 어쩌구 저쩌구
안녕하세요 저는 얼마전에 프리미엄 가입을 했으나 환불을 요청하고 싶습니다~ 어쩌구 저쩌구

<br><br><hr><br>

<h5>답변</h5>

<br>

관리자 &nbsp; | &nbsp; 2023 - 05 - 06 &nbsp; | &nbsp; <a href=#>삭제</a>

<br><br>

문의 내용에 대한 답변입니다.

<br><br><hr><br><br>

새 답변 달기

<br><br>

<textarea cols="70" rows="5" style="resize: none";></textarea>

<button type="submit" class="btn">작성</button>

<br><hr><br><br>

이전 &nbsp; <img src="img/top-arrow.png"/> &nbsp; 문의할 게 있습니다

<br><hr>

다음 &nbsp; <img src="img/bottom-arrow.png"/> &nbsp; 궁금합니다..

</div>


<br><br><br>
<br><br><br>


</body>
</html>