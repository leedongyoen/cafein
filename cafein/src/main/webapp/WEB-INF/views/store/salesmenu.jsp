<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>메뉴별 통계</title>
</head>
<body>
	<h2 align = "center">매출</h2>
	<h3 align="center">메뉴별 통계</h3>
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['에스프레소',     31],
          ['아메리카노',      92],
          ['카페라떼',  78],
          ['카페모카', 45],
          ['녹차 라떼',    35],
          ['홍차 라떼',    27],
          ['레몬 에이드',    58],
          ['자몽 에이드',    41],
          ['딸기 스무디',    35],
          ['망고 스무디',    24]
        ]);

        var options = {
          title: ''
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px; margin:auto;"></div>
    <p align = "center"><input type="date"></p>
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
   	<div>
		<table border="1" align="center">
			<tr>
				<th width=250>메뉴명</th>
				<th width=250>총 수량</th>
				<th width=250>총 금액</th>
			</tr>
			<tr>
				<td>에스프레소</td>
				<td>31</td>
				<td>124,000원</td>
			</tr>
			<tr>
				<td>아메리카노</td>
				<td>92</td>
				<td>414,000원</td>
			</tr>
			<tr>
				<td>카페라떼</td>
				<td>78</td>
				<td>390,000원</td>
			</tr>
			<tr>
				<td>카페모카</td>
				<td>45</td>
				<td>234,000원</td>
			</tr>
			<tr>
				<td>녹차 라떼</td>
				<td>35</td>
				<td>192,000원</td>
			</tr>
			<tr>
				<td>홍차 라떼</td>
				<td>27</td>
				<td>148,500원</td>
			</tr>
			<tr>
				<td>레몬 에이드</td>
				<td>58</td>
				<td>290,000원</td>
			</tr>
			<tr>
				<td>자몽 에이드</td>
				<td>41</td>
				<td>205,000원</td>
			</tr>
			<tr>
				<td>딸기 스무디</td>
				<td>35</td>
				<td>185,500원</td>
			</tr>
			<tr>
				<td>망고 스무디</td>
				<td>24</td>
				<td>127,200원</td>
			</tr>
			<tr>
				<td>합계</td>
				<td>466</td>
				<td>2,310,200원</td>
			</tr>
		</table>
	</div>
  </body>
</html>