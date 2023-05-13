<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sideBar</title>
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
			  height: 70%;
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
			#inbtn1{
			  	color: black;
			  	display: inline-block;
			    line-height: 1.5;
			    text-decoration: none;
			    border: none;
			    width: 30px;
			    height: 30px;
			    padding-bottom: 3px;
			    cursor: pointer;
			  }
			  .bot{
			  	padding-top: 70%; margin-left: 5px;
			  }
</style>
</head>
<body>
		<div id="wrapper" class="toggled">
	        <div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand">마이페이지</li>
			  		<li><label onclick="location.href='${contextPath}/myPage.me';" class="lab">내 정보</label><hr></li>
					<li><label class="lab" onclick="location.href='${contextPath}/reservation.me';">예약 관리</label><hr></li>
					<li><label class="lab" onclick="location.href='${contextPath}/serviceCenter.me';">고객센터</label></li>
					<li class="bot"><label for="inbtn1" style="cursor: pointer;">집사로 전환하기</label>
						<img src="../../img/button.png" id="inbtn1"/>
					</li>
				</ul>
			</div>
		</div>
</body>
</html>