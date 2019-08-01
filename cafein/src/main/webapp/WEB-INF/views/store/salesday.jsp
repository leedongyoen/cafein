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
<script type="text/javascript">
	google.charts.load('current', { packages :  [ 'table', 'corechart', 'bar' ] }); //pakages 안에 붙어줄 
	google.charts.setOnLoadCallback(drawBasic);

	var daystring = ["일","월","화","수","목","금","토"]; // week에 요일을 붙여줄 배열.
	var daydata; //
	var sId = '<%= session.getAttribute("sId") %>';
	
	function drawBasic() {
		var startDate = $('#startDate').val();
		var endDate = $('#endDate').val();
		
		$.ajax({
			url : "./getsalesday.do",
			data : { sId : sId, startDate : startDate, endDate : endDate}, // JSON에서 받아올 데이터
			type : "POST",
		//	async : false,
			datatype : "json",
			success : function(days) {
				var chartData = [];	//차트 데이터에 담을 배열 .
				chartData.push([' ','수량','금액']) 
					for(i=0; i<days.length; i++) {		//매개변수 값을 이용하여 for문으로  리스트뿌림
						// String 타입은 그냥 ,int 타입은 parseInt 로 변환후 사용 
						var dayss = [daystring[days[i].week-1]  , parseInt(days[i].cnt), parseInt(days[i].atotal)];
						chartData.push(dayss); // var 선언한 메소드를 담음
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
					
				};
				var table = new google.visualization.Table(document
							.getElementById('test_dataview')) // table 만들 id 값

				table.draw(daydata, { 
					 width: '50%', height: '30%'
				});
				var chart = new google.charts.Bar(document
							.getElementById('chart_div'));
				chart.draw(daydata, options); // draw에 담길  메소드값와 옵션값을 넣어줌
			}
		});
	};
	$(window).resize(function() {
		drawBasic();

	});
</script>
<title>일별 통계</title>
</head>
<body>
	<h2 align="center">일별 통계</h2><br>
	<div id="chart_div" align="center"></div>
	<p align="center">
		<input type ="date" name ="startDate" id="startDate">&nbsp;
		<!-- <input type ="date" name ="endDate" id="endDate">&nbsp; -->
		<input type="button" value= "검색" class="btn btn-primary btn-sm" onclick="drawBasic()">
	</p>
	<div align="center" id="test_dataview"></div><br>
	<table align="center">
		<tr>
			<th><button onclick="location.href='salestime.do'"  class="btn btn-primary">시간별매출</button>&nbsp;</th>
			<th><button onclick="location.href='salesday.do'" class="btn btn-success">일별매출</button>&nbsp;</th>
			<th><button onclick="location.href='salesmonth.do'" class="btn btn-info">월별매출</button>&nbsp;</th>
			<th><button onclick="location.href='salesyear.do'" class="btn btn-warning">연별매출</button>&nbsp;</th>
			<th><button onclick="location.href='salesmenu.do'" class="btn btn-danger">메뉴별매출</button>&nbsp;</th>
		</tr>
	</table>
</body>
</html>