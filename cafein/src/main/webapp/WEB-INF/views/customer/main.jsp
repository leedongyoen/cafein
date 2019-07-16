<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<%@ include file="cushead.jsp" %>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 	<script type="text/javascript">
	//객체 호출
 	$(function(){
 		mainTotalReserve();
		
	});
 	//메인에서 총적립금 보여주는 테이블
 	function mainTotalReserve() {
		$.ajax({
			url : "mainTotalReserve.do",
			data : {cId : "ju123"},
			type : "GET",
			datatype : "json",
			success : function(data) {
				console.log(data);
				$("#totalreserve tbody").empty();
				$.each(data,function(idx,item){
					$('<tr>')
					.append($('<td>').html(item.totalre))
					.appendTo('#totalreserve tbody');
				});
			}
		})
	};
 	</script>
<title>Customer Main Page</title>

<style>
 /* Make the image fully responsive */
.carousel-inner img {
    width: 100%;
    height: 100%;
}
table {

	width : 200px;
	height : 100px;
}
</style>
</head>
<body>

<div id="demo" class="carousel slide" data-ride="carousel">
	<!--페이지-->
	<ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
  </ul>
	<!--페이지-->
	<div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath}/image/ad01.JPG"  width="100%" >
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/image/ad02.JPG" width="100%" >
    </div>

  </div>
  
	<!--이전, 다음 버튼-->
	<a class="carousel-control-prev" href="#demo" data-slide="prev">
    	<span class="carousel-control-prev-icon"></span>
  	</a>
  	<a class="carousel-control-next" href="#demo" data-slide="next">
    	<span class="carousel-control-next-icon"></span>
  	</a>
</div>
<br><br>

<div style = "float:left;margin-right:10px;">
  <table border = "1" onclick = "location.href='${pageContext.request.contextPath}/likestorelist.do'">
	<tr>
		<th><label>자주 이용한 매장</label></th>
	</tr>
	<tr>
		<th><label>매장상호</label></th>
	</tr>
  </table>
</div>
<div style = "float:left;margin-right:10px;">
  <table border = "1" onclick = "location.href='${pageContext.request.contextPath}/likemenulist.do'">
	<tr>
		<th><label>많이 주문한 메뉴</label></th>
	</tr>
	<tr>
		<th><label>메뉴명</label></th>
	</tr>
  </table>
</div>
<div style = "float:left;margin-right:10px;">
  <table border = "1" id ="totalreserve" 
  onclick = "location.href='${pageContext.request.contextPath}/reservelist.do'">
	<thead>
	<tr>
		<th><label>총 적립금</label></th>
	</tr>
	</thead>
	<tbody>
	</tbody>
  </table>
</div>
<div style = "float:left;margin-right:10px;">
  <table border = "1" onclick = "location.href='${pageContext.request.contextPath}/orderlist.do'">
	<tr >
		<th><label>총 사용 금액</label></th>
	</tr>
	<tr>
		<th><label>347,000원</label></th>
	</tr>
  </table>
</div>


<br><br><br><br><br><br><br><br>
<div id="map" style="width:100%;height:400px;margin:auto;"></div>
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
