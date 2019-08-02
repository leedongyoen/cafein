<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<title>월별 통계</title>
	<script type="text/javascript">
	google.charts.load('current', {
		packages :  [ 'table', 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawBasic);

	var sId = '<%= session.getAttribute("sId") %>';
	
	
	var daydata;
	function drawBasic() {
		var startDate = $('#startDate').val();
		
		$.ajax({
			url : "./getsalesmonth.do",
			data : { sId : sId, week : "MM", startDate : startDate},
			type : "POST",
			datatype : "json",
			success : function(days) {
				var chartData = [];
				chartData.push([' ','수량','금액'])
					for(i=0; i<days.length; i++) {		
						var dayss = [days[i].week+ '월', parseInt(days[i].cnt), parseInt(days[i].atotal)];
						chartData.push(dayss);
						console.log(dayss);
					
				}
				
				daydata = google.visualization.arrayToDataTable(chartData);	
				var options = {
	 					width:800,
	 					height:300,
				          
				          bars: 'horizontal', // Required for Material Bar Charts.
				          series: {
				            0: { axis: '수량'}, // Bind series 0 to an axis named 'distance'.
				            1: { axis: '금액' }
				          }
				       /*     axes: {
				            x: {
				              distance: {label: 'parsecs'},				      
				              brightness: {side: 'top', label: 'apparent magnitude'} // Top x-axis.
				            }
				          }  */
					
				};

				var table = new google.visualization.Table(document
							.getElementById('test_dataview2'))

				table.draw(daydata, {
					 width: '50%', height: '30%'
				});

				var chart = new google.charts.Bar(document
							.getElementById('chart_div'));

				chart.draw(daydata, options);
			}
		});

	};
	$(window).resize(function() {
		drawBasic();
	});
	
	function dates(){
	if($('#startDate').val()==''){
		
		$("#divDate").html('전체 기간');
		} else {
		$('#divDate').html($('#startDate').val());
		}
	};
	
	</script>
</head>
<body>
	<h2 align="center">월별 통계</h2><br>
	<div id="chart_div"  align="center"></div>

	<p align="center">
		<input type ="date" name ="startDate" id="startDate">&nbsp;
		<input type="button" value= "검색" class="btn btn-primary btn-sm" onclick="drawBasic()">
	</p>
<!-- 	<div id = "divDate"><input type="datetime"></div> -->
	<div align="center" id="test_dataview2"></div><br>
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