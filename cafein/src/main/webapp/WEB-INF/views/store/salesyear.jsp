<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>연별 통계</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	  google.charts.load('current', {'packages':['table','corechart']});
      google.charts.setOnLoadCallback(drawChart);

      var sId = '<%= session.getAttribute("sId") %>';
      
  	  var daydata;
      function drawChart() {
    	  $.ajax({
    		  url : "./getsalesyear.do",
    		  data : { sId : sId },
    		  type : "POST",
    		  datatype: "json",
    		  success : function(days) {
  				var chartData = [];
				chartData.push(['연별','수량','금액'])
					for(i=0; i<days.length; i++) {		
						var dayss = [days[i].week + "년" , parseInt(days[i].cnt), parseInt(days[i].atotal)];
						chartData.push(dayss);
						console.log(dayss);
						
				}
				
				daydata = google.visualization.arrayToDataTable(chartData);	
				var options = {
					chartArea : {
						width : '40%'
					}
				};

				var table = new google.visualization.Table(document
							.getElementById('test_dataview4'))

				table.draw(daydata, {
					 width: '30%', height: '30%'
				});

				var chart = new google.visualization.LineChart(document
							.getElementById('curve_chart'));

				chart.draw(daydata, options);
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
	<h3 align="center">연별 통계</h3>
	<div id="curve_chart" style="width: 100%; margin: auto;"></div>
	<div align="center" id="test_dataview4"></div><br>
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