<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집사 관리</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@40,700,0,0" />
<style>
	.table thead tr th{background: rgba(224, 224, 224, 0.51);}
	.tablediv{
		width: 1000px;
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
						<h4 class="text-start"><b>집사 관리</b></h4>
					    <table class="table">
						    <form method="post" action="admin_Jibsas_update.ad">
					    		<input type="hidden" name="selectType" value="">
						    	<div class="d-flex justify-content-end mb-2 me-1">
						    		<span onclick="jibsaActive()" class="material-symbols-outlined me-3" style="font-size: 40px; cursor:pointer;">refresh</span>
						    		<span onclick="jibsaDelete()" class="material-symbols-outlined" style="font-size: 40px; cursor:pointer;">delete</span>	
						    	</div>
						    	<thead>
							    	<tr>
							    		<th>회원 번호</th>
							    		<th>이름</th>
							    		<th>지원서 제출</th>
							    		<th>희망시급</th>
							    		<th>프리미엄</th>
							    		<th>프리미엄가입</th>
							    		<th>프리미엄종료</th>
							    		<th>분류</th>
							    		<th>상태여부</th>
								    	<th><label for="allSelect">모두선택 &nbsp</label><input type="checkbox" name="allSelect" id="allSelect">
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
								    		<td>
												<c:if test="${j.expectedSalary gt 999 }">
													<fmt:formatNumber type="number" pattern="###,###,###" value="${j.expectedSalary}"/>원
												</c:if>
											</td>
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
								    		<td>${j.jibsaStatus}</td>
								    		<td><label for="s${j.memberNo}">선택&nbsp</label><input type="checkbox" id="s${j.memberNo}" name="select" value="${j.memberNo}"></td>
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
									<option value="name">이름</option>
								</select>
								<input type="text" name="searchText" style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;" value="${searchText}">
								<button onclick="location.href='${contextPath}/admin_Jibsa_Manage.ad'"  style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;">검색</button>
							</div>
						</form>
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
		
		function jibsaActive(){
			document.getElementsByName('selectType')[0].value="active";
			document.getElementsByTagName('form')[0].submit();
		}
		function jibsaDelete(){
			document.getElementsByName('selectType')[0].value="delete";
			document.getElementsByTagName('form')[0].submit();
		}
	
	</script>	
		
		
</body>
</html>