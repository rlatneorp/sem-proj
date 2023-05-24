<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap"  rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>집사 상세후기</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<style>
	* {font-family: 'Noto Sans KR', sans-serif;}
	 	
		
	#modal {width: 300px; height: 150px; border: 1px solid #eee; padding: 20px; margin: auto; display: none;
			border-radius: 20px; box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);  text-align: center; background-color: white;
			 position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 9999;}
			 
	#xBtn {display: inline; width: 100px; border: none; border-radius: 5px;}	
	#oBtn {display: inline; width: 100px; border: none; border-radius: 5px;}	
		
	#modalTitle { display: inline-block;  margin-top: 7px; text-align: center;}
	
	
	.container:nth-of-type(3) {
	  display: flex;
	 
	}
	
	
	.col:nth-child(2) { 
 	 width: 70%;
	}
	
	.review {
	  display: flex;
	  align-items: flex-start;
	  justify-content: flex-end;
	  margin-left: 10px;
	}
	
	.review .profile {
	  margin-right: -30px;
	}
	
	.review img {
	  width: 100px;
	  height: 100px;
	  object-fit: cover;
	  margin-right:1px;
	  border-radius: 50%;
	}
	
	.review h2 {
	  font-size: 1.5rem;
	  font-weight: bold;
/* 	  margin-left:20px; */
	}
		.review h4 {
	  font-size: 20px;
/* 	  margin-left:20px; */
	}
	
	.review p {
	  font-size: 1rem;
	  margin-bottom: 10px;
	  margin-top: 20px;
	  margin-left:20px;
	}
	
	.review .info {
/* 	  display: flex; */
/* 	  flex-direction: column; */
	  align-items: right;
	  text-align: right;
	  width: 100%;
	  margin-left: 100px;
	}
	
	#reviewBoxContainer {
		border: 0.5px solid rgb(26, 188, 156);
		padding: 18px;
		margin: 10px;
		border-radius: 30px;
	}
	
	p {
	   display: -webkit-box;
	   -webkit-line-clamp: 4;
	   -webkit-box-orient: vertical;
	   overflow: hidden;
	   text-overflow: ellipsis;
	   max-height: 120px; /* line-height와 font-size를 곱한 값을 입력합니다. */
 	}
 	
 	.username {
	  background-color: rgb(26, 188, 156);
	  color: white;
	  font-size: 20px;
	  padding: 5px;
	  border-radius: 5px;
	  margin-top: 10px;
	  text-align: center;
	}
	

	button.search-button {
        padding: 0.3rem 0.5rem; /* 패딩값 조정 */
        font-size: 1rem; /* 폰트 크기 조정 */
        border-radius: 10px; /* 둥근 모서리 크기 */
    }
    
     .col:nth-child(3) .images { 
 	  padding-left: 60px; 
 	} 
	
	.col:first-child .images {
	  padding-right: 1px;
	}
	
 	#comment {
 	  text-align: center; 
 	} 
	
	.material-symbols-outlined {
	  font-variation-settings:
	  'FILL' 0,
	  'wght' 100,
	  'GRAD' 200,
	  'opsz' 48;
	  color: rgb(26, 188, 156);
	   
	  
	}
	
	#reviewDetailSetting{align-items: center;}
	
	#allReviewBtn{
		background-color: rgb(26, 188, 156);
		color: white;
		font-size: 24px;
		padding: 0.7rem 1.5rem;
		border-radius: 5px; 
		border: none; 
		margin-right: 170px;}
		
	#replyBtn{
	border: none;
	background-color: rgb(184,184,184);
	color: white;
	cursor: pointer;
	width: 30px;
	height: 100px; display: inline-block; 
	font-size: 20px;
	border-radius: 5px;
	border: none; 
	vertical-align: top;
	writing-mode: vertical-lr;
	}
	
	
	#replyContent{
	border: 1px solid #7F8487;
	background-color: white;
	color: rgb(67, 154, 151);
	border-radius: 5px;
	}
	
	#contentBox{border: 1px solid #7F8487; border-radius: 5px; }
	.td1{text-align:center; font-size: 22px; width: 430px; height: 100px; resize: none; display:inline-block; border:none;}
	#reBtn {border: none;
	background-color: rgb(184,184,184);
	color: white;
	cursor: pointer;
	width: 30px;
	height: 100px; display: inline-block; 
	font-size: 20px;
	border-radius: 5px;
	vertical-align: top; writing-mode: vertical-lr;
	text-align: center;}
	.td2{margin-left: -56px; margin-top: -55px; position: absolute;}
	
	#star {
	  font-variation-settings:
	  'FILL' 1,
	  'wght' 700,
	  'GRAD' 200,
	  'opsz' 48;
	 color: rgb(98, 182, 183);
	 font-size: 30px;  
	}
	.animalInfo{
	margin-top: -100px;
	
	}
/* 	#subtitle{text-align: left; } */
</style>
	


 
<body>
<%@ include file="../common/top.jsp" %>

