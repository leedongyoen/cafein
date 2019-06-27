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

<h1 align="center">재고 리스트</h1>
<div class = "container">
<div align ="left">
<select name="category">
  <option value="카테고리"  selected="selected">카테고리</option>
  <option value="카테고리a">카테고리A</option>
  <option value="카테고리b">카테고리B</option>
</select>
</div>
<table class = "table table-hover">
<tr>
<th>재고 번호</th><th>재고 명</th><th>수 량</th><th>재고적정수량</th><th>재고 단가</th>
</tr>
<tr>
<td>ST001</td><td>원두</td><td>50</td><td>0.015</td><td>10000</td>
</tr>
<tr>
<td>ST002</td><td>우유</td><td>10</td><td>0.25</td><td>2500</td>
</tr>
<tr>
<td>ST003</td><td>두유</td><td>10</td><td>0.25</td><td>3000</td>
</tr><tr>
<td>ST004</td><td>초코소스</td><td>10</td><td>0.01</td><td>10000</td>
</tr><tr>
<td>ST005</td><td>카라멜소스</td><td>10</td><td>0.01</td><td>10000</td>
</tr><tr>
<td>ST006</td><td>휘핑크림</td><td>10</td><td>0.2</td><td>2000</td>
</tr><tr>
<td>ST007</td><td>레몬원액</td><td>10</td><td>0.05</td><td>10000</td>
</tr><tr>
<td>ST008</td><td>자몽원액</td><td>10</td><td>0.05</td><td>20000</td>
</tr><tr>
<td>ST009</td><td>딸기소스</td><td>10</td><td>0.05</td><td>13000</td>
</tr><tr>
<td>ST0010</td><td>망고소스</td><td>10</td><td>0.05</td><td>13000</td>
</tr><tr>
<td>ST0011</td><td>프레즐</td><td>50</td><td>1</td><td>2000</td>
</tr><tr>
<td>ST0012</td><td>베이글</td><td>50</td><td>1</td><td>2000</td>
</tr><tr>
<td>ST0013</td><td>치즈케익</td><td>50</td><td>1</td><td>2000</td>
</tr><tr>
<td>ST0014</td><td>초코케익</td><td>50</td><td>1</td><td>2000</td>
</tr><tr>
<td>ST0015</td><td>녹차파우더</td><td>10</td><td>0.1</td><td>7000</td>
</tr><tr>
<td>ST0016</td><td>홍차파우더</td><td>10</td><td>0.1</td><td>7000</td>
</tr>


</table>
<br><br>
<div align="center">
<button type="button">수정</button>&nbsp;
<button type="button">삭제</button>&nbsp;
<button onclick="location='stockadd.do'">추가</button>
</div>
</div>
</body>
</html>