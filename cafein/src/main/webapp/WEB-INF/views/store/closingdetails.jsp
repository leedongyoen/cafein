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
	var storeOpenTime, storeCloseTime;
	
	$(function() {
		$.ajax({
			url:"storeopen",		// request 보낼 서버경로
			type:'GET',			
			data:{sId:sId},				// 보낼 데이터 (매장id 보내야함)
			dataType:'json',
			error:function(){
				alert('통신 실패');
			},
			success:function(jsonData){
				
				storeOpenTime = jsonData.openTime;
				storeCloseTime= jsonData.closeTime;
				
				console.log('매장 오픈시간 : ' + storeOpenTime + ', 마감시간 : ' + storeCloseTime);
				
			}
		});
	});
</script>
</head>
<body>
<br><br>
<div class = "container" align="center">
	<h3><%= session.getAttribute("sName") %> 마감 내역</h3><br><br>
	<table class="table table-hover">
		<tr>
			<th>날짜</th>
			<th>PDF 보기</th>
		</tr>
		<tbody>
			<tr>
				<th>2019/07/24 ~ 2019/07/24</th>
				<th><button>PDF</button></th>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>