<div id="reviewDetailSetting">
	<div class="container">
		<br>
		<h1 class="text-left" style="width: 600px; text-align: center; margin-right: -500px; font-weight: bolder;">집사 후기</h1>
		<br>
		<div class="container" style="display: flex; align-items: center; width: 600px; text-align: center;">
		<div class="col">
			<div class="row" id="reviewBoxContainer">
			  	<div class="col">
				    <div class="review">
						  <div class="profile">
							  <c:if test="${empty image}">
									<img src="resources/image/logo.png"> 
								</c:if>
								<c:if test="${!empty image}">
									<img src="resources/uploadFiles/${image.renameName}"> 
								</c:if>
							  <div class="username">${b.memberName}</div>
						  </div>
						  <div class="info">
						  <table style="text-align: left;">
						  	  <tr>
						  		  <td colspan="2"></td>
						  		  <td><h2>${b.jibsaName} 집사</h2><h4>${list.matchingPlace}</h4></td>
						  	 	  <td></td>
						  	 </tr>
						  	  <tr id="subtitle">
						  		  <td colspan="2"></td>
						  	  	  <td style="color: rgb(98, 182, 183);">
						  	  	  	<c:forEach begin="0" end="0">평점 ${list.reviewRating}점</c:forEach>
					  			  </td>
					  			  <td></td>
						  	 </tr>
						 	  <tr>
						 	  <td></td>
								  <td colspan="2">	
						            <c:forEach begin="1" end="${list.reviewRating}">
						             <span class="material-symbols-outlined" id="star" style="font-size: 30px;">star</span>
						            </c:forEach>
							      </td>
						  	  </tr>
						  </table>
						  <div class="animalInfo"><h4  style="color: rgb(26, 188, 156); font-weight: 500;">${b.animalName}</h4><h4>${b.animalKind}</h4></div>
						  </div>
					</div>
					<br>
				</div>
				<hr><br><br>
				<textarea readonly cols="50" rows="10" style="resize: none; padding: 20px;" name="content" id="contentBox">  ${b.reviewContent }</textarea>
				
				<hr><br><hr><br>
				<h4 style="text-align: center;">집사의 댓글</h4>
				<br>
				<table id="reviewId">
					<tbody class="tbody1" style="text-align: center;">	
						<tr class="tr1">
							<td><textarea class="td1" readonly placeholder=" ${ b.jibsaName}님 댓글을 달아주세요!">${ b.jibsaComment }</textarea></td>
						<c:if test="${ loginUser.memberName eq b.jibsaName }">
						<c:if test="${ b.jibsaComment ne null }">
							<td>
								<button class="td2" type="button" id="reBtn">삭제</button>
							</td>
						</c:if>	
						</c:if>							
						</tr>
					</tbody>
				</table>
				
				<br><hr><br>
				<c:if test="${ loginUser.memberName eq b.jibsaName }">
				  <div id="comment">
				    <textarea id="replyContent" placeholder=" 댓글을 달거나 수정해주세요" style="resize: none; width:430px; height: 100px; display: inline-block;"></textarea>
					<button type="button" name="reply" id="replyBtn" onclick="json_reply();">저장</button>
				</div>
				</c:if>
			<br><br>
			</div>
			<br><br>
			<div class="col" style="margin-left: 160px;">
				<button id="allReviewBtn" onclick="location.href='${contextPath}/review_Main.bo'">모든 후기 보기</button>
			</div>
		</div>
			<br><br>
	</div>			
	</div>	
	</div>
<br><br><br><br>	

		<div id="modal">
		<h5 id="modalTitle">댓글을 삭제하시겠습니까?</h5>
		<br><hr>
		<button id="xBtn" onclick="deletedReply();">예</button>
		<button id="oBtn">아니요</button><br>
		</div>


<%@ include file="../common/bottom.jsp" %>

<script>
	const reBtn = document.querySelector('#reBtn');
	const modal = document.querySelector('#modal');
	const xBtn = document.querySelector('#xBtn');
	const oBtn = document.querySelector('#oBtn');
	
	if(reBtn != null){ 
	reBtn.addEventListener('click', ()=>{	
		   modal.style.display = 'block';
		});
	oBtn.addEventListener('click', ()=>{	
		   modal.style.display = 'none';
		});
		  
	window.addEventListener('click', e => {
	    if(!modal.contains(e.target) && !reBtn.contains(e.target)) {
	      modal.style.display = 'none';
	      }
	 })
	};
	function json_reply(){
		const jibsaCom = document.querySelector('#replyContent').value;
		var ajax1 = $.ajax({
			url: '${contextPath}/updateReply.bo',
			data: {
				  jibsaComment: jibsaCom,
				  matchingNo: ${b.matchingNo}
			},
			success: function(data){
				console.log(data);
									
				const td1 = document.querySelector('.td1');
				
				td1.innerText = '';
				td1.innerText = jibsaCom;
				
				
				document.querySelector('#replyContent').value = '';
				
			},
			error: function(data){
				console.log(data);
			},
			complete: function() {
				location.reload();
			}
		});
		
	}
	
	function deletedReply(){
		const jibsaCom = document.querySelector('#replyContent').value;
		var ajax2 = $.ajax({
			url: '${contextPath}/deleteReply.bo',
			data: {
				  jibsaComment: jibsaCom,
				  matchingNo: ${b.matchingNo}
			},
			success: function(data){
				console.log(data);
				modal.style.display = 'none';
				const tr1 = document.querySelector('.tr1');
				tr1.innerHTML = '';
			},
			error: function(data){
				console.log(data);
			},
			complete: function() {
				location.reload(); 
			}
		});
		
	};	
		
		
</script>
</body>
</html>