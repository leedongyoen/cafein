<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>주문 목록</title>
</head>
<body>
	<h2 align = "center">주문 목록</h2>
	<br><br>
	<div class = "container">
		<p align="right"><b>등록순</b>
		<select name="선택">
			<optgroup>
			<option selected>일주일 이내</option>
				<option>1개월 이내</option>
				<option>3개월 이내</option>
				<option>6개월 이내</option>
			</optgroup></select></p>
		<hr>
		
		<table class = "table table-hover">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>메뉴명</th>
				<th>총 수량</th>
				<th>금액</th>
			</tr>
		</thead>

			<tr onclick = "location.href='orderdetails.jsp'">
				<td>OR0012019617</td>
				<td>아메리카노(ICE)<br>바닐라라떼(HOT)</td>
				<td>2</td>
				<td>9000원</td>
			</tr>

		</table>
		
			<hr>
			<br>
			<p align = "right"><button type ="button" onclick="location='cusMenu.jsp'">메뉴</button> &nbsp;
			<a href="javascript:history.go(-1)" class="btn btn-default ">돌아가기</a>
		</div>
	
</body>
</html>