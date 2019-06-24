<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="cushead.jsp" %>
<title>Insert title here</title>
</head>
<body>
<h1 align="center">담기</h1>

<h3 align="center">선택한 메뉴</h3>
<div class = "container" align="center">
 <table class = "table">
 	<tr>
	<th> </th>
	<th>메뉴명</th>
	<th>옵션</th>
	<th>수량</th>
	<th>가격</th>
	<th>총가격</th>
	</tr>
	<tr>
	    <td><input type="checkbox" name="cuscart" value="ORDER1"></td>
	    <td>아메리카노</td>
	    <td>ICE/휘핑</td>
	    <td>1</td>
	    <td>4600</td>
	    <td>4600</td>
	</tr>
	<tr>
		<td><input type="checkbox" name="cuscart2" value="ORDER"></td>
	    <td>레몬에이드</td>
	    <td>ICE</td>
	    <td>2</td>
	    <td>5000</td>
	    <td>10000</td>
	</tr>
	<tr>
		<td><input type="checkbox" name="cuscart3" value="ORDER"></td>
	    <td>망고스무디</td>
	    <td>ICE</td>
	    <td>1</td>
	    <td>3800</td>
	    <td>3800</td>
	</tr>
    </table>
   <div align="right" >   
	    총가격 : 18400원
	</div>
	<br><br><br>
	<div align="right" >
		<button class="btn btn-default " onclick="location.href='cusMenu.jsp'">추가</button>
		<button class="btn btn-default " onclick="#">삭제</button>
	    <button class="btn btn-default " onclick="location.href='Order.jsp'">주문하기</button>
	    <a href="javascript:history.go(-1)" class="btn btn-default ">돌아가기</a>
	</div>
</div>
</body>
</html>