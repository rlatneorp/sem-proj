<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반려동물 등록</title>
<style>
body {
  overflow-x: hidden;
}
  label{cursor: pointer;}
  }
  #h3{margin-right: 300px;}
  .insert{
  	width: 750px;
  	height: 1600px;
  	border-radius: 10px;
  	box-shadow: 0px 0px 14px gray;
  	margin-left: 200px;
  	display: flex;
    justify-content: center;
    align-items: center;
    text-align: left;
  }
  #h6{margin-left: 82px;}
  .inbtn{
  	background: rgba(224, 224, 224, 0.33);
  	color: black;
  	display: inline-block;
    padding: 6px 12px;
    font-size: 16px;
    line-height: 1.5;
    border-radius: 10px;
    text-align: center;
    text-decoration: none;
    border: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  .sel{
  	font-size: 20px;
  	font-weight: bold;
  }
  #img{
  	width: 400px; height: 250px; border: 1px solid gray;
  }
  input[type=text]{border-radius: 10px 10px; border: 1px solid gray;}
  input[type="radio"] {
  	accent-color: rgb(26, 188, 156);
  }
  input[type="radio"]:hover {cursor: pointer;}
  #btn{
	  background: rgb(26, 188, 156);
	  color: white;
	  padding: 10px;
	  border: none;
	  border-radius: 10px;
	  margin-left: 160px;
	  width: 85px;
	  cursor: pointer;
  }
  rad{
  	max-height: 0;
  	overflow: hidden;
  	transition: max-height 0.3s ease-out;
  }

