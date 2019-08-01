<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Closing Details Page</title>
<script>

	var sId = "<%= (String)session.getAttribute("sId") %>";	
	//var storeOpenTime, storeCloseTime;
	var len;		
	
	$(function(){
		// PDF 볼 수 있는 이벤트
		$('#storeList').on('click','.pdfbtn',function(){
			var opentime = $(this).parent().prev().find('span').eq(0).text();
			var closetime = $(this).parent().prev().find('span').eq(1).text();
			console.log('opentime : ' + opentime + ', closetime : ' + closetime)
			window.open('report.do?openTime='+opentime+'&closeTime='+closetime);
		});
		
		
		// 데이터 요청
		$.ajax({
			url:"closedetailslist",
			type:'GET',			
			data:{sId:sId},
			dataType:'json',
			error:function(xhr,status,msg){
				alert('통신 실패');
				console.log("상태값 :" + status + ", Http에러메시지 :"+msg)
			},
			success:function(data){
				//len = data.length;
				$.each(data,function(idx,item){	
					//$('#storeList tbody').empty();
					if(item.openTime != null && item.closeTime != null) {
						$('<tr>')
						.append($('<th class="thcolor">').html("<span>"+item.openTime + '</span> ~ <span>' + item.closeTime+"</span>"))
						.append($('<th class="thcolor">').append($('<input>').attr({
							type:'button',
							value:'PDF 보기',
							class:'btn btn-outline-info'
						}).addClass('pdfbtn')))
						.appendTo('#storeList tbody');
					}
					
					
				});
				len = data.length;
			}
		});
		
	});
	
	
	// 날짜 검색
	function searchDate(){
		var startDate = jQuery('#startdate').val();
  		var endDate = jQuery('#enddate').val();
  		
  		
  		if(startDate > endDate){
  			alert('검색 날짜를 확인해주세요.');
  			return;
  		}else if(startDate == '' || endDate == ''){
  			alert('날짜를 입력해주세요.');
  			return;
  		}
  		console.log("startDate : "+ startDate);
  		console.log("endDate : "+ endDate);
  		
		
		$.ajax({
			url: 'closedetailslist',
			type:'GET',
			data: {sId: sId, startDate: startDate, endDate: endDate},
			dataType:'json',
			//async: false,		// 비동기식 으로 설정
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				
				$('#storeList tbody').empty();
				$.each(data,function(idx,item){	
					//$('#storeList tbody').empty();
					if(item.openTime != null && item.closeTime != null) {
						$('<tr>')
						.append($('<th class="thcolor">').html("<span>"+item.openTime + '</span> ~ <span>' + item.closeTime+"</span>"))
						.append($('<th class="thcolor">').append($('<input>').attr({
							type:'button',
							value:'PDF 보기',
							class:'btn btn-outline-info'
						}).addClass('pdfbtn')))
						.appendTo('#storeList tbody');
					}
					
					len = len - 1;
				});
			}
		});
  		
	}
	
</script>
</head>
<body>
<br><br>
<style>
@media (min-width: 768px) {
  .container {
    width: 750px;
  }
}

@media (min-width: 992px) {
  .container {
    width: 940px;
  }
}


table tbody th{
	text-align: center;
}
.thcolor {
	background-color:white;
	color:black;
}
</style>

<div class = "container" align="center">
	<h3><%= session.getAttribute("sName") %> 마감 내역</h3><hr>

	<input type="date" class="btn btn-secondary" name="startdate" id="startdate">~
    <input type="date" class="btn btn-secondary" name="enddate" id="enddate">
    <input type="button" class="btn btn-success" onclick="searchDate()" value="조회"><br><br>
	
	<table class="table table-hover" id="storeList">
		<thead>
		<tr>
			<th style="text-align: center;" class="col-md-8">날짜</th>
			<th class="col-md-4">PDF 보기</th>
		</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
</body>
</html>