<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">
<title>마이페이지</title>
<style>
*{font-family: 'Noto Sans KR', sans-serif;}
body {
  overflow-x: hidden;
}
.p-2{
  font-weight: bold;
  font-size: 18px;
  margin-left: 80px;
  text-align: left;
}
.p-4{
  width: 450px;
  height: 480px;
  border-radius: 10px;
  box-shadow: 0px 0px 14px gray;
  margin-left: 80px;
  display: inline-block;
}
.h4{
  margin-right: 300px;
}
.h6{
  margin-right: 200px;
}
.petImg{
  width: 350px;
  height: 250px;
  margin-left: 20px;
}
.info{
  margin-left: 30px;
}
.bold{
  width: 130px;
  height: 120px;
  font-size: 19px;
  font-weight: bold;
}
.nbold{
  font-size: 18px;
  width: 250px;
}
.p-5{
  width: 3px;
  height: 2px;
}
.inbtn{
  background: rgb(26, 188, 156);
  color: white;
  padding: 10px;
  border: none;
  border-radius: 10px;
}

 .table thead tr th{
 	background: rgba(224, 224, 224, 0.51);}
 .table {margin-left: 100px;}
 .tablediv{
	width: 50%;
	text-align: center;
	display: block;
	margin: 0 auto;
	margin-left: 10px;
  }
  
@media (max-width: 768px) {
  .p-4 {
    width: 50%;
    margin-left: 0;
  }
  
  .h4 {
    margin-right: 0;
  }
  .h6 {
    margin-right: 0;
  }
  .petImg {
    width: 100%;
    margin-left: 0;
  }
  .info {
    margin-left: 0;
  }
  .inbtn {
    margin-left: 0;
  }
}
</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/sideBar.jsp" %>
		<div id="wrapper" class="toggled">
	    	<div id="page-content-wrapper">
	        	<div class="container text-center">
				  <div class="row align-items-center">
				    <div class="col">
				      	<div class="p-2">대표 반려동물</div><br><br>
		                    <div class="p-4"><br>
			                    <c:if test="${ animal.isStatus eq 'Y' }">
				                	<h6 class="h6">${ animal.animalKind } / ${ animal.animalName } / ${ animal.animalGender }</h6><br>
				                	<c:if test="${ !empty image.memberNo }">
				                    	<img src="${ contextPath }/resources/uploadFiles/${ image.renameName }" width="90%" height="245"/><br><br><br>
				                    </c:if>
				                    <c:if test="${ empty image.memberNo }">
				                    	<br><br><br>내 반려동물의 사진을 등록해주세요<br><br><br>
				                    </c:if>
			                        <button class="inbtn" onclick="location.href='${ contextPath }/member_Pet_Insert_Edit.me'">수정하기</button>
			                   	</c:if>
  								<c:if test="${ animal.isStatus ne 'Y' }">
				                	<h4 class="h6">본인의 반려동물 정보를 등록해주세요</h4><br><br>
			                        <button class="inbtn" onclick="location.href='${ contextPath }/member_Pet_Insert.me'">등록하기</button>
			                    </c:if>
		                    </div>
				    	</div>				 
				    <div class="col">
				      	<div class="p-2">내 정보</div><br>
		                    <div class="p-4">
		                        <table class="info">
		                            <tr>
		                                <td class="bold">이름</td>
		                                <td class="nbold">${ loginUser.memberName }</td>
		                            </tr>
		                            <tr>
		                                <td class="bold">연락처</td>
		                                <td class="nbold">${ loginUser.memberPhone }</td>
		                            </tr>
		                            <tr>
		                                <td class="bold">찾아갈 주소</td>
		                                <td class="nbold">${ loginUser.memberAddress }</td>
		                            </tr>
		                        </table><br>
		                        <button class="inbtn" onclick="location.href='${contextPath}/member_EditInfo.me'">수정하기</button>
		                    </div>
				    </div><br><br>
				    </div>
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