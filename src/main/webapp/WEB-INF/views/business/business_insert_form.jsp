<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<script type="text/javascript">
	let b_check_bu_email = false
	
	function send(f){
		let bu_email = f.bu_email.value.trim()
		let bu_name = f.bu_name.value.trim()
		let bu_password = f.bu_password.value.trim()
		let bu_tel = f.bu_tel.value.trim()
		let bu_id = f.bu_id.value.trim()
		let bu_title = f.bu_title.value.trim()
		let bu_addr = f.bu_addr.value.trim()
		let picture = f.bupicture.files.length
		
		// 유효성 검사
		if(!b_check_bu_email){
			alert("이메일 중복체크를 하세요")
			return
		}
		
		if(bu_name == ''){
			alert("이름을 입력하세요")
			return
		}
		
		if(bu_password == ''){
			alert("비밀번호를 입력하세요")
			return
		}

		if(bu_tel == ''){
			alert("전화번호를 입력하세요")
			return
		}
		
		if(bu_title == ''){
			alert("업체명을 입력하세요")
			return
		}
		
		if(bu_addr == ''){
			alert("업체 주소를 입력하세요")
			return
		}
		
		if(picture <= 0){
			alert("사진을 등록해주세요")
			return
		}
		
		f.method = "post"
		f.action = "business_insert"
		f.submit()
	}
	
	// 계정 중복체크
	function check_bu_email(){
		let bu_email = document.getElementById("bu_email").value.trim()
		
		if(bu_email == ''){
			alert("이메일을 입력하세요")
			return;
		}
		
		let regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
			
		if(!regex.test(bu_email)){
			alert("형식에 맞지 않습니다.")
			return
		}
		
		let url = "check_bu_email"
		let param = "bu_email="+bu_email
		
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
				b_check_bu_email = true
			}
		}
	}
	
	function check(){
		b_check_bu_email = false
	}
	
	function change_bu_id(){
		let id = document.getElementById("select_bu_id")
		let value = id.options[id.selectedIndex].value
		
		let bu_id = document.getElementById("bu_id").value
		
		bu_id = value
		
		console.log(bu_id)
		
		if(bu_id == "0"){
			alert("업체 종류를 선택해주세요")
			return
		}
		
	}
</script>
</head>
<body>
	<form enctype="multipart/form-data">
	<input type="hidden" name="picture_count" value="-1">
		<table border="1" align="center">
			<caption>비즈니스 회원가입</caption>
			<tr>
				<th>이메일</th>
				<td>
					<input name="bu_email" id="bu_email" onchange="check()">
					<input type="button" value="중복체크" onclick="check_bu_email()">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input name="bu_name">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="bu_password">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input name="bu_tel">
				</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
					<select id="select_bu_id" name="bu_id" onchange="change_bu_id()">
					     <option value="0">선택</option>
					     <option value="1">호텔</option>
					     <option value="2">모텔</option>
					     <option value="3">펜션</option>
					     <option value="4">리조트</option>
				   	</select>
				</td>
			</tr>
			<tr>
				<th>업체 이름</th>
				<td>
					<input name="bu_title">
				</td>
			</tr>
			<tr>
				<th>업체 주소</th>
				<td>
					<input name="bu_addr">
				</td>
			</tr>
			<tr>
				<th>업체 사진 등록</th>
				<td>
					<input name="bupicture" type="file" multiple="multiple">
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