<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {font-family: 'Noto Sans KR', sans-serif;}
	.container h3 {font-weight: 700;}
	.container h5{font-weight: 700;}
	.container p{ font-size: 15px;}
	p[for="essential"]::before {
  		content: "*";
 		color: red;
 		font-size: 20px;
 	}	
 	
 	.e:after {
    content: "*";
    color: red;
    font-size: 20px;
	}
	
	.title::before {
    content: "●";
    font-size: 8px;
    margin-right: 10px;

	}
	
	.i{
	paddig : 40px;
 	margin-left: 30px; 
	border-radius: 5px;
	border-style: 1px solid gray;
	}
	
	.add{
	font-size : 10px;
	margin-left: 20px; 
		
	}
	
	
	.rounded-box {
  		  border-radius: 20px;
		  background-color: white; 
		  padding: 20px;
		  top: 50%; /* 요소의 상단을 화면의 중앙에 위치시킵니다. */
		  width: auto;
  		  height: auto; 
  		  max-height: 500px;
  		  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	}
	.flex {
		display : flex; 
 		justify-content:space-between; 
	}
	
	input[type=radio]:checked {
	  background-color: rgb(26, 188, 156);
	}
	
	#finalBtn{font-size:30px; font-weight:bold; border-style: none; border-radius:20px; width: 192px; height:76px; display: inline-block; margin-left: 250px; background: rgb(26, 188, 156); color: white;}
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"/>

	<div class="container" style="width: 780px; 
	max-width: none !important; 
	margin: 0 auto; text-align: left; margin-right: 600px;">
	<br><br><br><br><br><br>
		<h3>훈련사 지원서 작성하기</h3>
		<hr/>
		<br/>
		<h5>1. 기본정보</h5>
		
		<p for="essential" &nbsp; style="padding-left: 22px;"> &nbsp;은 필수입력 항목입니다.</p>
		
		<div class="rounded-box flex">
			<div class="container">
				<label class ="e title"> 이름</label><br/>
				<input type="text" class=" i name" style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 홍길동" style="font-size: 10px;"><br/><br/><br/>
			
			
				<label class ="e title"> 주민등록 번호 앞 7자리</label><br/>
				<span class = "add">만 18세 이상부터 지원할 수 있습니다.</span><br/>
				<input type="number" class=" i name"  style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224);  font-size: 15px;  font-weight: normal;width:120px; height: 43px;"  placeholder=" 생년월일"> <input type="number" class=" i name"  style=" paddig : 40px; margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:120px; height: 43px;" placeholder=" 1자리 ******"><br/><br/>
				<br/><br/>
				
				<label class ="e title"> 거주지 주소</label><br/>
				<span class = "add">시/군/구까지 입력해주세요.</span><br/>
				<input type="text" class=" i name" style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 주소를 입력해주세요"><br/><br/>
			</div>
			
			<div class="container">
				<label class ="e title"> 프로필 사진</label><br/>
				<button  style="margin-left: 25px; paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" >파일선택</button><br/><br/>
				
				<label class ="e title"> 성별</label><br/>
				<label style="margin-left: 25px;"><input type="radio" name="gender" value="male">남자</label>
				<label><input type="radio" name="gender" value="female">여자</label>
				<br/><br/>
				
				<label class ="e title"> 연락처</label><br/>
				<span class = "add">입력하신 연락처로 합격 여부를 알려드립니다.</span><br/>
				<input type="number" class=" i name" style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 휴대혼 번호를 입력해주세요."><br/><br/>
				
				<label class ="e title"> 흡연유무</label><br/>
				<span class = "add">직업 특성 상 흡연을 하시는 경우 집사 활동이 어려울 수 있습니다.</span><br/>
				<label style="margin-left: 25px;"><input type="radio" name="gender" value="yes">흡연 함</label>
				<label><input type="radio" name="gender" value="no">흡연 안함</label>
			</div>
		</div>
		<br/><br/>
		
		<h5>2. 경력 사항</h5>
		
		<p for="essential" &nbsp; style="padding-left: 22px;"> &nbsp;은 필수입력 항목입니다.</p>
		
		<div class="rounded-box">
			<label class ="e title"> 진행해본 훈련 횟수</label><br/>
			
			<label style="margin-left: 25px;"><input type="checkbox" name="career" value="없음"> 없음</label>
			<label style="margin-left: 15px;"><input type="checkbox" name="career" value="1_15"> 1회~15회</label>
			<label style="margin-left: 15px;"><input type="checkbox" name="career" value="15_35"> 15회~35회</label>
			<label style="margin-left: 15px;"><input type="checkbox" name="career" value="35_50"> 35회~50회</label>
			<br/><br/>
			
			<label class ="e title"> 훈련자격증</label><br/>
			<label style="margin-left: 25px;"><input type="checkbox" name="license" value="3"> 반려견 지도사 / 훈련사 3급</label>
			<label style="margin-left: 125px;"><input type="checkbox" name="license" value="2"> 반려견 지도사 / 훈련사 2급</label><br>
			<label style="margin-left: 25px;"><input type="checkbox" name="license" value="1"> 반려견 지도사 / 훈련사 1급</label>
			<label style="margin-left: 125px;"><input type="checkbox" name="license" value="care"> 반려동물 관리사 / 행동교정사</label><br>
			<label style="margin-left: 25px;"><input type="checkbox" name="license" value="kpa"> KPA 수료증 (CTP, Foundation 등)</label>
			<label style="margin-left: 75px;"><input type="checkbox" name="license" value="inpt"> 직접입력</label><br>
			<label style="margin-left: 320px;" for="other-checkbox">
  				<input type="text" name="other-pet" id="other-pet"  style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 이곳에 입력해주세요" size="25" >
			</label>
			<label class ="e title"> 경력사항</label><br/>
			<textarea name="career" class="i name"  style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:678px; height: 138px;" 
				placeholder=" 지원한 동기를 적어주세요." 
				rows="5"  style="width: 600px;" ></textarea>
			<br/><br/>
		</div><br><br>
			
		<h5>3. 활동 정보</h5>
		
		<p for="essential" &nbsp; style="padding-left: 22px;"> &nbsp;은 필수입력 항목입니다.</p>
		
		<div class="rounded-box">
			<label class ="e title"> 훈련 시 이동 수단수</label><br/>
			<p style="padding-left: 22px;"> &nbsp; 자차 보유자 우대</p>
			<label style="margin-left: 25px;"><input type="checkbox" name="transfer" value="car"> 자차 이동</label>
			<label style="margin-left: 240px;"><input type="checkbox" name="transfer" value="bus"> 대중교통 이용</label><br>
			<label style="margin-left: 25px;"><input type="checkbox" name="transfer" value="cycle"> 자전거 이용</label>
			<label style="margin-left: 225px;"><input type="checkbox" name="transfer" value="inpt"> 직접입력</label><br>
			<label style="margin-left: 320px;" for="other-checkbox">
  				<input type="text" name="other-pet" id="other-pet"  style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 이곳에 입력해주세요" size="25" >
			</label>
			<br/><br/>
			
			<label class ="e title"> 활동 가능한 횟수</label><br/>
			<label style="margin-left: 25px;"><input type="checkbox" name="transfer" value="car"> 주말 포함한 30일 모두 가능</label>
			<label style="margin-left: 122px;"><input type="checkbox" name="transfer" value="bus"> 평균 20일 이상 가능</label><br>
			<label style="margin-left: 25px;"><input type="checkbox" name="transfer" value="cycle"> 평균 20 이하 가능</label>
			<label style="margin-left: 184px;"><input type="checkbox" name="transfer" value="inpt"> 주말만 가능</label><br>
			<br/><br/>
			
			<label class ="e title"> 방문 가능 지역</label><br/>
			<label style="margin-left: 25px;"><input type="checkbox" name="transfer" value="car"> 서울 지역</label>
			<label style="margin-left: 240px;"><input type="checkbox" name="transfer" value="bus"> 경기 지역</label><br>
			<label style="margin-left: 25px;"><input type="checkbox" name="transfer" value="cycle"> 인천 지역</label>
			<label style="margin-left: 240px;"><input type="checkbox" name="transfer" value="inpt"> 수도권 외 지역</label><br>
			<label style="margin-left: 320px;" for="other-checkbox">
  				<input type="text" name="other-pet" id="other-pet"  style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 이곳에 입력해주세요" size="25" >
			</label>
			<br/><br/>
		
		</div>
		<br/><br/>
		
		<h5>4. 기타 정보</h5>
		
		<p for="essential" &nbsp; style="padding-left: 22px;"> &nbsp;은 필수입력 항목입니다.</p>
		
		<div class="rounded-box">
			<label class ="e title"> 지원 동기</label><br/>
			<textarea name="career" class="i name"  style="paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:678px; height: 138px;" 
				placeholder=" 지원한 동기를 적어주세요." 
				rows="5"></textarea>
			<br/><br/>
			<label class ="e title"> 희망 시급</label><br/>
			<textarea name="career" class="i name"  style="paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:250px; height: 50px;" 
				placeholder=" 희망하는 시급을 적어주세요." 
				rows="5"></textarea>
			<br/><br/>
			
			<label class ="e title"> 동의사항</label><br/>
			<input type="checkbox" style="paddig: 40px; margin-left: 23px; margin-top:10px;" name="agree" value="yes" required> 개인정보 수집/이용에 동의합니다. <br/>
			<input type="checkbox" style="paddig: 40px; margin-left: 23px; margin-top:10px;" name="agree" value="yes" required> 지원서에 기재된 내용은 모두 본인이 작성하였으며, 사실과 다름 없음을 확인했습니다. <br/>
			<span class = "add">사실과 다를 경우, 합격이 취소될 수 있습니다.</span><br/>
			
			<br/>
		</div>
		<br><br>
		<button type="button" id="finalBtn">최종 제출</button>
		<br><br><br>
	</div>
	<br><br><br><br><br><br>
	
<jsp:include page="../common/bottom.jsp"/>

</body>
</html>