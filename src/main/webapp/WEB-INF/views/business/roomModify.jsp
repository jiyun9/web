<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img{
		width: 275px;
		height: 183px;
	}
</style>
<script type="text/javascript">
	function send(f){
		var price = f.ro_price.value;
		var checkin = f.checkin.value;
		var checkout = f.checkout.value;
		var count = f.ro_count.value;
		var info = f.ro_info.value.trim();
		var picture = f.ropicture.files.length;
		
		//숫자 정규식
		var checknum = /^[0-9]+$/
		
		//유효성 검사 쭈르륵
		
		if(price==''){
			alert("가격 입력하세요");
			return;
		} else if(!checknum.test(price)){
			alert("숫자만 입력하세요")
			return;
		}
		
		if(checkin==''){
			alert("체크인 시간을 설정하세요");
			return;
		}
		
		if(checkout==''){
			alert("체크아웃 시간을 설정하세요");
			return;
		}
		
		if(count==''){
			alert("최대 인원수를 입력하세요");
			return;
		} else if(!checknum.test(count)){
			alert("숫자만 입력하세요")
			return;
		}
		
		if(info==''){
			alert("방 정보를 입력하세요");
			return;
		}

		
		f.action = "modify";
		f.method = "post";
		f.submit();
	}

</script>
</head>
<body>
	<form enctype="multipart/form-data">
		<input type="hidden" name="ro_num" value="${dto.ro_num}">
		<input type="hidden" name="ro_name" value="${dto.ro_name}">
		<input type="hidden" name="picture_count" value="${dto.picture_count}">
		<table border="1" >
			<caption>:::객실 정보 수정:::</caption>
			<tr>
				<th>객실 이름</th>
				<td><a onclick="alert('객실 이름을 변경하려면 삭제후 다시 등록해주세요')">${dto.ro_name}</a></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input name="ro_price" value="${dto.ro_price}"></td>
			</tr>
			<tr>
				<th>체크인 시간</th>
				<td><input type="time" name="checkin" value="${dto.checkin}"></td>				
			</tr>
			<tr>
				<th>체크아웃 시간</th>
				<td><input type="time"  name="checkout" value="${dto.checkout}"></td>				
			</tr>
			<tr>
				<th>최대 인원수</th>
				<td><input name="ro_count" value="${dto.ro_count}"></td>
			</tr>
			<tr>
				<th>객실 기본정보</th>
				<td><textarea name="ro_info" rows="10" cols="50" style="resize:none;">${dto.ro_info}</textarea></td>
			</tr>
			<tr>
				<th>사진 추가</th>
				<td><input name="ropicture" type="file" multiple="multiple"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="send(this.form)">
					<input type="button" value="목록" onclick="location.href='roomList_form'">
				</td>			
			</tr>
		</table>
	</form>
	<div id="picturebox" align="right">
		<c:forEach begin="0" end="${dto.picture_count}" step="1" varStatus="status">
			<img name="${dto.ro_name}_${status.current}"src="resources/${dto.bu_email}/${dto.ro_name}/${dto.ro_name}_${status.current}.jpeg">
		</c:forEach>
	</div>
</body>
</html>