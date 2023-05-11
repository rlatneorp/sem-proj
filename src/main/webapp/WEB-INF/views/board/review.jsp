<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<style>
	#reviewMain{width: 1200px; max-width: none !important; margin: 0 auto;}
 	
 	.reBtn {color: #1abc9c; border: 1px solid #1abc9c; background-color: white; width:60px; height: 30px; border-radius: 20px;}		
		
 	.mo {width: 600px; height: 400px; border: 1px solid #eee; padding: 20px; margin: auto; display: none; 
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center; background-color: white;
			 position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 1;}
			 
 	.xB {border: none; background-color: transparent; float: right;}	 
	
/*     .mo img { display: inline-block; float: left; z-index: 2;} */
 	
	* {font-family: 'Noto Sans KR', sans-serif;}
	
	body { max-width: none !important; margin: 0 auto; text-align: center; margin-left: auto; margin-right: auto;}
	
	.title {margin-left: 200px; font-weight: 700;}
	
	.area {border: 1px solid lightgray; padding: 20px;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center;}
	.avg {font-weight: 700;}
			
	
	.subtitle {font-size: 20px; text-align: left; font-weight: 500;}

	#area1 {display: inline-block; width: 380px; height: 340px; margin-left: 218px;  align-items: center; justify-content: center;
			top: 100px;}
	#area2 {display: inline-block; width: 380px; height: 340px; align-items: center; padding-top: 81px;}
	#area3 {margin-left: auto; margin-right: auto; width: 765px; height: 340px; margin-top: 20px;}
	
	.check {background-color: #1abc9c; color: white; border: none; width:85px; height: 33px;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);}
 	
	#reviewId{font-family: 'Noto Sans KR', sans-serif;  font-weight: 500; list-style: none; position: relative; }
 	#btnX{float:right; margin-left: -60px;}
 	#li1{ float:left; margin-top:30px; margin-left:30px; display:inline-block;}
 	#li2{ float:left; margin-top:44px; margin-left: 20px; display:inline-block;}
 	#li3{ float:right; margin-top:38px; display:inline-block; }
 	#li4{ float:right; margin-top:44px; margin-right: 100px; }
 	#li5{ margin-top: 130px; }
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<div id="reviewMain">
	<br>
	<h2 class="title">마이페이지</h2><br>
	<h4 class="title">후기 현황</h4><br><br>
	<form>
		<div class="area" id="area1">
			최대 3개월 범위 내에서 조회가 가능합니다.<br><br>
			<span class="subtitle">시작일</span><br><br>
			<select class="year" aria-label=".form-select-sm example">
				<option value="2023" selected>2023년</option>
				<option value="2022">2022년</option>
				<option value="2021">2021년</option>
			</select>  
			<select class="month" aria-label=".form-select-sm example">
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4" selected>4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select><br><br>
			
			<span class="subtitle">종료일</span><br><br>
			<select class="year" aria-label=".form-select-sm example">
				<option value="2023" selected>2023년</option>
				<option value="2022">2022년</option>
				<option value="2021">2021년</option>
			</select>
			<select class="month" aria-label=".form-select-sm example">
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4" selected>4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select><br><br>
			<button class="check">조회</button>
		</div>
		
		<div class="area" id="area2">
			<span class="subtitle">평점</span><br><br>
			<img src="resources/image/star1.png"/>
			<img src="resources/image/star1.png"/>
			<img src="resources/image/star1.png"/>
			<img src="resources/image/star1.png"/>
			<img src="resources/image/star1.png"/><br>
			<span>
				<h2 class="avg">5.0</h2>
			</span>
			<br>
			<span class="subtitle">후기건수</span><br>
			<span>33건</span><br>	
		</div>
	</form>
		<div class="area" id="area3">
			<span class="subtitle">조회결과</span><br>
			<span>2023년 01월 - 2023년 04월</span><br><br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">이름</th>
						<th scope="col">날짜</th>
						<th scope="col">애완동물</th>
						<th scope="col">후기보기</th>
					</tr>
				</thead>
				<tbody> 
			<c:forEach items="${ list }" var="i" varStatus="status">
				<tr>
					<th scope="row">${ status.index + 1 }</th>
					<td>${ i.memberName }</td>
					<td>${ i.endDate }</td>
					<td>${ i.animalName }</td>
					<td>
						<button class="reBtn${ status.index+1}" style="color: #1abc9c; border: 1px solid #1abc9c; background-color: white; width:60px; height: 30px; border-radius: 20px;">후기</button>
					</td>
				</tr>
				<div class="mo modal${status.index + 1}">
		    		<button class="xB xBtn${status.index + 1}">
		    			<img src="resources/image/x.png"/>
		    		</button>
				    <div id="li1"><img src="resources/image/user.png" width="50px" height="50px"/></div>
				    <div id="li2"><a>${ i.memberName }</a></div>
				    <div id="li3">
					    <img src="resources/image/star1.png" width="30px" height="30px"/>
					   	<img src="resources/image/star1.png" width="30px" height="30px"/>
					    <img src="resources/image/star1.png" width="30px" height="30px"/>
					    <img src="resources/image/star1.png" width="30px" height="30px"/>
					    <img src="resources/image/star2.png" width="30px" height="30px"/>
				    </div>
				   	<div id="li4"><a>${ i.animalName }</a></div>
					<div id="li5"><hr><br><a>${ i.reviewContent }</a></div>
				</div>	 
			</c:forEach>
		</tbody>
	</table> 
	</div>
	</div>
	<script>
		window.onload = () =>{ 
			const reBtns = document.querySelectorAll('[class^="reBtn"]');
			const modals = document.querySelectorAll('[class^="mo modal"]');
			const xBtns = document.querySelectorAll('[class^="xB xBtn"]')
			for(let i = 0; i < reBtns.length; i++) {
				const reBtn = reBtns[i];
				const modal = modals[i];
				const xBtn = xBtns[i];
				  
				reBtn.addEventListener('click', ()=>{	
				   modal.style.display = 'block';
				});
				xBtn.addEventListener('click', ()=>{	
				   modal.style.display = 'none';
				});
				  
			    window.addEventListener('click', e => {
			       if(!modal.contains(e.target) && !reBtn.contains(e.target)) {
			         modal.style.display = 'none';
			         }
			    });
			 }   
	 	 }
	</script>

</body>
</html>