<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Stock Statistics</title>
</head>
<body>

<h1 align="center">재고 통계</h1>
<div class = "container">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['원두',     41],
          ['우유',      10],
          ['두유',  4],
          ['초코소스', 2],
          ['카라멜소스',    2],
          ['휘핑크림',    15],
          ['레몬 원액',    2],
          ['자몽 원액',    2],
          ['딸기 소스',    3],
          ['망고 소스',    3],
          ['녹차파우더',    2],
          ['홍차파우더',    2]
        ]);

        var options = {
          title: ''
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
     <div id="piechart" style="width: 900px; height: 500px; margin:auto;"></div>
<input type="date">
<input type="date">
<input type="button" value="검색">
<table class = "table table-hover">
<tr>
	<th>재고명</th><th>수량</th><th>단가 합계</th><th>재고 손실</th>
</tr>
<tr>
	<td>원두</td><td>41</td><td>410,000</td><td>+2</td>
</tr>
<tr>
	<td>우유</td><td>10</td><td>20,000</td><td>-2</td>
</tr>
<tr>
	<td>두유</td><td>2</td><td>5,000</td><td>0</td>
</tr>
<tr>
	<td>초코소스</td><td>1</td><td>10,000</td><td>0</td>
</tr>
<tr>
	<td>카라멜소스</td><td>1</td><td>10,000</td><td>0</td>
</tr>
<tr>
	<td>휘핑 크림</td><td>5</td><td>10,000</td><td>0</td>
</tr>
<tr>
	<td>레몬원액</td><td>4</td><td>40,000</td><td>0</td>
</tr>
<tr>
	<td>자몽원액</td><td>3</td><td>30,000</td><td>0</td>
</tr>
<tr>
	<td>딸기소스</td><td>4</td><td>52,000</td><td>0</td>
</tr>
<tr>
	<td>망고소스</td><td>4</td><td>52,000</td><td>0</td>
</tr>
<tr>
	<td>프레즐</td><td>10</td><td>20,000</td><td>0</td>
</tr>
<tr>
	<td>베이글</td><td>12</td><td>24,000</td><td>0</td>
</tr>
<tr>
	<td>치즈케익</td><td>8</td><td>16,000</td><td>0</td>
</tr>
<tr>
	<td>초코케익</td><td>5</td><td>10,000</td><td>0</td>
</tr>
<tr>
	<td>녹차파우더</td><td>2</td><td>14,000</td><td>0</td>
</tr>
<tr>
	<td>홍차파우더</td><td>2</td><td>14,000</td><td>0</td>
</tr>
</table>

</div>
</body>
</html>