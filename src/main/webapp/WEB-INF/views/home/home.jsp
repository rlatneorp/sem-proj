<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>광고 페이지</title>
	<meta charset="UTF-8">
	<style>
		body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
		}

		.container {
			display: flex;
			justify-content: center;
			align-items: center;
			gap : 20px;
			padding: 20px;
		}

		.ad {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			height: 300px;
            width: 800px;
			background-color: white;
			box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.3);
			overflow: hidden;
			position: relative;
		}

		.ad .image-container {
			width: 100%;
			display: flex;
			transition: transform 0.3s ease-in-out;
		}
		.image-container img:hover {
		cursor: pointer;
	}

		.ad .image-container img {
			max-width: 800px;
  			height: auto;
			object-fit: cover;
		}

		.ad .button-container {
			display: flex;
			justify-content: center;
			position: absolute;
			height: 50px;
			width: 100%;
		}

		.ad .button-container button {
			background-color: rgba(0, 0, 0, 0.5);
			color: white;
			border: none;
			height: 50px;
			width: 50px;
			border-radius: 50%;
			cursor: pointer;
			opacity: 0.5;
			transition: opacity 0.3s ease-in-out;
		}

		.ad .button-container button:hover {
			opacity: 0.8;
		}

		.ad .button-container .prev-button {
			position: absolute;
			left: 20px;
		}

		.ad .button-container .next-button {
			position: absolute;
			right: 20px;
		}
		
		.container:nth-of-type(3) img {
		  max-width: 700px;
		  height: auto;
		  object-fit: cover;
		}
		
		.container:nth-of-type(4) p {
		  font-size: 25px
		}
		
		.container:nth-of-type(5) {
		  display: flex;
		  align-items: center;
		}
		.container:nth-of-type(5) p {
		  margin: 0;
		  font-size: 1.2rem;
		  order: 1;
		}
		.container:nth-of-type(5) .image-container {
		  order: 2;
		}
		.container:nth-of-type(5) .button-container {
		  order: 3;
		  display: flex;
		  justify-content: center;
		  width: 100%;
		}
		
		.container:nth-of-type(5) img {
		  max-width: 500px;
		  height: auto;
		  object-fit: cover;
		  order: 4;
		}
		
		.container:nth-of-type(6) img {
		  max-width: 500px;
		  height: auto;
		  object-fit: cover;
		}
		
		
		button.select {
		background-color: rgb(26, 188, 156);
		color: white;
		text-align: center;
		font-size: 1.7rem;
		padding: 0.7rem 1.5rem;
		background-color: rgb(26, 188, 156);
		border-radius: 15px; /* 둥근 모서리 크기 */
		border: none; /* 외각선 제거 */
		margin: 0 auto;
		}
		
		.video-container {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  height: 100vh;
		  padding: 20px;
		}
		
		.video-container iframe {
		  max-width: 800px;
		  width: 100%;
		  height: 475px;
		}
		.menu1:hover:not(.active){color: rgb(51, 51, 51);}
		.menu2:hover:not(.active){color: rgb(51, 51, 51);}
		.myMenu:hover:not(.active){color: rgb(51, 51, 51);}
		.btjipsa{width: 138px; height: 58px; background: rgb(26, 188, 156); border-style: none; border-radius: 4px;}
		.topLoginCont{width: 1200px; max-width: none !important; margin: 0 auto;}
		.logo{width: 160px;}
		.menu1{font-size: 23px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; margin: 10px; color: rgb(51, 51, 51); text-decoration: none;}
		.menu2{font-size: 23px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; color: rgb(51, 51, 51); text-decoration: none; justify-content: unset;}
		.left{margin-left: 5%; display: inline;}
		#right{margin-left: 18%; display: inline;}
		
		#top_hr{border: 20px solid rgb(26, 188, 156); opacity: 1; margin: 0;}
		#top_hr2{border: 1px solid gray;}
		#profile{width: 53px; height: 53px; border-radius: 100%; margin: 5px;}
		.animal:hover:not(.active){color: rgb(51, 51, 51);}
		.name:hover:not(.active){color: rgb(51, 51, 51);}
		.name{font-size: 23px; font-weight: 700; font-family: 'Noto Sans KR', sans-serif; margin: 0px; color: rgb(51, 51, 51); text-decoration: none; display: inline-block;}
		.animal{font-style: inherit; font-size: 18px; font-family: 'Noto Sans KR', sans-serif; margin: 0; color: rgb(51, 51, 51); text-decoration: none;}
		.dropd{position: relative; margin-right: 13%; margin-top: 3%;}
		.butn{padding: 10px 20px; background-color: transparent; border: none;}
		#drop-c{position: absolute; z-index: 1; border-radius: 15px; background-color: rgb(255, 255, 255); border-style: none; box-shadow: rgb(224, 224, 224) 0px 0px 20px 0px;}
		#drop-c a{display: block; padding: 5px 20px; margin: 2px 0px 0px 0px; text-decoration: none;}
		.myMenu{font-weight: 700; font-size: 18px; font-family: 'Noto Sans KR', sans-serif; margin: 10px; color: rgb(51, 51, 51); text-decoration: none;}
		#logOut{border: solid 1px; border-radius: 4px; width:100px; height:37px; margin-left: 45px; border-color: rgb(151, 222, 206); background-color: white;
		 font-family: 'Noto Sans KR', sans-serif; color: rgb(26, 188, 156);}
		#droul{margin: 0px 0px 0px; padding: 1px 1px 1px 1px; list-style: none;}
	</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<c:if test="${ !empty loginUser }"> 
		<div id="right">
			<a class="menu1"><img src="resources/image/profile.png" alt="profile" id="profile"></a>
			<a class="menu2">name</a>
			<div class="dropd" style="float:right; " aria-expanded="false">
				<button onclick="dp_menu()" class="butn"><img src="resources/image/down.png"></button>
			    <div style="width: 230px; height: 305px;" id="drop-c">
			    	<ul id="droul">
				       <li><a class="name">NAME님</a></li>
				       <li><a class="animal" style="display: block; float:left;">고양이</a><a class="animal">시암</a></li>
				       <li><a class="animal">미돌이</a></li>
				       <li><a><hr></a></li>
				       <li><a class="myMenu">마이페이지</a></li>
				       <li><a class="myMenu">프로필 설정</a></li>
				       <li><a><button onclick="location.href='${contextPath}/logout.do'" id="logOut">로그아웃</button></a></li>
			        </ul>
			    </div>
		  	 </div>
	  	</div>
	</c:if>
	<div class="container">
		<div class="ad">
			<div class="image-container">
				<img src="images/cat1.jpg">
			</div>
			<div class="button-container">
				<button class="prev-button">&#10094;</button>
				<button class="next-button">&#10095;</button>
			</div>
		</div>
	</div>

	<script>
		const images = [
			{src: 'resources/image/logo.png', link: 'https://www.naver.com'},
			{src: 'resources/image/cat1.jpg', link: 'https://www.google.com'},
			{src: 'resources/image/dog1.jpg', link: 'https://www.naver.com'},
			{src: 'resources/image/dog2.jpg', link: 'https://www.naver.com'}
			
		];

		const ad = document.querySelector('.ad');
		ad.querySelector('.image-container img').src = images[0].src;
		const prevButton = document.querySelector('.prev-button');
		const nextButton = document.querySelector('.next-button');
		let currentImageIndex = 0;

		// "이전" 버튼 클릭 시 이전 이미지로 전환하는 함수
		prevButton.addEventListener('click', () => {
			if (currentImageIndex === 0) {
				currentImageIndex = images.length - 1;
			} else {
				currentImageIndex--;
			}
			ad.querySelector('.image-container img').src = images[currentImageIndex].src;
		});
		
		// "다음" 버튼 클릭 시 다음 이미지로 전환하는 함수
		nextButton.addEventListener('click', () => {
			if (currentImageIndex === images.length - 1) {
				currentImageIndex = 0;
			} else {
				currentImageIndex++;
			}
			ad.querySelector('.image-container img').src = images[currentImageIndex].src;
		});
		
		// 5초마다 자동으로 다음 이미지로 전환하는 함수
		setInterval(() => {
			if (currentImageIndex === images.length - 1) {
				currentImageIndex = 0;
			} else {
				currentImageIndex++;
			}
			ad.querySelector('.image-container img').src = images[currentImageIndex].src;
		}, 5000);
		
		// 이미지를 클릭하면 해당 링크로 이동하는 함수 추가
		const image = ad.querySelector('.image-container img');
		image.addEventListener('click', () => {
			const link = images[currentImageIndex].link;
			window.open(link);
		});
		let click = document.getElementById("drop-c");
		click.style.display = "none"

		const dp_menu=()=>{
		    if(click.style.display === "none"){
		        click.style.display = "block";
		    }else{
		        click.style.display = "none";
		    }
		}
		
	</script>
	
	<div class="container">
	  <img src="resources/image/home1.png" alt="image description">
	</div>
	
	<div class="container">  
	  <p >더욱더 발전하는 반려동물 파트너 문화를 만드는 집사나라</p>
	</div>
	
	<div class="container">
		<div>
		  <p>반려동물 위탁돌봄을 희망하는<br>
		  	보호자와 전문가를<br>서로 매칭해줍니다</p>
		  <button class="select">파트너매칭</button>
		</div>
	  <img src="resources/image/home2.jpg" alt="image description">
	</div>
	
	<div class="container">
	  <img src="resources/image/home3.jpg" alt="image description">
	  <div>
		  <p>다양한 이용후기를 보면서 <br>
		  	어떤 서비스를 받을지 결정하세요 
		  </p>
		  <button class="select">이용후기</button>
	  </div>
	</div>
	
	<div class="video-container">
	  <iframe width="560" height="315" src="resources/video/short.mp4" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	</div>
	
`	<%@ include file="../common/bottom.jsp" %>
</body>
</html>
