<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<style>
	.inner{
	margin: 0 auto;
	width: 1300px;
	display: flex; 
	flex-direction: column;
	align-items: center; 
}

.inner button{
	margin-top:20px;
	height: 100%;
	background-color: #fff;	
}

.inner .revList{
	display: flex; justify-content: space-between;
	width: 850px;
	height: 250px;
	margin-bottom: 10px;
}

.inner .revList .pic{
	height: 100%;
	width: 60%;
	margin-right: 20px;
}
.inner .revList .pic img{
	height: 100%;
	width:100%;
	border-radius: 15px;
}

.inner .revList .rev_info{
	width:70%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}
.inner .revList .rev_info h2{
	text-align: start;
}

.inner .revList .rev_info .txt{
text-align: start;
}

.inner .revList .rev_info .txt p{
	margin-top: 10px;
}

.inner .revList .rev_info .txt .price{
	margin-right: 20px;
	text-align: end;
	font-size: 24px;
}
</style>

<script>

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	
	<div class="inner" align="center"><!-- 예약내역 틀-->
		<p>예약내역</p>
		<c:forEach var="dto" items="${list}">
			<div class="revList">
				<div class="pic">
					<img align="left" src="resources/room_img/room1.jpg">
				</div>
				<div class="rev_info"> <!-- 예약 내역 화면 -->
					<h2 id="roomName">${dto.ro_name}</h2>
					<div class="txt">
						<p>체크인 날짜 : ${dto.checkin_date}</p>
						<p>체크아웃 날짜 : ${dto.checkout_date}</p>
						<p>예약인원 : ${dto.re_people}명</p>
						<p>결제일 : ${dto.regdate}</p>
						<p>예약상태 : ${dto.status}</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>