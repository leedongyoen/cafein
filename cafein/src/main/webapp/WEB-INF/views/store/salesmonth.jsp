<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<title>월별 통계</title>
	<script type="text/javascript">
	google.charts.load('current', {
		packages :  [ 'table', 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawBasic);

	function drawBasic() {
		$.ajax({
			url : "./getsalesmonth.do",
		//	data : {oDnum : 1},
			type : "get",
			datatype : "json",
			success : function() {

				var datas = google.visualization.arrayToDataTable([
						[ '월', '총 수량','총 금액' ],
						[ '1월', 561,2712300, ],
						[ '2월', 401,450000 ],
						[ '3월', 123,502000 ],
						[ '4월', 321,720000 ],
						[ '5월', 122,870000 ],
						[ '6월', 492,2400000 ],
						[ '7월', 122,3400000 ],
						[ '8월', 122,3400000 ],
						[ '9월', 122,3400000 ],
						[ '10월', 122,3400000 ],
						[ '11월', 122,3400000 ],
						[ '12월', 122,3400000 ]
						]);

				var options = {
					title : '',
					chartArea : {
						width : '40%'
					}
				};

				var table = new google.visualization.Table(document
						.getElementById('test_dataview2'))
				table.draw(datas, {
					 width: '30%', height: '30%'
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
</head>
<body>
	<h2 align="center">매출</h2>
	<h3 align="center">월별 통계</h3>
	<div id="chart_div"></div>
	<div align="center" id="test_dataview2"></div>
	<p align="center"><input type="date"></p>
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
</body>
</html>