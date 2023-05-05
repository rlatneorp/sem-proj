<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<style>

	* {font-family: 'Noto Sans KR', sans-serif;}
	
	body {text-align: center; margin-left: auto; margin-right: auto;}
	
	.title {margin-left: 450px; font-weight: 700;}
	.subtitle {margin-left: 450px;}
	
	.area {border: 1px solid lightgray; padding: 40px;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
			margin-left: auto; margin-right: auto; width: 800px;}
			
	#submit {background-color: #1abc9c; color:white; border: none; width:110px; height: 40px;
			border-radius: 50px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); margin-left: 295px;}

</style>
<body>
	<jsp:include page="../common/top.jsp"/>

	<br><br>
	<h2 class="title">마이페이지</h2><br>
	<h4 class="title">1:1 문의</h4><br><br>
	<h5 class="title">문의등록</h5><br>

	<form>
		<div class="area">
			<label class="form-label">이메일 주소</label>
			<input type="email" class="form-control" placeholder="name@example.com"><br>
	
			<label class="form-label">전화번호</label>
			<input type="tel" class="form-control" placeholder="010-0000-0000"><br>
			
			<label class="form-label">제목</label>
			<input type="text" class="form-control" placeholder="제목을 입력해주세요"><br>
			
			<label class="form-label">내용</label><br>
			<textarea cols="87" rows="10" style="resize:none;" placeholder="내용을 입력해주세요"></textarea><br><br>
			
			<button id="submit">문의하기</button>
		</div>
	</form>
	
	<br><br><br>
	<br><br><br>
	<br><br><br>
	
</body>
</html>