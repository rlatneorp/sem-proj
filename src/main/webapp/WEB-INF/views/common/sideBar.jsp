<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			  	#modal { width: 320px; height: 250px; border: 1px solid #eee; padding: 50px; margin: auto; display: none;
						border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center; background-color: white;
						 position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;}
				
				#btn3 { background-color: #1abc9c; color:white; border: none; width: 100px; height: 35px;
						border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2); font-size: 13px;}
						
				#btn4 { background-color: lightgray; color:white; border: none; width: 100px; height: 35px;
						border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);}
</style>
</head>
<body>
		<div id="wrapper" class="toggled">
	        <div id="sidebar-wrapper">
				<ul class="sidebar-nav">
					<li class="sidebar-brand">마이페이지</li>
			  		<li><label onclick="location.href='${contextPath}/member_User_Info.me';" class="lab">내 정보</label><hr></li>
					<li><label class="lab" onclick="location.href='${contextPath}/member_Reservation.me';">예약 관리</label><hr></li>
					<li><label class="lab" onclick="location.href='${contextPath}/member_ServiceCenter.me';">고객센터</label></li>
					<c:if test="${ !empty loginUser }">
						<c:if test="${ loginUser.isJibsa eq 'Y' }">
							<li class="bot"><a style="cursor: pointer; margin-left: 20px; text-decoration: none;" href="${contextPath}/jibsa_Main.js">집사로 전환하기
								<img src="resources/image/button.png" id="inbtn1"/></a>
							</li>
						</c:if>
					</c:if>
					<c:if test="${ !empty loginUser }">
						<c:if test="${ loginUser.isJibsa eq 'N' }">
							<li class="bot"><a style="cursor: pointer; margin-left: 20px;" id="jib">집사로 전환하기
								<img src="resources/image/button.png" id="inbtn1"/></a>
							</li>
							<div id="modal">
								<h5>${ loginUser.memberName }님은 집사나라의 집사가 아닙니다!</h5><br>
								<h6>집사나라의 집사가 되어주시겠어요?</h6><br>
								<button type="submit" id="btn3" onclick="location.href='${contextPath}/enrollJibsa.js'">집사 지원하기</button>&nbsp;
								<button id="btn4">취소하기</button>
							</div>
						</c:if>
					</c:if>
				</ul>
			</div>
		</div>
		<script>
			const btn = document.getElementById('jib');
			const btn4 = document.getElementById('btn4');
			const modal = document.getElementById('modal');
			
			btn.addEventListener('click', () =>{
				modal.style.display = 'block';
			})
			
			btn4.addEventListener('click', () => {
				modal.style.display = 'none';
			})
		</script>
</body>
</html>