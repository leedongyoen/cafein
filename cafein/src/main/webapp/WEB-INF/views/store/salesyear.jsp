<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>연별 통계</title>
</head>
<body>
	<h2 align = "center">매출</h2>
	<h3 align="center">연별 통계</h3>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
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
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="curve_chart" style="width: 900px; height: 500px; margin:auto;"></div>
    	<div>
   		<table align = "center">
   			<tr>
   				<th><button onclick="location.href='salestime.jsp'">시간별매출</button></th>
   				<th><button onclick="location.href='salesday.jsp'">일별매출</button></th>
   				<th><button onclick="location.href='salesmonth.jsp'">월별매출</button></th>
   				<th><button onclick="location.href='salesyear.jsp'">연별매출</button></th>
   				<th><button onclick="location.href='salesmenu.jsp'">메뉴별매출</button></th>
   				<th><button onclick="location.href='storemain.jsp'">HOME</button></th>
   			</tr>
   		</table>
   	</div>
   	<p align = "center"><input type="date"></p>
   	<div>
		<table border="1" align="center">
			<tr>
				<th width=250>년도</th>	
				<th width=250>총 수량</th>
				<th width=250>총 금액</th>
			</tr>
			<tr>
				<td>2016</td>
				<td>8514</td>
				<td>142,500,000원</td>
			</tr>
			<tr>
				<td>2017</td>
				<td>7578</td>
				<td>139,000,000원</td>
			</tr>
			<tr>
				<td>2018</td>
				<td>8742</td>
				<td>151,020,000원</td>
			</tr>
			<tr>
				<td>2019</td>
				<td>7938</td>
				<td>148,630,000원</td>
			</tr>
			<tr>
				<td>합계</td>
				<td>32772</td>
				<td>581,150,000원</td>
			</tr>
		</table>
	</div>
  </body>
</html>
</body>
</html>