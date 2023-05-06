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

	* {font-family: 'Noto Sans KR', sans-serif; margin: auto;}
	
	#dog {display: block; margin: auto; border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);}
	
	h2 {text-align: center; font-weight: 700;}
	
	.search {
	  position: relative;
	  width: 450px;
	  margin: 0 auto;
	}
	
	input {
	  width: 100%;
	  border: 1.5px solid #1abc9c;
	  border-radius: 20px;
	  padding: 10px 13px;
	  font-size: 14px;
	  outline: none;
	  font-weight: 300;
	}

	
	#search-icon {
	  position : absolute;
	  width: 23px;
	  top: 11px;
	  right: 23px;
	  margin: 0;
	}
	
 	.accordion { 
     background-color: white; 
     color: black; 
     cursor: pointer; 
     padding: 24px; 
     width: 800px; 
     height: 60px; 
     margin-left: auto; margin-right: auto;
     border: 2px solid #eee; 
     text-align: left; 
     outline: none; 
     font-size: 15px; 
     color: black; 
     transition: 0.4s; 
     border-radius: 20px; 
     display: flex; 
   	 align-items: center; 
     margin-bottom: 30px; 
     box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2) 
   } 
  
   .active, .accordion:hover { 
      color: #1abc9c; 
    } 
  
   .panel { 
     padding: 0 18px; 
     background-color: white; 
     margin-left: 550px; 
     display: none; 
     overflow: hidden; 
  	 margin-bottom: 10px; 
  	 transition: height 0.5s ease;
   } 
	
</style>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<br><br><br>
	<img src="img/dog.png" id="dog">
	<br><br>
	
	<h2>자주하는 질문</h2><br><br>
	
	<div class="search">
  		<input type="text" placeholder=" 검색어를 입력해주세요">
  		<img src="img/search.png" id="search-icon">
	</div><br><br><br>

	<button class="accordion">1. 집사나라는 어떤 나라인가요?</button>
	<div class="panel">
	  <p>Content 1</p>
	</div>
	
	<button class="accordion">2. 결제는 어떻게 하나요?</button>
	<div class="panel">
	  <p>Content 2</p>
	</div>
	
	<button class="accordion">3. 우리 아이를 어떻게 믿고 맡기죠?</button>
	<div class="panel">
	  <p>Content 3</p>
	</div>
	
	<button class="accordion">4. 으아앙</button>
	<div class="panel">
	  <p>Content 4</p>
	</div>

	<br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br>
	
	
	<script>
	
		const accordions = document.querySelectorAll(".accordion");
		
		for (let i = 0; i < accordions.length; i++) {
			accordions[i].addEventListener("click", function() {
				// 현재 버튼의 다음 요소인 패널 요소를 가져옵니다.
				const panel = this.nextElementSibling;
				// 패널이 보이지 않는 상태라면 보이도록 합니다.
				if (panel.style.display === "none") {
					panel.style.display = "block";
					this.classList.add("active");
				} else { // 패널이 보이는 상태라면 감추도록 합니다.
					panel.style.display = "none";
					this.classList.remove("active");
				}
			});
		}
	</script>
	
</body>
</html>