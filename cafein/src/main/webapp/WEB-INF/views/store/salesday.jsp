<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		packages :  [ 'table', 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawBasic);

	var daydata;
	function drawBasic() {
		$.ajax({
			url : "./getsalesday.do",
			data : { s_id : 'SH001', dates : 'YYMMW'},
			type : "POST",
			async : false,
			datatype : "json",
			success : function(days) {
				var chartData = [];
				chartData.push(['요일','수량','금액'])
					for(i=0; i<days.length; i++) {
						var dayss = [days[i].week, parseInt(days[i].cnt), parseInt(days[i].atotal)];
						chartData.push(dayss);
					
					
				}
				daydata = google.visualization.arrayToDataTable(chartData);	
				
				var options = {
					title : '',
					chartArea : {
						width : '40%'
					}
				};

				var table = new google.visualization.Table(document
						.getElementById('test_dataview'))
				table.draw(daydata, {
					 width: '30%', height: '30%'
				});

				var chart = new google.visualization.BarChart(document
						.getElementById('chart_div'));

				chart.draw(daydata, options);
			}
		});

	};
	$(window).resize(function() {
		drawBasic();

	});
	
	
</script>
<title>일별 통계</title>
</head>
<body>
	<h2 align="center">매출</h2>
	<h3 align="center">일별 통계</h3>
	<p align="center">
		<input type="date">
	</p>
	<div id="chart_div"></div>
	<div align="center" id="test_dataview"></div>
	<table align="center">
		<tr>
			<th><button onclick="location.href='salestime.do'">시간별매출</button></th>
			<th><button onclick="location.href='salesday.do'">일별매출</button></th>
			<th><button onclick="location.href='salesmonth.do'">월별매출</button></th>
			<th><button onclick="location.href='salesyear.do'">연별매출</button></th>
			<th><button onclick="location.href='salesmenu.do'">메뉴별매출</button></th>
		</tr>
	</table>
</body>
</html>