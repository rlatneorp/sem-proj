<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
<title>집사나라 - 로그인</title>
<style>
.material-symbols-outlined{border-color: rgb(166, 166, 166); text-align: center; padding : 10px 0; border-left-radius: 4px; background: rgb(237, 237, 237); display: block; width: 47px; height: 47px; font-variation-settings: 'FILL' 1, 'wght' 700, 'GRAD' 200, 'opsz' 40; color: rgb(166, 166, 166); margin-right: -6px;  border-left: solid 1px; border-bottom: solid 1px; border-top: solid 1px; vertical-align:middle; border-bottom-left-radius: 4px; border-top-left-radius: 4px; }
.login1{box-shadow: 0px 0px 14px rgb(67, 154, 151); border-radius: 25px; width:437px; height: 618px; text-align: center; margin-left: 725px;}
#loginLogo{width: 472px; margin-top: -70px;}
#loginId{width: 203px; height:47px; vertical-align:middle; border-bottom: solid 1px rgb(166, 166, 166); border-right: solid 1px rgb(166, 166, 166); border-top: solid 1px rgb(166, 166, 166); border-bottom-right-radius: 4px; border-top-right-radius: 4px; border-left: none;}
#person{display: inline;}
#userName{text-align: center; margin-top: -200px;}
#loginPwd{width: 203px; height:47px; vertical-align:middle; border-bottom: solid 1px rgb(166, 166, 166); border-right: solid 1px rgb(166, 166, 166); border-top: solid 1px rgb(166, 166, 166); border-bottom-right-radius: 4px; border-top-right-radius: 4px; border-left: none;}
#person{display: inline;}
#password{text-align: center;}
#loginBtn{width: 168px; height: 44px; border: none; border-radius: 25px; color: white; background: rgb(26, 188, 156);}
#loginBtn{box-shadow: 0px 0px 15px 5px rgb(224, 224, 224);font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none;}
#loginBot{display: inline;}
#top_hr{border: 20px solid rgb(26, 188, 156); opacity: 1; margin: 0;}
</style>
</head>
<body>
	<hr id="top_hr">
	<br><br><br><br><br>
	<div class="login1">
		<a href="${ contextPath }"><img src="resources/image/loginLogo.png" id="loginLogo"></a>
		<form action="${ contextPath }/login.do" method="post" id="form">
		<div id="loginBox"> 
			<div id="userName">
				<div id="person">
					<span class="material-symbols-outlined d-inline-block">person</span>
				</div> 
				<input type="text" placeholder=" 아이디" id="loginId" name="memberId" required>
				
			</div>
			<br>
			<div id="password">
				<div id="person">
					<span class="material-symbols-outlined d-inline-block">vpn_key</span>
				</div> 
				<input type="password" placeholder=" 비밀번호" id="loginPwd" name="memberPwd" required>
			</div> 
		</div>
		<br><br><br><br><br>
		<div id="btnDiv"><button id="loginBtn" name="login">로그인</button></div>
		</form>
		<br>
		<div id="loginBot"><a href="${ contextPath }/searchId.do"> 아이디 찾기 </a> | <a href="${ contextPath }/searchPwd.do"> 비밀번호 찾기 </a> | <a href="${ contextPath }/enroll.do"> 회원가입 </a></div>
		<br><br>
	</div>
	<br><br><br><br><br><br><br><br><br><br>
</body>
</html>