<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<title>광고 페이지</title>
	<meta charset="UTF-8">
	<style>
		*{font-family: 'Noto Sans KR', sans-serif;}
		
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
			font-size: 25px;
		}
		#matchingNotice{
			font-size: 25px;
		}
		#matchingMain{
			font-size: 30px;
			font-weight: 700;
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
		
		.container:nth-of-type(2) img {
		  max-width: 750px;
		  height: auto;
		  object-fit: cover;
		}
		
		.container:nth-of-type(3) p {
		  font-size: 25px
		}
		
		.container:nth-of-type(4) {
		  display: flex;
		  align-items: center;
		}
		.container:nth-of-type(4) p {
		  margin: 0;
		  font-size: 1.2rem;
		  order: 1;
		}
		.container:nth-of-type(4) .image-container {
		  order: 2;
		}
		.container:nth-of-type(4) .button-container {
		  order: 3;
		  display: flex;
		  justify-content: center;
		}
		
		.container:nth-of-type(4) img {
		  max-width: 400px;
		  height: auto;
		  object-fit: cover;
		  order: 4;
		}
		
		.container:nth-of-type(5) img {
		  max-width: 400px;
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
		#directMatching {
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
		  padding: 20px;
		}
		
        #videoStyle{
          border-radius: 20px;
        }
       
		.material-symbols-outlined {
		  font-variation-settings:
		  'FILL' 0,
		  'wght' 500,
		  'GRAD' 300,
		  'opsz' 48;
		  color: rgb(26, 188, 156);
		  font-size: 40px;
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
<br><br>


	<div class="video-container">
	  <video id="videoStyle" width="720" height="405" src="resources/video/video.mp4" loop="loop" title="YouTube Copyrights video player" autoplay="autoplay" muted="muted"></video>
	</div>
	
	<div class="container">  
	  <p id="matchingMain">더욱더 발전하는 반려동물 파트너 문화를 만드는 집사나라</p>
	</div>
	<br><br>
	<div class="container">
		<div>
		  <p id="matchingNotice">반려동물 위탁돌봄을 희망하는<br>
		  	보호자와 전문가를<br>서로 매칭해줍니다</p>
		  <button class="select" onclick="location.href='${ contextPath }/matching_Main.mc'">집사매칭</button>
		</div>
	  <img src="resources/image/main1.jpg"  style=" border-radius: 20px; width: 400px; height: 400px;" alt="image description">
	</div>
	<br><br>
	<div class="container">
	  <img src="resources/image/main2.jpg"  style=" border-radius: 20px; width: 400px; height: 400px;" alt="image description">
	  <div>
		  <p>다양한 이용후기를 보면서 <br>
		  	어떤 서비스를 받을지 결정하세요 
		  </p>
		  <button class="select" onclick="location.href='${ contextPath }/review_Main.bo'">이용후기</button>
	  </div>
	</div>
	<br><br>
	<div style="text-align: center;">
		<h1>오늘의 집사 <span style="font-size: 40px;" class="material-symbols-outlined">thumb_up</span></h1> <br>
		<h5>집사나라에서 추천하는 집사님을 소개합니다</h5><br><br>
		<div class="todayJibsa">
			<c:forEach items="${ iList }" var="i" begin="0" end="0">
					<h3 id="jibsaN">${ i.memberName } 집사 <span class="material-symbols-outlined">verified</span></h3>
					<div><img src="${contextPath}/resources/uploadFiles/${ i.renameName}" width="300" height="250" style="border-radius: 10px;"></div><br>
					<button id="directMatching" onclick="location.href='${contextPath}/jibsa_Detail.bo?mId=${i.memberNo }&page=${pi.currentPage}'">집사 보러가기</button>
					<input id="hiddenNo" type="hidden"/>
			</c:forEach>	
		</div>
<!-- 	  <img src="resources/image/maindog.PNG" style=" border-radius: 20px; width: 720px; height: auto;" alt="image description"> -->
	</div>
	<br><br>
`	<%@ include file="../common/bottom.jsp" %>
	<script>
		// 각각의 이미지와 링크를 등록하는 함수
		const images = [
			{src: 'resources/image/광고(1).png', link: 'https://smartstore.naver.com/nekostory/products/4252063645?n_media=11068&n_query=%EC%A5%90%EB%8F%8C%EC%9D%B4&n_rank=2&n_ad_group=grp-a001-02-000000025268717&n_ad=nad-a001-02-000000166143559&n_campaign_type=2&n_mall_id=nekostory&n_mall_pid=4252063645&n_ad_group_type=2&NaPm=ct%3Dli12h1u0%7Cci%3D0zK00035qkPynwYyJuYZ%7Ctr%3Dpla%7Chk%3D32415c577aea4540fe116c8472154b3a99dac0c9'},
			{src: 'resources/image/광고(2).png', link: 'https://smartstore.naver.com/dreamsg/products/656478110?NaPm=ct%3Dli12n8ts%7Cci%3D46c87dfdfc4f30061d2df4f0e1055da8d975a8c7%7Ctr%3Dslsl%7Csn%3D264467%7Chk%3Dba2143c4cecb9facca184cc00cf310b2d39779b0'},
			{src: 'resources/image/광고(3).png', link: 'https://smartstore.naver.com/tenbyten/products/7262239581?NaPm=ct%3Dli12o3ow%7Cci%3D30b8814750af154e720b4df11ff9d0988fd3277c%7Ctr%3Dslsl%7Csn%3D354287%7Chk%3Dfe2bf5c8c07cd80251173132985d820f3867f73e'},
			{src: 'resources/image/광고(4).png', link: 'https://smartstore.naver.com/smart_jb/products/7034063908?n_media=11068&n_query=%EB%B0%98%EB%A0%A4%EB%8F%99%EB%AC%BC%EC%84%B8%EC%A0%95&n_rank=3&n_ad_group=grp-a001-02-000000031410995&n_ad=nad-a001-02-000000221457107&n_campaign_type=2&n_mall_id=ncp_1o4d7d_01&n_mall_pid=7034063908&n_ad_group_type=2&NaPm=ct%3Dli12p4q8%7Cci%3D0z40000YqQPyD9h7mvkl%7Ctr%3Dpla%7Chk%3D489bd9be6da38dc20d408c35655f10b3dbc04c1f'},
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
