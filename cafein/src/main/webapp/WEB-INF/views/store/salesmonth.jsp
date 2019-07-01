<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>월별 통계</title>
</head>
<body>
	<h2 align="center">매출</h2>
	<h3 align="center">월별 통계</h3>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<div id="chart_div"></div>
	<script type="text/javascript">
		google.charts.load('current', {
			packages : [ 'corechart', 'bar' ]
		});
		google.charts.setOnLoadCallback(drawBasic);

		function drawBasic() {

			var data = google.visualization.arrayToDataTable([
					[ '-', '2019', ], [ '1월', 10232000 ], [ '2월', 9570000 ],
					[ '3월', 12053004 ], [ '4월', 8657400 ], [ '5월', 13032050 ],
					[ '6월', 7545661 ],

			]);

			var options = {
				title : '',
				chartArea : {
					width : '40%'
				},
				hAxis : {
					title : '',
					minValue : 0
				},
				vAxis : {
					title : ''
				}
			};

			var chart = new google.visualization.BarChart(document
					.getElementById('chart_div'));

			chart.draw(data, options);
		}

		$(window).resize(function() {
			drawBasic();
		});
	</script>
	<div>
		<table align="center">
			<tr>
				<th><button onclick="location.href='salestime.do'">시간별매출</button></th>
				<th><button onclick="location.href='salesday.do'">일별매출</button></th>
				<th><button onclick="location.href='salesmonth.do'">월별매출</button></th>
				<th><button onclick="location.href='salesyear.do'">연별매출</button></th>
				<th><button onclick="location.href='salesmenu.do'">메뉴별매출</button></th>
			</tr>
		</table>
	</div>
	<p align="center">
		<input type="date">
	</p>
	<div>
		<table border="1" align="center">
			<tr>
				<th width=250>월</th>
				<th width=250>총 수량</th>
				<th width=250>총 금액</th>
			</tr>
			<tr>
				<td>1월</td>
				<td>1419</td>
				<td>20,232,000원</td>
			</tr>
			<tr>
				<td>2월</td>
				<td>1263</td>
				<td>29,570,000원</td>
			</tr>
			<tr>
				<td>3월</td>
				<td>1557</td>
				<td>22,053,004원</td>
			</tr>
			<tr>
				<td>4월</td>
				<td>1182</td>
				<td>18,657,400원</td>
			</tr>
			<tr>
				<td>5월</td>
				<td>1734</td>
				<td>33,032,050원</td>
			</tr>
			<tr>
				<td>6월</td>
				<td>1341</td>
				<td>19,832,648원</td>
			</tr>
			<tr>
				<td>합계</td>
				<td>8496</td>
				<td>143,377,102원</td>
			</tr>
		</table>
	</div>
</body>
</html>