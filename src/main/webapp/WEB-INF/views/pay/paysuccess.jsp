<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function CheckIn_Check(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var data = xhr.responseText;
			
			var json = (new Function('return' + data))();
			alert(data.tid)
/* 			if(json[0].result == 'yes'){
				alert("변경 성공")
				location.href='checkIn_form';
			} else {
				alert('변경 실패')
			} */
		}
	}
</script>
</head>
<body>
	<h1>succes</h1>
</body>
</html>