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
								    		<td><a href="${contextPath}/admin_Member_Detail.ad?page=${pi.currentPage}&mId=${m.memberNo}">${m.memberName }</a></td>
								    		<td>${m.memberId }</td>
								    		<td>등록동물 수(수정 필요)</td>
								    		<td>${m.enrollDate}</td>
								    		<td>
								    			<c:if test="${m.blackList gt 0}">${m.blackList}회</c:if>   
								    			<c:if test="${m.blackList eq 0}"></c:if>   
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