<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Stock Staticstics List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>

<h1 align="center">재고 통계</h1>
<div class = "container">
    <script type="text/javascript">
	$(function(){
		warehousingList();
		enteredList();
		releasedList();
	});
	
      google.charts.load('current', {packages:['corechart','table','bar']});
      google.charts.setOnLoadCallback(drawChart);
      
      var wareData;
      
      function drawChart() {
			$.ajax({
				url:'warehousing',
				type:'GET',
				datatype: 'json',
// 				data : JSON.stringify({ stName : stName, wareQty : wareQty, warePrice : warePrice, stLoss : stLoss}),
				success: function(data){
					var chartData = [];
					chartData.push(['재고명','수량'])
					for(i=0; i<data.length; i++){
						var datas = [data[i].stName, data[i].wareQty];
// 							data[i].warePrice, data[i].stLoss];
						chartData.push(datas);
						console.log(datas);
					}
					

					wareData = google.visualization.arrayToDataTable(chartData);	
					var options = {
						chartArea : {
							width : '40%'
						}
					};

					var table = new google.visualization.Table(document
								.getElementById('test_dataview')) // table 만들 id 값

					table.draw(wareData, { 
						 width: '30%', height: '30%'
					});

					var chart = new google.visualization.PieChart(document
								.getElementById('chart_div'));

					chart.draw(wareData, options); // draw에 담길  메소드값와 옵션값을 넣어줌
				}
			});
		};
		
		$(window).resize(function(){
			drawChart();
		});

      

		//재고 출고 리스트 요청
	      function releasedList(){
	    	  $.ajax({
	    		  url:'released',
	    		  type:'GET',
	    		  dataType:'json',
	    		  error:function(status,msg){
	    			  alert(status+"메세지"+msg);
	    		  },
	    		  success:warehousingListResult
	    	  });
	    	}
	    //재고 입고 리스트 요청
	      function enteredList(){
	    	  $.ajax({
	    		  url:'entered',
	    		  type:'GET',
	    		  dataType:'json',
	    		  error:function(status,msg){
	    			  alert(status+"메세지"+msg);
	    		  },
	    		  success:warehousingListResult
	    	  });
	    	}
      //재고 입/출고 리스트 요청
      function warehousingList(){
    	  $.ajax({
    		  url:'warehousing',
    		  type:'GET',
    		  dataType:'json',
    		  error:function(status,msg){
    			  alert(status+"메세지"+msg);
    		  },
    		  success:warehousingListResult
    	  });
    	}
      
      //입출고 리스트 뿌리기
      function warehousingListResult(data){
    	  $("thead").empty();
    	  $("tbody").empty();
    	  $('<tr>')
    			.append($('<th>').html('재고 명'))
    			.append($('<th>').html('총 가격'))
    			.append($('<th>').html('총 수량'))
    			.append($('<th>').html('재고 손실'))
    			.appendTo('thead');
    	  $.each(data, function(idx,item){
    		  $('<tr>')
    		  	.append($('<td>').html(item.stName))
    		  	.append($('<td>').html(item.warePrice))
    		  	.append($('<td>').html(item.wareQty))
    		  	.append($('<td>').html(item.stLoss))
    		  	.appendTo('tbody');
    	  })
      }
      
	//날짜 데이터 보내기
	function dateSearch(){    	  													
		var startDate = jQuery('#startDate').val();
		var endDate = jQuery('#endDate').val();
			
		if(startDate == '' || endDate == ''){
			alert('날짜를 선택해 주세요.');
			return;
		}
		
		//alert(jQuery('#startDate').val());
		//alert(jQuery('#endDate').val());
		
		$.ajax({
  		  url:'dateSearch',
  		  type:'POST',
  		  dataType:'json',
  		data : {startDate : startDate,
  				endDate : endDate},
  		  error:function(status,msg){
  			  alert(status+"메세지"+msg);
  		  },
  		  success:warehousingListResult
  	  });
	}
    </script>
    <div id="chart_div" style="width: 900px; height: 500px;" ></div>
	<div align="center" id="test_dataview"></div><br>
	     <div class="btn-group">
		<input type="button" value="입고 통계" class="btn btn-primary" id="btnEnterd" onclick="enteredList()">
		<input type="button" value="출고 통계" class="btn btn-primary" id="btnReleased" onclick="releasedList()">
		<input type="button" value="전체 통계" class="btn btn-primary" id="btnwarehousing" onclick="warehousingList()">
	</div>
	<hr>
	<div class="btn-group">
		<input type="date" class="btn btn-primary" id="startDate" name="startDate">
		<input type="date" class="btn btn-primary" id="endDate" name="endDate">
		<input type="button" value="검색" class="btn btn-primary" id="btnSearch" onclick="dateSearch()">
	</div>
		
</div>
	<br>
	<hr>
	
<div class="container">
	<table class="table text-center">
		<thead></thead>
		<tbody></tbody>
	</table>

</div>
</body>
</html>