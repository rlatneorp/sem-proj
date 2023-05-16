<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>



</head>
<body>
	<%@ include file="../common/top.jsp" %>
	<%@ include file="../common/adminSideBar.jsp" %>
	
	임시 페이지
	<input type="text" class="timepicker">
	
	
	
	<!-- body인듯 -->
	<script>
		$(document).ready(function(){
			$('.timepicker').timepicker({
			    timeFormat: 'h:mm p',
			    interval: 30,
			    minTime: '10',
			    maxTime: '6:00pm',
			    defaultTime: '11',
			    startTime: '10:00',
			    dynamic: false,
			    dropdown: true,
			    scrollbar: true
			});
		});
	</script>	
	
	
</body>
</html>