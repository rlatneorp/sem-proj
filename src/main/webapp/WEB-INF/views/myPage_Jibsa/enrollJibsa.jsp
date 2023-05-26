<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

#applyText{display: inline-block; margin-left: 210px;}
#applyTitle{font-size: 23px; 
	font-family: 'Noto Sans KR', sans-serif; 
	font-weight: 700; 
	color: rgb(51, 51, 51);}
	
#applyTitle{
	width: 1300px; 
	max-width: none !important; 
	margin: 0 auto;  
	}
#picDog{
display: inline-block;
margin-top:-280px;
margin-left: 650px;
width:412px;
height:380px;
border-style: none; border-radius:20px;
}

#box1{width:340px; height:162px; display: inline-block; margin-left: 220px;
box-shadow:0px 0px 15px 5px rgb(224, 224, 224); border-style: none; border-radius: 30px;
text-align: center;}
#box2{width:340px; height:162px; display: inline-block; margin-left: 100px;
box-shadow:0px 0px 15px 5px rgb(224, 224, 224); border-style: none; border-radius: 30px;
text-align: center;}

#btn1{border-style: none; border-radius:20px; width: 192px; height:76px; display: inline-block; margin-left: 300px; background: rgb(26, 188, 156); color: white;}
#btn2{border-style: none; border-radius:20px; width: 192px; height:76px; display: inline-block; margin-left: 170px; background: rgb(26, 188, 156); color: white; }

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 1,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48;
  color: rgba(67, 154, 151, 0.53);
}
#applyTree{text-align: left; margin-left: 500px;}

</style>

<body>

<jsp:include page="../common/top.jsp"/>
<div id="applyTitle">
	<br><br><br><br>
		<div id="applyText"> 
			<p>
				반려동물을 사랑하는 집사님들!<br> 혼자 남겨질 아이들을 위해<br> 
				집사 나라의 집사, 훈련사가 되어주세요!<br><br> 
				반려동물을 사랑하고 아낀다면 누구나<br> 
				집사나라의 집사, 훈련사가 될 수 있습니다.
			</p>
		</div>
		<div>
			<img id="picDog" src="resources/image/catdog.jpg">
		</div>
		<br><br>
	<hr/>
	<br><br>
	<div>
			<table>
				<tr>
					<td>
						<div id="box1">
							<p><br>
							반려동물을 돌봐주고<br/>
							산책시켜줄 수 있다면?
							</p>
						</div>
					</td>
					<td>
					<div id="box2">
						<p><br>
						반려동물의 기본교육과<br/>
						문제 행동 교육을 해줄 수 있다면?
						</p>
					</div>
					</td>
				</tr>
				<tr>
				<td><br><br></td> 
				<td><br><br></td>
				</tr>
				<tr>
					<td>
						<button id="btn1" onclick="location.href='${contextPath}/enrollJibsaPage.js'">집사 지원하기</button>
					</td>
					<td>
						<button id="btn2" onclick="location.href='${contextPath}/enrollTrainerPage.js'">훈련사 지원하기</button>
					</td>
				</tr>
			</table>
		</div><br><br><br>
	<div id="applyTree">
		<h2>채용 절차</h2><br>
		<h4>
			<span class="material-symbols-outlined">counter_1</span>
			온라인 서류 지원
		</h4>
			<a style="font-size: 20px; font-weight: normal;">
			서류 지원서를 작성해 주시면<br>
			합격자에 한해 7일이내로 연락드립니다.
			</a>
			<br><br>
		<h4>
			<span class="material-symbols-outlined">counter_2</span>
			1:1 오픈 카톡 면접
		</h4>
		<a style="font-size: 20px; font-weight: normal;">
		서류 합격자에 한해 자격 관련 면접을 진행합니다.</a>
		<br><br>
		<h4>
			<span class="material-symbols-outlined">counter_3</span>
			최종합격
		</h4><br><br><br><br>
		
		
	</div>		
</div>
<%@ include file="../common/bottom.jsp" %>
</body>
</html>