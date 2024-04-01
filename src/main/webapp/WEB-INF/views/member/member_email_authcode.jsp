<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">
	let m_email

	function m_email_authcode(){
		m_email = document.getElementById("m_email").value.trim()
		
		if(m_email == ''){
			alert("이메일을 입력하세요")
			return
		}
		
		let regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
			
		if(!regex.test(m_email)){
			alert("형식에 맞지 않습니다.")
			return
		}
		
		let url = "m_email_authcode"
		let param = "m_email="+m_email
		
		sendRequest(url, param, email_authCode, "post")
	}
	
	function email_authCode(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText
			
			let json = (new Function('return'+data))()
			
			if(json[0].result == 'yes'){
				alert("메일로 인증코드를 전송했습니다.")
				location.href="authcode?authcode="+json[1].auth + "&m_email=" + m_email
			}
			if(json[0].result == 'no'){
				alert("없는 계정입니다.")
				return
			}
		}
	}
</script>
</head>
<body>
	<table border="1" align="center">
		<caption>비밀번호 재설정</caption>
		<tr>
			<th>이메일</th>
			<td>
				<input name="m_email" id="m_email" placeholder="회원가입 당시 이메일을 입력해주세요.">
				<input type="button" value="인증코드 전송" onclick="m_email_authcode()">
			</td>
		</tr>
	</table>
</body>
</html>