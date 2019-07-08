<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Closing Page</title>
<%@ include file="storehead.jsp" %>
</head>
<body>
<h2 align = "center">하루 매출 정산</h2>

<h4 align = "center">지출</h4>
<div class = "container" align = "center">
<table class = "table table-hover">
	<tr><th>순번</th><th>항목</th><th>수량</th><th>지출액</th></tr>
	<tr><td>1</td><td>인건비</td><td>1</td><td>56000</td></tr>
	<tr><td>2</td><td>입고 재료(1)</td><td>30</td><td>70000</td></tr>
	<tr><td>3</td><td>입고 재료(2)</td><td>40</td><td>130000</td></tr>
	<tr><td></td><td></td><td></td><td><font color="red">2560000</font></td></tr>
</table>

</div>
<br><hr/><br>
<div class = "container" align = "center">
<h4 align = "center">추가 지출 내역</h4>
	<form action="#">
		항목	<input type="text"><br>
		지출액 <input type="text"><br>
		<input type="button" value=" + ">
		<br>
	</form>
	<span></span>
	<div>25600원</div>
</div>
<br><hr/><br>
<div class = "container" align = "center">
<h3 align = "center">결재 방식별 매출</h3>
<div align = "center">
<table class = "table table-hover">
	<tr><th>결제 방식</th><th>결제 금액</th></tr>
	<tr><td>카드</td><td>345000</td></tr>
	<tr><td>현금</td><td>279000</td></tr>
	<tr><td>적립 결제</td><td>35000</td></tr>
	<tr><td></td><td></td></tr>
</table>
</div>
<br>
총 매출 <input type="text" value="589000">
</div>

<br><br><hr/><br>
	<div align="center">
	
	<table border="1">
	<tr><th>현금</th><th>권수 </th></tr>
	<tr><td>5만원</td><td><input type="text"></td></tr>
	<tr><td>1만원</td><td><input type="text"></td></tr>
	<tr><td>5천원</td><td><input type="text"></td></tr>
	<tr><td>1천원</td><td><input type="text"></td></tr>
	<tr><td>동전</td><td><input type="text"></td></tr>
	</table>

<input type="button" value="정산">
</div>

<br><hr/><br>
<div align = "center">
	<p>현금 매출 279000</p>
	<p>보유 현금 277000</p>
	<p>차액 <font color="purple">2000</font></p>
	
	<button onclick = "location.href='stocktruthlist.do'">다음</button>
</div>
</body>
</html>