<%@page import="co.yedam.cafein.vo.RecipeVO"%>
<%@page import="co.yedam.cafein.vo.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		


	$("#cartTable tbody").empty();
	var local_cart = JSON.parse(localStorage.getItem("cartlist"));
	if (local_cart == null) {
		local_cart = new Array();
		$("#cartTableForm").hide();
	}else {
		
		
		console.log(local_cart.length);
		for(var i = 0;i<local_cart.length;i++){
			
			$('<tr>')
			.append($('<td>').html(local_cart[i].sId))
			.append($('<td>').html(local_cart[i].mName))
			.append($('<td>').html(local_cart[i].hotice_option))
			.append($('<td>').html(local_cart[i].mPrice))
			.append($('<td>').html(local_cart[i].qty))
			.append($('<td>').html(local_cart[i].cuNumList.toString()))
			.append($('<td>').html(local_cart[i].totalPrice))
			.append($('<td>').html(local_cart[i].mNum))
			.appendTo("#cartTable tbody");
		}
		
	}
		console.log(local_cart);
	
});
	
</script>
</head>
<body>

<h3 align="center">장바구니!</h3>
<div class = "container" align="center">
<div id="cartTableForm">

	<c:forEach var="cart" items="${optionname}">
		<li> ${cart.mNum} ${cart.stNum} ${cart.opName}</li>

	</c:forEach>




 <table class = "table" id="cartTable">
 <thead>
 	<tr>
 		<th>매장 이름</th>
 		<th>메뉴 이름</th>
 		<th>ICE/HOT</th>
 		<th>메뉴 가격</th>
 		<th>수량</th>
 		<th>옵션</th>
 		<th>총 가1격</th>
 	</tr>
 </thead>
 
 	<th rowspan="7"><input type="checkbox">
 	

    </table>
    </div>
   <div align="right" >   
	    총가격 : 18400원
	</div>
	<br><br><br>
	<div align="right" >
		<button class="btn btn-default " >삭제</button>
	    <button class="btn btn-default " >주문하기</button>
	    <a href="javascript:history.go(-1)" class="btn btn-default ">돌아가기</a>
	</div>
</div>

</body>
</html>