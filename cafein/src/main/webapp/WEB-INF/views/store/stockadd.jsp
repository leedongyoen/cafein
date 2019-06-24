<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>재고 추가</title>
</head>
<body>

<h1 align="center">재고 추가</h1>
<div class = "container">
<div align ="left">
카테고리  &nbsp;&nbsp;<select name="category">
  <option value="카테고리"  selected="selected">카테고리</option>
  <option value="카테고리a">카테고리A</option>
  <option value="카테고리b">카테고리B</option>
</select><br><br>
</div>

<table class = "table table-hover">

	<tr>
		<th>재고 명</th>
		<td><input type="text" ></td>
	</tr>
	<tr>
		<th>수량</th>
		<td><input type="text" ></td>
	</tr>
	<tr>
		<th>재고단가</th>
		<td><input type="text" ></td>
	</tr>

</table>
<div align ="right">
<button onclick="location='stock.jsp'">취소</button>
<button onclick="location='stock.jsp'">추가</button>
</div>
</div>
</body>
</html>