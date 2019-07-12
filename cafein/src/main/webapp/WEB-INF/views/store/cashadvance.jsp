<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마감 시재 정산</title>
<script>
	console.log('operatingreserveSum (cashadvance.jsp) : ' +operatingreserveSum)
	$('#orSum').text(addCommas(operatingreserveSum)+'원');
</script>
</head>
<body>
<h3 align = "center">마감 시재 정산</h3><br>
<div class="container">
	<div class="row">
		<div class="col-11" style="height:350px;width:550px;overflow:auto;">
			<table class="table table-striped">
				<tr>
					<th>기본 준비금</th>
					<td><p id="defaultCash">50,000원</p></td>
				</tr>
				<tr>
					<th>영업 준비금(현금 결제건)</th>
					<td><p id="orSum"></p></td>
				</tr>
				<tr>
					<th>현금 매출</th>
					<td><p id="cashSales"></p></td>
				</tr>
				<tr>
					<th>현금 결제 시 사용된 포인트</th>
					<td><p id="usedMileage"></p></td>
				</tr>
			</table>
		</div>
		<hr>
		<div class="col-6">
			<table>
				<tr>
					<th>5만원 </th>
					<td><input type="text" id="" style="width:50px"></td>
					<td><input type="text" id=""></td>
				</tr>
				<tr>
					<th>1만원 </th>
					<td><input type="text" id="" style="width:50px"></td>
					<td><input type="text" id=""></td>
				</tr>
				<tr>
					<th>5천원 </th>
					<td><input type="text" id="" style="width:50px"></td>
					<td><input type="text" id=""></td>
				</tr>
				<tr>
					<th>1천원 </th>
					<td><input type="text" id="" style="width:50px"></td>
					<td><input type="text" id=""></td>
				</tr>
				<tr>
					<th>5백원 </th>
					<td><input type="text" id="" style="width:50px"></td>
					<td><input type="text" id=""></td>
				</tr>
				<tr>
					<th>1백원 </th>
					<td><input type="text" id="" style="width:50px"></td>
					<td><input type="text" id=""></td>
				</tr>
			</table>
		</div>
		<div class="col-6">
			<table>
				<tr>
					<th>총 현금 매출액</th>
					<td><p id="totalCashSales"></p></td>
				</tr>
				<tr>
					<th>총 현금 시재</th>
					<td><p id="totalCash"></p></td>
				</tr>
				<tr>
					<th>차액</th>
					<td><p id="difference"></p></td>
				</tr>
			</table>
		</div>
	</div>
</div>

<button>시재등록</button>
<button>취소</button>
<button>저장</button>
<button>시재 재등록</button>
</body>
</html>