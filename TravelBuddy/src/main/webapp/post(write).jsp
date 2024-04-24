<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 작성</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap">
<link rel="stylesheet" href="css/post.css">
<style>
* {
	box-sizing: border-box;
	outline: none;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: #f2f2f2;
}

textarea[name="title"] {
	height: 40px;
}

textarea[name="content"] {
	height: 150px;
}

.box {
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.container {
	margin: 0 auto;
	max-width: 800px;
	padding: 20px 15px;
	text-align: center;
}

.btn {
	background-color: #2D2F7A;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
}

.btn:hover {
	background-color: #1e1f5e;
}

textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #dadada;
	margin-bottom: 10px;
	resize: vertical;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

@media ( max-width : 768px) {
	.container {
		padding: 20px 10px;
	}
	table {
		font-size: 14px;
	}
}

.select-box {
	width: 50%;
	height: 50px;
	box-sizing: border-box;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 5px;
	padding: 5px 0 5px 10px;
	border-radius: 4px;
	border: 1px solid #d9d6d6;
	color: #383838;
	background-color: #ffffff;
	font-family: 'Noto Sans KR', sans-serif;
}

.option {
	font-size: 14px;
}

#map {
	height: 300px;
	width: 100%;
	margin-bottom: 20px;
}
</style>
</head>
<body class="box-body">
	<div class="container">
		<div id="wrap">
			<h2>게시글 작성</h2>
			<form action="BuddyFindingService" method="post">
			<%@ page import="com.smhrd.model.Member" %>
			
				<% 
                    Member loginMember = (Member) session.getAttribute("loginMember");
                    String mem_id = "";
                    if (loginMember != null) {
                        mem_id = loginMember.getMem_id(); 
                    }
                %>

                <input type="hidden" value="board_write" name="command">
                <input type="hidden" name="mem_id" value="<%=mem_id%>">

				<table>
					<tr>
						<th>제목</th>
						<td><textarea cols="50" rows="1" name="title"></textarea></td>
					</tr>
					<tr>
						<th>여행날짜</th>
						<td><input type="date" name="travel_dt"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea cols="50" rows="15" name="content"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<div>
								<input type="text" id="searchInput" placeholder="위치를 검색하세요">
								<input type="button" value="검색" onclick="searchLocation()">
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="map" style="width: 100%; height: 400px;"></div>
							<div id="selectedLocation">
								선택한 위치: <span id="address"></span>
							</div> <input type="hidden" id="latInput" name="lat"> <input
							type="hidden" id="lngInput" name="lng">
						</td>
					</tr>
					<tr>
						<th>여행장소</th>
						<td><input type="text" id="place_name" name="place_name"></td>
					</tr>
				</table>
				<input class="btn" type="submit" value="등록"> <input
					class="btn" type="reset" value="다시작성하기"> <input class="btn"
					type="button" value="취소" onclick="javascript:history.back()">
			</form>
		</div>
	</div>
	<script>
		var map;
		var marker = null;

		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 10,
				center : {
					lat : 37.5665,
					lng : 126.9780
				}
			});
			map.addListener('click', function(event) {
				placeMarker(event.latLng);
				getAddress(event.latLng);
				var lat = event.latLng.lat();
				var lng = event.latLng.lng();
				document.getElementById('latInput').value = lat;
				document.getElementById('lngInput').value = lng;
				getPlaceName(event.latLng);
			});
		}

		function placeMarker(location) {
			if (marker !== null) {
				marker.setMap(null);
			}
			marker = new google.maps.Marker({
				position : location,
				map : map
			});
		}

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

		function searchLocation() {
			var geocoder = new google.maps.Geocoder();
			var address = document.getElementById('searchInput').value;
			geocoder.geocode({
				'address' : address
			}, function(results, status) {
				if (status === 'OK') {
					map.setCenter(results[0].geometry.location);
					placeMarker(results[0].geometry.location);
					getAddress(results[0].geometry.location);
					var lat = results[0].geometry.location.lat();
					var lng = results[0].geometry.location.lng();
					document.getElementById('latInput').value = lat;
					document.getElementById('lngInput').value = lng;
					getPlaceName(results[0].geometry.location);
				} else {
					alert('위치를 입력해주세요.');
				}
			});
		}

		function getPlaceName(latLng) {
			var geocoder = new google.maps.Geocoder();
			geocoder
					.geocode(
							{
								'location' : latLng
							},
							function(results, status) {
								if (status === 'OK') {
									if (results[0]) {
										document.getElementById('place_name').value = results[0].formatted_address;
									} else {
										document.getElementById('place_name').value = '주소를 찾을 수 없습니다.';
									}
								} else {
									document.getElementById('place_name').value = '주소를 찾을 수 없습니다.';
								}
							});
		}
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5z9o0mEWFw3Gfsty4lUKD-ytifSz2Pbs&callback=initMap">
		
	</script>
</body>
</html>
