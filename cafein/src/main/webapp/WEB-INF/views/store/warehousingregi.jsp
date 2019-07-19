<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>재고</title>
<script>
$(function() {
	stockList();
});

//입고할 목록 요청하기
function stockList() {
	$.ajax({
		url : 'stocks',
		type : 'GET',
		contentType : 'application/json;charset=utf-8',
		dataType : 'json',
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : stockListResult
	});
}//stockList

//입고할 목록 받아오기
function stockListResult(data) {
	
	console.log(data);
	$("#stockTbody").empty();
	$.each(data, function(idx, item) {
						$('<tr>').append($('<td>').html(item.stName))
								.append($('<td>').html(item.stPrice))
								.append($('<td>').html(item.stQty))
								.append($('<td>').html('<input type=\'text\' id=\'enterQty\' value=\''+item.stQty
										+'\' class=\'form-control\'>'))
								.append($('<input type=\'hidden\' id=\'hidden_stNum\'>')
								.val(item.stNum)).appendTo('#stockTbody');
					});
}
</script>
</head>
<body>
<div class="container">
		<h2>재고 목록</h2>
		<!-- 	<form action="deleteStock.do"> -->
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">재고 명</th>
					<th class="text-center">재고 단가</th>
					<th class="text-center">재고 수량</th>
					<th class="text-center">입고 수량</th>
				</tr>
			</thead>
			<tbody id="stockTbody"></tbody>

		</table>
		<div class="btn-group" style="float:right;">
			<button type="button" class="btn btn-primary" onclick="location.href='stocklist.do'">재고 변경</button>
			<button type="button" class="btn btn-success" id="enterStock">입고 등록</button>
		</div>
	</div>

</body>
</html>