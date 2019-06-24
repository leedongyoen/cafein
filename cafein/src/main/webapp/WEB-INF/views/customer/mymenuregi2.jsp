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
		<h1 align="center">나만의메뉴 등록</h1>
		<table class = "table table-hover">
		<tr>
			<th>매 장 명</th>
			<td>(매장명)</td>
		</tr>
		<tr>
			<th>메 뉴 명</th>
			<td>(상품명)</td>
		</tr>
		<tr>
			<th>가 격</th>
			<td>(가격)</td>
		</tr>
		<tr>
			<th>HOT/ICE</th>
			<td><input type="radio" name="type" value="hot" id="hot" checked> 
				<label for="hot">HOT</label> 
				<input type="radio" name="type" value="ice" id="ice"> <label for="ice">ICE</label>
			</td>
		</tr>
		<tr>
			<th>옵  션</th>
			<td>
			<input type="checkbox" name="option" value="whipping" /> <label for="whipping">휘핑크림 추가(+500원)</label><br>
			<input type="checkbox" name="option" value="shot" />	 <label for="shot">1샷 추가(+500원)</label><br>
			<input type="checkbox" name="option" value="syrup" /> <label for="syrup">시럽 추가(+0원)</label>
			</td>
		</tr>
		<tr>
			<th>총 금 액</th>
			<td>(총금액값)</td>
		</tr>
	</table>
	<br>
	<div align ="right">
	<button onclick="location='myMenu.jsp'">등록</button>&nbsp;&nbsp;
	<a href="javascript:history.go(-1)">돌아가기</a>
	</div>
	</div>
	

</body>
</html>