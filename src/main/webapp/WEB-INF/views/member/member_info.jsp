<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<caption>내 정보 관리</caption>
		<tr>
			<th>예약자 이름</th>
			<td>${dto.m_name}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${dto.m_email}</td>
		</tr>
		<tr>
			<th>휴대폰 번호</th>
			<td>${dto.m_tel}</td>
		</tr>
	</table>
</body>
</html>