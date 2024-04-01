<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/HttpRequest.js"></script>
<style type="text/css">
	#detailBox{
		border: solid 1px green;
		width: 600px;
		
		margin: auto;
		margin-top: 30px;
	}
	
	#ro_img{
		width: 275px;
		height: 183px;
	}
	
	
	
	#info{
		line-height: 1.5;
	}
	
	button{
		width: 600px;
		height: 30px;
		margin-bottom: 5px;
	}
	
	#delBtn{
		
		background-color: red;
		width: 600px;
		height: 30px;
	}
	
	#delBtn:hover {
		background-color: green;
	}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/business/businessTopView.jsp"></jsp:include>
	<form action="modify_form" action="post">
	<input type="hidden" name="ro_num" value="${dto.ro_num}">
	<input type="hidden" id="ro_name" value="${dto.ro_name}">
	<input type="hidden" id="bu_email" value="${dto.bu_email}">
	<input type="hidden" id="picture_count" value="${dto.picture_count}">
	<div align="center" id="detailBox">
		<h1 align="center">${dto.ro_name}</h1>
		<div id="photoBox" style="border: 1px solid blue;">
			<a href="#" onclick="prev();">
				<img alt="이전" src="resources/img/left_btn.png">
			</a>
			
			<img id="ro_img" src="resources/${dto.bu_email}/${dto.ro_name}/${dto.ro_picture}">
			
			<a href="#" onclick="next();">
				<img alt="다음" src="resources/img/right_btn.png">
			</a>
		</div>
		<p>체크인 : ${dto.checkin}</p>
		<p>체크아웃 : ${dto.checkout}</p>
		<h2>가격 : ${dto.ro_price}</h2>
		<p id="info" align="left">${dto.ro_info}</p>
		<button style="display: block;">수정</button> <!-- f.submit -->
		<input id="delBtn" type="button" value="삭제" onclick="del(this.form)">
	</div>
	</form>
	
<script type="text/javascript">
	var num = 0;
	var max = document.getElementById('picture_count');
	max = max.value;
	var ro_name = document.getElementById("ro_name");
	ro_name = ro_name.value;
	var bu_email = document.getElementById("bu_email");
	bu_email = bu_email.value;
	var path="resources/"+bu_email+'/'+ro_name+"/";
	
	
	function prev() {
		num--;
		
		if(num<0) {
			num = max;
		}
		//gallery라는 아이디를 가진 태그를 검색
		var img = document.getElementById("ro_img");
		img.src = path + ro_name + "_" + num + ".jpeg";
		
	}//prev
	
	function next() {
		num++;
		
		if(num>max) {
			num = 0;
		}
		var img = document.getElementById("ro_img");
		img.src = path + ro_name + "_" + num + ".jpeg";
	}

	function del(f){
		if(!confirm("삭제하시겠습니까?")){
			return;
		}
		
		var url = "delete"
		var param = "num="+f.ro_num.value+"&ro_name="+f.ro_name.value;
		
		sendRequest(url,param,resultFn,"POST");
	}
	
	function resultFn(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			var json = (new Function ('return' + data))();
			
			if(json[0].res == 'no'){
				alert("삭제 실패");
				return;
			}
			
			alert('삭제 성공');
			location.href='roomList_form';
		}
	}
	setInterval("next()",3000); // 1초 간격으로 자동으로 next() 메서드를 호출
	
</script>
</body>
</html>