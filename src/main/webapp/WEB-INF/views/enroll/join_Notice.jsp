<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;700&display=swap" rel="stylesheet">
<title>집사나라 - 회원가입 - 약관동의</title>
<style>
.joinNotice{font-size: 45px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; color: black; text-decoration: none; text-align: center;}
.notice{width: 577px; height: 876px; margin-left: 30%; border: 1px solid white; box-shadow: rgb(224, 224, 224) 0px 0px 10px 0px; border-radius: 4px;}
.noticeContent{font-size: 24px; font-family: 'Noto Sans KR', sans-serif; font-weight: 700; color: black; text-decoration: none; text-align: center;}
.noticeHead{font-size: 16px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; color: black; text-decoration: none; display:inline;}
.join1{width: 30px; margin-left: 27px;  margin-bottom: 30px; margin-top: 10px;}
.join2{width: 25px; margin-left: 29px;  margin-bottom: 10px;}
.notice3{align-content: center; text-align: justify; display: block; width: 434px; height: 45px; }
.notice2{text-align: left; display: block;}
.noticBot{margin-left: 77px; text-align: justify; width: 434px; height: 45px; font-size: 14px; font-family: 'Noto Sans KR', sans-serif; font-weight: 300; color: black; text-decoration: none; display:inline-block;}
.ta{display: inline;  margin-bottom: 20px;}
#joinCancel{margin-left: 100px; width: 131px; height: 40px; color: white; background: rgb(127, 127, 127); border-radius: 4px; border-style: none;}
#joinCheck{margin-left: 110px; width: 131px; height: 40px; color: white; background: rgb(26, 188, 156); border-radius: 4px; border-style: none;}
.joinBtn{display: inline;}
</style>
</head>
<body>
<jsp:include page="../common/top.jsp"/>
<article style="width: 1200px; margin: 0 auto;">
<br><br>
	<div class="joinNotice">
		<a>회원가입</a>
	</div>
	<br>
	<div>
		<div class="notice">
		<br>
			<div class="noticeContent">
				<a>회원가입 약관</a>
			</div>
			<br><br>
			<div class="noticeHead">
				<table>
					<tr>
						<td width="80px;" height="10px;"><img src="resources/image/join1.png" class="join1"></td>
						<td class="notice3"><div>집사나라 이용약관, 개인정보 수집 및 이용, 위치기반서비스 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.</a></td>
					</tr>
					<tr><td class="join1"></td></tr>
					<tr>
						<td><img src="resources/image/join1.png" class="join2"></td>
						<td class="notice2"><div>집사나라 이용약관 동의</a><a>(필수)</div></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<textarea rows="3" cols="55" class="ta">여러분을 환영합니다.
집사나라 서비스 및 제품(이하 '서비스')을 이용해 주셔서 감사합니다.
본 약관은 다양한 집사나라 서비스의 이용과 (이하생략)
							</textarea>
						</td>
					</tr>
					<tr>
						<td><img src="resources/image/join1.png" class="join2"></td>
						<td class="notice2"><div>개인정보 수신 및 이용 동의<a>(필수)</a></div></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<textarea rows="3" cols="55" class="ta">여러분을 환영합니다.
집사나라 서비스 및 제품(이하 '서비스')을 이용해 주셔서 감사합니다.
본 약관은 다양한 집사나라 서비스의 이용과 (이하생략)
							</textarea>
						</td>
					</tr>
					<tr>
						<td><img src="resources/image/join1.png" class="join2"></td>
						<td class="notice2"><div>위치기반서비스 이용약관 동의<a>(선택)</a></div></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<textarea rows="3" cols="55" class="ta">여러분을 환영합니다.
집사나라 서비스 및 제품(이하 '서비스')을 이용해 주셔서 감사합니다.
본 약관은 다양한 집사나라 서비스의 이용과 (이하생략)
							</textarea>
						</td>
					</tr>
					<tr>
						<td><img src="resources/image/join1.png" class="join2"></td>
						<td class="notice2"><div>프로모션 정보 수신 동의<a>(선택)</a></div></td>
					</tr>
				</table>
				<div class="noticBot">집사나라 서비스 및 제휴 이벤트 혜택 등의 정보를 휴대전화(집사나라앱 알림 또는 문자), 이메일로 받을 수 있습니다. 일부 서비스(별개의 회원 체계 운영, 집사나라 가입 후 추가 가입하는 서비스 등)의 경우, 수신에 대해 별도로 안내 드리며 동의를 구합니다.</div>
			<br><br><br>
			<div class="joinBtn"> 
				<button onclick="location.href='${ contextPath }/home.do'" type="submit" id="joinCancel" value="cancel">취소</button>
				<button onclick="location.href='${ contextPath }/enrollPage.do'" type="submit" id="joinCheck" value="check">확인</button>
			</div>
			</div>
		</div>
	</div>
<br><br><br><br>
<%@ include file="../common/bottom.jsp" %>
</article>


</body>
</html>