<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	table thead tr,
.tableth{
	color: black;
	
}

/* 테이블 th, td css */

table tr th,
table thead tr th,
.trth
{
	color: black;
	
}  
</style>
<title>월별 통계</title>
	<script type="text/javascript">
	google.charts.load('current', {
		packages :  [ 'table', 'corechart', 'bar' ]
	});
	google.charts.setOnLoadCallback(drawBasic);

	var sId = '<%= session.getAttribute("sId") %>';
	
	
	var daydata;
	
	$(function(){
		settingDate();
	});
	
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
					 width: '50%', height: '30%', colors: 'black'
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
		
function settingDate(){
		
		// 하루를 뺀 날짜 가져옴
		var date = new Date(new Date().setDate(new Date().getDate()-1));
		// 해당 날짜의 년도
		var year = date.getFullYear();
		// 해당 날짜의 달 , 0부터 시작하기때문에 +1을 함
		var mm =Number(date.getMonth())+1;
		// 해당 날짜의 일( 이때 위에서 하루를 뺀 일을 가져온다. )
		var dd = date.getDate();
		
		// format을 맞추기 위해서
		if(mm < 10)
			mm = '0'+mm;
		if(dd <10)
			dd = '0'+dd;

		// end date는 현재 날짜로 세팅하기
		document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
	};
	
	
	
	
	</script>
</head>
<body>
	<h2 align="center">월별 통계</h2><br>
	<div id="chart_div"  align="center"></div>

	<p align="center">
		<input type ="date"  class="btn btn-secondary resetdate" name ="startDate" id="startDate" value="gettoday()">&nbsp;
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