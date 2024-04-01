<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" />

<link rel="stylesheet" href="resources/css/header.css" />

</head>
<body>


	<header class="header">
		<div class="container g-0">
			<div class="row d-flex justify-content-between">
				<div class="col d-flex align-items-center">
					<h1 class="logo"><a href="index">여행갈래?</a></h1>
				</div>
				
				<div class="col d-flex align-items-center">
		            <div class="search_option">
		              <input type="text" class="search_txt" placeholder="검색" name="text"/>
		              <input type="date" class="" id="checkin2" name="checkin2" placeholder="" value="${checkin_d}" />
		              <input type="date" class="" id="checkout2" name="checkout2" placeholder="" value="${checkout_d}" />
		              <span>인원</span>
		              <select name="count" id="">
		                <option value="1">1</option>
		                <option value="2" selected>2</option>
		                <option value="3">3</option>
		                <option value="4">4</option>
		              </select>
		              <button type="button" onclick="">검색</button>
		            </div>
          		</div>
				
				
				
				
				<!-- 비로그인 -->
				<c:if test="${empty m_email and empty bu_dto}">
				<div class="info col d-flex justify-content-end">
					<ul class="gnb d-flex align-items-center">
						<li><a href="map">지도검색</a></li>
						<li><a href="login_form" onclick="check()">예약내역</a></li>
						<li><a href="login_form">로그인<i class="bi bi-person-circle"></i></a></li>
					</ul>
				</div>
				</c:if>
				
				<!-- 회원 로그인 -->
				<c:if test="${not empty m_email}">
				<div class="info col d-flex justify-content-end">
					<ul class="gnb d-flex align-items-center">
						<li><a href="">지도검색</a></li>
						<li><a href="">내 정보</a></li>
						<li><a href="rev_list?m_email=${m_email.m_email}">예약 내역</a></li>
						<li><a href="logout">로그아웃</a></li>	
					</ul>
				</div>
				</c:if>
				
				<!-- 사업자 로그인 -->
				<c:if test="${not empty bu_dto}">
				<div class="info col d-flex justify-content-end">
					<ul class="gnb d-flex align-items-center">
						<li><a href="roomList_form">사업자 메뉴</a></li>
						<li><a href="bu_logout">로그아웃</a></li>	
					</ul>
				</div>
				</c:if>
			</div>
		</div>
	</header>
	
	<script type="text/javascript">
		function check() {
			alert('로그인이 필요한 서비스입니다.')
		}
		
		
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	
	
	<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', (event) => {
	        
	        // 현재 페이지가 메인 페이지인지 확인합니다.
			const isMainPage = document.getElementById('isMainPage').value === 'true';
	        
	        // 메인 페이지가 아닌 경우, 검색 옵션을 표시하지 않습니다.
	        const searchOption = document.querySelector('.search_option');
	        if (!isMainPage) {
	            searchOption.classList.add('hidden');
	        }
    });
	
    var checkin2Input = document.getElementById("checkin2");
    var checkout2Input = document.getElementById("checkout2");
    
    var checkin2Date = checkin2Input.value;
    var checkout2Date = checkout2Input.value;
    
    checkin2Input.placeholder = checkin2Date;
    checkout2Input.placeholder = checkout2Date;
    
    

	</script>
</body>
</html>