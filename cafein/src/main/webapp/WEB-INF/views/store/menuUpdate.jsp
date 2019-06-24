<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Insert title here</title>
</head>
<body>
<h1 align="center">매장메뉴 수정</h1>
<hr>
<div class = "container" align = "center">

<form action="">

<table class = "table table-hover">


	<tr><th>메뉴 번호</th><td>ME006</td></tr>
	<tr><th>메뉴 이름</th><td>카페 모카</td></tr>
	<tr><th>메뉴 가격(원)</th><td>5000</td></tr>
	<tr><th>카테고리</th><td>커피</td></tr>
	<tr><th>판매 상태</th><td><input type="radio" name="menusale" value="Y" checked>Y <input type="radio" name="menusale" value="N">N</td></tr>
	

</table>

</form>

<div align ="right">
<button class="btn btn-default pull-right" onclick="#">수정</button>
<a class="btn btn-default pull-right"  href="javascript:history.go(-1)">돌아가기</a>
</div>
</div>
</body>
</html>