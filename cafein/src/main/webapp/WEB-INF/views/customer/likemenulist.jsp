<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Like Menu List</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		getLikeMenuList();
		
	});
	
	var cId = '<%= session.getAttribute("cId") %>';
	
	function getLikeMenuList() {
		$.ajax({
			url : "getLikeMenuList.do",
			data : {cId : cId},
			type : "GET",
			datatype : "json",
			success : function(data) {
				console.log(data);
				$("#likemenulist tbody").empty();
				$.each(data,function(idx,item){
					$('<tr>')
					.append($('<td>').html(item.rank))
					.append($('<td>').html(item.mName))
					.append($('<td>').html(item.sName))
					.append($('<td>').html(item.cnt))
					.appendTo('#likemenulist tbody');
				});
			}
		})
	};
	
</script>
</head>
<body>
<h3 align="center">선호 메뉴 목록</h3>
<div class="container" align="center">
<table class = "table table-hover" id="likemenulist">
	<thead>
		<tr onclick = "location.href='Order.jsp'">
			<th>주문순위</th>
			<th>메뉴명</th>
			<th>매장상호</th>
			<th>주문횟수</th>
		</tr>
	</thead>
		<tbody>
		</tbody>
</table>
<div style="text-align:right" >
<p align="center">
<button onclick = "location.href='customermainform.do'" class="btn btn-success">돌아가기</button></p>
</div>
</div>
</body>
</html>