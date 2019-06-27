<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>재고</title>

</head>
<body>

<h1 align="center">재고 입고</h1>
<div class = "container">
<div align ="left">
<select name="category">
  <option value="카테고리"  selected="selected">카테고리</option>
  <option value="카테고리a">카테고리A</option>
  <option value="카테고리b">카테고리B</option>
</select>
</div>
<div align="center">
<table class = "table table-hover">
<tr>
<th>입고 번호</th><th>재고 명</th><th>수 량</th><th>재고적정수량</th><th>재고 단가</th><th>유통 기한</th>
</tr>
<tr>
<td>WH001</td><td>원두</td><td><input type="text" value="50"></td><td>0.015</td><td><input type="text" value="10000"></td><td><input type="date" value="2019-08-15"></td>
</tr>
<tr>
<td>WH002</td><td>우유</td><td><input type="text" value="10"></td><td>0.25</td><td><input type="text" value="2500"></td><td><input type="date" value="2019-08-15"></td>
</tr>
<tr>
<td>WH003</td><td>두유</td><td><input type="text" value="10"></td><td>0.25</td><td><input type="text" value="3000"></td><td><input type="date" value="2019-08-15"></td>
</tr><tr>
<td>WH004</td><td>초코소스</td><td><input type="text" value="10"></td><td>0.01</td><td><input type="text" value="10000"></td><td><input type="date" value="2019-10-11"></td>
</tr><tr>
<td>WH005</td><td>카라멜소스</td><td><input type="text" value="10"></td><td>0.01</td><td><input type="text" value="10000"></td><td><input type="date" value="2019-10-11"></td>
</tr><tr>
<td>WH006</td><td>휘핑크림</td><td><input type="text" value="10"></td><td>0.2</td><td><input type="text" value="2000"></td><td><input type="date" value="2019-08-15"></td>
</tr><tr>
<td>WH007</td><td>레몬원액</td><td><input type="text" value="10"></td><td>0.05</td><td><input type="text" value="10000"></td><td><input type="date" value="2020-05-08"></td>
</tr><tr>
<td>WH008</td><td>자몽원액</td><td><input type="text" value="10"></td><td>0.05</td><td><input type="text" value="20000"></td><td><input type="date" value="2020-05-08"></td>
</tr><tr>
<td>WH009</td><td>딸기소스</td><td><input type="text" value="10"></td><td>0.05</td><td><input type="text" value="13000"></td><td><input type="date" value="2019-08-15"></td>
</tr><tr>
<td>WH010</td><td>망고소스</td><td><input type="text" value="10"></td><td>0.05</td><td><input type="text" value="13000"></td><td><input type="date" value="2019-08-15"></td>
</tr><tr>
<td>WH011</td><td>프레즐</td><td><input type="text" value="50"></td><td>1</td><td><input type="text" value="2000"></td><td><input type="date" value="2022-01-01"></td>
</tr><tr>
<td>WH012</td><td>베이글</td><td><input type="text" value="50"></td><td>1</td><td><input type="text" value="2000"></td><td><input type="date" value="2022-01-01"></td>
</tr><tr>
<td>WH013</td><td>치즈케익</td><td><input type="text" value="50"></td><td>1</td><td><input type="text" value="2000"></td><td><input type="date" value="2022-01-01"></td>
</tr><tr>
<td>WH014</td><td>초코케익</td><td><input type="text" value="50"></td><td>1</td><td><input type="text" value="2000"></td><td><input type="date" value="2022-01-01"></td>
</tr><tr>
<td>WH015</td><td>녹차파우더</td><td><input type="text" value="10"></td><td>0.1</td><td><input type="text" value="7000"></td><td><input type="date" value="2022-01-01"></td>
</tr><tr>
<td>WH016</td><td>홍차파우더</td><td><input type="text" value="10"></td><td>0.1</td><td><input type="text" value="7000"></td><td><input type="date" value="2022-01-01"></td>
</tr>


</table>
<br><br>
<div align ="right">
<button type="button">수정</button>&nbsp;
<button type="button">삭제</button>&nbsp;
<button onclick="location='stockadd.do'">추가</button>
</div>
</div>
</div>
</body>
</html>