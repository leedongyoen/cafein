<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>매장별 적립금</title>
</head>
<body>
	<h2 align="center">나의 적립금 현황</h2>
	<hr>
	 <p align="center"><b>쭈호야 회원님의 적립금은</b></p>
	<div class = "container" align="center" >
	 <table class = "table" >
			<tr>
				<th>총 적립금</th>
				<td>1.500 point</td>
				<th>사용된 적립금</th>
				<td>500 point</td>
			</tr>
			<tr>
				<th>사용가능한 적립금</th>
				<td>1.000 point</td>
				<th>보유한 적립금</th>
				<td>1.000 point</td>
			</tr>
		</table>
		</div>
	<hr><br>
	<div class = "container" align="center">
		<table class = "table">
			<tr>
				<th width=250>날짜</th>
				<th width=250>매장 ID</th>
				<th width=250>매장명</th>
				<th width=250>마일리지</th>
			</tr> 
			<tr>
				<td>2019-06-20</td>
				<td>SH001</td>
				<td>CAFE Lyn</td>
				<td>-500 point</td>
			</tr>
			<tr>
				<td>2019-06-19</td>
				<td>SH001</td>
				<td>CAFE Lyn</td>
				<td>300 point</td>
			</tr>
			<tr>
				<td>2019-06-18</td>
				<td>SH002</td>
				<td>BROCOLLI cafe</td>
				<td>500 point</td>
			</tr>
			<tr>
				<td>2019-06-17</td>
				<td>SH001</td>
				<td>CAFE Lyn</td>
				<td>200 point</td>
			</tr>
			<tr>
				<td>2019-06-16</td>
				<td>SH001</td>
				<td>CAFE Lyn</td>
				<td>300 point</td>
			</tr>
			<tr>
				<td>2019-06-16</td>
				<td>SH002</td>
				<td>BROCOLLI cafe</td>
				<td>200 point</td>
			</tr>
		</table>
	</div>
	<button onclick = "location.href='customerMainForm.do'">돌아가기</button>
</body>
</html>