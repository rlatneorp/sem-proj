<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminSideBar</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
			body {
			  overflow-x: hidden;
			}
			
			#wrapper {
			  padding-left: 0;
			  -webkit-transition: all 0.5s ease;
			  -moz-transition: all 0.5s ease;
			  -o-transition: all 0.5s ease;
			  transition: all 0.5s ease;
			}
			
			#wrapper.toggled {
 			  padding-left: 250px;
			}
			
			#sidebar-wrapper {
			  z-index: 1000;
			  position: fixed;
			  left: 250px;
			  width: 0;
			  height: 74%;
			  margin-left: -250px;
			  overflow-y: auto;
			  background: rgb(26, 188, 156);
			  -webkit-transition: all 0.5s ease;
			  -moz-transition: all 0.5s ease;
			  -o-transition: all 0.5s ease;
			  transition: all 0.5s ease;
			  border-right: 1px solid gray;
			}
			
			#wrapper.toggled #sidebar-wrapper {
			  width: 250px;
			}
			
			#page-content-wrapper {
			  width: 100%;
			  position: absolute;
			  padding: 15%;
			}
			
			#wrapper.toggled #page-content-wrapper {
			  position: absolute;
			  margin-right: -250px;
			}
			
			.sidebar-nav {
			  position: absolute;
			  top: 0;
			  width: 80%;
			  margin: 0;
			  padding: 0;
			  list-style: none;
			}
			
			.sidebar-nav li {
 			  text-indent: 20px;
 			  line-height: 40px;
			}
			
			.sidebar-nav .lab:hover {
			  text-decoration: none;
			  color: #fff;
			  cursor: pointer;
			}
			
			.sidebar-nav .lab:active, .sidebar-nav .lab:focus {
			  text-decoration: none;
			}
			
			.sidebar-nav>.sidebar-brand {
			  height: 65px;
			  font-size: 18px;
			  line-height: 60px;
			  color: black;
			  font-size: 25px;
			  padding-top: 10px;
			  padding-bottom: 90px;
			}
			
			@media(min-width:768px) {
			  #wrapper {
			    padding-left: 0;
			  }
			  #wrapper.toggled {
			    padding-left: 20%;
			  }
			  #sidebar-wrapper {
			    width: 0;
			  }
			  #wrapper.toggled #sidebar-wrapper {
			    width: 250px;
			  }
			  #page-content-wrapper {
			    padding: 20px;
			    position: relative;
			    padding-right: 220px;
			  }
			  #wrapper.toggled #page-content-wrapper {
			    position: relative;
			    margin-right: 0;
			  }
			}
</style>
</head>
<body>
<!-- 		<div id="wrapper" class="toggled"> -->
<!-- 	    	<div id="page-content-wrapper"> -->
<!-- 	        	<div class="container text-center"> -->
<!-- 				  <div class="row align-items-center"> -->
<!-- 				  </div> -->
<!-- 				</div> -->
<!-- 	    	</div> -->
<!-- 		</div> -->
			<!-- 각자 파일 생성하실 때 주석 처리된 코드를 가져가서 .row align-items-center div 안에 내용을 넣어야
				 sidebar랑 겹치지 않고 나올 것 같아요!! -->
			
		<div id="wrapper" class="toggled">
	        <div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand">관리자 페이지</li>
			  		<li><label class="lab" onclick="location.href='${contextPath}/admin_Member_Manage.ad'" >회원 관리</label><hr></li>  <!-- 일단 화면 이동은 href로 넣어놨어요 -->
					<li><label class="lab" onclick="location.href='${contextPath}/admin_Jibsa_Manage.ad'">집사 관리</label><hr></li>
					<li><label class="lab" onclick="location.href='${contextPath}/admin_Review_Manage.ad'">후기 게시판 관리</label><hr></li>
					<li><label class="lab" onclick="location.href='${contextPath}/admin_Matching_Manage.ad'">매칭 관리</label><hr></li>
					<li><label>- 고객센터 관리 -</label></li>
					<li><label class="lab" onclick="location.href='${contextPath}/admin_FAQ_Manage.ad'">자주묻는질문 관리</label></li>
					<li><label class="lab" onclick="location.href='${contextPath}/admin_QNA_Manage.ad'">1:1문의 관리</label></li>
				</ul>
			</div>
		</div>
		
</body>
</html>