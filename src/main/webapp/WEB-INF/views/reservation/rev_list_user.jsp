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
.container {
	display: flex;
	margin-top: 120px;
}

#photo_box {
	margin: 0 auto;
	margin-top: 60px;
	margin-left: -510px;
	margin-right: 20px;
	width: 512px;
	height: 250px;
	border: 1px solid black;
	overflow: auto;
	position: relative;
	border-collapse: collapse;
}

.photo_type {
	width: 300px;
	height: 200px;
	border: 1px solid green;
	float: left;
	margin: 10px;
	position: relative;
}

.div1 {
	width: 170px;
	height: 50px;
	margin-right: -6px;
	border-collapse: collapse;
	margin-bottom: -30px;
	background-color: transparent;
	border-bottom: none;
}

.div2 {
	width: 170px;
	height: 50px;
	margin-right: -6px;
	border-collapse: collapse;
	margin-bottom: -30px;
	background-color: transparent;
	border-bottom: none;
}

.div3 {
	width: 170px;
	height: 50px;
	margin-right: -6px;
	border-collapse: collapse;
	margin-bottom: -30px;
	background-color: transparent;
	border-bottom: none;
}

table, tr, td {
	position: relative;
	top: 3px;
	border: none;
	padding: 4px;
}

.menu {
	margin-left: 300px;
	float: left;
	margin-top: -70px;
}

.menu ul li {
	list-style: none;
	padding: 0;
	margin-bottom: 5px;
}

.menu ul li input[type="button"] {
	font-size: 16px;
	width: 180px;
	height: 50px;
	background-color: transparent;
}

.b_container {
	margin-left: 130px;
}

.div2 :active {
	border-bottom: 2px solid black;
}
</style>

<script>
	function popup() {
		window.open("popup", "예약정보", "width=400, height=600, left=100, top=50");
	}

	function rev_del() {
		window.open("del", "예약취소", "width=400, height=600, left=100, top=50");
	}
</script>

</head>
<body>

		<div class="menu">
			<ul>
				<li style="padding-top: 75px;"><input type="button"
					value="예약내역" style="width: 150px; height: 50px;"
					onclick="location.href='rev_info'"></li>
				<li><input type="button" value="내정보관리"
					style="width: 150px; height: 50px;"
					onclick="location.href='my_info'"></li>
				<li><input type="button" value="내가 작성한리뷰"
					style="width: 150px; height: 50px;"
					onclick="location.href='MyReview'"></li>
				<li><input type="button" value="찜한숙소"
					style="width: 150px; height: 50px;" onclick="location.href='zzim'"></li>
			</ul>
		</div>

		<div class="container">
			<div class="b_container" id="button">
				<input type="button" style="width: 172px; height: 50px;"
					class="div1" value="예약 완료" onclick="location.href='rev_list'">
				<input type="button" style="width: 172px; height: 50px;"
					class="div2" value="예약 취소" onclick="location.href='rev_del'">
				<input type="button" style="width: 172px; height: 50px;"
					class="div3" value="이용 완료" onclick="location.href='usingwon'">
			</div>

			<form>
				<c:forEach var="dto" items="${list}">
					<div id="photo_box">
						<p>${dto.re_num }</p>
						<table border="1" width="170">
							<tr>
								<td>${dto.bu_title}</td>
							</tr>
							<tr>
								<td>${dto.ro_name}</td>
							</tr>
							<tr>
								<td>${dto.checkin_date }~${dto.checkout_date }</td>
							</tr>
							<tr>
								<td>${dto.price}</td>
							</tr>
							<tr>
								<td>${dto.payment }</td>
							</tr>
							<tr>
								<td align="center"><input type="button" value="예약 정보"
									onclick="popup()"></td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</form>
		</div>
</body>
</html>
