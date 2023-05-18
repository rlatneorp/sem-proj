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
<title>집사나라 - 비밀번호 찾기</title>
<style>
#top_hr{border: 20px solid rgb(26, 188, 156); opacity: 1; margin: 0;}
.foundPwd{text-align: center; width:472px; margin-left: 725px;}
#foundPwd{margin-top: -200px;}
#foundPwdLogo{width: 472px; text-align: center; display: inline;}
#foundPwdTitle{text-align: center; font-size: 24px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; margin: 10px; text-decoration: none;}
#foundPwdName{font-size: 18px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
#foundPwdId{font-size: 18px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
#foundPwdEmail{font-size: 18px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin-left: 10px; text-decoration: none; color: rgb(51, 51, 51);
 			   margin-top: 500px;
}
.foundPwdnp{text-align: left;}
#fpnBtn{margin-left: 70px; width: 300px; height: 40px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94);}
#fpiBtn{margin-left: 54px; width: 300px; height: 40px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94);}
#fppBtn{border: none; border-radius: 4px; margin-left: 10px; width: 80px; height: 40px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94);}
#foundPwdNext1{box-shadow:0px 0px 15px 5px rgb(224, 224, 224); border: none; border-radius: 25px; width: 168px; height: 44px; font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; text-decoration: none; color: white; background: rgb(26, 188, 156);}
.email{width: 130px; margin-left: 20px; border: 1px solid gray;}
/* #code{ */
/* 	margin-left: 130px; width: 300px; height: 55px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94); */
/* } */
#emailId{margin-left: 130px; width: 210px;}
#check{border: none; border-radius: 4px; margin-left: 10px; width: 50px; height: 30px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94);}

</style>
</head>
<body>
<hr id="top_hr">
	<div class="foundPwd">
		<a href="${ contextPath }/home.do"><img src="resources/image/loginLogo.png" id="foundPwdLogo"></a>
		<br><br>
		<div id="foundPwd"> 
			<a id="foundPwdTitle">비밀번호 찾기</a>
			<form action="${ contextPath }/pwd_Set.do" method="post">
			<input type="hidden" name="num" value="${ num }" id="num">
			<div class="foundPwdnp"> 
				<br><br><br><br>
				<a id="foundPwdName">인증번호</a>
				<input type="text" id="fpnBtn" placeholder=" 인증 번호를 입력하세요." name="emailAuth" required>
				<div id="check"> </div>
				
			</div>
			<br><br><br><br><br>
			<div>
				<button type="submit" id="foundPwdNext1">확인</button>	
			</div>
			</form>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br>
	<script>
		const emailCode = document.getElementById('fpnBtn');
		const check = document.getElementById('check');
		const num = document.getElementById('num');
		const btn = document.getElementById('foundPwdNext1');
		
		emailCode.addEventListener('keyup', () => {
			if(emailCode.value == num.value){
				check.innerText = '인증번호가 일치합니다. 다음 단계를 진행해주세요.';
				check.style.color = 'green';
				btn.disabled = false;
				btn.style.background = 'rgb(26, 188, 156)';
			} else {
				check.innerText = '인증번호가 불일치합니다. 다시 한번 확인해주세요.';
				check.style.color = 'red';
				btn.disabled = true;
				btn.style.background = 'gray';
			}
		});
	</script>
</body>
</html>