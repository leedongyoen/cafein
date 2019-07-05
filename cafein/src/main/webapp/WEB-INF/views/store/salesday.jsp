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
<<<<<<< HEAD
		//	data : {oDnum : 1},
			type : "get",
=======
			data : { s_id : 'SH001', dates : 'YYMMW'},
			type : "POST",
			async : false,
>>>>>>> branch 'master' of https://github.com/leedongyoen/cafein.git
			datatype : "json",
<<<<<<< HEAD
			success : function() {

				var data = google.visualization.arrayToDataTable([

						[ '요일', '총 수량','총 금액' ], [ '일', 561,2712300, ], [ '월', 401,450000 ],
						[ '화', 123,502000 ], [ '수', 321,720000 ], [ '목', 122,870000 ],
						[ '금', 492,2400000 ], [ '토', 122,3400000 ] ]);
		 		
				/* 		"cols": [
			        {"id":"","label":"Topping","pattern":"","type":"string"},
			        {"id":"","label":"Slices","pattern":"","type":"number"}
			      ],
			  "rows": [
			        {"c":[{"v":"Mushrooms","f":null},{"v":3,"f":null}]},
			        {"c":[{"v":"Onions","f":null},{"v":1,"f":null}]},
			        {"c":[{"v":"Olives","f":null},{"v":1,"f":null}]},
			        {"c":[{"v":"Zucchini","f":null},{"v":1,"f":null}]},
			        {"c":[{"v":"Pepperoni","f":null},{"v":2,"f":null}]}
			      ]  
						); */

=======
			success : function(days) {
				var chartData = [];
				chartData.push(['요일','수량','금액'])
					for(i=0; i<days.length; i++) {
						var dayss = [days[i].week, parseInt(days[i].cnt), parseInt(days[i].atotal)];
						chartData.push(dayss);
					
					
				}
				daydata = google.visualization.arrayToDataTable(chartData);	
				
>>>>>>> branch 'master' of https://github.com/leedongyoen/cafein.git
				var options = {
					chartArea : {
						width : '40%'
					}
				};

				var table = new google.visualization.Table(document
						.getElementById('test_dataview'))
<<<<<<< HEAD
				table.draw(data, {
					 width: '30%', height: '30%'
=======
				table.draw(daydata, {
					 width: '30%', height: '30%'
>>>>>>> branch 'master' of https://github.com/leedongyoen/cafein.git
				});

				var chart = new google.visualization.BarChart(document
						.getElementById('chart_div'));

<<<<<<< HEAD
				chart.draw(data, options);
=======
				chart.draw(daydata, options);
>>>>>>> branch 'master' of https://github.com/leedongyoen/cafein.git
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