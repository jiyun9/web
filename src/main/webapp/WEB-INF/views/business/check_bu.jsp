<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty bu_dto}"> <!-- bu_dto가 비어있다는 것은 세션에 저장을 못했다는것! -->
	<script>
		alert("로그인 후 이용해주세요");
		location.replace("login_business");
	</script>
	</c:if>
</body>
</html>