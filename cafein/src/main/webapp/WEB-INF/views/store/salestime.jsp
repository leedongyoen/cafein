<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>시간별 통계</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script>
		google.charts.load('current', {
			packages : [ 'table','corechart', 'line' ]
		});
		google.charts.setOnLoadCallback(drawBasic);

		function drawBasic() {
			$.ajax({
				url : "./getsalestime.do",
			//	data : "",
				type : "POST",
				datatype : "json",
				success : function() {

			var data = new google.visualization.DataTable();
			data.addColumn('number', '시간별');
			data.addColumn('number', '총 수량');
			data.addColumn('number', '총 금액');

			data
					.addRows([ [ 10, 10, 55000 ], [ 11, 14, 76000 ], [ 12, 23, 120000 ],
							[ 13, 35, 118000 ], [ 14,23,  108000 ], [ 15, 30, 238000 ],
							[ 16, 25, 171000 ], [ 17, 42, 335000 ], [ 18, 11, 52000 ],
							[ 19, 13, 87000 ], [ 20, 14, 95000 ], [ 21, 9, 52000 ],
							[ 22, 5, 23000 ] ]);

			var options = {
				width : '100%'
			};

			var table = new google.visualization.Table(document
					.getElementById('test_dataview3'))
			table.draw(data, {
				 width: '30%', height: '30%'
			});
			
			var chart = new google.visualization.LineChart(document
					.getElementById('chart_div'));
 
			chart.draw(data, options);
			}
		});
	};
		$(window).resize(function() {
			drawBasic();
		}); 
	</script> 
</head>
<body>
	<!-- 일일매출 그래프 -->
	<h2 align="center">매출</h2>
	<h3 align="center">시간별 통계</h3>
<<<<<<< HEAD
</head>
<body>
	<!-- 일일매출 그래프 -->
	<div align="center" id="test_dataview3"></div>
=======
>>>>>>> branch 'master' of https://github.com/leedongyoen/cafein.git
	<div id="chart_div"></div>
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
	<p align="center"><input type="date"></p>
<<<<<<< HEAD
=======
	<div align="center" id="test_dataview3"></div>
>>>>>>> branch 'master' of https://github.com/leedongyoen/cafein.git
</body>
</html>