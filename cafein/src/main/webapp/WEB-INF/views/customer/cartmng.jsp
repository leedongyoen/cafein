<%@page import="co.yedam.cafein.vo.CartVO"%>
<%@page import="java.util.ArrayList"%>
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

	
	$(function(){
		
		
		
		
		var local_cart = localStorage.getItem("cartlist");
		if (local_cart == null) {
			local_cart = new Array();
			$("#cartTable").hide();
		}else {
			
			$("#cartTable").show();
			
		}
		console.log(local_cart);		
	});
	
	
</script>
</head>
<body>
<h3 align="center">장바구니</h3>
<div class = "container" align="center">
<div id="cartTable">
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


    </table>
    </div>
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