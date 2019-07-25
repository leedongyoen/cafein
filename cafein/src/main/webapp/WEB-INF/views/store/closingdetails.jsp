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
	var storeTime = new Array(), storeTimeList = new Array(), len;		// 매장의 오픈/마감 시간을 담을 list, list를 담을 배열
	
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
				len = data.length;
				$.each(data,function(idx,item){	
					//$('#storeList tbody').empty();
					if(item.openTime != null && item.closeTime != null) {
						$('<tr>')
						.append($('<th>').html(len))
						.append($('<th>').html("<span>"+item.openTime + '</span> ~ <span>' + item.closeTime+"</span>"))
						.append($('<th>').append($('<input>').attr({
							type:'button',
							value:'PDF 보기'
						}).addClass('pdfbtn')))
						.appendTo('#storeList tbody');
					}
					
					storeTime = {
							openTime:item.openTime,
							closeTime:item.closeTime
					}
					storeTimeList.push(storeTime);
					len = len - 1;
				});
				
				console.log(data)
				console.log('storeTimeList : ' + JSON.stringify(storeTimeList))
			}
		});
		
	});
</script>
</head>
<body>
<br><br>
<div class = "container" align="center">
	<h3><%= session.getAttribute("sName") %> 마감 내역</h3><br><br>
	<table class="table table-hover" id="storeList">
		<thead>
		<tr>
			<th>순번</th>
			<th>날짜</th>
			<th>PDF 보기</th>
		</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>
</body>
</html>