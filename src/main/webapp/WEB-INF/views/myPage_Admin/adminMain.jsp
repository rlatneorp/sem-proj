<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain</title>
</head>
<body>
	<jsp:include page="../common/top.jsp"></jsp:include>
	
	<div class="row p-5">
		<h2>admin 임시 링크</h2>
	
		<div class="col-12 mb-5">
			<a href="${ contextPath }/adminModifyJibsa.ad" class="btn btn-primary text-decoration-none fs-4">adminModifyJibsa</a>
		</div>
		<div class="col-12 mb-5">
			<a href="${ contextPath }/adminModifyMember.ad" class="btn btn-primary text-decoration-none fs-4">adminModifyMember</a>
		</div>
		<div class="col-12 mb-5">
			<a href="${ contextPath }/adminModifySchedule.ad" class="btn btn-primary text-decoration-none fs-4">adminModifySchedule</a>
		</div>
		<div class="col-12 mb-5">
			<a href="${ contextPath }/adminQuestionList.ad" class="btn btn-primary text-decoration-none fs-4">adminQuestionList</a>
		</div>
	</div>
	
	
	
</body>
</html>