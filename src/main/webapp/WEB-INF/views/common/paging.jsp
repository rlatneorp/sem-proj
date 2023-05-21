<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paging</title>
<style>
	.pagination a { color: #1abc9c; }
</style>
</head>
<body>
	<div>
		<nav aria-label="Standard pagination example">
			<ul class="pagination justify-content-start">
				<li class="page-item">
					<c:url var="goBack" value="${ loc }">
	       				<c:if test="${ pi.currentPage-1 lt 1 }">
	        				<c:param name="page" value="1"></c:param>
	        				<c:param name="searchType" value="${searchType}"></c:param>
	        				<c:param name="searchText" value="${searchText}"></c:param>
	       				</c:if>
	       				<c:if test="${ pi.currentPage-1 gt 0 }">
	        				<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
	        				<c:param name="searchType" value="${searchType}"></c:param>
	        				<c:param name="searchText" value="${searchText}"></c:param>
	       				</c:if>
	      			</c:url>
	       			<a class="page-link" href="${ goBack }" aria-label="Previous">
	       				<span aria-hidden="true">&laquo;</span>
	        		</a>
	       		</li>
	    		<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	      			<c:url var="goNum" value="${ loc }">
	      				<c:param name="page" value="${ p }"></c:param>
        				<c:param name="searchType" value="${searchType}"></c:param>
        				<c:param name="searchText" value="${searchText}"></c:param>
	      			</c:url>
	    			<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	   			</c:forEach>
	      		<li class="page-item">
	       			<c:url var="goNext" value="${ loc }">
	       				<c:if test="${ pi.currentPage+1 gt pi.endPage }">
	       					<c:param name="page" value="${ pi.endPage }"></c:param>
	        				<c:param name="searchType" value="${searchType}"></c:param>
	        				<c:param name="searchText" value="${searchText}"></c:param>
	       				</c:if>
	       				<c:if test="${ pi.currentPage+1 le pi.endPage }">
	       					<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
	        				<c:param name="searchType" value="${searchType}"></c:param>
	        				<c:param name="searchText" value="${searchText}"></c:param>
	       				</c:if>
	       			</c:url>
	       			<a class="page-link" href="${ goNext }" aria-label="Next">
	       				<span aria-hidden="true">&raquo;</span>
	       			</a>
	       		</li>
			</ul>
	  	</nav>
	</div>
</body>
</html>