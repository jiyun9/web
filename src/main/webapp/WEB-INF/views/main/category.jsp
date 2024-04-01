<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/category.css" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>

	<main>
		
		<div class="inner">

			<div class="others">
				<!-- 나중에 다른거 들어갈 공간 -->
			</div>

			<div class="accom-area">
				<c:forEach var="dto" items="${list}">
					<form action="room_view" method="post">
						<input type="hidden" name ="bu_email" value ="${dto.bu_email}">		
						<input type="hidden" name ="bu_title" value ="${dto.bu_title}">
						<input type="hidden" name ="checkin_d" value ="${checkin_d}">
						<input type="hidden" name ="checkout_d" value ="${checkout_d}">
				
					<button class="btn">
						<a>
							<div class="pic">
								<img src="resources/business_img/${dto.bu_title}/${dto.bu_picture}" style="width: 346px; height: 229px;">
							</div>
							<div class="accom-info">
								<div class="bu_info">
									<h2 class="title">${dto.bu_title}</h2>
									<p>${dto.bu_addr}</p>
								</div>
								<div class="min-price">
									<p>가격 : ${dto.min_price}원~</p>
								</div>
							</div>
						</a>
					</button>
					</form>
				</c:forEach>
			</div>
		
		</div>

	</main>



<script type="text/javascript">
	function submit(f){
		f.submit()
	}
</script>
</body>
</html>