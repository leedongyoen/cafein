<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>재고 입출고 상세 내역</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>

<h1 align="center">입출고 상세 내역</h1>
<div class = "container">
    <script type="text/javascript">
    
	$(function(){
		 loginCheck();
		dateSearch();
		
		 // 입출고상세내역 검색
	    $("#wareserch").on("keyup", function() {
	     var value = $(this).val().toLowerCase();
	     $("tbody tr").filter(function() {
	        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	   		});
		});
	});
	
		
      //재고 입/출고 리스트 요청
      function warehousingList(){
    	  $.ajax({
    		  url:'getWarehousing',
    		  type:'POST',
    		  dataType:'json',
    		  error:function(status,msg){
    			  alert(status+"메세지"+msg);
    		  },
    		  success:warehousingListResult
    	  });
    	}
    
     //재고 입/출고 리스트 요청
  	function dateSearch(){    	  													
  		var startDate = jQuery('#startDate').val();
  		var endDate = jQuery('#endDate').val();
  		var sId = "<%= (String)session.getAttribute("sId") %>";	
  		if(startDate != "" && endDate != ""){
  			alert("기간검색이 되었습니다.");
  		}
  		
  		$.ajax({
    		  url:'getWarehousing',
    		  type:'POST',
    		  dataType:'json',
    		data : {startDate : startDate,
    				endDate : endDate,
    				sId : sId
    				},
    		  error:function(status,msg){
    			  alert(status+"메세지"+msg);
    		  },
    		  success:warehousingListResult
    	  });
	}
		
      //입출고 리스트 뿌리기
      function warehousingListResult(data){
    	  var wDate;
    	  if($('#endDate').val() =='' || $('#startDate').val()==''){
				$("#divDate").html('최근 7일');
				}else{
				$('#divDate').html($('#startDate').val()+' ~ '+$('#endDate').val());
				}
    	  
    	  $("thead").empty();
    	  $("tbody").empty();
    	  $('<tr>')
    	 		.append($('<th>').html('날짜'))
    			.append($('<th>').html('재고 명'))
    			.append($('<th>').html('총 가격'))
    			.append($('<th>').html('총 수량'))
//     			.append($('<th>').html('재고 손실'))
    			.appendTo('thead');
    	  $.each(data, function(idx,item){
				wDate = new Date(item.wareDate);
    		  $('<tr>')
    		  	.append($('<td>').html(wDate.toLocaleDateString('ko-KR')))
    		  	.append($('<td>').html(item.stName))
    		  	.append($('<td>').html(item.warePrice))
    		  	.append($('<td>').html(item.wareQty))
//     		  	.append($('<td>').html(item.stLoss))
    		  	.appendTo('tbody');
    	  });
      }
      
//       style="width: 700px; height: 400px;" 
    </script>
	    
	<hr>
	<div class="btn-group">
		<input type="date" class="btn btn-secondary" id="startDate" name="startDate">&nbsp;
		<input type="date" class="btn btn-secondary" id="endDate" name="endDate">&nbsp;
		<input type="button" value="검색" class="btn btn-success" id="btnSearch" onclick="dateSearch()">
		
	</div>
	<div>
		<input class="form-control" id="wareserch" type="text" placeholder="Search..">
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