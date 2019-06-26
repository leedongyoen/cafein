<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Like Menu List</title>
</head>
<body>
<h3 align="center">선호 메뉴 목록</h3>
<div class="container" align="center">
<table class ="table">
	<tr onclick = "location.href='Order.jsp'">
		<th>주문순위</th>
		<th>메뉴명</th>
		<th>매장상호</th>
		<th>주문횟수</th>
	</tr>
	<tr onclick = "location.href='Order.jsp'">
		<th>1</th>
		<th>아메리카노</th>
		<th>카페 린</th>
		<th>21</th>
	</tr>
	<tr onclick = "location.href='Order.jsp'">
		<th>2</th>
		<th>바닐라라떼</th>
		<th>카페 예시</th>
		<th>4</th>
	</tr>
	<tr onclick = "location.href='Order.jsp'">
		<th>3</th>
		<th>자몽에이드</th>
		<th>카페 린</th>
		<th>2</th>
	</tr>
</table>
<div style="text-align:right" >
<button onclick = "location.href='customerMainForm.do'">돌아가기</button>
</div>
</div>
</body>
</html>