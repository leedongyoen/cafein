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
<div class = "container" align = "center">
	<h2 align="center">주문 조회</h2>
	<hr>	
</div>
<div class = "container" align = "center">

<form id="" action="">
    
    <div align="right">
        날짜 입력:
    <input type="date" id="userdate" name="userdate"
                value="">~
    <input type="date" id="userdate" name="userdate"
                value="">
    <input type="submit" value="조회">
    </div>
	
</form>


<form action="">

<table class = "table table-hover">

<thead>
	<tr>
		<th>주문번호</th>
		<th>고  객</th>
		<th>주문 메뉴</th>
		<th>총 금액</th>
		<th>수령 방식</th>
		<th>배달번호</th>
		<th>배달위치</th>
		<th>배달상태</th>
		<th>요청사항</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>OR190613005</td>
		<td>장준혁</td>
		<td>카페모카(15) 아이스 카페모카(15)</td>
		<td>153,000원</td>
		<td>배달</td>
		<td>DEOR190613005</td>
		<td> 대구시 중구</td>
		<td>배달 준비</td>
		<td>빨리 와주세요</td>
						
	</tr>
		<tr>
		<td>OR190613004</td>
		<td>김혜민</td>
		<td>카페모카(1)</td>
		<td>5100원</td>
		<td>직접수령</td>
		<td> - </td>
		<td> - </td>
		<td>- </td>
		<td> - </td>
						
	</tr>
		<tr>
		<td>OR1906130007</td>
		<td>이동연</td>
		<td>에스프레소(4),카페모카(6),아이스 아메리카노(2), 아이스 카페라떼(2)</td>
		<td>66,500원</td>
		<td>직접수령</td>
		<td> - </td>
		<td> - </td>
		<td>- </td>
		<td> - </td>
						
	</tr>
</tbody>
</table>

</form>

</div>
</body>
</html>