<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>

<title>Insert title here</title>
</head>
<body>

<div class = "container">
<h3 align="center">현재 위치: 예담 직업 전문학교</h3>
<div align="center" >
<img src="../image/listonmap.png"  alt="My Image">
</div>
</div>
<br>
<div class = "container">
<table class = "table table-hover">
	<tr onclick= "location.href='cusMenu.jsp'"><th>매장 이름</th><th>매장 위치</th><th>예상 거리</th></tr>
	<tr onclick= "location.href='cusMenu.jsp'" ><td>카페 린</td><td>대구 중구 상서동 22-2 호당빌딩 5층</td><td>30m</td></tr>
	<tr onclick= "location.href='cusMenu.jsp'"><td>카페 예시2</td><td>대구 중구 상서동 22-1 </td><td>50m</td></tr>

</table>
</div>


</body>
</html>