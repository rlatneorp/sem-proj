<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세페이지</title>
<style>
	td{height: 50px;}
	.table thead tr th{background: rgba(224, 224, 224, 0.51);}
	.tablediv{
		width: 800px;
		text-align: center;
		display: block;
		margin: 0 auto;
	}
	.jibsa{
		 width: 800px;
		 margin: 0 auto;
		 text-align: left;
	}
	#listbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 5px;
	 	width: 50px;
	}
 	#cancel:hover{color: black; text-decoraZtion: underline; cursor: pointer;}
 	#write{color: black; text-decoration: none;}
 	#write:hover{text-decoration: underline;}
 	#chat{color: black; text-decoration: none;}
 	#chat:hover{color: black; text-decoration: underline; cursor: pointer;}
 	#edit{color: black; text-decoration: none;}
</style>
</head>
<body>
<%@ include file="../common/top.jsp" %>
<%@ include file="../common/sideBar.jsp" %>
<div id="wrapper" class="toggled">
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <div class="container text-center">
        <h4 style="margin-right: 620px;"><b>예약 상세페이지</b></h4>
        <h6 style="margin-right: 570px;">나의 예약 현황을 살펴보세요!</h6>
        <p style="font-size: 12px; text-align: left; margin-left: 70px;">*매칭 취소는 후기 작성 상태를 클릭해서 진행할 수 있습니다.</p>
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
              <c:forEach items="${rList}" var="r">
                <c:if test="${r.matchingNo == param.matchingNo}">
                  <tr>
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
                                                    
                          // matchingStatus가 Y, 현재시간이 매칭 시간보다 크면 후기 작성에 대한 내용
                          // Y, 작으면 예약중 / N 이면 예약취소로 뜨게 함
                          if (matchingStatus === 'Y') {
                            if (new Date().getTime() > endDate${r.matchingNo}.getTime()) {
                              if (${empty r.reviewContent}) {
                                td${r.matchingNo}.innerHTML = '<a id="write" href="${contextPath}/writeReview.me?matchingNo=${param.matchingNo}">작성하기</a>';
                              } else {
                            	  td${r.matchingNo}.innerHTML = '<a id="edit">작성완료</a>';
                                  td${r.matchingNo}.addEventListener('mouseover', () => {
                                    td${r.matchingNo}.style.textDecoration = 'underline';
                                    td${r.matchingNo}.style.cursor = 'pointer';
                                    td${r.matchingNo}.innerHTML = '<a id="edit">수정하기</a>';
                                  });
                                  td${r.matchingNo}.addEventListener('mouseout', () => {
                                    td${r.matchingNo}.style.textDecoration = 'none';
                                    td${r.matchingNo}.style.cursor = 'auto';
                                    td${r.matchingNo}.innerHTML = '<a id="edit">작성완료</a>';
                                  });
                                  td${r.matchingNo}.addEventListener('click', () => {
                                    location.href = '${contextPath}/editReview.me?matchingNo=${param.matchingNo}';
                                  });
                              }
                            } else {
                            	td${r.matchingNo}.innerHTML = '<a id="cancel">예약중</a>';
                                td${r.matchingNo}.addEventListener('mouseover', () => {
                                  td${r.matchingNo}.style.textDecoration = 'underline';
                                  td${r.matchingNo}.style.cursor = 'pointer';
                                  td${r.matchingNo}.innerHTML = '<a id="cancel">매칭 취소</a>';
                                });
                                td${r.matchingNo}.addEventListener('mouseout', () => {
                                  td${r.matchingNo}.style.textDecoration = 'none';
                                  td${r.matchingNo}.style.cursor = 'auto';
                                  td${r.matchingNo}.innerHTML = '<a id="cancel">예약중</a>';
                                });
                                td${r.matchingNo}.addEventListener('click', () => {
                                	const confirmed = confirm('매칭을 취소하시겠습니까?');
                                    if (confirmed) {
                                    	location.href = '${contextPath}/cancelMatching.me?matchingNo=${param.matchingNo}';
                                    }
                                });
                            }
                          } else {
                            td${r.matchingNo}.innerText = '예약 취소';
                          }
	                      	
                        })();
                      </script>
                  </tr>
                </c:if>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <br><br>
        <div class="jibsa">
		  <h4><b>매칭 집사</b></h4><hr>
		  <c:forEach items="${rList}" var="r">
			  <c:if test="${r.matchingNo == param.matchingNo}">
			    <c:set var="found" value="false" /> <!-- 매칭에 해당하는 집사 정보를 아직 찾지 못했음을 표시 -->
			    <c:forEach items="${jList}" var="jibsa">
			      <c:if test="${jibsa.memberNo eq r.jibsaNo}">
			        <c:if test="${!found}"> <!-- 매칭에 해당하는 집사 정보를 아직 찾지 못한 경우에만 출력 -->
			          <span><b>[${jibsa.jibsaName}집사님]</b></span><br><br><br>
			          <b>간단 자기소개</b><hr>
			          <span>${jibsa.profileTitle}</span>
			          <c:set var="found" value="true" /> <!-- 매칭에 해당하는 집사 정보를 찾았음을 표시 -->
			        </c:if>
			      </c:if>
			    </c:forEach>
			  </c:if>
			</c:forEach>
		</div>
		<br><br>
		<div class="jibsa">
		  <h4><b>매칭 장소</b></h4><hr>
		  <c:forEach items="${rList}" var="r">
		    <c:if test="${r.matchingNo == param.matchingNo}">
		      <span>${r.matchingPlace}</span>
		    </c:if>
		  </c:forEach>
		</div>
        <br><br>
        <div class="jibsa">
  <h4><b>상담하기</b></h4><hr>
  <c:forEach items="${rList}" var="r">
    <c:if test="${r.matchingNo == param.matchingNo}">
      <span id="connect"><a href="${chat}" id="chat">카카오톡 오픈채팅방 연결하기</a></span>
    </c:if>
  </c:forEach>
</div>
        <br><br>
        <button onclick="location.href='javascript:history.back()'" style="margin-left: 750px;" id="listbtn">목록</button>
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
