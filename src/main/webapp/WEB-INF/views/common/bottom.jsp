<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">
<title>bottom</title>
<style>
.botCent{text-align: center; width: 1200px; max-width: none !important; margin: 0 auto;}
a:hover:not(.active){color: rgb(127, 127, 127);}
.bot_hr{border: 1px solid gray;}
#foot_hr{border: 20px solid rgb(26, 188, 156); opacity: 1; margin: 0;}
.left{text-align: left; display: inline-block;}
.right{display: inline-block; text-align: left;}
.right2{display: inline-block; text-align: right; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; color: rgb(127, 127, 127); text-decoration: none;}
.bottomUl{list-style:none;}
#infocenter{font-size: 24px; font-family: 'Noto Sans KR', sans-serif;  font-weight: 700; margin: 10px; color: rgb(127, 127, 127); text-decoration: none;}
.infophone{font-size: 21px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; margin: 10px; color: rgb(127, 127, 127); text-decoration: none;}
.infoKakao{font-size: 21px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; margin: 70px; color: rgb(127, 127, 127); text-decoration: none;}
.info{font-weight: 300; font-style: bold; font-size: 16px; font-family: 'Noto Sans KR', sans-serif; margin: 10px; color: rgb(127, 127, 127); text-decoration: none;}
#kakao{width: 64px; display: block; border-radius: 100%; margin: 0px auto;}
#up{width: 64px; display: block; border-radius: 100%; margin: 0px auto;}
#up2{width: 64px; display: block; border-radius: 100%; margin: 0px auto;}

</style>
</head>
<body>
<footer> 
	<div>
		<div class="botCent"> 
		  	<div class="left"> 
			  	<ul class="bottomUl">
				  	<li><a id="infocenter">고객만족센터</a></li>
				  	<li><a class="infophone">1234-5678</a></li>
				  	<li><a class="info">09:00 ~ 17 : 00</a></li>
				  	<li><a class="info">점심시간 12:00 ~ 13:00</a></li>
				  	<li><a class="info">jipsanara@jsnr.co.kr</a></li>
				  	<li><a class="infophone">제휴/마케팅</a><a class="info">jsnrfd@jsnr.co.kr</a></li>
			  	</ul>
		  	</div>
		  	<div class="right"> 
			  	<ul class="bottomUl">
				  	<li></li>
				  	<li></li>
				  	<li><a class="infophone">집사나라 공식사이트</a></li>
				  	<li><a class="info">(주) 집사나라 | 대표자 : 박신우</a></li>
				  	<li><a class="info">사업자등록번호 : 123-15-5456-789</a></li>
				  	<li><a class="info">통신판매업신고 : 제 - 2023 - 서울 -123</a></li>
				  	<li><a class="info">본사 서울 중구 남대문로1 KH정보교육</a></li>
			  	</ul>
		  	</div>
		  	<div class="right">
	  			<a class="infoKakao">카카오톡 문의</a>
	  			<a><img src="resources/image/kakao.png" id="kakao"></a>
	  			<pre>	  			</pre>
		  	</div>
	  	</div>
	  	<div class="right" id="upToTop" style="position: fixed; bottom: 150px; right: 15%;">
  			<img class="up" src="resources/image/uptotop.png" onmouseover="this.src='resources/image/uptotop2.png'" onmouseout="this.src='resources/image/uptotop.png'" id="up">
	  	</div>
	
		<br><hr class="bot_hr"><br>
		<div class="botCent">
			<div class="right2">
				<ul class="bottomUl">
					<li><a>Copyright (C) 2023 JSNR. All Rights Reserved</a></li>
				</ul>
			</div>
			<div class="right2">	
				<ul class="bottomUl"> 
					<li><a>이용약관 |</a><a> 개인정보처리</a></li>
				</ul>
			</div>
		</div>
		<br>
	</div>
	<hr id="foot_hr">
</footer>
<script>
	var upToTop = () => {
		let up = document.getElementById('up');
			window.addEventListener('scroll', () => {
				if (document.querySelector('html').scrollTop > 10) {
				up.style.display = "block";
		   		} else {
		      	up.style.display = "none";
		   		}
		  	})
			
			up.addEventListener('click', () => {
		    	window.scrollTo({ top: 0, left: 0, behavior: 'smooth' })
			})
		};
		upToTop();
		
</script>	
</body>

</html>