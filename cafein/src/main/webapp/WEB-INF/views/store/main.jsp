<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="storehead.jsp" %>
<title>Store Main Page</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>

	var sId = "<%= (String)session.getAttribute("sId") %>";	
	var daydata,word;

	google.charts.load('current', {	packages : [ 'table','corechart', 'line' ]});
	google.charts.setOnLoadCallback(drawBasic);

	$(function(){
		menuTop3();
		stockLess();
		mileageInfo();
	});
	
	function drawBasic() {
		$.ajax({
			url : "./getsalestime.do",
			data : { sId : "SH001"},
			type : "POST",
			datatype : "json",
			success : function(days) {
				var chartData = [];
				chartData.push(['시간별','수량','금액'])
					for(i=0; i<days.length; i++) {		
						var dayss = [days[i].week, parseInt(days[i].cnt), parseInt(days[i].atotal)];
						chartData.push(dayss);
						//console.log(dayss);
						
				}
				
				daydata = google.visualization.arrayToDataTable(chartData);	
				var options = {
						width : '100%'
				};
	
				var table = new google.visualization.Table(document
							.getElementById('test_dataview3'))
	
				table.draw(daydata, {
					 width: '30%', height: '30%'
				});
	
				var chart = new google.visualization.LineChart(document
							.getElementById('chart_div'));
	
				chart.draw(daydata, options);
			}
		});
	
	};

	// ----------------------- 매장 메인화면 data (매출 아래쪽에 뿌려질 data) -----------------------------
	// 매장 메인 판매율 TOP3 메뉴 조회
	function menuTop3() {
		$.ajax({
			url:"salesrank",
			type:'GET',			
			data:{sId:sId},
			dataType:'json',
			error:function(xhr,status,msg){
				alert('통신 실패');
			},
			success:function(data){ 
				
				$('#salesRank tbody').empty();
				
				if(data.length == 0) {
					$('<tr>')
					.append($('<th colspan="3" height="99px">').html('판매된 메뉴가 없습니다.'))
					.appendTo('#salesRank tbody');
				} else {
					$.each(data,function(idx,item){	
						
						$('<tr>')
						.append($('<th>').html(item.rank))
						.append($('<th>').html(item.mName))
						.append($('<th>').html(item.cnt+'잔'))
						.appendTo('#salesRank tbody');
						
						console.log('순위 : ' + item.rank + ', 메뉴명 : ' + item.mName + ', 판매량 : ' + item.cnt+'잔')
						
					});
				}
			}
		});
	}
	
	// 매장 메인 재고 소모량 TOP3 조회
	function stockLess() {
		$.ajax({
			url:"stockless",
			type:'GET',			
			data:{sId:sId},
			dataType:'json',
			error:function(xhr,status,msg){
				alert('통신 실패');
			},
			success:function(data){ 
				console.log(data)
				$('#stockLess tbody').empty();
				
				if(data.length == 0) {
					$('<tr>')
					.append($('<th colspan="3" height="99px">').html('소모된 재고가 없습니다.'))
					.appendTo('#stockLess tbody');
				} else {
				
					$.each(data,function(idx,item){	
						console.log(item.stUnit)
	
						if(item.stUnit == 'ml' || item.stUnit == 'g') { 
							word = '통';
							
						} else if(item.stUnit == 'EA') {
							word = '개';
						}
						
						$('<tr>')
						.append($('<th>').html(item.rank))
						.append($('<th>').html(item.stName))
						.append($('<th>').html(item.stQty+word))
						.appendTo('#stockLess tbody');
						
	
						console.log('순위 : ' + item.rank + ', 메뉴명 : ' + item.stName + ', 판매량 : ' + item.stQty)
						
					});
				}
			}
		});
	}
	
	// 매장 메인 마일리지 현황 조회
	function mileageInfo() {
		$.ajax({
			url:"mileageinfo",
			type:'GET',			
			data:{sId:sId},
			dataType:'json',
			error:function(xhr,status,msg){
				alert('통신 실패');
			},
			success:function(data){ 
				$('#mileageInfo tbody').empty();
				$.each(data,function(idx,item){	
					
					$('<tr>')
					.append($('<th height="99px">').html(addCommas(item.addmileage)+'P'))
					.append($('<th height="99px">').html(addCommas(item.mileage)+'P'))
					.appendTo('#mileageInfo tbody');
					
					console.log('사용된 마일리지 : ' + item.addmileage + ', 적립된 마일리지 : ' + item.mileage)
					
				});
			}
		});
	}
	

	// 각 함수를 호출해서 화면에 뿌려준다
	$(window).resize(function() {
		drawBasic();
	});

	// 숫자 3단위마다 콤마 생성
	function addCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
<style>
table {
	width : 350px;
	height : 150px;
}
table tr th {
	text-align:center;
}
</style>
</head>
<body>
<input type="button" onclick="location.href='maintest.do'" value="메인화면 테스트">
<!-- 시간별 매출 그래프 -->
	<h3 align="center">시간별 통계</h3>
	<div id="chart_div"></div><br>
	<div align="center" id="test_dataview3"></div>
	<br>	
<div class = "container" align="center">
	<!-- 판매율 -->
	<div style = "float:left;margin-right:10px;">
	<table border = "1" id="salesRank">
		<thead>
			<tr>
				<th colspan = "3">월별 판매율 TOP3 메뉴</th>
			</tr>
			<tr>
			<th>No.</th>
			<th>메뉴명</th>
			<th>판매량</th>
		</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	</div>
	<!-- 재고 소모 순위 -->
	<div style = "float:left;margin-right:10px;">
	<table border = "1" id="stockLess">
		<thead>
			<tr>
				<th colspan = "3">일일 재고 소모 순위</th>
			</tr>
			<tr>
				<th>No.</th>
				<th>재고명</th>
				<th>소모량</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	</div>
	<!-- 적립금 현황 -->
	<div>
	<table border = "1" id="mileageInfo">
		<thead>
			<tr height="66px">
				<th>적립된 마일리지</th>
				<th>사용된 마일리지</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	</div>
</div>
</body>
</html>