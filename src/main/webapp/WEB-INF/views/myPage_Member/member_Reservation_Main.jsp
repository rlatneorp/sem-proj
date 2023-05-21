<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<%@ include file="../common/sideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
					 <h4 style="margin-right: 58%;"><b>예약 관리</b></h4>
					 <h6 style="margin-right: 48%;">나의 예약 현황을 살펴보세요!</h6><br>
					    <br>
					    <div class="tablediv">
						    <table class="table">
						    	<thead>
						    	<tr>
						    		<th>예약 번호</th>
						    		<th>예약 서비스</th>
						    		<th>예약 날짜</th>
						    		<th>예약 시간</th>
						    		<th>매칭 반려동물</th>
						    		<th>후기 작성</th>
						    	</tr>
						    	</thead>
						    	<tbody>
						    	<c:choose>
						    		<%-- 예약 내역 없을 때 --%>
								    <c:when test="${empty rList}">
								        <tr>
								            <td colspan="6">아직 예약 내역이 없습니다.</td>
								        </tr>
								    </c:when>
								    <c:otherwise>
								    	<%-- 예약 내역 있을 때 --%>
								        <c:forEach items="${rList}" var="r">
								            <tr onclick="location.href='${contextPath}/reservationDetail.me?matchingNo=${ r.matchingNo }&jibsaNo=${ r.jibsaNo }'" class="detail">
								                <td>${r.matchingNo}</td>
								                <td>${r.serviceType}</td>
								                <td>${fn:substring(r.startDate, 0, 10)}</td>
								                <td>${fn:substring(r.startDate, 11, 13)}:${fn:substring(r.startDate, 13, 14)}0~${fn:substring(r.endDate, 11, 13)}:${fn:substring(r.endDate, 13, 14)}0</td>
								                <td>${animal.animalName}</td>
								                <td id="td-${r.matchingNo}">
								                    <script>
								                        (function() {
								                            const td${r.matchingNo} = document.getElementById('td-${r.matchingNo}');
								                            const endDate${r.matchingNo} = new Date('${fn:substring(r.endDate, 0, 10)}');
								                            const matchingStatus = '${r.matchingStatus}';
								                            
								                            // matchingStatus가 Y, 현재시간이 매칭 시간보다 크면 후기 작성에대한 내용
								                            // Y, 작으면 예약중 / N 이면 예약취소로 뜨게함
								                            if (matchingStatus === 'Y') {
								                                if (new Date().getTime() > endDate${r.matchingNo}.getTime()) {
								                                    if (${r.reviewContent != null}) {
								                                        td${r.matchingNo}.innerText = '작성 완료';
								                                    } else {
								                                        td${r.matchingNo}.innerText = '미작성';
								                                    }
								                                } else {
								                                    td${r.matchingNo}.innerText = '예약중';
								                                }
								                            } else {
								                                td${r.matchingNo}.innerText = '예약 취소';
								                            }
								                        })();
								                    </script>
								                </td>
								            </tr>
								        </c:forEach>
								    </c:otherwise>
								</c:choose>
						    	</tbody>
					    	</table>
					    </div>
					    <br>
					    <!-- 예약 내역이 없으면 페이징 숨김 -->
					    <c:if test="${ !empty rList }">
					    <div>
							<nav aria-label="Standard pagination example" style="float: center; margin-left: 400px;">
								<ul class="pagination">
									<li class="page-item">
										<c:url var="goBack" value="${ loc }">
											<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
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
											<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
										</c:url>
										<a class="page-link" href="${ goNext }" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</ul>
							</nav>
						</div>
						</c:if>
					    </div>
					</div>
	            </div>
	        </div>
	    <br><br><br><br><br><br><br><br><br><br><br><br><br>
		<footer>
			<%@ include file="../common/bottom.jsp" %>
		</footer>
</body>
</html>