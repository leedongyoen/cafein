<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>시간별 통계</title>

</head>
<body>
	<h2 align = "center">매출</h2>
	<h3 align = "center">시간별 통계</h3>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', '판매');

      data.addRows([
         [10, 55000], [11, 76000], [12, 120000], [13, 118000],  
          [14, 108000], [15, 238000], [16, 171000], [17, 335000],  
          [18, 52000], [19, 87000], [20, 95000], [21, 52000],
          [22, 23000]
      ]);

      var options = {
        hAxis: {
          title: 'Time'
        },
        vAxis: {
          title: ''
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
</script>
</head>
<body>
<!-- 일일매출 그래프 -->
<div id="chart_div"></div>
		<div>
   		<table align = "center">
   			<tr>
   				<th><button onclick="location.href='salestime.do'">시간별매출</button></th>
   				<th><button onclick="location.href='salesday.do'">일별매출</button></th>
   				<th><button onclick="location.href='salesmonth.do'">월별매출</button></th>
   				<th><button onclick="location.href='salesyear.do'">연별매출</button></th>
   				<th><button onclick="location.href='salesmenu.do'">메뉴별매출</button></th>
   			</tr>
   		</table>
   	</div>
   	<p align = "center"><input type="date"></p>
   	<div>
		<table border="1" align="center">
			<tr>
				<th width=250>시간</th>	
				<th width=250>총 수량</th>
				<th width=250>총 금액</th>
			</tr>
			<tr>
				<td>10:00 AM</td>
				<td>12</td>
				<td>55,000원</td>
			</tr>
			<tr>
				<td>11:00 AM</td>
				<td>14</td>
				<td>76,000원</td>
			</tr>
			<tr>
				<td>12:00 PM</td>
				<td>22</td>
				<td>120,000원</td>
			</tr>
			<tr>
				<td>13:00 PM</td>
				<td>21</td>
				<td>118,000원</td>
			</tr>
			<tr>
				<td>14:00 PM</td>
				<td>20</td>
				<td>108,000원</td>
			</tr>
			<tr>
				<td>15:00 PM</td>
				<td>37</td>
				<td>238,000원</td>
			</tr>
			<tr>
				<td>16:00 PM</td>
				<td>32</td>
				<td>171,000원</td>
			</tr>
			<tr>
				<td>17:00 PM</td>
				<td>41</td>
				<td>335,000원</td>
			</tr>
			<tr>
				<td>18:00 PM</td>
				<td>11</td>
				<td>52,000원</td>
			</tr>
			<tr>
				<td>19:00 PM</td>
				<td>12</td>
				<td>87000</td>
			</tr>
			<tr>
				<td>20:00 PM</td>
				<td>17</td>
				<td>95000</td>
			</tr>
			<tr>
				<td>21:00 PM</td>
				<td>11</td>
				<td>52000</td>
			</tr>
			<tr>
				<td>22:00 PM</td>
				<td>6</td>
				<td>23000</td>
			</tr>
			<tr>
				<td>합계</td>
				<td>256</td>
				<td>1,530,000원</td>
			</tr>
		</table>
	</div>
</body>
</html>