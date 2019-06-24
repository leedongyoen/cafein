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
	<form action="#">
		<select align="right">
			<option>
				커피
			</option>
			<option>
				음료
			</option>
			<option>
				디저트
			</option>
		</select>
	</form>
</div>
<div class = "container">
	<h2 align="center">메뉴 조회</h2>
	<hr>	
</div>
<div class = "container">
<table class = "table table-hover">

<thead>
<tr>
	<th>No.</th>
	<th>메뉴명</th>
	<th>판매 상태</th>
	<th>메뉴 가격</th>
	<th>카테고리</th>
	<th>메뉴 상태</th>
	<th>삭제 체크</th>
	
</tr>
</thead>
<tbody>
<form action="#">
<tr>
	<td>1</td>
	<td><a href="menuInquiryDetail.jsp">아메리카노</a></td>
	<td>Y</td>
	<td>5000</td>
	<td>커피</td>
	<td>사용 가능</td>
	<td><input type="checkbox"></td>
</tr>
</form>
</tbody>
</table>
<hr>
<a class="btn btn-default pull-right"  href="menuRegi.jsp">추가</a>
<a class="btn btn-default pull-right"  href="#">삭제</a>
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