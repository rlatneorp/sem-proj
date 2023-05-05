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
<title>집사나라 - 아이디 찾기</title>
<style>
#top_hr{border: 20px solid rgb(26, 188, 156); opacity: 1; margin: 0;}
.foundId2{text-align: center; width:472px; margin-left: 725px;}
#foundId2{margin-top: -200px;}
#foundIdLogo{width: 472px; text-align: center; display: inline;}
#foundIdTitle{text-align: center; font-size: 24px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; margin: 10px; text-decoration: none;}
#foundedId1{font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
#foundedId2{font-size: 21px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
#foundedId3{font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
#foundedId4{font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
.foundedId{text-align: left;}
#login{box-shadow:0px 0px 15px 5px rgb(224, 224, 224); border: none; border-radius: 25px; width: 168px; height: 44px; font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; text-decoration: none; color: white; background: rgb(26, 188, 156);}
#foundPwd{box-shadow:0px 0px 15px 5px rgb(224, 224, 224); border: none; border-radius: 25px; width: 168px; height: 44px; font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; text-decoration: none; color: white; background: rgb(26, 188, 156);}
</style>
</head>
<body>
<hr id="top_hr">
<form> 
	<div class="foundId2">
		<img src="resources/image/loginLogo.png" id="foundIdLogo">
		<br><br>
		<div id="foundId2"> 
			<a id="foundIdTitle">아이디 찾기</a>
			<div class="foundedId"> 
				<br><br><br>
				<a id="foundedId1">${ username }</a>
				<a id="foundedId3">님의 아이디는</a>
				<br><br>
				<input type="text" id="foundedId2">
				<a id="foundedId4"> 입니다.</a>
				<br><br>
			</div>
			<br><br><br><br>
			<div>
				<button type="submit" id="login">로그인</button>	
				&nbsp;&nbsp;&nbsp;
				<button type="submit" id="foundPwd">비밀번호 찾기</button>	
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br><br>
</form>
</body>
</html>