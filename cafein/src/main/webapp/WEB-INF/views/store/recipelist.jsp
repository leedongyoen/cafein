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
	<h2 align="center">레시피 조회</h2>
	<hr>	
</div>
<div class = "container">
<table class = "table table-hover">

<thead>
<tr>
	<th>No.</th>
	<th>메뉴 번호</th>
	<th>메뉴 이름</th>

</tr>
</thead>
<tbody>
<form action="#">
<tr onclick= "location.href='recipedetail.do'">
	<td>1</td>
	<td>ME001</td>
	<td>아메리카노</td>
</tr>
</form>
</tbody>
</table>
<hr>
<a class="btn btn-default pull-right"  href="reciperegi.do">등록</a>
<a class="btn btn-default pull-right"  href="javascript:history.go(-1)">돌아가기</a>
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