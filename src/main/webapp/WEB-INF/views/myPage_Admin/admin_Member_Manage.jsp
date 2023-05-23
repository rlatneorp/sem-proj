<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,700,0,0" />
<style>
	.table thead tr th{background: rgba(224, 224, 224, 0.51);}
	.tablediv{
		width: 800px;
		text-align: center;
		display: block;
		margin: 0 auto;
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
					    <div class="tablediv">
							<h4 class="text-start"><b>회원 관리</b></h4>
					    	<form method="post" action="admin_Members_Update.ad">
								<table class="table">
						    		<input type="hidden" name="selectType" value="">
							    	<div class="d-flex justify-content-end mb-2 me-1">
							    		<span onclick="memberActive()" class="material-symbols-outlined me-3" style="font-size: 40px; cursor:pointer;">refresh</span>
							    		<span onclick="memberDelete()" class="material-symbols-outlined" style="font-size: 40px; cursor:pointer;">delete</span>	
							    	</div>
							    	<thead>
								    	<tr>
								    		<th>회원 번호</th>
								    		<th>이름</th>
								    		<th>아이디</th>
								    		<th>등록 동물 수</th>
								    		<th>가입 날짜</th>
								    		<th>상태여부</th>
								    		<th><label for="allSelect">모두선택 &nbsp</label><input type="checkbox" name="allSelect" id="allSelect"></th>
								    	</tr>
							    	</thead>
							    	<tbody>
								    	<c:forEach items="${ mList }" var="m">
									    	<tr>
									    		<td>${m.memberNo }</td>
									    		<td><a href="${contextPath}/admin_Member_Detail.ad?page=${pi.currentPage}&mId=${m.memberNo}">${m.memberName }</a></td>
									    		<td>${m.memberId }</td>
									    		<td>${m.animalCount }</td>
									    		<td>${m.enrollDate}</td>
									    		<td>${m.memberStatus}</td>
									    		<td><label for="s${m.memberNo}">선택&nbsp</label><input type="checkbox" id="s${m.memberNo}" name="select" value="${m.memberNo}"></td>
									    	</tr>
								    	</c:forEach>
							    	</tbody>
						    	</table>
					    	</form>
					
							<%@ include file="../common/paging.jsp" %>
							
							<br>
							<form>
								<div>
									<input type="hidden" name="page" value="${pi.currentPage}"> 
									<select name="searchType" class="search" style="padding: 3px 4px;">
										<c:if test="${empty searchType}">
											<option value="name">이름</option>
											<option value="id">아이디</option>
										</c:if>
										<c:if test="${searchType eq 'name'}">
											<option value="name" selected>이름</option>
											<option value="id">아이디</option>
										</c:if>
										<c:if test="${searchType eq 'id'}">
											<option value="name">이름</option>
											<option value="id" selected>아이디</option>
										</c:if>
									</select>
									<input type="text" name="searchText" style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;" value="${searchText}">
									<button onclick="location.href='${contextPath}/admin_Member_Manage.ad'"  style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;">검색</button>
								</div>
							</form>
			     		</div>
	     			</div>
				</div>
			</div>
		</div>
	</div>
	    <br><br><br><br><br><br><br><br><br><br><br><br><br>
		
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
			
			function memberActive(){
				document.getElementsByName('selectType')[0].value="active";
				document.getElementsByTagName('form')[0].submit();
			}
			function memberDelete(){
				document.getElementsByName('selectType')[0].value="delete";
				document.getElementsByTagName('form')[0].submit();
			}
		
		</script>
		
</body>
</html>