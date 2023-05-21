<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.table thead tr th{background: rgba(224, 224, 224, 0.51);}
	.tablediv{
		width: 800px;
		text-align: center;
		display: block;
		margin: 0 auto;
	}
	.pagination { display: flex; justify-content: center; align-items: center; }

	.pagination a { color: #1abc9c; }

	.pagination a:hover {color: black;}
	.faqbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 10px;
	}
	#faqbtn{text-align: left; width: 800px; margin: 0 auto;}
	#box{padding: 3px 4px;}
	.search{
		border-radius: 8px; padding: 3px 3px; border: 1px solid gray;
		margin-right: 5px;
	}
	button{
		width: 60px; height: 33px;
		background-color: white;
	}
 	.write{
 		display:inline-block; margin-left: 94%; width: 60px; height: 50px; justify-content: center; align-items: center;
 	}
 	#write{
 		border: 1px solid gray; margin-left: 92%; width: 65px; height: 40px; border-radius: 10px;
 		margin-bottom: -90px;
 	}
 	#detail{cursor: pointer;}
 	#detail:hover {text-decoration: underline;}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid text-center">
	        	<div class="container text-center">
				    <br>
					<div class="tablediv" id="faqD">
					    <table class="table">
							<h4 class="text-start"><b>자주 묻는 질문 관리</b></h4>
						    <form method="post" action="admin_FAQs_Update.ad">
					    		<input type="hidden" name="selectType" value="">
						    	<div class="d-flex justify-content-end mb-2 me-1">
						    		<span onclick="FaqActive()" class="material-symbols-outlined me-3" style="font-size: 40px; cursor:pointer;">refresh</span>
						    		<span onclick="FaqDelete()" class="material-symbols-outlined" style="font-size: 40px; cursor:pointer;">delete</span>	
					    		</div>
						    	<thead>
							    	<tr>
							    		<th>글 번호</th>
							    		<th>제목</th>
							    		<th>작성자</th>
							    		<th>작성일</th>
							    		<th>활성화</th>
							    		<th><label for="allSelect">모두선택 &nbsp</label><input type="checkbox" name="allSelect" id="allSelect"></th>
							    	</tr>
						    	</thead>
						    	<tbody>
						    		<c:forEach items="${fList}" var="f">
								    	<tr>
								    		<td>${f.faqNo}</td>
								    		<td>
								    			<a href="${contextPath}/admin_FAQ_Detail.ad?fId=${f.faqNo}">${f.faqTitle}</a>
								    		</td>
								    		<td>${f.faqWriter}</td>
								    		<td>${f.faqCreateDate}</td>
								    		<td>
								    			<c:if test="${f.faqStatus eq 'Y'}">활성화</c:if>
								    			<c:if test="${f.faqStatus eq 'N'}">비활성화</c:if>
								    		</td>
								    		<td><label for="s${f.faqNo}">선택&nbsp</label><input type="checkbox" id="s${f.faqNo}" name="select" value="${f.faqNo}"></td>
								    	</tr>
								    </c:forEach>
						    	</tbody>
						    </form>
				    	</table>
				    </div>
				    	<button id="write" onclick="location='${contextPath}/admin_FAQ_Write.ad'">글쓰기</button>
			    </div>
			    <br>
				    
			    <%@ include file="../common/paging.jsp" %>
				
				<br>
				<form>
					<div>
						<input type="hidden" name="page" value="${pi.currentPage}"> 
						<select name="searchType" class="search" style="padding: 3px 4px;">
							<c:if test="${searchType eq null}">
								<option value="title">제목</option>
								<option value="content">내용</option>
							</c:if>
							<c:if test="${searchType eq 'title'}">
								<option value="title" selected>제목</option>
								<option value="content">내용</option>
							</c:if>
							<c:if test="${searchType eq 'content'}">
								<option value="title">제목</option>
								<option value="content" selected>내용</option>
							</c:if>
						</select>
						<input type="text" name="searchText" style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;" value="${searchText}">
						<button onclick="location.href='${contextPath}/admin_FAQ_Manage.ad'"  style="border-radius: 8px; padding: 3px 3px; border: 1px solid gray; margin-right: 5px;">검색</button>
					</div>
				</form>
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
		
		function FaqActive(){
			document.getElementsByName('selectType')[0].value="active";
			document.getElementsByTagName('form')[0].submit();
		}
		function FaqDelete(){
			document.getElementsByName('selectType')[0].value="delete";
			document.getElementsByTagName('form')[0].submit();
		}
	
	</script>
		
		
</body>
</html>