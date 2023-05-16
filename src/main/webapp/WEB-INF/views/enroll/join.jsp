<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<title>집사나라 - 회원가입</title>
<style>
.uul{font-style: bold; margin-left: 30%; font-size: 23px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; color: rgb(51, 51, 51); text-decoration: none; text-align: left;}
.lii{display: block; margin: 0 auto; padding: 3px;}
.uul2{padding: 3px 3px 3px 3px; width: 429px; height: 40px; font-size: 15px;}
.joinBtnDiv{position: relative; margin-left: 43px;}
.joinBtn{width: 350px; height: 68px; border: none; background: rgb(26, 188, 156); border-radius: 4px;} 
.joinBtn{font-size: 27px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; color: white; text-decoration: none;}
.joinIdBt{border: none; background: transparent; position: absolute; margin-left: -111px; text-align: center; z-index: 1;}
#idCheckResult{font-size:15px;}
#pwdCheck{font-size:15px;}
</style>
</head>
<body>
<article style="width: 1200px; margin: 0 auto;">
<br><br><br><br><br><br>
	<form class="jo" action="${ contextPath }/enrollMember.do" method="post" onsubmit="showSuccessAlert()">
		<ul class="uul"> 	
			<li class="lii"><a>아이디</a></li>
			<li class="lii"><input class="uul2" id="memberId" name="memberId" type="text" placeholder=" 사용할 아이디를 입력하세요"></li>
<!-- 				<button type="button" class="joinIdBt"> -->
<!-- 	          		<img src="resources/image/bb.png"/> -->
<!-- 	        	</button></li> -->
			<label id="idCheckResult">   </label>
			<br>
			
			<li class="lii"><a>비밀번호</a></li>
			<li class="lii"><input class="uul2" id="memberPwd" name="memberPwd" type="password" placeholder=" 사용할 비밀번호를 입력하세요"></li>
			<br>
			<li class="lii"><a>비밀번호 확인</a></li>
			<li class="lii"><input class="uul2" id="confirmPassword" type="password" placeholder=" 다시 한 번 비밀번호를 입력하세요"></li>
			<label id="pwdCheck">   </label>
			
			<br>
			<li class="lii"><a>이름</a></li>
			<li class="lii"><input class="uul2" id="memberName" name="memberName" type="text" placeholder=" 이름을 입력하세요"></li>
			<br>
			<li class="lii"><a>이메일</a></li>
			<li class="lii"><input class="uul2" id="memberEmail" name="memberEmail" type="email" placeholder=" 이메일을 입력하세요"></li>
			<br>
			<li class="lii"><a>연락처</a></li>
			<li class="lii"><input class="uul2" id="memberPhone" name="memberPhone" type="number" placeholder=" 연락처를 입력하세요"></li>
			<br>
			<li class="lii"><a>주소</a></li>
			<li class="lii"><input class="uul2" id="memberAddress" name="memberAddress" type="text" placeholder=" 주소를 입력하세요"></li>
			<br><br>
			<div class="joinBtnDiv">
				<button class="joinBtn" >가입하기</button>
			</div>
		</ul>
	</form>
<br><br><br><br><br><br>	
</article>	

<script >
	// 아이디가 중복인지 확인하는 함수
	window.onload = () => {
	    document.getElementById('memberId').addEventListener('change', function() {
	        const idResult = document.getElementById('idCheckResult');
	        if (this.value.trim() == '') {
	            idResult.innerText = '';
	        } else {
	            $.ajax({
	                url: '${contextPath}/member_CheckMemberId.me',
	                data: { memberId: this.value.trim() },
	                success: data => {
	                    if (data == 'yes') {
	                        idResult.innerText = '사용가능한 아이디입니다';
	                        idResult.style.color = "green";
	                    } else if (data == 'no') {
	                        idResult.innerText = '아이디가 중복됩니다 다른 아이디를 입력하세요';
	                        idResult.style.color = "red";
	                    }
	                },
	                error: data => {
	                    console.log(data);
	                }
	            });
	        }
	    });
	};
	
	// 비밀번호와 비밀번화 확인이 일치하는지 확인하는 함수
	document.getElementById('confirmPassword').addEventListener('keyup', function() {
	    const password = document.getElementById('memberPwd').value;
	    const confirmPassword = this.value;
	    const pwdCheckResult = document.getElementById('pwdCheck');

	    if (password === confirmPassword) {
	        pwdCheckResult.innerText = '비밀번호가 일치합니다';
	        pwdCheckResult.style.color = 'green';
	    } else {
	        pwdCheckResult.innerText = '비밀번호가 일치하지 않습니다';
	        pwdCheckResult.style.color = 'red';
	    }
	});
	
	 // 회원가입 완료 알림창을 띄우는 함수
    function showSuccessAlert() {
        alert("회원가입이 완료되었습니다! 다시 로그인 해주세요");
    }


</script>
	
</body>
</html>