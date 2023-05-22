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
.notice{width: 577px; height: 876px; margin-left: 26%; border: 1px solid white; box-shadow: rgb(224, 224, 224) 0px 0px 10px 0px; border-radius: 4px;}
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
						<td width="80px;" height="10px;"><input type="checkbox" id="agreeAll" class="join1" name = "checkAgree"></td>
						<td class="notice3"><div>집사나라 이용약관, 개인정보 수집 및 이용, 위치기반서비스 이용약관에 모두 동의합니다.</a></td>
					</tr>
					<tr><td class="join1"></td></tr>
					<tr>
						<td><input type="checkbox" id="termsCheckbox" class="join2" name = "checkAgree"></td>
						<td class="notice2"><div>전자 상거래 표준약관 동의</a><a>(필수)</div></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<textarea rows="3" cols="55" class="ta">표준약관 제10023호
(2015. 6. 26. 개정)
제1조(목적) 이 약관은 집사나라 회사(전자상거래 사업자)가 운영하는 집사나라 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

 PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
제2조 (약관 등의 명시와 설명 및 개정) 

  ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

  ② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
							</textarea>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="privacyCheckbox" class="join2" name = "checkAgree"></td>
						<td class="notice2"><div>개인정보 수신 및 이용 동의<a>(필수)</a></div></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<textarea rows="3" cols="55" class="ta">개인정보처리방침 제2523호
제1조 집사나라는 정보 주체의 자유와 권리 보호를 위해 ｢개인정보 보호법｣ 및 관계 법령이 정한 바를 준수하여, 적법하게 개인정보를 처리하고 안전하게 관리하고 있습니다. 이에 ｢개인정보 보호법｣ 제30조에 따라 정보 주체에게 개인정보 처리에 관한 절차 및 기준을 안내하고, 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

이 방침은 별도의 설명이 없는 한 우리 구에서 처리하는 모든 개인정보파일에 적용됩니다. 다만, 소관업무 처리를 위해 소속기관(부서)에서 별도의 개인정보 처리방침을 제정, 시행하는 경우에는 그에 따르고, 해당기관(부서)이 운영하는 홈페이지에 게시함을 알려드립니다.

제2조 개인정보의 처리 목적 및 항목처리목적 라벨처리항목 라벨
①개인정보는 다음의 목적을 위해 처리합니다. 처리한 개인정보는 다음의 목적 이외의 용도로는 사용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
회원가입 및 관리
회원 가입의사 확인, 회원제 서비스 제공에 따른 본인 식별·인증, 회원자격 유지·관리, 제한적 본인확인제 시행에 따른 본인확인, 서비스 부정 이용 방지, 만 14세 미만인 아동의 개인정보 처리 시 법정대리인의 동의 여부 확인, 각종 고지·통지, 고충 처리 등을 목적으로 개인정보를 처리합니다.
민원사무 처리
민원인의 신원 확인, 민원 사항 확인, 사실조사를 위한 연락·통지, 처리결과 통보 등의 목적으로 개인정보를 처리합니다.
공공서비스 제공
자치행정, 교통, 도시계획, 주택건축, 보건복지, 교육, 문화예술, 환경관리 등 주민 생활과 밀접한 공공서비스 제공을 목적으로 개인정보를 처리합니다.
②집사나라는 다음 어느 하나에 해당하는 경우에는 개인정보를 수집한 목적 범위에서 개인 정보를 제3자에게 제공합니다.
정보주체의 동의를 받은 경우
법률에 특별한 규정이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우
법령 등에서 정하는 소관업무의 수행을 위하여 불가피한 경우
정보주체 또는 법정대리인이 의사표시를 할 수 없는 상태에 있거나 주소불명 등으로 사전 동의를 받을 수 없는 경우로서 명백히 정보 주체 또는 제3자의 급박한 생명, 신체, 재산의 이익을 위하여 필요 하다고 인정되는 경우
							</textarea>
						</td>
					</tr>
					<tr>
						<td><input type="checkbox" id="locationCheckbox" class="join2" name = "checkAgree"></td>
						<td class="notice2"><div>위치기반서비스 이용약관 동의<a>(필수)</a></div></td>
					</tr>
					<tr>
						<td></td>
						<td>
							<textarea rows="3" cols="55" class="ta">위치기반서비스 이용약관 제15686호
제 1 조 (목적) 이 약관은 네이버 주식회사 (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

제 2 조 (약관 외 준칙) 이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.

제 3 조 (서비스 내용 및 요금) ①회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
1.GeoTagging 서비스: 게시물 또는 이용자가 저장하는 콘텐츠에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다. 저장된 위치정보는 별도의 활용없이 보관되거나, 또는 장소를 기반으로 콘텐츠를 분류하거나 검색할 수 있는 기능이 제공될 수도 있습니다.
2.위치정보를 활용한 검색결과 및 콘텐츠 제공 : 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과, 주변결과(맛집, 주변업체, 교통수단 등), 번역결과를 제시합니다.
3.이용자 위치를 활용한 광고정보 제공: 검색결과 또는 기타 서비스 이용 과정에서 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 광고소재를 제시합니다.
4.이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
5.길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스, 주소 자동 입력 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
②제1항 위치기반서비스의 이용요금은 무료입니다.
							</textarea>
						</td>
					</tr>
				</table>
			<br><br><br>
			<div class="joinBtn"> 
				<button onclick="location.href='${ contextPath }/home.do'" type="button" id="joinCancel" >취소</button>
				<button  onclick="joinCheck()" type="button" id="joinCheck" >확인</button>
			</div>
			</div>
		</div>
	</div>
<br><br><br><br>

<script>
	const checkAgree = document.getElementsByName('checkAgree');
	const checkAllCheckbox = document.getElementById('agreeAll');
	// 전체 동의하게 하는 함수, 전체 해제도 가능
	checkAllCheckbox.onclick = function() {
		if(this.checked){
			for(const cate of checkAgree){
				cate.checked = true;
			}
		}else {
			for(const cate of checkAgree){
				cate.checked = false;
			}
		}
	}
	
	let count = 0;
	for(const cate of category){
		cate.onclick = function(){
			if(this.checked){
				count++;
			}else{
				count--;
			}
			
			if(count==4){
				all.checked=true;
			}else{
				all.checked=false;
			}
		}
	}
	
	// 약관에 모두 동의하면 회원가입페이지로 넘어가고 아니면 동의하라는 알림창 뜨는 함수
	function joinCheck() {
		  var check1 = document.getElementById('termsCheckbox').checked;
		  var check2 = document.getElementById('privacyCheckbox').checked;
		  var check3 = document.getElementById('locationCheckbox').checked;
		  
		  if (!check1 ) {
		    alert('전자 상거래 표준약관에 동의해야 합니다.');
		    return;
		  }
		  if (!check2 ) {
		    alert('개인정보 수신 및 이용에 동의해야 합니다.');
		    return;
		  }
		  if (!check3 ) {
		    alert('위치기반서비스 이용약관에 동의해야 합니다.');
		    return;
		  } 
		  
		  location.href= "${ contextPath }/enrollPage.do"
	}
</script>

<%@ include file="../common/bottom.jsp" %>
</article>


</body>
</html>