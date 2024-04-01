<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">
	let b_check_m_email = false
	
	function send(f){
		let m_email = f.m_email.value.trim()
		let m_name = f.m_name.value.trim()
		let m_pwd = f.m_pwd.value.trim()
		let m_tel = f.m_tel.value.trim()
		
		// 유효성 검사
		if(!b_check_m_email){
			alert("이메일 중복체크를 하세요")
			return
		}
		
		if(m_pwd == ''){
			alert("비밀번호를 입력하세요")
			return
		}
		
		if(m_name == ''){
			alert("이름을 입력하세요")
			return
		}

		if(m_tel == ''){
			alert("전화번호를 입력하세요")
			return
		}
		
		let regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,16}$/
		
		if(!regPwd.test(m_pwd)){
			alert("비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.")
			return
		}

		let regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/

		if(!regPhone.test(m_tel)){
			alert("전화번호 형식에 맞지 않습니다.")
			return
		}	
		
		let regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
		
		if(!regex.test(m_email)){
			alert("이메일 형식에 맞지 않습니다.")
			return
		}
		
		f.method = "post"
		f.action = "member_insert"
		f.submit()
	}
	
	// 계정 중복체크
	function check_m_email(){
		let m_email = document.getElementById("m_email").value.trim()
		
		if(m_email == ''){
			alert("이메일을 입력하세요")
			return;
		}
		
		let url = "check_m_email"
		let param = "m_email="+m_email
		
		sendRequest(url, param, resultFn, "post")
	}
	
	// 콜백 메서드
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText
			
			let json = (new Function('return'+data))()
			
			if(json[0].result == 'no'){
				alert("이미 사용중인 계정입니다.")
				return
			} else {
				alert("사용 가능한 계정입니다.")
				b_check_m_email = true
			}
		}
	}
	
	function check(){
		b_check_m_email = false
	}
</script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>회원가입</caption>
			<tr>
				<th>이메일</th>
				<td>
					<input name="m_email" id="m_email" onchange="check()">
					<input type="button" value="중복체크" onclick="check_m_email()">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input name="m_pwd">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input name="m_name">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input name="m_tel">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="가입" onclick="send(this.form)">			
					<input type="button" value="취소" onclick="location.href='login_form'">
				</td>
			</tr>			
		</table>
	</form>
</body>
</html>