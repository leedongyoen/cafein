<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 영업 준비금</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>

function addlist(){
	console.log('in');
	var i = 0;
	var stName = $('#stName').val();
	var wareQty = $('#wareQty').val();
	var warePrice = $('#warePrice').val();
	var stPayMethod = $('#stPayMethod').val();
	
	sum = Number(wareQty) * Number(warePrice);
	console.log(sum);
	
	$('<tr>')
	.append($('<td>').html(listnum+1))
	.append($('<td>').html(stName))
	.append($('<td>').html(wareQty))
	.append($('<td>').html(warePrice))
	.append($('<td>').html(sum))
	.append($('<td>').html(stPayMethod))
	.appendTo('#operatingreservTable tbody');
	
	
	$('#totalSum').text = $('#totalSum').text + sum;
}
</script>
</head>
<body>
<h3 align = "center">매장 영업 준비금</h3><br>
<div class="container">
	<div class="row">
		<div class="col-12" style="height:350px;width:550px;overflow:auto;">
			<table class="table table-striped" id = "operatingreservTable">
				<thead>
				<tr>
					<th>순번</th>
					<th>항목</th>
					<th>수량</th>
					<th>단가</th>
					<th>지출액</th>
					<th>결제방식</th>
				</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
				</tfoot>
			</table>
		</div>
		<div style="margin:auto;">
			<table>
				<tr>
					<th>항목</th>
				</tr>
				<tr>
					<td><input type="text" id="stName"></td>
				</tr>
				<tr>
					<th>수량</th>
				</tr>
				<tr>
					<td><input type="text" id="wareQty"></td>
				</tr>
				<tr>
					<th>단가</th>
				</tr>
				<tr>
					<td><input type="text" id="warePrice"></td>
				</tr>
				<tr>
					<th>결제방식</th>
				</tr>
				<tr>
					<td>
						<select id="stPayMethod">
							<option id="card" selected>카드
							<option id="cash">현금
						</select>
					</td>
				</tr>
			</table>
			<button id="addbtn" onclick="addlist()">추가</button>
			<button id="backbtn">취소</button>
			<button id="savebtn">저장</button>
		</div>
	</div>
</div>
</body>
</html>