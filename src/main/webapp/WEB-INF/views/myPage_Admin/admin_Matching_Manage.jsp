<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 관리</title>
<style>
	.table thead tr th{background: rgba(224, 224, 224, 0.51);}
	.tablediv{
		width: 1000px;
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
					 <h4 class="text-start"><b>매칭 관리</b></h4>
					    <br>
				    		<div class="tablediv" id="faqD">
							    <table class="table">
								    <form method="post" action="admin_Matchings_Update.ad">
							    		<input type="hidden" name="selectType" value="">
								    	<div class="d-flex justify-content-end mb-2 me-1">
								    		<span onclick="matchingActive()" class="material-symbols-outlined me-3" style="font-size: 40px; cursor:pointer;">refresh</span>
								    		<span onclick="matchingDelete()" class="material-symbols-outlined" style="font-size: 40px; cursor:pointer;">delete</span>	
								    	</div>
								    	<thead>
									    	<tr>
									    		<th>매칭번호</th>
									    		<th>이용자</th>
									    		<th>집사</th>
									    		<th>시작시간</th>
									    		<th>종료시간</th>
									    		<th>매칭장소</th>
									    		<th>상태여부</th>
									    		<th><label for="allSelect">모두선택 &nbsp</label><input type="checkbox" name="allSelect" id="allSelect"></th>
									    	</tr>
								    	</thead>
								    	<tbody>
								    		<c:forEach items="${mcList}" var="mc">
										    	<tr>
										    		<td>${mc.matchingNo}</td>
										    		<td>
										    			<a href="${contextPath}/admin_Matching_Detail.ad?page=${pi.currentPage}&mcId=${mc.matchingNo}">
										    				${mc.memberName}
										    			</a>
									    			</td>
										    		<td>${mc.jibsaName}</td>
										    		<td>${fn:substring(mc.startDate,0,10)} ${fn:substring(mc.startDate,11,13)}:${fn:substring(mc.startDate,13,15)}</td>
										    		<td>${fn:substring(mc.endDate,0,10)} ${fn:substring(mc.endDate,11,13)}:${fn:substring(mc.endDate,13,15)}</td>
										    		<td class="w-25">${fn:substring(mc.matchingPlace,0,18)}</td>
										    		<td>${mc.matchingStatus}</td>
										    		<td><label for="s${mc.matchingNo}">선택&nbsp</label><input type="checkbox" id="s${mc.matchingNo}" name="select" value="${mc.matchingNo}"></td>
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
												<option value="user">이용자</option>
												<option value="jibsa">집사</option>
											</c:if>
											<c:if test="${searchType eq 'user'}">
												<option value="user" selected>이용자</option>
												<option value="jibsa">집사</option>
											</c:if>
											<c:if test="${searchType eq 'jibsa'}">
												<option value="user">이용자</option>
												<option value="jibsa" selected>집사</option>
											</c:if>
										</select>
										<input type="text" name="searchText" style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;" value="${searchText}">
										<button onclick="location.href='${contextPath}/admin_Matching_Manage.ad'"  style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;">검색</button>
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
			
			function matchingActive(){
				document.getElementsByName('selectType')[0].value="active";
				document.getElementsByTagName('form')[0].submit();
			}
			function matchingDelete(){
				document.getElementsByName('selectType')[0].value="delete";
				document.getElementsByTagName('form')[0].submit();
			}
		
		</script>
		
</body>
</html>