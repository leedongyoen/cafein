<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>시간별 통계</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
		google.charts.load('visualization','1',{	packages : [ 'table','corechart']});
		google.charts.setOnLoadCallback(drawBasic);

		var sId = '<%= session.getAttribute("sId") %>';

		var daydata;
		
		function drawBasic() {
			
			var startDate = $('#startDate').val();

			$.ajax({
					url : "./getsalestime.do",
					data : { sId : sId, startDate : startDate},
					type : "POST",
					datatype : "json",
					success : function(days) {
						var chartData = [];
						chartData.push(['시간별','수량','금액'])
							for(i=0; i<days.length; i++) {		
								var dayss = [days[i].week +'시', parseInt(days[i].cnt), parseInt(days[i].atotal)];
								chartData.push(dayss);
								console.log(dayss);
								
						}
						
						daydata = google.visualization.arrayToDataTable(chartData);	
						var options = {
								  
						          hAxis: {showTextEvery: 3},
						          vAxes: {0: {
						                 
						                      gridlines: {color: 'transparent'},
						                      },
						                  1: {gridlines: {color: 'transparent'},
						                     
						                  	},
						                  },
						               
						          series: {0: {targetAxisIndex:0},
						                   1:{targetAxisIndex:1},
						                  		            
						                  
						                  },
						          colors: ["red", "green"],
						          chartArea:{left:400,top:100, width:700, height:150}
								
						};
	
						var table = new google.visualization.Table(document
									.getElementById('test_dataview3'))
	
						table.draw(daydata, {
							 width: '50%', height: '30%'
						});
	
						var chart = new google.visualization.LineChart(document
									.getElementById('chart_div'));
	
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
	<!--  일일 매출 그래프-->
	<h2 align="center">시간별 통계</h2><br>
	<div id="chart_div" align="center"></div><br>
	<p align="center">
		<input type ="date" name ="startDate" id="startDate">&nbsp;
		<input type="button" value= "검색" class="btn btn-primary btn-sm" onclick="drawBasic()">
	</p>
	<div align="center" id="test_dataview3"></div>
	<div>
		<table align="center">
			<tr>
				<th><button onclick="location.href='salestime.do'"  class="btn btn-primary">시간별매출</button>&nbsp;</th>
				<th><button onclick="location.href='salesday.do'" class="btn btn-success">일별매출</button>&nbsp;</th>
				<th><button onclick="location.href='salesmonth.do'" class="btn btn-info">월별매출</button>&nbsp;</th>
				<th><button onclick="location.href='salesyear.do'" class="btn btn-warning">연별매출</button>&nbsp;</th>
				<th><button onclick="location.href='salesmenu.do'" class="btn btn-danger">메뉴별매출</button>&nbsp;</th>
			</tr>
		</table>
	</div>
</body>
</html>