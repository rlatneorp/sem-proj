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
.pwdSet{text-align: center; width:472px; margin-left: 725px;}
#pwdSet{margin-top: -200px;}
#pwdSetLogo{width: 472px; text-align: center; display: inline;}
#pwdSetTitle{text-align: center; font-size: 24px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; margin: 10px; text-decoration: none;}
#pwdSetted{font-size: 18px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
#pwdSetteing1{font-size: 18px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
#pwdSetteing2{font-size: 18px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
.pwdSetnp{text-align: left;}
#pwdBtn{margin-left: 85px; width: 250px; height: 40px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94);}
#pwdBtn1{margin-left: 69px; width: 250px; height: 40px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94);}
#pwdBtn2{margin-left: 30px; width: 250px; height: 40px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94);}
#pwdSetBtn{box-shadow:0px 0px 15px 5px rgb(224, 224, 224); border: none; border-radius: 25px; width: 168px; height: 44px; font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; text-decoration: none; color: white; background: rgb(26, 188, 156);}
</style>
</head>
<body>
<hr id="top_hr">
<form method="post" id="form"> 
	<div class="pwdSet">
		<a href="${ contextPath }/home.do"><img src="resources/image/loginLogo.png" id="pwdSetLogo"></a>
		<br><br>
		<div id="pwdSet"> 
			<a id="pwdSetTitle">비밀번호 재설정</a>
			<div class="pwdSetnp"> 
				<br><br><br><br>
				<a id="pwdSetteing1">새로운 비밀번호</a>
				<input type="password" id="pwdBtn1" name="newPwd" placeholder=" 새로운 비밀번호를 입력하세요">
				<br><br>
				<a id="pwdSetteing2">새로운 비밀번호 확인</a>
				<input type="password" id="pwdBtn2" placeholder=" 한 번 더 입력하세요">
				<div id="check" style="margin-left: 215px;"></div> 
			</div>
			<br><br><br><br><br>
			<div>
				<button type="submit" id="pwdSetBtn">변경</button>
				<input type="hidden" name="memberId" value="${ memberId }">
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br>
	<script>
		const check = document.getElementById('check');
		const pwd = document.getElementById('pwdBtn1');
		const npwd = document.getElementById('pwdBtn2');
		const change = document.getElementById('pwdSetBtn');
		const form = document.getElementById('form');
		
		
		npwd.addEventListener('keyup', () => {
			if(pwd.value == '' || npwd.value == ''){
				check.innerText = '';
			} else if (pwd.value == npwd.value){
				check.innerText = '비밀번호가 일치합니다.';
				check.style.color = 'green';
			} else {
				check.innerText = '비밀번호가 불일치합니다.';
				check.style.color = 'red';
			}
		});
		
		change.addEventListener('click', (e) => {
		    if (check.innerText == '비밀번호가 일치합니다.') {
		        alert('비밀번호가 변경되었습니다.');
		        form.action = '${contextPath}/pwd_New.do';
		        form.submit();
		    } else {
		        alert('비밀번호를 다시 확인해주세요.');
		        e.preventDefault();
		    }
		});
	</script>
</form>
</body>
</html>