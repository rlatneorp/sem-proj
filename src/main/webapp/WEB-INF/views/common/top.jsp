<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">

	<!-- 이환희 css파일(추후 병합 요망) -->
	<link rel="stylesheet" href="${ contextPath }/css/main.css"/>
<!-- 장현지 중복확인 Ajax -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<title>top</title>
<style>
.menu1:hover:not(.active){color: rgb(51, 51, 51);}

.btjipsa{width: 138px; height: 58px; background: rgb(26, 188, 156); border-style: none; border-radius: 4px; }
#btjibsa_apply{color: white; border-radius: 4px; width:100px; height:37px; margin-left: 45px; 
		 font-family: 'Noto Sans KR', sans-serif; font-size : 18px}
.topCont{width: 1200px; max-width: none !important; margin: 0 auto;}
.logo{width: 160px;}
.menu1{font-size: 23px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; margin: 10px; color: rgb(51, 51, 51); text-decoration: none;}
.menu2{font-size: 23px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; margin: 10px; color: white;}
.topLeft{margin-left: 5%; display: inline;}
.topRight{margin-left: 15%; display: inline;}
#top_hr{border: 20px solid rgb(26, 188, 156); opacity: 1; margin: 0;}
#top_hr2{border: 1px solid gray;}
		.menu1:hover:not(.active){color: rgb(51, 51, 51);}
		.menu2:hover:not(.active){color: rgb(51, 51, 51);}
		.myMenu:hover:not(.active){color: rgb(51, 51, 51);}
		.btjipsa{width: 138px; height: 58px; background: rgb(26, 188, 156); border-style: none; border-radius: 4px;}
		.topLoginCont{width: 1200px; max-width: none !important; margin: 0 auto;}
		.logo{width: 160px;}
		.menu1{font-size: 20px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; margin: 10px; color: rgb(51, 51, 51); text-decoration: none;}
		.menu2{font-size: 23px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; color: rgb(51, 51, 51); text-decoration: none; justify-content: unset;}
		.left{margin-left: 5%; display: inline;}
		#right{margin-left: 18%; display: inline;}
		
		#top_hr{border: 20px solid rgb(26, 188, 156); opacity: 1; margin: 0;}
		#top_hr2{border: 1px solid gray;}
		#profile{width: 53px; height: 53px; border-radius: 100%; margin: 5px;}
		.animal:hover:not(.active){color: rgb(51, 51, 51);}
		.name:hover:not(.active){color: rgb(51, 51, 51);}
		.name{font-size: 23px; font-weight: 700; font-family: 'Noto Sans KR', sans-serif; margin: 0px; color: rgb(51, 51, 51); text-decoration: none; display: inline-block;}
		.animal{font-style: inherit; font-size: 18px; font-family: 'Noto Sans KR', sans-serif; margin: 0; color: rgb(51, 51, 51); text-decoration: none;}
		.dropd{margin-top: 3.5%; margin-right: 12%}
		.butn{padding: 10px 20px; background-color: transparent; border: none;}
		#drop-c{position: absolute; z-index: 1; border-radius: 15px; background-color: rgb(255, 255, 255); border-style: none; box-shadow: rgb(224, 224, 224) 0px 0px 20px 0px;}
		#drop-c a{display: block; padding: 5px 20px; margin: 2px 0px 0px 0px; text-decoration: none;}
		.myMenu{font-weight: 700; font-size: 18px; font-family: 'Noto Sans KR', sans-serif; margin: 10px; color: rgb(51, 51, 51); text-decoration: none;}
		#logOut{border: solid 1px; border-radius: 4px; width:100px; height:37px; margin-left: 45px; border-color: rgb(151, 222, 206); background-color: white;
		 font-family: 'Noto Sans KR', sans-serif; color: rgb(26, 188, 156);}
		#droul{margin: 0px 0px 0px; padding: 1px 1px 1px 1px; list-style: none;}
	
</style>
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"/>
<header> 
	<hr id="top_hr">
	<br>
	<div>
	<div class="topCont"> 
		<div class="topLeft" style="color: inherit;">
	    	<a class="menu1" href="${contextPath}"><img src="resources/image/logo.png" alt="logo" class="logo"></a>
		    <a class="menu1" href="${ contextPath }/matching_Main.mc">집사매칭</a>
		    <a class="menu1" href="${ contextPath }/jibsa_List.bo">집사보기</a>
		    <a class="menu1" href="${ contextPath }/review_Main.bo">이용후기</a>
		</div>
		<c:if test="${ empty loginUser }">
		<div class="topRight">    
		    <a class="menu1" href="${ contextPath }/loginView.do">로그인</a>
		    <a class="menu1" href="${ contextPath }/joinNotice.do">회원가입</a>
			<button class="btjipsa menu2" type="submit" onclick="location.href='${contextPath}/enrollJibsa.js'">집사 지원</button>
		</div>
		</c:if>
		<c:if test="${ !empty loginUser }"> 
			<div id="right">
				<a class="menu1"><img src="resources/image/profile.png" alt="profile" id="profile"></a>
				<a class="menu2">${ loginUser.memberName }</a>
				<div class="dropd" style="float:right; " aria-expanded="false">
					<button onclick="dp_menu()" class="butn"><img src="resources/image/down.png"></button>
				    <div style="width: 230px; height: 390px; display: none;" id="drop-c">
				    	<ul id="droul">
				    	<c:if test="${ loginUser.isAdmin eq 'Y' }">
					       <li><a class="name">${ loginUser.memberName }관리자</a></li>
					       <li><a><hr></a></li>
					       <li><a class="myMenu" href="${ contextPath }/admin_Main.ad">관리자페이지</a></li>
					       <li><a><button onclick="location.href='${contextPath}/logout.do'" id="logOut">로그아웃</button></a></li>
				    	</c:if>
				    	
				    	<c:if test="${ loginUser.isAdmin eq 'N' }">
					       <li><a class="name">${ loginUser.memberName }님</a></li>
					       <li><a class="animal" style="display: block; float:left;">고양이</a><a class="animal">시암</a></li>
					       <li><a class="animal">미돌이</a></li>
					       <li><a><hr></a></li>
					       <li><a class="myMenu" href="${ contextPath }/member_User_Info.me">마이페이지</a></li>
					       <li><a class="myMenu" href="${ contextPath }/member_EditInfo.me">프로필 설정</a></li>
				  		   <li><a href="${contextPath}/enrollJibsa.js"><button class="btjipsa menu2" id = "btjibsa_apply" >집사 지원</button></a></li>
					       <li><a><button onclick="location.href='${contextPath}/logout.do'" id="logOut">로그아웃</button></a></li>
				    	</c:if>
				        </ul>
				    </div>
			  	 </div>
		  	</div>
		</c:if>
	</div>
	</div>
	<hr id="top_hr2">
</header>
<script>
	const dp_menu = () => {
	  const dropC = document.getElementById("drop-c");
	  if (dropC.style.display === "none") {
	    dropC.style.display = "block";
	  } else {
	    dropC.style.display = "none";
	  }
	};
	
	
	 
</script>
</body>
</html>