</style>
</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/sideBar.jsp" %>
	<div id="wrapper" class="toggled">
        <div id="page-content-wrapper">
	    	<div class="container-fluid">
	        	<div class="container text-center">
					  <h4 style="margin-right: 56%;"><b>내 반려동물</b></h4>
					  <h6 style="margin-right: 46%;">반려동물의 정보를 수정하세요!</h6><br>
					      	<div class="insert">
					      		<form action="${ contextPath }/updateAnimal.me" method="POST">
					      		
					      			<p class="sel">1. 반려동물 사진</p>
					      			<div id="img"></div>
    							  	<input class="form-control" type="file" accept="image/*" id="formFile">
    							  	<br>
    							  	
    							  	<input type="text" name="name" value="${ animal.animalName }" style="width: 400px; height: 35px;"/>
    							  	<br><br><br>
    							  	
    							  	<p class="sel">2. ${ animal.animalName }는</p>
    							  	<label for="dog">
    							  		<input type="radio" name="breed" class="rad" id="dog" <c:if test="${ animal.animalKind == '강아지' }">checked</c:if>> 강아지
    							  	</label>
    							  	<div class="hide">
    							  		&nbsp;&nbsp;<input type="text" name="breed" value="${ animal.animalType }"/>이에요<br>
    							  		&nbsp;&nbsp;<input type="radio" name="size" id="ds" <c:if test="${ animal.animalKind == '강아지' and animal.animalSize == '소형' }">checked</c:if>><label for="ds">&nbsp;소형</label>
    							  		&nbsp;&nbsp;<input type="radio" name="size" id="dm" <c:if test="${ animal.animalKind == '강아지' and animal.animalSize == '중형' }">checked</c:if>><label for="dm">&nbsp;중형</label>
    							  		&nbsp;&nbsp;<input type="radio" name="size" id="dl" <c:if test="${ animal.animalKind == '강아지' and animal.animalSize == '대형' }">checked</c:if>><label for="dl">&nbsp;대형</label>
    							  	</div>
    							  	<br>
    							  	<label for="cat">
    							  		<input type="radio" name="breed" class="rad" id="cat" <c:if test="${ animal.animalKind == '고양이' }">checked</c:if>> 고양이
    							  	</label>
    							  	<div class="hide">
    							  		&nbsp;&nbsp;<input type="text" name="breed" value="${ animal.animalType }"/>이에요<br>
    							  		&nbsp;&nbsp;<input type="radio" name="size" id="cs" <c:if test="${ animal.animalKind == '고양이' and animal.animalSize == '소형' }">checked</c:if>><label for="cs">&nbsp;소형</label>
    							  		&nbsp;&nbsp;<input type="radio" name="size" id="cm" <c:if test="${ animal.animalKind == '고양이' and animal.animalSize == '중형' }">checked</c:if>><label for="cm">&nbsp;중형</label>
    							  		&nbsp;&nbsp;<input type="radio" name="size" id="cl" <c:if test="${ animal.animalKind == '고양이' and animal.animalSize == '대형' }">checked</c:if>><label for="cl">&nbsp;대형</label>
    							  	</div>
    							  	<br>
    							  	<label for="other">
    							  		<input type="radio" name="breed" class="rad" id="other" <c:if test="${ animal.animalKind ne '강아지' and animal.animalKind ne '고양이'}">checked</c:if>> 기타
    							  		<input type="text" name="other" <c:if test="${ animal.animalKind ne '강아지' and animal.animalKind ne '고양이'}">value="${ animal.animalKind }</c:if>/>
    							  	</label>
    							  	<br><br><br>
    							  	
    							  	<p class="sel">3. ${ animal.animalName }의 성별</p>
    							  	<input type="radio" name="gender" id="M" <c:if test="${ animal.animalGender == 'M' }">checked</c:if>><label for="M">&nbsp;남자</label>&nbsp;&nbsp;&nbsp;&nbsp;
    							  	<input type="radio" name="gender" id="F" <c:if test="${ animal.animalGender == 'F' }">checked</c:if>><label for="F">&nbsp;여자</label>
    							  	<br><br><br>
    							  	
    							  	<p class="sel">4. ${ animal.animalName }는 중성화수술</p>
    							  	<input type="radio" name="surgery" id="ok" <c:if test="${ animal.isNeuter == 'Y' }">checked</c:if>><label for="ok">&nbsp;했어요</label>&nbsp;
    							  	<input type="radio" name="surgery" id="nok" <c:if test="${ animal.isNeuter == 'N' }">checked</c:if>><label for="nok">&nbsp;안했어요</label>
    							  	<br><br><br>
    							  	
    							  	<p class="sel">5. ${ animal.animalName }의 생일</p>
    							  	<input type="date" name="date" style="width: 120px;" value="${ animal.birthDate }">
    							  	<br><br><br>
    							  	
    							  	<p class="sel">6. ${ animal.animalName }의 몸무게</p>
    							  	<input type="text" name="kg" value="${ animal.animalWeight }"> kg
    							  	<br><br><br>
    							  	
    							  	<p class="sel">7. 참고사항</p>
    							  	<textarea cols="50" rows="10" style="resize: none" name="content">${ animal.animalNote }</textarea>
    							  	<br><br><br>
    							  	
									<button type="submit" id="btn">수정하기</button>
					      		</form>
					      	</div>
					      </div>
					    </div>
					</div>
	            </div>
		<script>
			const dbtn = document.getElementById('dog');
			const cbtn = document.getElementById('cat');
			const obtn = document.getElementById('other');
			
			const div = document.getElementsByClassName('hide');
			
			div[0].style.display = 'none';
			div[1].style.display = 'none';
			
			dbtn.addEventListener('click', () => {
				div[0].style.display = 'none';
				div[1].style.display = 'none';
				div[0].style.display = 'block';
			});
			
			cbtn.addEventListener('click', () => {
				div[0].style.display = 'none';
				div[1].style.display = 'none';
				div[1].style.display = 'block';
			});
			
			obtn.addEventListener('click', () => {
				div[0].style.display = 'none';
				div[1].style.display = 'none';
			});

			
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
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		<footer>
			<%@ include file="../common/bottom.jsp" %>
		</footer>
</body>
</html>