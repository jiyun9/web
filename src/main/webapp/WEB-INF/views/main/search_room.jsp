<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/search_room.css" />
</head>
<body>

	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

	<c:forEach var="dto" items="${list}">
		<form action="reservation_form_member" method="post">
		<input type="hidden" name="ro_num" value="${dto.ro_num}">
		<input type="hidden" name="bu_title" value="${bu_title}">
		<input type="hidden" name="checkin_d" value="${checkin_d}">
		<input type="hidden" name="checkout_d" value="${checkout_d}">
			<div class="inner">
				<div class="room">
					<div class="pic">
						<img src="resources/${dto.bu_email}/${dto.ro_name}/${dto.ro_picture}">
					</div>
					<div class="room_info">
						<div class="ro_name">
							<h2 id="roomName">${dto.ro_name}</h2>
						</div>
						<div class="room_detail">
							<div class="check_time">
								<p><i class="bi bi-clock"></i> 입실: ${dto.checkin}</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp;퇴실: ${dto.checkout}</p>
							</div>
							<div class="reserve">
								<p>${dto.ro_price}원 <span>/1박</span></p>
								<button>객실 예약</button>
							</div>
						</div>
						<div class="room_txt">
							<p><span>객실정보</span>
								기준${dto.ro_count}인 · 최대${dto.ro_count + 1}인 (유료)<br>
								<span>패키지&nbsp;&nbsp;&nbsp;</span>
								아침을 깨우는 소리~[더 파크뷰 조식 2인]<br>
								<span>이벤트&nbsp;&nbsp;&nbsp;</span>
								더 파크뷰 조식 2인 제공</p>
						</div>
					</div>
				</div>
				<div class="others">
					<!--나중에 다른거 추가할 공간 -->
				</div>
			</div>
		</form>
	</c:forEach>



</body>
</html>