<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
	<link rel="stylesheet" href="resources/css/header.css">
	<link rel="stylesheet" href="resources/css/login_form.css">
</head>
<body>
	
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	
	
		<main>
			<div class="content">
				<div class="inner">
					<div class="logo-box">
						<h1 class="logo"><a href="">여행갈래?</a></h1>
					</div>
					<div class="login-title">
						<span class="line"></span>
						<span class="caption">로그인/회원가입</span>
					</div>
					<div class="login-button-group">
						<button class="btn kakao-login" onclick="kakaoLogin();">
							<div class="btn_content">
								<svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="#3C1E1E" viewBox="0 0 21 21">
									<path fill="current" d="M10.5 3.217c4.514 0 8 2.708 8 6.004 0 3.758-4.045 6.184-8 5.892-1.321-.093-1.707-.17-2.101-.23-1.425.814-2.728 2.344-3.232 2.334-.325-.19.811-2.896.533-3.114-.347-.244-3.157-1.329-3.2-4.958 0-3.199 3.486-5.928 8-5.928Z">
									</path>
								</svg>
								<span>카카오로 시작하기</span>
							</div>
						</button>

						<button class="btn naver-login" id="naverIdLogin_loginButton">
							<div class="btn_content" id="naverIdLogin_loginButton" href="javascript:void(0)">
								<svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="none" viewBox="0 0 21 21">
									<path fill="#fff" d="M4 16.717h4.377V9.98l4.203 6.737H17v-13h-4.377v6.737l-4.16-6.737H4v13Z"></path>
								</svg>
								<span>네이버로 시작하기</span>
							</div>
						</button>

						<button class="btn email-login" onclick="location.href='login_email';">
							<div class="btn_content">
								<i class="bi bi-envelope-fill"></i>								
								<span>이메일로 시작하기</span>
							</div>
						</button>

						<button class="btn business-login"  onclick="location.href='login_business';">
							<div class="btn_content">								
								<span>비즈니스 로그인/회원가입</span>
							</div>
						</button>

					</div>
				</div>
			</div>
		</main>
	
	
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
		charset="utf-8">
	</script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="resources/js/login_form.js"></script>
</body>
</html>