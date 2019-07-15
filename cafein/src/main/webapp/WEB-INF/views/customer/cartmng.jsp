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
		
	var local_cart = JSON.parse(localStorage.getItem("cartlist"));
	if (local_cart == null) {
		local_cart = new Array();
		$("#cartTable").hide();
	}else {
		
		$("#cartTable tbody").empty();
		
		for(var i = 0;i<local_cart.length;i++){
			console.log(local_cart[i]);
			$('<tr>')
			.append($('<td>').html(local_cart[i].sId))
			.append($('<td>').html(local_cart[i].cId))
			.append($('<td>').html(local_cart[i].cuNumList.toString()))
			.append($('<td>').html(local_cart[i].hotice_option))
			.append($('<td>').html(local_cart[i].mName))
			.append($('<td>').html(local_cart[i].mPrice))
			.append($('<td>').html(local_cart[i].qty))
			.appendTo("#cartTable tbody");
		}
		
		
		
			
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
 <thead>
 	<tr>
 		<th>매장 번호</th>
 		<th>메뉴 번호</th>
 		<th>ICE/HOT</th>
 		<th>메뉴 가격</th>
 		<th>수량</th>
 		<th>옵션</th>
 		<th>총 가격</th>
 	</tr>
 </thead>
 
 	<th rowspan="7"><input type="checkbox">
 	
<tbody></tbody>

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