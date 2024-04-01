<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
	<script type="text/javascript">
	function kakaopay(){
		var url ="kakaopay";
		var param = "";
		
		sendRequest(url,param,resultFn,"post");
	}
	
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = (new Function ('return' + data))();
			
			var url = json.next_redirect_pc_url;
			var popOption = "top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no";
			
			window.open(url,"kakaopay", popOption);
		}
	}
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/business/check_bu.jsp"></jsp:include>
	<div align="center" style="margin-top: 10px;">
		<input type="button" value="객실등록" onclick="location.href='addRoom_form'">
		<input type="button" value="객실정보" onclick="location.href='roomList_form'">
		<input type="button" value="예약확인" onclick="location.href='reservation_form'">
		<input type="button" value="체크인" onclick="location.href='checkIn_form'">
		<input type="button" value="체크아웃" onclick="location.href='checkOut_form'">
		<input type="button" value="리뷰" onclick="location.href='review_form'">
		<input type="button" value="임시 로그아웃" onclick="location.href='bu_logout'">
		<input type="button" value="카카오페이" onclick="kakaopay()">
	</div>	
</body>
</html>