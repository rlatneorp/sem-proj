<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
	#area2 {display: inline-block; width: 380px; height: 340px; align-items: center; padding-top: 81px; vertical-align: top;}
	#area3 {margin-left: auto; margin-right: auto; width: 765px; height: 500px; margin-top: 20px;}
	
	.check {background-color: #1abc9c; color: white; border: none; width:85px; height: 33px;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);}
 	
	#reviewId{font-family: 'Noto Sans KR', sans-serif;  font-weight: 500; list-style: none; position: relative; }
 	#btnX{float:right; margin-left: -60px;}
 	#li1{ float:left; margin-top:30px; margin-left:30px; display:inline-block;}
 	#li2{ float:left; margin-top:38px; margin-left: 20px; display:inline-block;}
 	#li2{ font-size: 30px; font-weight: 500;}
 	#li3{ float:right; margin-top:45px; display:inline-block; }
 	#li4{ text-align: left; vertical-align: text-top;}
 	#li4{ font-size: 15px; font-weight: 400; color:black;}
 	#li5{ margin-top: 130px; }
 	

	.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 1,
	  'wght' 700,
	  'GRAD' 200,
	  'opsz' 48;
	 color: rgb(98, 182, 183);
	 font-size: 40px;  
	}
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp"/>
	
	<div id="reviewMain">
	<br>
	<h2 class="title">마이페이지</h2><br>
	<h4 class="title">후기 현황</h4><br><br>
	<form id="searchForm" action="${ contextPath }/jibsaReviewDateSearch.js" method="GET">
		<div class="area" id="area1"><br><br><h4>날짜로 검색하기</h4>
		<br>
			모든 범위를 검색하실 수 있습니다<br><br>
			<div id="dateType">
  				<input type="date" id="dateFrom" name="from">
  				~ <input type="date" id="dateTo" name="to">
			</div><br><br>
			<button class="check">조회</button>
		</div>
		<div class="area" id="area2">
	    <span class="subtitle">평점</span><br>
		    <div>
		        <c:forEach var="item" items="${b}" begin="0" end="0">
		            <c:forEach var="i" begin="1" end="${item.jibsaAvgRating}">
		                <span class="material-symbols-outlined" style="font-size: 40px;">star</span>
		            </c:forEach>
		        </c:forEach>
		    </div>
		    <span>
			    <c:forEach var="item" items="${b}" begin="0" end="0">
   				 ${item.jibsaAvgRating}점
  				</c:forEach>
			</span>
			<br><br>
			<span class="subtitle">후기건수</span><br>
			<span>${fn:length(b)}</span><br>	
		</div>
	</form>
		<div class="area" id="area3" style="overflow:scroll; overflow-x:hidden; ">
			<span class="subtitle">조회결과</span><br>
			<span>${ from } - ${ to }</span><br><br>
			<table class="table" id="scrollTable">
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
			<c:forEach items="${ b }" var="i" varStatus="status">
				<tr id="scrollReview">
					<th scope="row">${ status.index + 1 }</th>
					<td>${ i.memberName }</td>
					<td>${fn:substring(i.endDate, 0, 10)}</td>
					<td>${ i.animalName }</td>
					<td>
						<button class="reBtn${ status.index+1}" style="color: #1abc9c; border: 1px solid #1abc9c; background-color: white; width:60px; height: 30px; border-radius: 20px;">후기</button>
					</td>
				</tr>
				<div class="mo modal${status.index + 1}">
		    		<button class="xB xBtn${status.index + 1}">
		    			<img src="resources/image/x.png"/>
		    		</button>
				    <div id="li1"><img src="resources/image/user.png" width="70px" height="70px"/></div>
				    <div id="li2"><a>${ i.memberName }</a></div>
				    <div id="li3">
				            <c:forEach begin="1" end="${i.reviewRating}">
				                <span class="material-symbols-outlined" style="font-size: 40px;">star</span>
				            </c:forEach>
				    </div>
				   	<div id="li4"><a>　　${ i.animalName }</a></div>
					<div id="li5"><hr><br><a>${ i.reviewContent }</a></div>
				</div>	 
			</c:forEach>
		</tbody>
		
	</table> 
	</div>
	</div>
	<br><br><br>
<jsp:include page="../common/bottom.jsp"/>

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
	$('#btnSearch').click(function() {
	    var dateFrom = document.getElementById('dateFrom').value;
	    var dateTo = document.getElementById('dateTo').value;
	    var today = new Date();

	    var fromYear = 0;
	    var fromMonth = 0;
	    var fromDay = 0;

	    if (dateFrom !== '') {
	        dateFrom = new Date(dateFrom);
	        fromYear = dateFrom.getFullYear();
	        fromMonth = dateFrom.getMonth() + 1;
	        fromDay = dateFrom.getDate();
	    }

	    var toYear = 0;
	    var toMonth = 0;
	    var toDay = 0;

	    if (dateTo !== '') {
	        dateTo = new Date(dateTo);
	        toYear = dateTo.getFullYear();
	        toMonth = dateTo.getMonth() + 1;
	        toDay = dateTo.getDate();
	    }

	    var todayYear = today.getFullYear();
	    var todayMonth = today.getMonth() + 1;
	    var todayDay = today.getDate();

	    var todayString = todayYear + '-' + todayMonth + '-' + todayDay;

	    if (fromYear === 0 || fromMonth === 0 || fromDay === 0 || isNaN(fromYear) || isNaN(fromMonth) || isNaN(fromDay)) {
	        fromYear = 0;
	        fromMonth = 0;
	        fromDay = 0;
	    }

	    if (toYear === 0 || toMonth === 0 || toDay === 0 || isNaN(toYear) || isNaN(toMonth) || isNaN(toDay)) {
	        toYear = 0;
	        toMonth = 0;
	        toDay = 0;
	    }

	    var from = fromYear + '-' + fromMonth + '-' + fromDay;
	    var to = toYear + '-' + toMonth + '-' + toDay;

	    
	    if (from <= todayString && to >= from) {
	        var searchUrl = '${contextPath}/jibsa_Review.js?from=' + from + '&to=' + to;
	        window.location.href = searchUrl;
	    } else {
	        alert("해당 기간의 조회가 불가능합니다.");
	    }
		     
	});
    $(document).ready(function() {
        var urlParams = new URLSearchParams(window.location.search);
        var from = urlParams.get('from');
        var to = urlParams.get('to');
        
        if (from === '' && to === '') {
            alert("검색할 날짜를 지정해주세요.");
        }
    });


</script>

</body>
</html>