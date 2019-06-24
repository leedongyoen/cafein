<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Store Main Page</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);

function drawBasic() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', 'Sales');

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
          title: 'Popularity'
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
    }
</script>
<style>
table {
	width : 350px;
	height : 150px;
}
</style>
</head>
<body>
<!-- 일일매출 그래프 -->
<div id="chart_div"></div>
<!-- 판매율 -->
<div style = "float:left;margin-right:10px;">
<table border = "1" onclick = "location.href='menuInquiry.jsp'">
	<tr>
		<th colspan = "3">판매율 TOP3 메뉴</th>
	</tr>
	<tr>
		<th>
			<p>1.아메리카노</p>
		</th>
		<th>
			<p>2.바닐라라떼</p>
		</th>
		<th>
			<p>3.자몽에이드</p>
		</th>
	</tr>
</table>
</div>
<!-- 재고 소모 순위 -->
<div style = "float:left;margin-right:10px;">
<table border = "1" onclick = "location.href='stock.jsp'">
	<tr>
		<th colspan = "3">일일 재고 소모 순위</th>
	</tr>
	<tr>
		<th>No.</th>
		<th>재고명</th>
		<th>소모량</th>
	</tr>
	<tr>
		<th>1</th>
		<th>우유</th>
		<th>13박스</th>
	</tr>
	<tr>
		<th>2</th>
		<th>원두</th>
		<th>10kg</th>
	</tr>
	<tr>
		<th>3</th>
		<th>자몽원액</th>
		<th>5통</th>
	</tr>
</table>
</div>
<!-- 적립금 현황 -->
<div>
<table border = "1" onclick = "location.href='viewOurCustomer.jsp'">
	<tr>
		<th>적립된 적립금</th>
		<th>사용된 적립금</th>
	</tr>
	<tr>
		<th>35,730원</th>
		<th>7,400원</th>
	</tr>
</table>
</div>
</body>
</html>