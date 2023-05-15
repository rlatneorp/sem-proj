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
						    		<th>집사활동여부</th>
						    		<th>분류</th>
						    	</tr>
					    	</thead>
					    	<tbody>
					    		<c:forEach items="${jList}" var="j">
							    	<tr>
							    		<td>${j.memberNo}</td>
							    		<td>
							    			<a href="${contextPath}/admin_Jibsa_Detail.ad?page=${page}&mId=${j.memberNo}">${j.memberName}</a>
						    			</td>
							    		
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
							    		<td>${j.isJibsa}</td>
							    		<td>
							    			<c:if test="${j.isTrainer eq 'Y'}">훈련사</c:if>
							    			<c:if test="${j.isTrainer ne 'Y'}">집사</c:if>
							    		</td>
							    	</tr>
						    	</c:forEach>
					    	</tbody>
				    	</table>
				    	
				    	
				    	<div>
							<%@ include file="../common/paging.jsp" %>
					
							<br>
							<div>
								<select class="search" style="padding: 3px 4px;">
									<option>제목</option>
									<option>이름</option>
									<option>아이디</option>
								</select>
								<input type="text" style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;">
								<button onclick="location.href='';"  style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;">조회</button>
								<button onclick="location.href='QnA_main.jsp';"  style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;">목록</button>
							</div>
			     		</div>
				    </div>
				</div>
            </div>
        </div>
	</div>
	    <br><br><br><br><br><br><br><br><br><br><br><br><br>
		
</body>
</html>