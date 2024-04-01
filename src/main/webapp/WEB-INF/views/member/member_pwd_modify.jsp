<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f){
		let m_pwd = f.m_pwd.value.trim() 
		let new_confirm_pwd = f.new_confirm_pwd.value.trim()
		
		if(m_pwd == '') {
			alert("새 비밀번호를 입력하세요")
			return
		}
		
		if(new_confirm_pwd == '') {
			alert("다시 한번 새 비밀번호를 입력하세요")
			return
		}
		
		if(m_pwd != new_confirm_pwd) {
			alert("비밀번호가 일치하지 않습니다")
			return
		}
		
		if(m_pwd == new_confirm_pwd){
			alert("비밀번호가 변경되었습니다.")
		}
		
		f.action = "member_pwd_modify?m_email=${param.m_email}"
		f.method = "post"
		f.submit()
	}
</script>
</head>
<body>
	<form>
		<table border="1" align="center">
			<caption>새 비밀번호 설정</caption>
			<tr>
				<th>새 비밀번호</th>
				<td>
					<input name="m_pwd">
				</td>
			</tr>
			<tr>
				<th>새 비밀번호 확인</th>
				<td>
					<input name="new_confirm_pwd">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="hidden" value="${param.m_email}">
					<input type="button" value="확인" onclick="send(this.form)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>