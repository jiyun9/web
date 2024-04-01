<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
</head>
<body>
<h3>상세조건</h3>
<form action="map_search" method="post" name="f">
	<div>
		<strong>체크인</strong><br>
		<input type="date" name="checkin" id="checkin" required="required">
	</div>
	<div>
		<strong>체크아웃</strong><br>
		<input type="date" name="checkout" id="checkout" required="required">
	</div>
	<div>
		<strong>인원 수</strong>
		<select>
			<option value="none">인원 수 선택</option>
			<option value="1" ${searchDTO.ro_count == '1' ? 'selectd' : ''}>1</option>
			<option value="2" ${searchDTO.ro_count == '2' ? 'selectd' : ''}>2</option>
			<option value="3" ${searchDTO.ro_count == '3' ? 'selectd' : ''}>3</option>
			<option value="4" ${searchDTO.ro_count == '4' ? 'selectd' : ''}>4</option>
		</select>
	</div>
	<hr>
		<strong>검색</strong><br>
		<input type="search" placeholder="지역, 숙소명" name="bu_address" id="bu_address" value="${SearchDTO.bu_addr}" required="required">
	<hr>
	<div>
		<strong>숙소 유형</strong>
		<ul>
			<li>
				<input type="radio" name="bu_id" id="bu_id" value="1"  ${SearchDTO.bu_id == '1' ? 'checked' : ''}>
				<label>호텔</label>
			</li>
			<li>
				<input type="radio" name="bu_id" id="bu_id" value="2" ${SearchDTO.bu_id == '2' ? 'checked' : ''}>
				<label>모텔</label>
			</li>
			<li>
				<input type="radio" name="bu_id" id="bu_id" value="3" ${SearchDTO.bu_id == '3' ? 'checked' : ''}>
				<label>펜션</label>
			</li>
			<li>
				<input type="radio" name="bu_id" id="bu_id" value="4" ${SearchDTO.bu_id == '4' ? 'checked' : ''}>
				<label>리조트</label>
			</li>
		</ul>
	</div>
	<button type="submit" style="border: none;">조회</button>
</form>
<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10119c6ab1ce3e3fb5920c6427ca9f17&libraries=services"></script>
<script>
		let container = document.getElementById('map');
		let options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		let map = new kakao.maps.Map(container, options);
		
		function map_
</script>
</body>
</html>