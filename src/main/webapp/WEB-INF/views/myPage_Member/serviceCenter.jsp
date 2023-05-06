<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<style>
	.table thead tr th{background: rgba(224, 224, 224, 0.51);}
	.tablediv{
		width: 800px;
		text-align: center;
		display: block;
		margin: 0 auto;
	}
	#fdetail{cursor: pointer;}
	#fdetail:hover{text-decoration: underline;}
	.faqbtn{
		background: rgb(26, 188, 156);
	 	color: white;
	 	border: none;
	 	border-radius: 10px;
	 	padding: 10px;
	}
	#faqbtn{text-align: left; width: 800px; margin: 0 auto;}
	.detail{
		cursor: pointer;
	}
	.detail:hover{text-decoration: underline;}
	#write{
		background: white;
	 	color: black;
	 	border: 1px solid rgb(224, 224, 224);
	 	border-radius: 10px;
	 	padding: 10px;
	 	margin-left: 700px;
	}
		h2 {text-align: center; font-weight: 700;}
	
	.search {
	  position: relative;
	  width: 450px;
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
     margin-left: 0px; 
     display: none; 
     overflow: hidden; 
  	 margin-bottom: 10px; 
  	 transition: height 0.5s ease;
  	 text-align: left;
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
					 <h4 style="margin-right: 700px;"><b>고객센터</b></h4>
					 <br>
					 <div id="faqbtn">
					 <button class="faqbtn">자주묻는질문</button>
					 <button class="faqbtn">1:1 문의</button>
					 </div>
					    <br><br>
						    <div class="tablediv" id="faqD">
									<h2 style="text-align: left">자주하는 질문</h2><br><br>
									
									<div class="search">
								  		<input type="text" placeholder=" 검색어를 입력해주세요">
								  		<img src="../../img/search.png" id="search-icon">
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
						    	</div>
						    	<div class="tablediv" id="qnaD">
							    <table class="table">
							    	<thead>
							    	<tr>
							    		<th>글 번호</th>
							    		<th>제목</th>
							    		<th>작성 날짜</th>
							    		<th>답변 여부</th>
							    	</tr>
							    	</thead>
							    	<tbody>
							    	<tr>
							    		<td>1255</td>
							    		<td onclick="location.href='editQ&A.jsp';" class="detail">문의합니다.</td>
							    		<td>2023-04-17(월)</td>
							    		<td>답변중</td>
							    	</tr>
							    	<tr>
							    		<td>1187</td>
							    		<td>예약 취소하고 싶어요</td>
							    		<td>2023-04-16(토)</td>
							    		<td>답변중</td>
							    	</tr>
							    	<tr>
							    		<td>1125</td>
							    		<td>회원 탈퇴는 어떻게 하나요?</td>
							    		<td>2023-04-15(금)</td>
							    		<td>답변완료</td>
							    	</tr>
							    	<tr>
							    		<td>1112</td>
							    		<td>결제는 어떻게 하나요?</td>
							    		<td>2023-04-06(토)</td>
							    		<td>답변완료</td>
							    	</tr>
							    	<tr>
							    		<td>1110</td>
							    		<td>집사와 상담은 어떻게 하나요?</td>
							    		<td>2023-04-01(화)</td>
							    		<td>답변완료</td>
							    	</tr>
							    	</tbody>
						    	</table>
						    	<button id="write" onclick="location.href='Q&A.jsp';">문의하기</button>
					    </div>
					 </div>
				</div>
	         </div>
	      </div>
	      <script>
// 	      	const btn = document.getElememtsByClassName('faqbtn');
// 	      	const show = document.getElementsByClassName('tableDiv');
	      	
// 	      	btn[0].addEventListener('click', () => {
// 	      		show[0].style.display = 'table';
// 	      		show[1].style.display = 'none';
// 	      	});
	      	
// 	      	btn[1].addEventListener('click', () => {
// 	      		show[1].style.display = 'table';
// 	      		show[0].style.display = 'none';
// 	      	});
			
			const faqBtn = document.getElementsByClassName('faqbtn')[0];
			const qnaBtn = document.getElementsByClassName('faqbtn')[1];
			const tableDiv1 = document.getElementById('faqD');
			const tableDiv2 = document.getElementById('qnaD');
			
			console.log(faqBtn);
			
			tableDiv2.style.display = 'none';
			
			faqBtn.addEventListener('click', () => {
			  tableDiv2.style.display = 'none';
			  tableDiv1.style.display = 'block';
			});
			
			qnaBtn.addEventListener('click', () => {
			  tableDiv2.style.display = 'block';
			  tableDiv1.style.display = 'none';
			});
			
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
	      <br><br><br><br><br><br><br><br><br><br><br><br><br>
		<footer>
			<%@ include file="../common/bottom.jsp" %>
		</footer>
</body>
</html>