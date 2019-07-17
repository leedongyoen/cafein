<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Like Store List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	$(function(){
	getLikeStoreList();
	
});
		var cId = '<%= session.getAttribute("cId") %>';
		
		function getLikeStoreList() {
			$.ajax({
				url : "getLikeStoreList.do",
				data : {cId : cId},
				type : "GET",
				datatype : "json",
				success : function(data) {
					console.log(data);
					$("#likestorelist tbody").empty();
					$.each(data,function(idx,item){
						$('<tr>')
						.append($('<td>').html(item.rank))
						.append($('<td>').html(item.sName))
						.append($('<td>').html(item.sAdd))
						.append($('<td>').html(item.cnt))
						.appendTo('#likestorelist tbody');
					});
				}
			})
		};
</script>
</head>
<body>
<h3 align="center">선호 매장 목록</h3>
<div class="container" align="center">
<table class ="table" id="likestorelist">
	<thead>
	<tr>
		<th>방문순위</th>
		<th>매장상호</th>
		<th>매장주소</th>
		<th>방문횟수</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<div style="text-align:right" >
<button onclick = "location.href='customermainform.do'">돌아가기</button>
</div>
</div>
</body>
</html>