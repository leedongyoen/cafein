<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>연별 통계</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<h2 align="center">매출</h2>
	<h3 align="center">연별 통계</h3>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
      google.charts.load('current', {'packages':['table','corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  $.ajax({
    		  url : "./getsalesyear.do",
    		  data : "",
    		  type : "get",
    		  datatype: "json",
    		  success : function() {

        var data = google.visualization.arrayToDataTable([
          ['Year', '총 판매', '순수익'],
          ['2016',  4250,      1200],
          ['2017',  3900,      900],
          ['2018',  5102,       1640],
          ['2019',  4863,      1430]
        ]);

        var options = {
          title: '',
          curveType: 'function',
          width: '100%',
          legend: { position: 'bottom' }
        };
        
        var table = new google.visualization.Table(document
				.getElementById('test_dataview4'))
		table.draw(data, {
			 width: '30%', height: '30%'
		});
      
        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
   });
};
      $(window).resize(function(){
      	drawChart();	  
      	});

    </script>
</head>
<body>
	<div id="curve_chart" style="width: 100%; margin: auto;"></div>
	<div align="center" id="test_dataview4"></div>
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
</body>
</html>