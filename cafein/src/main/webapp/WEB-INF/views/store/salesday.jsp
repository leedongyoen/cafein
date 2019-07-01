<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>일별 통계</title>
</head>
<body>
	<h2 align="center">매출</h2>
	<h3 align="center">일별 통계</h3>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<p align="center">
		<input type="date">
	</p>
	<div id="chart_div"></div>
	<script type="text/javascript">
		google.charts.load('current', {
			packages : [ 'corechart', 'bar' ]
		});
		google.charts.setOnLoadCallback(drawBasic);

		function drawBasic() {

			var data = google.visualization.arrayToDataTable([ [ '-', '6월', ],
					[ '일', 2712300, ], [ '월', 450000 ], [ '화', 502000 ],
					[ '수', 720000 ], [ '목', 870000 ], [ '금', 2400000 ],
					[ '토', 3400000 ] ]);

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


	<div>
		<table border="1" align="center">
			<tr>
				<th width=250>요일</th>
				<th width=250>총 수량</th>
				<th width=250>총 금액</th>
			</tr>
			<tr>
				<td>일</td>
				<td>395</td>
				<td>2,712,300원</td>
			</tr>
			<tr>
				<td>월</td>
				<td>86</td>
				<td>450,000원</td>
			</tr>
			<tr>
				<td>화</td>
				<td>92</td>
				<td>502,000원</td>
			</tr>
			<tr>
				<td>수</td>
				<td>113</td>
				<td>720,000원</td>
			</tr>
			<tr>
				<td>목</td>
				<td>136</td>
				<td>870,000원</td>
			</tr>
			<tr>
				<td>금</td>
				<td>364</td>
				<td>2,400,000원</td>
			</tr>
			<tr>
				<td>토</td>
				<td>498</td>
				<td>3,400,000원</td>
			</tr>
			<tr>
				<td>합계</td>
				<td>1684</td>
				<td>11,054,300원</td>
			</tr>
		</table>
	</div>
</body>
</html>