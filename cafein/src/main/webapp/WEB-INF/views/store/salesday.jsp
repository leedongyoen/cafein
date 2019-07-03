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

	function drawBasic() {
		$.ajax({
			url : "./getsalesday.do",
			data : {oDnum : 1},
			type : "POST",
			datatype : "json",
			success : function() {

				var datas = google.visualization.arrayToDataTable([
						[ '-', '6월','' ], [ '일', 561,2712300, ], [ '월', 401,450000 ],
						[ '화', 123,502000 ], [ '수', 321,720000 ], [ '목', 122,870000 ],
						[ '금', 492,2400000 ], [ '토', 122,3400000 ] ]);

				var options = {
					title : '',
					chartArea : {
						width : '40%'
					}
				};

				var table = new google.visualization.Table(document
						.getElementById('test_dataview'))
				table.draw(datas, {
					sortColumn : 1 ,showRowNumber: true, width: '30%', height: '30%'
				});

				var chart = new google.visualization.BarChart(document
						.getElementById('chart_div'));

				chart.draw(datas, options);
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