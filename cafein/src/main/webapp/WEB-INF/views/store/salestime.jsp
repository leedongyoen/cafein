<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>시간별 통계</title>
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
<script>
		google.charts.load('visualization','1',{	packages : [ 'table','corechart']});
		google.charts.setOnLoadCallback(drawBasic);

		var sId = '<%= session.getAttribute("sId") %>';

		var daydata;
		
		$(function(){
			settingDate();
		});
		
		function drawBasic() {
			
			var startDate = $('#startDate').val();

			$.ajax({
					url : "./getsalestime.do",
					data : { sId : sId, startDate : startDate},
					type : "POST",
					datatype : "json",
					success : function(days) {
						var chartData = [];
						chartData.push([' ','수량','금액'])
							for(i=0; i<days.length; i++) {		
								var dayss = [days[i].week, parseInt(days[i].cnt), parseInt(days[i].atotal)];
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
			   }
			

	</script> 
</head>
<body>
	<!--  일일 매출 그래프-->
	<h2 align="center">시간별 통계</h2><br>
	<div id="chart_div"></div><br>
	<p align="center">
		<input type ="date" class="btn btn-secondary resetdate" name ="startDate" id="startDate">&nbsp;
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