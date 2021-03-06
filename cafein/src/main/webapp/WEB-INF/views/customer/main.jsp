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
		
 		mainLikeStoreList();
 		
 		mainLikeMenuList();
		
 		mainOrderList();
 		
 		loginCheck();
 	});
	
	var cId = '<%= session.getAttribute("cId") %>';

 	//메인에서 총적립금 보여주는 테이블
 	function mainTotalReserve() {
		$.ajax({
			url : "mainTotalReserve.do",
			data : {cId : cId},
			type : "GET",
			datatype : "json",
			success : function(data) {
				
				$("#totalreserve tbody").empty();
				$.each(data,function(idx,item){
					
					if(item == null) {
						$('<tr>')
						.append($('<td class="thcolor">').html('적립금이 없습니다.'))
						.appendTo('#totalreserve tbody');
					} else {
						
						$('<tr>')
						.append($('<td>').html(addCommas(item.toto)+'원'))
						.appendTo('#totalreserve tbody');
					}
					
				});
				
			}
		})
	};
	//메인에서 보여줄 자주사용하는 매장 순위리스트를 보여줌
	function mainLikeStoreList() {
		$.ajax({
			url : "mainLikeStoreList.do",
			data : {cId : cId},
			type : "GET",
			datatype : "json",
			success : function(data) {
				
				$("#mainlikestorelist tbody").empty();
				
				if(data.length == 0) {
					$('<tr>')
					.append($('<td colspan="2" height="58px" class="thcolor">').html('이용한 매장이 없습니다.'))
					.appendTo('#mainlikestorelist tbody');
				} else {
				
					$.each(data,function(idx,item){
						$('<tr>')
						.append($('<td>').html(item.rank))
						.append($('<td>').html(item.sName))
						.appendTo('#mainlikestorelist tbody');
					});
				}
			}
		})
	};
	
	//메인에서 보여줄 메뉴 리스트
	function mainLikeMenuList() {
		$.ajax({
			url : "mainLikeMenuList.do",
			data : {cId : cId},
			type : "GET",
			datatype : "json",
			success : function(data) {
				
				$("#mainlikemenulist tbody").empty();
				
				if(data.length == 0) {
					$('<tr>')
					.append($('<td colspan="2" height="58px" class="thcolor">').html('주문한 메뉴가 없습니다.'))
					.appendTo('#mainlikemenulist tbody');
				} else {
				
					$.each(data,function(idx,item){
						$('<tr>')
						.append($('<td>').html(item.rank))
						.append($('<td>').html(item.mName))
						.appendTo('#mainlikemenulist tbody');
					});
				}
			}
		})
	};
	//메인에서 보여줄 총주문금액 리스트
	function mainOrderList(){
		$.ajax({
			url:"mainorderlist.do",
			data : {cId : cId},
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				$("#mainorderlist tbody").empty();	
				console.log('-----------------')
				console.log(data)
					
					$.each(data,function(idx,item){
						
						if(item == null) {
							$('<tr>')
							.append($('<td class="thcolor">').html('사용한 금액이 없습니다.'))
							.appendTo('#mainorderlist tbody');
						} else {
						
						
							$('<tr>')
							.append($('<td>').html(addCommas(item.totals)+'원'))
							.appendTo('#mainorderlist tbody');
						}
					});
				
			} 
		});
	}
	
	function addCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
 	</script>
<title>Customer Main Page</title>

<style>
 /* Make the image fully responsive */
.carousel-inner img {
    width: 100%;
   min-height: 200px;
}
table {

	width : 200px;
	height : 100px;
}
 .carousel-inner > .item > img {
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 200px;
    } 
 .cursor {cursor: pointer;}
.thcolor {
	background-color:white;
	color:black;
	text-align:center;
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
      <img src="${pageContext.request.contextPath}/image/cusbanner1.jpg"  width="100%" height="500vw">
    </div>
     <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/image/cusbanner3.jpg" width="100%" height="500vw">
    </div>
     <div class="carousel-item">
      <img src="${pageContext.request.contextPath}/image/cusbanner4.jpg" width="100%" height="500vw">
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
<div class = "container" align="center">
	<div class="row">
		<div class="col-sm" >
		  <table  border = "1" id="mainlikestorelist" 
		  	onclick = "location.href='${pageContext.request.contextPath}/likestorelist.do'" style="cursor:pointer">
			<thead>
				<tr>
					
					<th colspan="2"><label>자주 이용한 매장</label></th>
				</tr>
			</thead>
				<tbody>
				</tbody>
		  </table>
		</div>
		<div class="col-sm">
		  <table border = "1" id="mainlikemenulist"
		  onclick = "location.href='${pageContext.request.contextPath}/likemenulist.do'" style="cursor:pointer">
			<thead>
				<tr>
					
					<th colspan="2"><label>많이 주문한 메뉴</label></th>
				</tr>
			</thead>
				<tbody>
				</tbody>
		  </table>
		</div>
		<div class="col-sm">
		  <table border = "1" id ="totalreserve" 
		  onclick = "location.href='${pageContext.request.contextPath}/reservelist.do'" style="cursor:pointer">
			<thead>
			<tr>
				<th><label>적립금</label></th>
			</tr>
			</thead>
			<tbody class="thead-dark">
			</tbody>
		  </table>
		</div>
		<div class="col-sm">
		  <table border = "1" id="mainorderlist"
		  onclick = "location.href='${pageContext.request.contextPath}/orderlist.do'" style="cursor:pointer">
			<thead>
				<tr >
					<th><label>총 사용 금액</label></th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		  </table>
		</div>
	</div>	
</div><!-- <br><br><br><br><br><br><br><br>
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
<br><br> -->
</body>
</html>
