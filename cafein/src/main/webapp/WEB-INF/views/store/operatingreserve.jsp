<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 영업 준비금</title>
</head>
<body>
<h3 align = "center">매장 영업 준비금</h3><br>
<div class="container">
	<div class="row">
		<div class="col-11" style="height:350px;width:550px;overflow:auto;">
			<table class="table table-striped">
				<tr>
					<th>순번</th>
					<th>항목</th>
					<th>수량</th>
					<th>단가</th>
					<th>지출액</th>
					<th>결제방식</th>
				</tr>
				<tr>
					<td>1</td>
					<td>원두</td>
					<td>3</td>
					<td>10,000원</td>
					<td>30,000원</td>
					<td>카드</td>
				</tr>
				<tr>
					<td>2</td>
					<td>우유</td>
					<td>15</td>
					<td>2,500원</td>
					<td>37,500원</td>
					<td>카드</td>
				</tr>
				<tr>
					<td>3</td>
					<td>망고소스</td>
					<td>2</td>
					<td>13,000원</td>
					<td>26,000원</td>
					<td>현금</td>
				</tr>
				<tr>
					<td>총금액</td>
					<td colspan="5" style="text-align:right;">93,500원</td>
				</tr>
			</table>
		</div>
		<div class="col-11">
			<table>
				<tr>
					<th>항목</th>
				</tr>
				<tr>
					<td><input type="text" id="name"></td>
				</tr>
				<tr>
					<th>수량</th>
				</tr>
				<tr>
					<td><input type="text" id="qty"></td>
				</tr>
				<tr>
					<th>단가</th>
				</tr>
				<tr>
					<td><input type="text" id=""></td>
				</tr>
				<tr>
					<th>결제방식</th>
				</tr>
				<tr>
					<td>
						<select>
							<option id="card" selected>카드
							<option id="cash">현금
						</select>
					</td>
				</tr>
			</table>
			<button>추가</button>
			<button>취소</button>
			<button>저장</button>
		</div>
	</div>
</div>
</body>
</html>