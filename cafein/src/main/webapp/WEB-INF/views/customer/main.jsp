<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="cushead.jsp" %>

<title>Customer Main Page</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
<style>
table {
	width : 200px;
	height : 100px;
}
</style>
</head>
<body>

<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	<!--페이지-->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
	</ol>
	<!--페이지-->
	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="../image/ad01.JPG" style="width:100%" alt="First slide">
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="../image/ad02.JPG" style="width:100%" data-src="" alt="Second slide">
		</div>
		<!--슬라이드2-->
	</div>
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>
<br><br>

<div style = "float:left;margin-right:10px;">
  <table border = "1" onclick = "location.href='likestorelist.do'">
	<tr>
		<th><label>자주 이용한 매장</label></th>
	</tr>
	<tr>
		<th><label>매장상호</label></th>
	</tr>
  </table>
</div>
<div style = "float:left;margin-right:10px;">
  <table border = "1" onclick = "location.href='cuslikemenulist.jsp'">
	<tr>
		<th><label>많이 주문한 메뉴</label></th>
	</tr>
	<tr>
		<th><label>메뉴명</label></th>
	</tr>
  </table>
</div>
<div style = "float:left;margin-right:10px;">
  <table border = "1" onclick = "location.href='reserve.jsp'">
	<tr>
		<th><label>총 적립금</label></th>
	</tr>
	<tr>
		<th><label>12,750원</label></th>
	</tr>
  </table>
</div>
<div style = "float:left;margin-right:10px;">
  <table border = "1" onclick = "location.href='orderlist.jsp'">
	<tr >
		<th><label>총 사용 금액</label></th>
	</tr>
	<tr>
		<th><label>347,000원</label></th>
	</tr>
  </table>
</div>


<br><br><br><br><br><br><br><br>
<div id="map" style="width:500px;height:400px;margin:auto;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae2e6275133a2bf25fe30fba002ced8d&libraries=services"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
<br><br>
</body>
</html>
