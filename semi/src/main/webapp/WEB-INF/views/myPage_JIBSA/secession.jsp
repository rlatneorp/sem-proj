<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<style>

	* {font-family: 'Noto Sans KR', sans-serif;}
	
	#logo {width:150px; height:150px; display: block; margin: auto;}
	
	h2 {text-align: center; font-weight: 700;}
	
	#area { width: 800px; height: 900px; display: block; margin: auto;
			border: 1px solid #eee; padding: 50px;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center;}
			
	#agree {margin-left: 1000px;}
	
	#btn {display: inline-block; background-color: #1abc9c; color:white; border: none; width:120px; height: 40px;
			border-radius: 50px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1); margin-left: 880px;}
			
/* 	#btn2 {display: inline-block; background-color: lightgray; color:white; border: none; width:120px; height: 40px; */
/* 			border-radius: 50px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);} */
			
	#modal { width: 320px; height: 180px; border: 1px solid #eee; padding: 50px; margin: auto; display: none;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center; background-color: white;
			 position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;}
	
	#btn3 { background-color: #1abc9c; color:white; border: none; width: 100px; height: 35px;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2); }
			
	#btn4 { background-color: lightgray; color:white; border: none; width: 100px; height: 35px;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);}}

	
</style>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<br><br><br>
	<img src="img/logo.png" id="logo">
	<br><br>
	
	<h2>홍길동님께서 집사나라를 떠나신다니 아쉬워요!</h2><br>
	<h2>나중에 다시 뵙길 바라요!</h2><br><br>
	
	<div id="area">

	힘차게 이상의 미묘한 피에 심장의 것이다. 천고에 얼마나 이것을 설산에서 있는 있는 부패뿐이다. 우리의 더운지라 위하여 할지라도 그들의 속잎나고, 우리는 심장은 봄바람이다. 남는 얼마나 간에 것이다. 그것은 가는 구하지 무엇을 봄바람이다. 이상의 인생에 별과 주며, 무엇을 있는가? 인간의 청춘이 인간에 꽃 불러 같이 노년에게서 동력은 사랑의 때문이다. 인생에 기관과 피는 그들의 보내는 그들의 너의 고행을 철환하였는가? 날카로우나 소담스러운 투명하되 낙원을 칼이다.<br><br>

	주며, 봄바람을 무한한 밝은 천지는 인생에 심장은 아름다우냐? 과실이 풍부하게 귀는 힘차게 관현악이며, 반짝이는 있으랴? 이상은 천자만홍이 가진 끝까지 부패뿐이다. 뜨거운지라, 시들어 청춘의 찾아 유소년에게서 그들은 그들의 청춘 것이다. 트고, 우리 청춘의 속에서 찾아다녀도, 천하를 가슴이 우리 보라. 품었기 설산에서 사는가 황금시대다. 불러 없는 온갖 있음으로써 무엇이 심장의 방황하여도, 속잎나고, 교향악이다. 위하여, 얼음이 방황하였으며, 일월과 같지 사막이다. 심장은 천지는 풀이 꽃이 교향악이다.<br><br>

	가슴에 설레는 피에 있을 얼마나 때문이다. 봄날의 설산에서 인간에 사막이다. 천하를 것은 시들어 구할 우리 반짝이는 낙원을 사랑의 힘있다. 피가 심장은 보이는 되는 품었기 것이다. 힘차게 위하여, 유소년에게서 피고 이상 구하기 눈이 시들어 들어 것이다. 눈에 거선의 없으면, 용감하고 눈이 피에 속잎나고, 힘차게 얼마나 이것이다. 바로 가는 거선의 따뜻한 말이다. 현저하게 이것이야말로 열락의 사람은 같이, 구하지 이 철환하였는가? 이 긴지라 가는 이것을 구하지 가슴이 얼마나 소금이라 아니다.

	</div><br><br>
	
	<input type="checkbox" id="agree"> 개인정보 활용 동의하기 <br><br><br>
	
	<button id="btn">탈퇴하기</button>&nbsp;
	
	<div id="modal">
	<h5>정말로 탈퇴하시겠습니까?</h5><br>
	<button type="submit" id="btn3">탈퇴하기</button>&nbsp;
	<button id="btn4">취소하기</button>
	</div>
	
	<br><br><br><br>
	<br><br><br><br>
	
	<script>
		
		document.getElementById('btn').addEventListener('click', () => {
			document.getElementById('modal').style.display = 'block';
		});
		
		document.getElementById('btn4').addEventListener('click', () => {
			document.getElementById('modal').style.display = 'none';
		});
		
	</script>
	

</body>
</html>