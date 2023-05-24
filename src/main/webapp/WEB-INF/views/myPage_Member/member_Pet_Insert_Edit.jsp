<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">
<title>반려동물 정보 수정</title>
<style>
*{font-family: 'Noto Sans KR', sans-serif;}
body {
  overflow-x: hidden;
}
  label{cursor: pointer;}
  }
  #h3{margin-right: 300px;}
  .insert{
  	width: 750px;
  	height: 1800px;
  	border-radius: 10px;
  	box-shadow: 0px 0px 14px lightgray;
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
	  margin-left: 110px;
	  width: 85px;
	  cursor: pointer;
  }
  #btn2{
	  background: lightgray;
	  color: white;
	  padding: 10px;
	  border: none;
	  border-radius: 10px;
	  margin-left: 30px;
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
	        	<br>
					  <h3 style="margin-right: 56%;"><b>내 반려동물</b></h3>
					  <h6 style="margin-right: 50%;">반려동물의 정보를 수정하세요!</h6><br><br>
					      	<div class="insert">
					      		<form action="${ contextPath }/updateAnimal.me" method="POST" enctype="multipart/form-data" id="attmForm">
					      		
					      			<p class="sel">1. 반려동물 사진</p>					  
					      			<img id="preview" width="100%" height="245"/>
    							  	<input class="form-control" type="file" accept="image/*" name="file" id="formFile" onchange="previewImage(event)"><br>
    							  	현재 등록된 사진 : <c:if test="${ !empty image.originalName }">${ image.originalName }</c:if><c:if test="${ empty image.originalName }">없음</c:if>
    							  	<button type="button" class="btn btn-outline-dark btn-sm deleteAttm" id="delete-${ image.renameName }/${ image.imageLevel }">삭제</button>
									<input type="hidden" name='deleteAttm' value='none'><br><br>
    							  	
    							  	<input type="text" name="animalName" value="${ animal.animalName }" style="width: 400px; height: 35px;"/>
    							  	<br><br><br>
    							  	
    							  	<p class="sel">2. ${ animal.animalName }은/는</p>
    							  	<label for="dog">
    							  		<input type="radio" name="animalKind" class="rad" value="DOG" id="dog" <c:if test="${ animal.animalKind == 'DOG' }">checked</c:if>> 강아지
    							  	</label>
    							  	<div class="hide">
    							  		&nbsp;&nbsp;<input type="text" name="dType" <c:if test="${ animal.animalKind == 'DOG' }">value="${ animal.animalType }"</c:if>/>이에요<br>
    							  		&nbsp;&nbsp;<input type="radio" name="animalSize" id="ds" value="small" <c:if test="${ animal.animalKind == 'DOG' and animal.animalSize == 'small' }">checked</c:if>><label for="ds">&nbsp;소형</label>
    							  		&nbsp;&nbsp;<input type="radio" name="animalSize" id="dm" value="medium" <c:if test="${ animal.animalKind == 'DOG' and animal.animalSize == 'medium' }">checked</c:if>><label for="dm">&nbsp;중형</label>
    							  		&nbsp;&nbsp;<input type="radio" name="animalSize" id="dl" value="large" <c:if test="${ animal.animalKind == 'DOG' and animal.animalSize == 'large' }">checked</c:if>><label for="dl">&nbsp;대형</label>
    							  	</div>
    							  	<br>
    							  	<label for="cat">
    							  		<input type="radio" name="animalKind" class="rad" value="CAT" id="cat" <c:if test="${ animal.animalKind == 'CAT' }">checked</c:if>> 고양이
    							  	</label>
    							  	<div class="hide">
    							  		&nbsp;&nbsp;<input type="text" name="cType" <c:if test="${ animal.animalKind == 'CAT' }">value="${ animal.animalType }"</c:if>/>이에요<br>
    							  		&nbsp;&nbsp;<input type="radio" name="animalSize" id="cs" value="small" <c:if test="${ animal.animalKind == 'CAT' and animal.animalSize == 'small' }">checked</c:if>><label for="cs">&nbsp;소형</label>
    							  		&nbsp;&nbsp;<input type="radio" name="animalSize" id="cm" value="medium" <c:if test="${ animal.animalKind == 'CAT' and animal.animalSize == 'medium' }">checked</c:if>><label for="cm">&nbsp;중형</label>
    							  		&nbsp;&nbsp;<input type="radio" name="animalSize" id="cl" value="large" <c:if test="${ animal.animalKind == 'CAT' and animal.animalSize == 'large' }">checked</c:if>><label for="cl">&nbsp;대형</label>
    							  	</div>
    							  	<br>
    							  	<label for="other">
    							  		<input type="radio" name="animalKind" class="rad" value="other" id="other" <c:if test="${ animal.animalKind ne 'DOG' and animal.animalKind ne 'CAT'}">checked</c:if>> 기타
    							  		<input type="text" name="oType" placeholder="ex. 토끼 등" <c:if test="${ animal.animalKind ne 'DOG' and animal.animalKind ne 'CAT'}">value="${ animal.animalType }"</c:if>/>
    							  	</label>
    							  	<br><br><br>
    							  	
    							  	<p class="sel">3. ${ animal.animalName }의 성별</p>
    							  	<input type="radio" name="animalGender" id="M" value="M" <c:if test="${ animal.animalGender == 'M' }">checked</c:if>><label for="M">&nbsp;남자</label>&nbsp;&nbsp;&nbsp;&nbsp;
    							  	<input type="radio" name="animalGender" id="F" value="F" <c:if test="${ animal.animalGender == 'F' }">checked</c:if>><label for="F">&nbsp;여자</label>
    							  	<br><br><br>
    							  	
    							  	<p class="sel">4. ${ animal.animalName }은/는 중성화수술</p>
    							  	<input type="radio" name="isNeuter" id="ok" value="Y" <c:if test="${ animal.isNeuter == 'Y' }">checked</c:if>><label for="ok">&nbsp;했어요</label>&nbsp;
    							  	<input type="radio" name="isNeuter" id="nok" value="N" <c:if test="${ animal.isNeuter == 'N' }">checked</c:if>><label for="nok">&nbsp;안했어요</label>
    							  	<br><br><br>
    							  	
    							  	<p class="sel">5. ${ animal.animalName }의 생일</p>
    							  	<input type="date" name="birthDate" style="width: 120px;" value="${ animal.birthDate }">
    							  	<br><br><br>
    							  	
    							  	<p class="sel">6. ${ animal.animalName }의 몸무게</p>
    							  	<input type="text" name="animalWeight" value="${ animal.animalWeight }"> kg
    							  	<br><br><br>
    							  	
    							  	<p class="sel">7. 참고사항</p>
    							  	<textarea cols="50" rows="10" style="resize: none" name="animalNote">${ animal.animalNote }</textarea>
    							  	<br><br><br>
    							  	
									<button type="submit" id="btn">수정하기</button>
									<button type="button" id="btn2" onclick="location.href='${contextPath}/deleteAnimal.me'">삭제하기</button>
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
			
			if(dbtn.checked){
				div[0].style.display = 'none';
				div[1].style.display = 'none';
				div[0].style.display = 'block';
			}
			
			if(cbtn.checked){
				div[0].style.display = 'none';
				div[1].style.display = 'none';
				div[1].style.display = 'block';
			}
			
			if(obtn.checked){
				div[0].style.display = 'none';
				div[1].style.display = 'none';
			}
			
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
			
			// 삭제 OFF 버튼을 누르면, 배경은 검은색 글자는 하얀색으로 버튼이 바뀌며 삭제 ON으로 뜨게끔 만들기
			// 버튼을 눌렀을 때 파라미터 deleteAttm 안에 삭제한 파일의 정보(리네임/레벨)가 들어가게 하시오
			
			 const deleteOn = document.getElementsByClassName('deleteAttm');
				
	         for(const btn of deleteOn){
	            btn.addEventListener('click', function(){
	            	const nextHidden = this.nextElementSibling;
	            	if(nextHidden.value == 'none'){
	            		this.style.background = "black";
	              		this.style.color = "white";
	              		this.innerHTML = "삭제";
	            		nextHidden.value = this.id.split('-')[1];
	            	} else {
	            		this.style.background = "none";
	              		this.style.color = "black";
	              		this.innerHTML = "유지";
	            		nextHidden.value = 'none';
	            	}
	                              
	            })   
	        }
	   
	         
	        const form = document.getElementById('attmForm');
				
			document.getElementById('btn').addEventListener('click', ()=>{
				const files = document.getElementsByName('file');
				let isEmpty = true;
				for(const f of files){
					if(f.value != ''){
						isEmpty = false;
					}
				}
					
				let isAllRemove = true;
				for(const btn of deleteOn){
					if(btn.innerText == '삭제'){
						isAllRemove = false;
					}
				}
					
				if(isEmpty && isAllRemove){
					$('#modalChoice').modal('show');
				} else {
					form.submit();
				}
			})
			
			const previewImage = (event) => {
			const input = event.target;
			const preview = document.getElementById('preview');
			
			  if (input.files && input.files[0]) {
			    const reader = new FileReader();
			
			    reader.onload = (e) => {
			      preview.src = e.target.result;
			    };
			
			    reader.readAsDataURL(input.files[0]);
			  }
			};
			
		</script>
		<br><br><br><br><br><br><br><br><br><br><br><br><br>
		<footer>
			<%@ include file="../common/bottom.jsp" %>
		</footer>
</body>
</html>