<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{margin: 0; padding: 0; box-sizing: border-box;}
ul,li,ol{list-style: none;}
a{text-decoration: none;}

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

.inner .roomList{
	display: flex; justify-content: space-between;
	width: 850px;
	height: 250px;
}

.inner .roomList .pic{
	height: 100%;
	width: 60%;
	margin-right: 20px;
}
.inner .roomList .pic img{
	height: 100%;
	width:100%;
	border-radius: 15px;
}

.inner .roomList .room_info{
	width:70%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}
.inner .roomList .room_info h2{
	text-align: start;
}

.inner .roomList .room_info .txt{
text-align: start;
}

.inner .roomList .room_info .txt p{
	margin-top: 10px;
}

.inner .roomList .room_info .txt .price{
	margin-right: 20px;
	text-align: end;
	font-size: 24px;
}
	
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/business/businessTopView.jsp"></jsp:include>
	
		<div class="inner">
		<c:forEach var="dto" items="${list}">
			<form action="detail" method="post">
			<input type="hidden" name="ro_num" value="${dto.ro_num}">
				<button>
					<div class="roomList">
						<div class="pic">
							<img src="resources/${dto.bu_email}/${dto.ro_name}/${dto.ro_picture}">
						</div>
						<div class="room_info">
							<h2 id="roomName">${dto.ro_name}</h2>
							<div class="txt">
								<p>이용인원 : ${dto.ro_count}</p>
								<p>체크인시간 : ${dto.checkin}</p>
								<p>체크아웃시간 : ${dto.checkout}</p>
								<p class="price">${dto.ro_price}원</p>
							</div>
						</div>
					</div>
				</button>
			</form>
		</c:forEach>
	</div>
</body>
</html>