<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="storehead.jsp" %>
</head>
<body>
<div class = "container">
	<h3 align="center">레시피 상세 조회</h3>
	<hr>	
</div>
<div class = "container" align="center">
<table class = "table">


<tr>
	<th>재료명</th>
	<th>소모량</th>
	<th>재료 적정수량</th>
	<th>기준 단위</th>
</tr>

<tbody>

	<td>원두</td>
	<td>0.015</td>
	<td>0.015</td>
	<td>1</td>
</tr>
</tbody>
</table>
<hr>
<a class="btn btn-default pull-right"  href="recipeUpdate.jsp">수정</a>
<a class="btn btn-default pull-right"  href="recipeInquiry.jsp">돌아가기</a>
</div>
<div class = "text-center">
	<ul class="pagination"><!-- 페이지 처리하는 부분 -->
		<li><a href="%">1</a></li>
		<li><a href="%">2</a></li>
		<li><a href="%">3</a></li>
		<li><a href="%">4</a></li>
		<li><a href="%">5</a></li>
	</ul>
</div>
</body>
</html>