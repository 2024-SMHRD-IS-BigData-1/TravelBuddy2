<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap">
    <link rel="stylesheet" href="css/post.css">
    <style>
        #countrySelect {
            width: 200px; 
        }
    </style>
</head>
<body class="box-body"> 
    <div class="container">
        <div id="wrap">
            <h2>게시글 작성</h2>
            <form method="post" action="BoardServlet">
                <input type="hidden" value="board_write" name="command">
                <table>
                    <tr>
                        <th>제목</th>
                        <td><textarea cols="50" rows="1" name="title"></textarea></td> 
                    </tr>
                    <tr>
                        <th>여행날짜</th>
                        <td><input type="date" name="date"></td>
                    </tr>
                    <tr>
                        <th>여행국가</th>
                        <td>
                            <select name="country" id="countrySelect"></select>
                        </td> 
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
                            </div>
                            <input type="hidden" id="latInput" name="latitude">
                            <input type="hidden" id="lngInput" name="longitude">
                        </td>
                    </tr>
                </table>
                <input class="btn" type="submit" value="등록">
                <input class="btn" type="reset" value="다시작성하기">
                <input class="btn" type="button" value="취소" onclick="javascript:history.back()">
            </form>
        </div>
    </div>

    <script>
        function populateCountrySelect(data) {
            var select = document.getElementById('countrySelect');
            data.forEach(function(country) {
                var option = document.createElement('option');
                option.text = country;
                select.add(option);
            });
        }

        function fetchCountryData() {
            fetch('csv/여행국가 (인덱스삭제).csv')
            .then(response => response.text())
            .then(text => {
                var lines = text.split('\n');
                var countries = lines.map(line => line.trim());
                populateCountrySelect(countries);
            });
        }

        window.onload = fetchCountryData;

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
            geocoder.geocode(
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
                }
            );
        }

        function searchLocation() {
            var geocoder = new google.maps.Geocoder();
            var address = document.getElementById('searchInput').value;

            geocoder.geocode({ 'address': address }, function(results, status) {
                if (status === 'OK') {
                    map.setCenter(results[0].geometry.location);
                    placeMarker(results[0].geometry.location);
                    getAddress(results[0].geometry.location);

                    var lat = results[0].geometry.location.lat();
                    var lng = results[0].geometry.location.lng();

                    document.getElementById('latInput').value = lat;
                    document.getElementById('lngInput').value = lng;
                } else {
                    alert('위치를 입력해주세요.');
                }
            });
        }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA5z9o0mEWFw3Gfsty4lUKD-ytifSz2Pbs&callback=initMap">
    </script>
</body>
</html>
</body>
</html>