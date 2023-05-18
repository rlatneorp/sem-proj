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
		
        #videoStyle{
          border-radius: 20px;
        }
	</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
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


	<div class="container">
	  <img src="resources/image/home1.png" alt="image description">
	</div>
	
	<div class="container">  
	  <p>더욱더 발전하는 반려동물 파트너 문화를 만드는 집사나라</p>
	</div>
	
	<div class="container">
		<div>
		  <p>반려동물 위탁돌봄을 희망하는<br>
		  	보호자와 전문가를<br>서로 매칭해줍니다</p>
		  <button class="select">집사매칭</button>
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
	  <video id="videoStyle" width="720" height="405" src="resources/video/video.mp4" loop="loop" title="YouTube Copyrights video player" autoplay="autoplay" muted="muted"></video>
	</div>
	
`	<%@ include file="../common/bottom.jsp" %>
	<script>
		const images = [
			{src: 'resources/image/광고(1).png', link: 'https://www.naver.com'},
			{src: 'resources/image/광고(2).png', link: 'https://www.google.com'},
			{src: 'resources/image/광고(3).png', link: 'https://www.naver.com'},
			{src: 'resources/image/광고(4).png', link: 'https://www.google.com'},
			
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
		
		
	</script>
	
</body>
</html>
