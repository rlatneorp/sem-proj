<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 관리</title>
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
					 <h4 style="margin-right: 58%;"><b>집사 관리</b></h4>
					    <br><br>
					    <div class="tablediv">
						    <table class="table">
						    	<thead>
							    	<tr>
							    		<th>회원 번호</th>
							    		<th>이름</th>
							    		<th>지원서 제출여부</th>
							    		<th>희망시급</th>
							    		<th>프리미엄가입</th>
							    		<th>프리미엄가입일자</th>
							    		<th>프리미엄종료일자</th>
							    		<th>분류</th>
							    	</tr>
						    	</thead>
						    	<tbody>
						    		<c:forEach items="${jList}" var="j">
								    	<tr>
								    		<td>${j.memberNo}</td>
								    		<td>${j.memberName}</td>
								    		<td>
								    			<c:if test="${j.motive eq null}"></c:if>
								    			<c:if test="${j.motive ne null}">제출완료</c:if>
								    		</td>
								    		<td>${j.exptectedSalary}</td>
								    		<td>
								    			<c:if test="${j.isPrimium eq 'Y'}">가입</c:if>
								    			<c:if test="${j.isPrimium eq 'Y'}"></c:if>
								    		</td>
								    		<td>${j.primiumPaymentDate}</td>
								    		<td>${j.primiumEndDate}</td>
								    		<td>
								    			<c:if test="${j.isTrainer eq 'Y'}">훈련사</c:if>
								    			<c:if test="${j.isTrainer ne 'Y'}">집사</c:if>
								    		</td>
								    	</tr>
							    	</c:forEach>
						    	</tbody>
					    	</table>
					    	
					    	
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
	            </div>
	        </div>
	    <br><br><br><br><br><br><br><br><br><br><br><br><br>
		
</body>
</html>