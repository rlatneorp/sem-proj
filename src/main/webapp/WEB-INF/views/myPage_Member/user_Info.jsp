<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
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

@media (max-width: 768px) {
  .p-4 {
    width: 100%;
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
				      	<div class="p-2">내 반려동물</div><br>
		                    <div class="p-4">
		                        <h4 class="h4">코코</h4>
		                        <h6 class="h6">강아지 / 소형 / 여</h6><br>
		                        <img src="#" class="petImg"/><br><br><br>
		                        <button class="inbtn" onclick="location.href='petInsert.jsp';">더 등록하기</button>
		                    </div>
				    	</div>
				    <div class="col">
				      	<div class="p-2">내 정보</div><br>
		                    <div class="p-4">
		                        <table class="info">
		                            <tr>
		                                <td class="bold">이름</td>
		                                <td class="nbold">홍길동</td>
		                            </tr>
		                            <tr>
		                                <td class="bold">연락처</td>
		                                <td class="nbold">010-1010-1010</td>
		                            </tr>
		                            <tr>
		                                <td class="bold">찾아갈 주소</td>
		                                <td class="nbold">서울시 중구 남대문로1</td>
		                            </tr>
		                        </table><br>
		                        <button class="inbtn" onclick="location.href='edit.jsp';">수정하기</button>
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
</body>
</html>