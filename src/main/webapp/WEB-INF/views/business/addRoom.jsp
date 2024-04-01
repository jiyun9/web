<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function send_check(){
			var f = document.f;
			var name = f.ro_name.value.trim();
			var price = f.ro_price.value;
			var checkin = f.checkin.value;
			var checkout = f.checkout.value;
			var count = f.ro_count.value;
			var info = f.ro_info.value.trim();
			var picture = f.ropicture.files.length;
			
			//alert(picture)
			
			//숫자 정규식
			var checknum = /^[0-9]+$/
			
			//유효성 검사 쭈르륵
			if(name==''){
				alert("방 이름을 입력하세요");
				return;
			}
			
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
			
			if(picture <= 0){
				alert("사진을 등록해주세요");
				return;
			}
			
			
			
			f.submit();
		}
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/business/businessTopView.jsp"></jsp:include>
	<div align="center">
	<form action="addRoom" name="f" method="post" enctype="multipart/form-data">
		<input type="hidden" name="picture_count" value="-1">
		<table border="1">
			<caption>:::객실 등록:::</caption>
			<tr>
				<th>객실 이름</th>
				<td><input name="ro_name" placeholder="방 이름을 입력하세요"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input name="ro_price" placeholder="숫자만 입력하세요"></td>
			</tr>
			<tr>
				<th>체크인 시간</th>
				<td><input type="time" name="checkin"></td>				
			</tr>
			<tr>
				<th>체크아웃 시간</th>
				<td><input type="time"  name="checkout"></td>				
			</tr>
			<tr>
				<th>최대 인원수</th>
				<td><input name="ro_count" placeholder="최대 인원수를 입력하세요"></td>
			</tr>
			<tr>
				<th>객실 기본정보</th>
				<td><textarea name="ro_info" rows="10" cols="50" style="resize:none;"></textarea></td>
			</tr>
			<tr>
				<th>사진등록</th>
				<td><input name="ropicture" type="file" multiple="multiple"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="등록" onclick="send_check()">
				</td>			
			</tr>
		</table>
	</form>
	</div>
</body>
</html>