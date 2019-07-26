<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>재고 입고 통계</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
	<h1 align="center">재고 입고 통계</h1>
	<div class="container">
		<script type="text/javascript">
		var sId = "<%= (String)session.getAttribute("sId") %>";
		
		$(function() {
			loginCheck();		
		});
		
		google.charts.load('current', {
			packages : [ 'corechart', 'bar' ]
		});
		google.charts.setOnLoadCallback(dateSearch);
	
		var chartData = []; 
		
		var options = {
			chartArea : {
				width : '40%'
			},
			is3D: true
		};

		function drawChart() {
			
			var wareData = google.visualization.arrayToDataTable(chartData);

			var barChart = new google.visualization.BarChart(document.getElementById('barChart_div')) // table 만들 id 값

			barChart.draw(wareData, options);

			var pieChart = new google.visualization.PieChart(document.getElementById('pieChart_div'));

			pieChart.draw(wareData, options); // draw에 담길  메소드값와 옵션값을 넣어줌 
		}

		$(window).resize(function() {
			drawChart();
		});

		function dateSearch() {
			//날짜 데이터 같이 보내기
			var startDate = jQuery('#startDate').val();
			var endDate = jQuery('#endDate').val();

			//   		if(startDate == '' || endDate == ''){
			//   			alert('날짜를 선택해 주세요.');
			//   			return;
			//   		}

			//alert(jQuery('#startDate').val());
			//alert(jQuery('#endDate').val());

			$.ajax({
				url : 'dateSearchEntered',
				type : 'POST',
				dataType : 'json',
				data : {
					startDate : startDate,
					endDate : endDate,
					sId : sId
				},
				
				error : function(status, msg) {
					alert(status + "메세지" + msg);
				},
				success : function(data) {
					warehousingListResult(data);
					chartData = [];
					chartData.push([ '재고명', '수량' ])
					
					for (i = 0; i < data.length; i++) {
						var datas = [ data[i].stName, data[i].wareQty ];
						chartData.push(datas);
						console.log(datas);
					}
					if(datas == null){
						alert("기간에 맞는 데이터가 없습니다.");
						return;
					}
					drawChart();
					
				}

			});
		}

		//입출고 리스트 뿌리기
		function warehousingListResult(data) {
// 			$('#pieChart_div').empty();
			$("thead").empty();
			$("tbody").empty();
			if($('#endDate').val() =='' || $('#startDate').val()==''){
				$("#divDate").html('전체 기간');
				}else{
				$('#divDate').html($('#startDate').val()+' ~ '+$('#endDate').val());
				}
			$('<tr>').append($('<th>').html('재고 명'))
					 .append($('<th>').html('총 가격'))
					 .append($('<th>').html('총 수량'))
					 .append($('<th>').html('재고 손실'))
					 .appendTo('thead');
			$.each(data, function(idx, item) {
				$('<tr>').append($('<td>').html(item.stName))
						 .append($('<td>').html(item.warePrice))
						 .append($('<td>').html(item.wareQty))
						 .append($('<td>').html(item.stLoss))
						 .appendTo('tbody');
			});
		}

			//       style="width: 700px; height: 400px;"
		</script>
		<div class="row">
			<div id="pieChart_div" class="col-xs-12 col-md-8"
				style="width: 600px; height: 400px;"></div>
			<div id="barChart_div" class="col-xs-6 col-md-4"></div>

		</div>
		<br>

		<hr>
		<div class="btn-group">
			<input type="date" class="btn btn-secondary" id="startDate"
				name="startDate">&nbsp; <input type="date"
				class="btn btn-secondary" id="endDate" name="endDate">&nbsp;
			<input type="button" value="검색" class="btn btn-success"
				id="btnSearch" onclick="dateSearch()">
		</div>
		<div class="btn-group">
			<input type="button" value="입고 통계" class="btn btn-primary"
				id="btnEntered" onclick="location.href='stockentered.do'">&nbsp;
			<input type="button" value="출고 통계" class="btn btn-primary"
				id="btnReleased" onclick="location.href='stockreleased.do'">&nbsp;
			<input type="button" value="전체 통계" class="btn btn-primary"
				id="btnwarehousing" onclick="location.href='stockwarehousing.do'">
		</div>
	<div><h5 id="divDate"></h5></div>
	</div>
	<br>

	<div class="container">
		<table class="table text-center">
			<thead></thead>
			<tbody></tbody>
		</table>
		<hr>

	</div>
</body>
</html>