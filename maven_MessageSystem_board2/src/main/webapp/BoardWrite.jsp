<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="assetsBoard/css/main.css" />
<link rel="stylesheet" href="assetsBoard/css/board.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
<style>
/* Optional CSS styling for the map container */
#map {
	height: 400px; /* Adjust the height as needed */
	width: 100%; /* Adjust the width as needed */
}
</style>
</head>
<body>
	<!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) - 파일업로드 cos.jar 사용 -->
	<!-- 
            enctype속성
            1. application/x-www-form-urlencoded
                : form태그 안에서 보내는 요청데이터를 name(key)값과 value형태로 보내는 것
            2. multipart/form-data
                : 사진파일과 같이 용량이 큰 데이터를 보낼때 사용(무조건 post방식 사용)    
         -->

	<form action="BoardService" method="post">
		<table id="list">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>여행장소</td>
				<td><input type="text" name="place_name"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="mem_id"></td>
			</tr>
			<tr>
				<td>여행 일자</td>
				<td><input type="text" id="datepicker" name="travel_dt"></td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="content" rows="10"
						style="resize: none;"></textarea> <input type="hidden"
					id="latInput" name="lat"> <input type="hidden"
					id="lngInput" name="lng"></td>
			</tr>
			<tr>
				<!-- 구글 지도 삽입 -->
				<td colspan="2">
					<div id="map"></div>
					<div id="selectedLocation">
						선택한 위치: <span id="address"></span>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="reset" value="초기화"> <input
					type="submit" value="작성하기"></td>
			</tr>
		</table>
	</form>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script>
		var map;
		var marker = null;

		// Initialize and add the map
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10, // 초기 확대 수준 조정
				center : {
					lat : 37.5665,
					lng : 126.9780
				}
			// 초기 위치 조정 (서울을 중심으로 설정)
			});

			// 마우스 클릭 시 이벤트 핸들러
			map.addListener('click', function(event) {
				placeMarker(event.latLng);
				getAddress(event.latLng);

				// 클릭한 위치의 위도와 경도 가져오기
				var lat = event.latLng.lat();
				var lng = event.latLng.lng();

				// hidden input 태그를 사용하여 위도와 경도를 폼에 추가
				document.getElementById('latInput').value = lat;
				document.getElementById('lngInput').value = lng;
			});
		}

		// 위치에 마커 추가 함수
		function placeMarker(location) {
			if (marker !== null) {
				marker.setMap(null); // 이전에 추가된 마커가 있다면 제거
			}
			marker = new google.maps.Marker({
				position : location,
				map : map
			});
		}

		// 클릭한 위치의 주소 가져오기 함수
		function getAddress(latLng) {
			var geocoder = new google.maps.Geocoder();
			geocoder
					.geocode(
							{
								'location' : latLng
							},
							function(results, status) {
								if (status === 'OK') {
									if (results[0]) {
										document.getElementById('address').innerHTML = results[0].formatted_address;
									} else {
										document.getElementById('address').innerHTML = '주소를 찾을 수 없습니다.';
									}
								} else {
									document.getElementById('address').innerHTML = '지오코딩 서비스에 오류가 발생했습니다.';
								}
							});
		}

		$(function() {
		    $("#datepicker").datepicker({
		        dateFormat : 'yy-mm-dd' // 날짜 형식을 YYYY-MM-DD로 설정
		    });
		});

	</script>
	<!-- Google Maps API -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5z9o0mEWFw3Gfsty4lUKD-ytifSz2Pbs&callback=initMap">
		
	</script>
</body>
</html>
