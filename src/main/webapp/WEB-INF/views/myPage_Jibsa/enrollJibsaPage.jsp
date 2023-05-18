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
  		  max-height: 1000px;
  		  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
	}
	.flex {
		display : flex; 
 		justify-content:space-between; 
	}
	input[type=radio]:checked {
	  background-color: rgb(26, 188, 156);
	}
	#img{
  	width: 400px; height: 250px; border: 1px solid gray;
  	}
	#finalBtn{font-size:30px; font-weight:bold; border-style: none; border-radius:20px; width: 192px; height:76px; display: inline-block; margin-left: 305px; background: rgb(26, 188, 156); color: white;}
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"/>

	<form class="container" style="width: 880px; 
	max-width: none !important; margin: 0 auto; text-align: left; " 
	action="${ contextPath }/insertJibsa.js" method="POST" enctype="multipart/form-data">
	<br/><br/><br/>
		<h3>집사 지원서 작성하기</h3>
		<hr/>
		<br/>
		<h5>1. 기본정보</h5>
		
		<p for="essential" &nbsp; style="padding-left: 22px;"> &nbsp;은 필수입력 항목입니다.</p>
		
		<div class="rounded-box flex">
			<div class="container" >
				<label class ="title"> 이름</label><br/>
				<input type="text" id="memberName" name="memberName" class=" i name" style="	paddig : 40px; 	margin-left: 23px; margin-top:5px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 홍길동" style="font-size: 10px;"
						value ="${ loginUser.memberName }" readonly><br/><br/>
			
				<label class ="e title">생년월일</label><br/>
				<span class = "add">만 18세 이상부터 지원할 수 있습니다.</span><br/>
				<input type="number" id="jibsaRrn" name="jibsaRrn" class=" i name"  style="	paddig : 40px; 	margin-left: 23px; margin-top:5px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224);  font-size: 15px;  font-weight: normal;width:120px; height: 43px;"  placeholder=" 생년월일"><br/><br/>
				
				<label class ="title">이메일</label><br/>
				<input type="text" id="memberEmail" name="memberEmail" class=" i name" style="	paddig : 40px; 	margin-left: 23px; margin-top:5px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 이메일을 입력해주세요"
						value ="${ loginUser.memberEmail }" readonly><br/><br/>
				
				<label class ="e title">방문가능지역</label><br/>
				<span class = "add">지역을 선택해주세요.</span><br/>
				<input type="text" id="availableArea" name="availableArea" class=" i name" style="	paddig : 40px; 	margin-left: 23px; margin-top:5px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 주소를 입력해주세요"><br/><br/>
				
				<label class ="e title"> 성별</label><br/>
				<label style="margin-left: 25px;"><input type="radio" name="jibsaGender" value="M">남자</label>
				<label><input type="radio" id="jibsaGender" name="jibsaGender" value="F">여자</label>
				<br/><br/>
				
				<label class ="e title"> 흡연유무 </label><br/>
				<span class = "add">거짓기재시 불이익이 있을 수 있습니다.</span><br/>
				<label style="margin-left: 25px;"><input type="radio" name="isSmoking" value="Y">흡연 함</label>
				<label><input type="radio" id="isSmoking" name="isSmoking" value="N">흡연 안함</label>
			</div>
			
			<div class="container">
				<label class ="e title"> 프로필 사진</label><br/>
				<div id="img"></div><br/>			  	
				<input class="form-control" type="file" accept="image/*" name="file" id="formFile"><br/>
			  	
			  	<br/><br/><br/>
				
				<label class ="e title"> 연락처 </label><br/>
				<span class = "add">입력하신 연락처로 합격 여부를 알려드립니다.</span><br/>
				<input type="text" id="memberPhone" name="memberPhone" class=" i name" style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:284px; height: 43px;" placeholder=" 휴대혼 번호를 입력해주세요."
						value ="${ loginUser.memberPhone }" readonly><br/><br/>
			</div>
		</div>
		<br/><br/>
		
		<h5>2. 경력사항, 자격증 및 시급</h5>
		
		<p for="essential" &nbsp; style="padding-left: 22px;"> &nbsp;은 필수입력 항목입니다.</p>
		
		<div class="rounded-box">
			
			<label class ="e title"> 경력사항</label><br/>
			<textarea id="workCareer" name="workCareer" class="i name"  style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:678px; height: 138px;" 
				placeholder=" 관련 업종 근무 경험, 관련 학과 졸업 등 없는 경우엔 없다고 작성" 
				rows="5"  style="width: 900px;" ></textarea>
			<br/><br/>
			
			<label class ="e title"> 희망 시급</label><br/>
			<input type="number" id="expectedSalary" name="expectedSalary" class=" i name"  style="	paddig : 40px; 	margin-left: 23px; margin-top:5px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224);  font-size: 15px;  font-weight: normal;width:250px; height: 43px;"  placeholder="희망하는 시급을 적어주세요"><br/><br/>
			
			<label class ="e title"> 훈련자격증</label><br/>
			<label style="margin-left: 25px;"><input type="checkbox" name="license" value="훈련사 3급"> 반려견 지도사 / 훈련사 3급</label>
			<label style="margin-left: 125px;"><input type="checkbox" name="license" value="훈련사 2급"> 반려견 지도사 / 훈련사 2급</label><br>
			<label style="margin-left: 25px;"><input type="checkbox" name="license" value="훈련사 1급"> 반려견 지도사 / 훈련사 1급</label>
			<label style="margin-left: 125px;"><input type="checkbox" name="license" value="행동교정사"> 반려동물 관리사 / 행동교정사</label><br>
			<label style="margin-left: 25px;"><input type="checkbox" name="license" value="KPA 수료증"> KPA 수료증 (CTP, Foundation 등)</label>
			<label style="margin-left: 75px;"><input type="checkbox" name="directInput" onclick="toggleDirectInput(this)"> 직접입력</label><br>
			<label style="margin-left: 320px;" for="other-checkbox">
			    <input type="text" name="license" id="directLicense" style="padding: 40px; margin-left: 23px; margin-top: 10px; border-radius: 5px; border-style: none; box-shadow: 0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width: 284px; height: 43px;" placeholder="이곳에 입력해주세요" size="25" disabled>
			</label>
			
		</div>
		<br/><br/>
		
		<h5>3. 기타 정보</h5>
		
		<p for="essential" &nbsp; style="padding-left: 22px;"> &nbsp;은 필수입력 항목입니다.</p>
		
		<div class="rounded-box">
			<label class ="e title"> 지원 동기</label><br/>
			<textarea id = "motive" name="motive" class="i name"  style="	paddig : 40px; 	margin-left: 23px; margin-top:10px;	border-radius: 5px; border-style: none;	box-shadow:0px 0px 1px 1px rgb(224, 224, 224); font-size: 15px; font-weight: normal; width:678px; height: 138px;" 
				placeholder=" 지원한 동기를 적어주세요." 
				rows="5"  style="width: 600px;" ></textarea>
			<br/><br/>
			
			<label class ="e title"> 동의사항</label><br/>
			<input type="checkbox" style="paddig: 40px; margin-left: 23px; margin-top:10px;" name="agree" value="yes" required> 개인정보 수집/이용에 동의합니다. <br/>
			<input type="checkbox" style="paddig: 40px; margin-left: 23px; margin-top:10px;" name="agree" value="yes" required> 지원서에 기재된 내용은 모두 본인이 작성하였으며, 사실과 다름 없음을 확인했습니다. <br/>
			<span class = "add">사실과 다를 경우, 합격이 취소될 수 있습니다.</span><br/>
			
			<br/>
		</div>
		<br/><br/>
		<button type="submit" id="finalBtn"  >최종 제출</button>
		<br/><br/><br/>
	</form>
	<br/><br/><br/><br/><br/><br/>
	
<script>
	function toggleDirectInput(checkbox) {
	    const directInputField = document.getElementById("directLicense");
	    directInputField.disabled = !checkbox.checked;
	    if (!checkbox.checked) {
	        directInputField.value = "";
	    }
	}

	const input = document.getElementById('formFile');
	const imgDiv = document.getElementById('img');
	
	input.addEventListener('change', function() {
	  const file = this.files[0];
	  if (!file.type.startsWith('image/')){ 
	    alert('이미지 파일을 선택하세요.'); 
	    return;
	  }
	  const reader = new FileReader();
	  reader.onload = function() {
	    const img = new Image();
	    img.style.width = '400px';
	    img.style.height = '247px';
	    img.src = reader.result;
	    imgDiv.innerHTML = '';
	    imgDiv.appendChild(img);
	  }
	  reader.readAsDataURL(file);  
	});	
</script>
<jsp:include page="../common/bottom.jsp"/>
</body>
</html>