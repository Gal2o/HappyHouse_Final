<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBtbedEFS8QTfbiGZbEKwXoOCZ7xQ7C9aE&callback=initMap"></script>

<!-- 시도/구군/동 선택 박스 -->
<div class="location-select">
	<select id="sido">
		<option value="0">도/광역시</option>
	</select>
	<select id="gugun">
		<option value="0">시/구/군</option>
	</select>
	<select id="dong">
		<option value="0">동</option>
	</select>
</div>

<!-- 아파트 거래 정보 -->
<div class="aptList-area">
	<!-- 지도 -->
	<div class="map" id="map">
	</div>
</div>

<script>
let colorArr = ['table-primary','table-success','table-danger'];
$(document).ready(function() {
	$.ajax({
		type: 'GET',
		url: '/selectbox.do/sido',
		dataType: 'json',
		success: function(data) {
			var htmlTxt = $('#sido').html();
			$.each(data,function(index, value) {
				htmlTxt += '<option value="'+value.sido_code+'">'+value.sido_name+'</option>';
			});
			
			$('#sido').html(htmlTxt);
		}
	});
});

$(document).ready(function(){
	$("#sido").change(function() {
		$.ajax({
			type: 'GET',
			url: '/selectbox.do/gugun/'+$('#sido').val(),
			dataType: 'json',
			success: function(data) {
				$("#gugun").empty();
				var htmlTxt = '<option value="0">선택</option>';
				$.each(data,function(index, value) {
					htmlTxt += '<option value="'+value.gugun_code+'">'+value.gugun_name+'</option>';
				});
				
				$('#gugun').html(htmlTxt);
			}
		});
	});//sido change
	$("#gugun").change(function() {
		$.ajax({
			type: 'GET',
			url: '/selectbox.do/dong/'+$('#gugun').val(),
			dataType: 'json',
			success: function(data) {
				$("#dong").empty();
				var htmlTxt = '<option value="0">선택</option>';
				$.each(data,function(index, value) {
					htmlTxt += '<option value="'+value.dong+'">'+value.dong+'</option>';
				});
				
				$('#dong').html(htmlTxt);
			}
		});
	});//gugun change
	$("#dong").change(function() {
		$.ajax({
			type: 'GET',
			url: '/selectbox.do/apt/'+$('#dong').val(),
			dataType: 'json',
			success: function(data) {
				geocode(data);
			}
		});
	});//dong change
});//ready

function geocode(jsonData) {
	let idx = 0;
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		$.get("https://maps.googleapis.com/maps/api/geocode/json"
				,{	key:'AIzaSyBtbedEFS8QTfbiGZbEKwXoOCZ7xQ7C9aE'
					, address:vo.dong+"+"+vo.AptName+"+"+vo.jibun
				}
				, function(data, status) {
					console.log(data);
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					$("#lat_"+index).text(tmpLat);
					$("#lng_"+index).text(tmpLng);
					addMarker(tmpLat, tmpLng, vo.AptName);
				}
				, "json"
		);//get
	});//each
}
</script>

<script>
	var multi = {lat: 37.5665734, lng: 126.978179};
	var map;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 12
		});
		var marker = new google.maps.Marker({position: multi, map: map});
	}
	function addMarker(tmpLat, tmpLng, aptName) {
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			label: aptName,
			title: aptName
		});
		marker.addListener('click', function() {
			map.setZoom(17);
			map.setCenter(marker.getPosition());
			callHouseDealInfo();
		});
		marker.setMap(map);
	}
	function callHouseDealInfo() {
		alert("you can call HouseDealInfo");
	}
</script>