<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style>
	.table thead tr th{background: rgba(224, 224, 224, 0.51);}
	.tablediv{
		width: 800px;
		text-align: center;
		display: block;
		margin: 0 auto;
	}
	.detail{
		cursor: pointer;
	}
	.detail:hover{text-decoration: underline;}
	#reviewbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 5px;
	}
	td{height: 50px;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
					 <h4 style="margin-right: 58%;"><b>회원 관리</b></h4>
					    <br><br>
					    <div class="tablediv">
						    <table class="table">
						    	<thead>
							    	<tr>
							    		<th>회원 번호</th>
							    		<th>이름</th>
							    		<th>아이디</th>
							    		<th>등록 동물 수</th>
							    		<th>가입 날짜</th>
							    		<th>신고내역</th>
							    	</tr>
						    	</thead>
						    	<tbody>
							    	<c:forEach items="${ mList }" var="m">
								    	<tr>
								    		<td>${m.memberNo }</td>
								    		<td>${m.memberName }</td>
								    		<td>${m.memberId }</td>
								    		<td>등록동물 수(수정 필요)</td>
								    		<td>가입날짜(수정 필요)</td>
								    		<td>
								    			<c:if test="${m.blackList gt 0}">${m.blackList}회</c:if>   
								    			<c:if test="${m.blackList eq 0}"></c:if>   
								    		</td>
								    	</tr>
							    	</c:forEach>
						    	</tbody>
					    	</table>
					    </div>
					</div>
					
					<div>
						<nav aria-label="Standard pagination example" style="float: center;">
							<ul class="pagination text-center">
			          			<li class="page-item">
			          				<c:url var="goBack" value="${ loc }">
			          					<c:if test="${ pi.currentPage-1 lt 1 }">
				          					<c:param name="page" value="1"></c:param>
			          					</c:if>
			          					<c:if test="${ pi.currentPage-1 gt 0 }">
				          					<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
			          					</c:if>
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
			          					<c:if test="${ pi.currentPage+1 gt pi.endPage }">
				          					<c:param name="page" value="${ pi.endPage }"></c:param>
			          					</c:if>
			          					<c:if test="${ pi.currentPage+1 le pi.endPage }">
				          					<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
			          					</c:if>
			          				</c:url>
			          				<a class="page-link" href="${ goNext }" aria-label="Next">
			          					<span aria-hidden="true">&raquo;</span>
			          				</a>
			          			</li>
			   				</ul>
			     		</nav>
		     		</div>
		     		
	            </div>
	        </div>
	    <br><br><br><br><br><br><br><br><br><br><br><br><br>
		
</body>
</html>