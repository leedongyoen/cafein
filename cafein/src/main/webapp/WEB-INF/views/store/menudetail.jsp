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
<div class = "container">
	<h2 align="center">메뉴 상세 조회</h2>
	<hr>	
</div>

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

<a class="btn btn-default pull-right"  href="javascript:history.go(-1)">돌아가기</a>
<a class="btn btn-default pull-right"  href="menuUpdate.jsp">수정</a>
<a class="btn btn-default pull-right"  href="recipeInquiry.jsp">레시피 조회</a>

</div>
</body>
</html>