<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/css/reservation_form.css">
</head>
<body>

<form action="reservation_operator" method="post">

<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

<input type="hidden" name="m_email" value="${m_email.m_email}">
<input type="hidden" name="bu_title" value="${bu_title}">
<input type="hidden" name="price" value="${dto.ro_price}">
<input type="hidden" name="ro_name" value="${dto.ro_name}">
<input type="hidden" name="ro_num" value="${dto.ro_num}">
<input type="hidden" name="checkin_date" value="${checkin_d}">
<input type="hidden" name="checkout_date" value="${checkout_d}">

	<main>
		<div class="inner">
			<div class="content">
				<div class="top">
					<div class="reservation_form">
						<div class="title_box">
							<button><i class="bi bi-backspace"></i></button>
							<h1 class="title">예약 확인 및 결제</h1>
						</div>
						<div class="user-info">
							<h2>예약자 정보</h2>
							<div class="name">
								<p><label for="m_name">예약자 이름</label></p>
								<input type="text" name="m_name" class="input_name" placeholder="홍길동" />
							</div>
							<p><label for="m_tel">휴대폰 번호</label></p>
							<div class="phone">
								<input type="text" name="m_tel" class="input_phone" placeholder="010-1234-5678" />
								<button type="button" class="btn_check">인증번호 전송</button>
							</div>
							<p class="txt">개인 정보 보호를 위해 안심번호로 숙소에 전송됩니다.</p>
						</div>
					</div>
					<div class="no_content">
					</div>
				</div>
				<div class="pay_method">
					<h2>결제 수단</h2>
					<div class="payment">
						<div class="row">
							<label class="radio-label">
								<input type="radio" class="box" name="payment" value="카카오페이">
								<span class="radio-custom"></span>
								카카오페이
							</label>
							<label class="radio-label">
								<input type="radio" class="box" name="payment" value="토스페이">
								<span class="radio-custom"></span>
								토스페이
							</label>
							<label class="radio-label">
								<input type="radio" class="box" name="payment" value="신용/체크카드">
								<span class="radio-custom"></span>
								신용/체크카드
							</label>
							<label class="radio-label">
								<input type="radio" class="box" name="payment" value="KB페이">
								<span class="radio-custom"></span>
								KB페이
							</label>
							<label class="radio-label">
								<input type="radio" class="box" name="payment" value="네이버페이">
								<span class="radio-custom"></span>
								네이버페이
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="banner">
				<div class="reservation_info">
					<h2>객실이름</h2>
					<div class="pic">
						<img src="resources/${dto.bu_email}/${dto.ro_name}/${dto.ro_picture}" alt="">
					</div>
					<div class="room_info">
						<table>
							<tr>
								<th>객실</th>
								<td>${dto.ro_name}</td>
							</tr>
							<tr>
								<th>일정</th>
								<td>${checkin_d} ${dto.checkin}~<br>
									${checkout_d} ${dto.checkout}
								</td>
							</tr>
							<tr>
								<th>기준인원</th>
								<td>${dto.ro_count}인</td>
							</tr>
							<tr>
								<th>추가정보</th>
								<td>Room Only</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="pay_info">
					<h2>결제 금액</h2>
					<div class="price_re">
						<span>예약금액</span>
						<span>${dto.ro_price}원</span>
					</div>
					<div class="price_total">
						<span>총 결제금액</span>
						<span>${dto.ro_price}원</span>
					</div>
					<div class="btn">
						<button>${dto.ro_price}원 결제하기</button>
						${m_email.m_email}로 로그인됨
					</div>
				</div>
			</div>
		</div>
	</main>
</form>

</body>
</html>