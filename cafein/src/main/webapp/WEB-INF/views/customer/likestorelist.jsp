<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Like Store List</title>
</head>
<body>
<h3 align="center">선호 매장 목록</h3>
<div class="container" align="center">
<table class ="table">
	<tr>
		<th>방문순위</th>
		<th>매장상호</th>
		<th>매장주소</th>
		<th>방문횟수</th>
	</tr>
	<tr>
		<th>1</th>
		<th>카페 린</th>
		<th>대구 중구 상서동 22-2 호당빌딩 </th>
		<th>21</th>
	</tr>
	<tr>
		<th>2</th>
		<th>카페 예시</th>
		<th>대구 중구 상서동 22-1 </th>
		<th>4</th>
	</tr>
</table>
<div style="text-align:right" >
<button onclick = "location.href='customermainform.do'">돌아가기</button>
</div>
</div>
</body>
</html>