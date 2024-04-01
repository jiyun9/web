<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function number(code){
		let authcode = document.getElementById("authcode").value
		let Authcode = code
		
		if(authcode == ''){
			alert("인증번호를 입력하세요")
			return
		}
		
		if(authcode != Authcode){
			alert("일치하지 않습니다. 다시 입력하세요")
			return
		}
		
	    if(authcode == Authcode){
	    	alert("인증되었습니다.")
	    	location.href="m_pwd_modify?m_email=${param.m_email}"
	    }
	}
</script>
</head>
<body>
	<table border="1" align="center">
		<tr>
			<th>인증코드</th>
			<td>
				<input name="authcode" id="authcode">
				<input type="hidden" name="m_email" value="${param.m_email}">
				<input type="button" value="인증" onclick="number('${param.authcode}')">
			</td>
		</tr>
	</table>
</body>
</html>