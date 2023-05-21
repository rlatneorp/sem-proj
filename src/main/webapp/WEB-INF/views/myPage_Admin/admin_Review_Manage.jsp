<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판 관리</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,700,0,0" />
<style>
	.table thead tr th{background: rgba(224, 224, 224, 0.51);}
	.tablediv{
		width: 800px;
		text-align: center;
		display: block;
		margin: 0 auto;
	}

	button{
		width: 60px; height: 33px;
		background-color: white;
	}
	
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
					    <br>
					    <div id="faqbtn" class="text-start">
				 			<h4><b>후기 게시판 관리</b></h4>
				    		<div class="tablediv" id="faqD">
							    <table class="table">
								    <form method="post" action="admin_Reviews_Update.ad">
							    		<input type="hidden" name="selectType" value="">
								    	<div class="d-flex justify-content-end mb-2 me-1">
								    		<span onclick="reviewActive()" class="material-symbols-outlined me-3" style="font-size: 40px; cursor:pointer;">refresh</span>
								    		<span onclick="reviewDelete()" class="material-symbols-outlined" style="font-size: 40px; cursor:pointer;">delete</span>	
								    	</div>
								    	<thead>
									    	<tr>
									    		<th>리뷰번호</th>
									    		<th class="w-50">내용</th>
									    		<th>작성자</th>
									    		<th>조회수</th>
									    		<th>상태여부</th>
									    		<th><label for="allSelect">모두선택 &nbsp</label><input type="checkbox" name="allSelect" id="allSelect"></th>
									    	</tr>
								    	</thead>
								    	<tbody>
								    		<c:forEach items="${rList}" var="r">
										    	<tr>
										    		<td>${r.matchingNo}</td>
										    		<td>
										    			<c:if test="${r.reviewContent eq null }">
										    				<a href="${contextPath}/admin_Review_Detail.ad?page=${pi.currentPage}&rId=${r.matchingNo}">-미작성-</a>
										    			</c:if>
										    			<c:if test="${r.reviewContent ne null }">
										    				<a href="${contextPath}/admin_Review_Detail.ad?page=${pi.currentPage}&rId=${r.matchingNo}">${fn:substring(r.reviewContent, 0, 26)}</a>
										    			</c:if>
									    			</td>
										    		<td>${r.memberName}</td>
										    		<td>${r.reviewCount}</td>
										    		<td>${r.reviewStatus}</td>
										    		<td><label for="s${r.matchingNo}">선택&nbsp</label><input type="checkbox" id="s${r.matchingNo}" name="select" value="${r.matchingNo}"></td>
										    	</tr>
										    </c:forEach>
								    	
								    	</tbody>
							    	</form>
						    	</table>
	  					    	
								<%@ include file="../common/paging.jsp" %>
						
								<br>
								<form>
									<div>
										<input type="hidden" name="page" value="${pi.currentPage}"> 
										<select name="searchType" class="search" style="padding: 3px 4px;">
											<c:if test="${searchType eq null}">
												<option value="content">내용</option>
												<option value="writer">작성자</option>
											</c:if>
											<c:if test="${searchType eq 'content'}">
												<option value="content" selected>내용</option>
												<option value="writer">작성자</option>
											</c:if>
											<c:if test="${searchType eq 'writer'}">
												<option value="content">내용</option>
												<option value="writer" selected>작성자</option>
											</c:if>
										</select>
										<input type="text" name="searchText" style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;" value="${searchText}">
										<button onclick="location.href='${contextPath}/admin_Review_Manage.ad'"  style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;">검색</button>
									</div>
								</form>
						    </div>
					    </div>
					</div>
	            </div>
	        </div>
		</div>
	    <br><br><br><br><br><br><br><br><br><br><br><br><br>
		<footer>
			<%@ include file="../common/bottom.jsp" %>
		</footer>
		
		<script>
			const allSelect = document.getElementById('allSelect');
			const selectBoxs = document.getElementsByName('select');
			
			window.onload = () =>{
				let count = 0;
				allSelect.addEventListener('click', ()=>{
					if(allSelect.checked){
						count = selectBoxs.length;
						for(const sel of selectBoxs){
							sel.checked = true;
						}
					}else if(!allSelect.checked){
						count = 0;
						for(const sel of selectBoxs){
							sel.checked = false;
							
						}
					}
				});
				for(const sel of selectBoxs){
					sel.addEventListener('click', ()=>{
						if(!sel.checked){
							allSelect.checked = false;
							count--;
						}else if(sel.checked){
							count++;
							for(const del of selectBoxs){
								if(sel.checked){
									if(count == selectBoxs.length){
										allSelect.checked = true;
									}
								}
							}
						}
					})
				};
			}
			
			function reviewActive(){
				document.getElementsByName('selectType')[0].value="active";
				document.getElementsByTagName('form')[0].submit();
			}
			function reviewDelete(){
				document.getElementsByName('selectType')[0].value="delete";
				document.getElementsByTagName('form')[0].submit();
			}
		
		</script>
</body>
</html>