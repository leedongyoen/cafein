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
<script>

//test로 넘어오는값 임시로 넣은 json문장,
var jsonString='[{"sId":"SH001","mNum":"ME001","qty":"1","hotice_option":"CAIC","mPrice":"4000","caNumList":"[{"":"","":""}]"},{"sId":"SH001","mNum":"ME002","qty":"2","hotice_option":"CAHT","mPrice":"4500","caNumList":"[{"":"","":""}]"}]';


</script>
</head>
<body>

<h3 align="center">장바구니</h3>
<div class = "container" align="center">
 <table class = "table">
 	<tr>
 		<th rowspan="7"><input type="checkbox"></th>
 		<th>매장 번호</th><td>SH001</td>
 	</tr>
 	<tr>
 		<th>메뉴 번호</th><td>ME001</td>
 	</tr>
 	<tr>
 		<th>ICE/HOT</th><td>CAIC</td>
 	</tr>
 	<tr>
 		<th>메뉴 가격</th><td>4000</td>
 	</tr>
 	<tr>
 		<th>담은 수량</th><td>1</td>
 	</tr>
 	<tr>
 		<th>옵션</th><td>...</td>
 	</tr>
 	<tr>
 		<th>총가격</th><td>4000*1</td>
 	</tr>



 	<tr>
 		<th rowspan="7"><input type="checkbox"></th>
 		<th>매장 번호</th><td>SH001</td>
 	</tr>
 	<tr>
 		<th>메뉴 번호</th><td>ME001</td>
 	</tr>
 	<tr>
 		<th>ICE/HOT</th><td>CAIC</td>
 	</tr>
 	<tr>
 		<th>메뉴 가격</th><td>4000</td>
 	</tr>
 	<tr>
 		<th>담은 수량</th><td>1</td>
 	</tr>
 	<tr>
 		<th>옵션</th><td>...</td>
 	</tr>
 	<tr>
 		<th>총가격</th><td>4000*1</td>
 	</tr>
 	
 	
 	 	<tr>
 		<th rowspan="7"><input type="checkbox"></th>
 		<th>매장 번호</th><td>SH001</td>
 	</tr>
 	<tr>
 		<th>메뉴 번호</th><td>ME001</td>
 	</tr>
 	<tr>
 		<th>ICE/HOT</th><td>CAIC</td>
 	</tr>
 	<tr>
 		<th>메뉴 가격</th><td>4000</td>
 	</tr>
 	<tr>
 		<th>담은 수량</th><td>1</td>
 	</tr>
 	<tr>
 		<th>옵션</th><td>...</td>
 	</tr>
 	<tr>
 		<th>총가격</th><td>4000*1</td>
 	</tr>
    </table>
   <div align="right" >   
	    총가격 : 18400원
	</div>
	<br><br><br>
	<div align="right" >
		<button class="btn btn-default " onclick="#">삭제</button>
	    <button class="btn btn-default " onclick="#">주문하기</button>
	    <a href="javascript:history.go(-1)" class="btn btn-default ">돌아가기</a>
	</div>
</div>
</body>
</html>