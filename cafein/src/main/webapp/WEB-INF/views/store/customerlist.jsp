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
	<h2 align="center">우리 매장 고객 조회</h2>
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
		<th>고객ID</th>
		<th>닉네임</th>
		<th>이름</th>
		<th>연락처</th>
		<th>마일리지</th>
		
	</tr>
</thead>
<tbody>
	<tr>
	<td>jang123</td>
	<td>sajangnim</td>
	<td>장준혁</td>
	<td>010-1111-2222</td>
	<td>5500</td>					
	</tr>
	<tr>
	<td>ann123</td>
	<td>subin1</td>
	<td>안수빈</td>
	<td>010-3333-2222</td>
	<td>3000</td>				
	</tr>
	<tr>
	<td>ju123</td>
	<td>juhoya</td>
	<td>김주호</td>
	<td>010-4444-2222</td>
	<td>1500</td>					
	</tr>
	<tr>
	<td>yeon123</td>
	<td>jaehwan</td>
	<td>이동연</td>
	<td>010-1111-5555</td>
	<td>10000</td>					
	</tr>
	
	
	</tbody>
</table>

</form>
</div>

</body>
</html>