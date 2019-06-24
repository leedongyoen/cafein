<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실수량 확인</title>
<%@ include file="storehead.jsp" %>
</head>
<body>
<h2 align = "center">실수량 확인</h2>

<div class = "container" align = "center">
<table class = "table table-hover">
<tr>
	<th>재고 명</th><th>수량</th><th>재고명</th><th>실 수량</th>
</tr>
<tr>
	<td>원두</td><td>2</td><td>원두</td><td><input type="text" value="2"></td>
</tr>
<tr>
	<td>우유</td><td>4</td><td>우유</td><td><input type="text" value="3"></td>
</tr>
<tr>
	<td>두유</td><td>4</td><td>두유</td><td><input type="text" value="3"></td>
</tr>
<tr>
	<td>초코소스</td><td>3</td><td>초코소스</td><td><input type="text" value="3"></td>
</tr>
<tr>
	<td>카라멜소스</td><td>3</td><td>카라멜소스</td><td><input type="text" value="3"></td>
</tr>
<tr>
	<td>휘핑 크림</td><td>10</td><td>휘핑 크림</td><td><input type="text" value="9"></td>
</tr>
<tr>
	<td>레몬원액</td><td>2</td><td>레몬원액</td><td><input type="text" value="2"></td>
</tr>
<tr>
	<td>자몽원액</td><td>2</td><td>자몽원액</td><td><input type="text" value="2"></td>
</tr>
<tr>
	<td>딸기소스</td><td>4</td><td>딸기소스</td><td><input type="text" value="4"></td>
</tr>
<tr>
	<td>망고소스</td><td>4</td><td>망고소스</td><td><input type="text" value="4"></td>
</tr>
<tr>
	<td>프레즐</td><td>10</td><td>프레즐</td><td><input type="text" value="10"></td>
</tr>
<tr>
	<td>베이글</td><td>12</td><td>베이글</td><td><input type="text" value="11"></td>
</tr>
<tr>
	<td>치즈케익</td><td>8</td><td>치즈케익</td><td><input type="text" value="8"></td>
</tr>
<tr>
	<td>초코케익</td><td>5</td><td>초코케익</td><td><input type="text" value="4"></td>
</tr>
<tr>
	<td>녹차파우더</td><td>2</td><td>녹차파우더</td><td><input type="text" value="2"></td>
</tr>
<tr>
	<td>홍차파우더</td><td>2</td><td>홍차파우더</td><td><input type="text" value="2"></td>
</tr>
</table>
</div>
<div class = "container" align = "right">

<a class="btn btn-default pull-right"  href="storemain.jsp">다음</a>
<a class="btn btn-default pull-right"  href="javascript:history.go(-1)">이전</a>
</div>
</body>
</html>