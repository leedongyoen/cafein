<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="storehead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>입/출고 목록</title>
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./js/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		wareList();

	});
	function wareList() {
		$.ajax({
			url : 'warehousing',
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : wareListResult
		});
	}

	//입고 목록 조회 응답
	function wareListResult(data) {
		console.log(data);
		$("tbody").empty();
		$.each(
				data,
				function(idx, item) {
					$('<tr>').append($('<td>').html(item.wareNum))
							.append($('<td>').html(item.wareDate))
							.append($('<td>').html(item.wareQty))
							.append($('<td>').html(item.warePrice))
							.append($('<td>').html(item.stNum))
							.append($('<td>').html(item.sId))
							.append($('<td>').html(item.stPayMethod)).appendTo('tbody');
							
							});
				}
</script>
</head>
<body>
	<div class="container">
	<h1>입출고 리스트</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>입출고 번호</th><th>입출고 날짜</th><th>입출고 수량</th><th>입출고 가격</th><th>재고 번호</th><th>매장 명</th><th>결제 방식</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</body>
</html>