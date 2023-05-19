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
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>집사나라 - 아이디 찾기</title>
<style>
#top_hr{border: 20px solid rgb(26, 188, 156); opacity: 1; margin: 0;}
.foundId{text-align: center; width:472px; margin-left: 725px;}
#foundId{margin-top: -200px;}
#foundIdLogo{width: 472px; text-align: center; display: inline;}
#foundIdTitle{text-align: center; font-size: 24px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; margin: 10px; text-decoration: none;}
#foundIdName{font-size: 18px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
#foundIdEmail{font-size: 18px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; margin: 10px; text-decoration: none; color: rgb(51, 51, 51);}
.foundIdnp{text-align: left;}
#finBtn{margin-left: 70px; width: 300px; height: 40px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94);}
#fipBtn{margin-left: 54px; width: 300px; height: 40px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; text-decoration: none; color: rgb(94, 94, 94);}
#foundIdNext1{box-shadow:0px 0px 15px 5px rgb(224, 224, 224); border: none; border-radius: 25px; width: 168px; height: 44px; font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 400; text-decoration: none; color: white; background: rgb(26, 188, 156);}
</style>
</head>
<body>
<hr id="top_hr">
<form action="${ contextPath }/foundId.do" method="post"> 
	<div class="foundId">
		<a href="${ contextPath }/home.do"><img src="resources/image/loginLogo.png" id="foundIdLogo"></a>
		<br><br>
 		<div id="foundId"> 
			<a id="foundIdTitle">아이디 찾기</a>
			<div class="foundIdnp"> 
				<br><br><br><br>
				<a id="foundIdName">이름</a>
				<input type="text" id="finBtn" name="memberName" placeholder=" 이름을 입력하세요" required>
				<br><br>
				<a id="foundIdEmail">이메일</a>
				<input type="text" id="fipBtn" name="memberEmail" placeholder=" 이메일을 입력하세요" required>
			</div>
			<br><br><br>
			<div>
				<button type="submit" id="foundIdNext1">다음</button>	
			</div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br><br>
	<script>
		const memberName = document.getElementById('finBtn');
		const memberEmail = document.getElementById('fipBtn');
		const next = document.getElementById('foundIdNext1');
		
		const foundCheckId = () => {
		    $.ajax({
		        type: 'POST',
		        url: '${contextPath}/foundCheckId.do',
		        data: { memberName: memberName.value.trim(), memberEmail: memberEmail.value.trim() },
		        success: data => {
		            console.log(data);
		            if (data == 'yes') {
		                next.disabled = false;
		                next.style.background = 'rgb(26, 188, 156)';
		            } else if (data == 'no') {
		                next.disabled = true;
		                next.style.background = 'gray';
		            }
		        },
		        error: data => {
		            console.log(data);
		            alert('에러발생');
		        }
		    });
		};

		memberEmail.addEventListener('change', foundCheckId);
		memberName.addEventListener('change', foundCheckId);
	</script>
	
	
	
	
	
	
	
</form>
</body>
</html>