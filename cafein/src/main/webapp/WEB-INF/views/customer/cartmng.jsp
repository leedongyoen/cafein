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
		
var sumtotalPrice = 0;
var state = "";

	$("#CartList table tbody").empty();
	var local_cart = JSON.parse(localStorage.getItem("cartlist"));
	if (local_cart == null) {
		local_cart = new Array();
		$("#CartListWrapper").hide();
	}else {
		
		
		console.log(local_cart.length);
		for(var i = 0;i<local_cart.length;i++){

			sumtotalPrice = (local_cart[i].totalPrice*1) + sumtotalPrice;
			if(local_cart[i].hotice_option=="CAIC"){
					state="ICE";
				}
			else if(local_cart[i].hotice_option=="CAHT"){
				state="HOT";
			}
			
			
			$("#CartList div a").html(local_cart[i].sId);
			$('<tr>')
			.append($('<td rowspan="2">').append($('<input>').attr({type: "checkbox"})))
			.append($('<td rowspan="2">').html(local_cart[i].sId))
			.append($('<td rowspan="2">').html("Photo"))
			.append($('<td>').html(local_cart[i].mName))
			.append($('<td rowspan="2">').html(state))
			.append($('<td rowspan="2">').html(local_cart[i].qty).append($('<input>').attr({type: "button",value:"변경"})).append($('<input style="text-align:center; width:40px;">').val("")))
			.append($('<td rowspan="2">').html(local_cart[i].totalPrice))
			.append($('<td style="visibility:hidden;>').html(local_cart[i].mNum))
			.appendTo("#CartList table tbody");
			
			$('<tr>').append($('<td>').append($('<ul>'))).appendTo("#CartList table tbody");
			
			
			for(var j = 0;j<local_cart[i].cuNumList.length;j++){
				//function(mNum,local_cart[i].cuNumList[j])
				
				var detail = getOptionNaming("ME008", "ST042");
				console.log("detail: "+detail);
				
				$('<li>').html(local_cart[i].cuNumList[j]).appendTo("#CartList table tbody tr:eq("+(2*i+1)+") ul");
				
		
			}		
						//$('<li>').html(local_cart[i].cuNumList[j]);
						//console.log($test);
						//$('<li>').html(local_cart[i].cuNumList[j]).appendTo("#CartList table tbody tr:even td ul");
					
				//totalPrice 합계 넣기
				
				$("#CartList div p span strong").html(sumtotalPrice);
				
		}
		
	}
		console.log(local_cart);
	

});
	
	
function getOptionNaming(mnumber, stnumber){
	console.log(mnumber+" : "+stnumber);
	return "helloe";
}
</script>


</head>
<body>
	<div
		style="width: 100%; text-align: center; padding: 3px; border: 1px solid pink;"
		id="CartListWrapper">
		<h3 align="center">장e바 see구니</h3>
		
		<c:forEach var="cart" items="${optionname}">
			<li>${cart.mNum} ${cart.stNum} ${cart.opName}</li>

		</c:forEach>
		<c:forEach var="stoname" items="${storename}">
			<li>${stoname.sid} ${stoname.sname}</li>

		</c:forEach>
		<c:forEach var="mimg" items="${menuimg}">
			<li>${mimg.uploadFileName} ${mimg.mNum}</li>

		</c:forEach>

		<div
			style="padding: 3px; border: 1px solid orange; display: inline-block; text-align: center;"
			id="CartList">
			<!-- display: inline-block; -->
			<div style="background: gray;">
				<label><input type="checkbox"></label> <a href="#"></a>
			</div>
			<div style="text-align: center;">
				<table border="1">


					<thead>
						<tr><th rowspan="1"></th>
							<th rowspan="1">매2장 명</th>
							<th colspan="2">상품/옵션정보</th>
							<th rowspan="1">ICE/HOT</th>
							<th rowspan="1">수e량</th>
							<th rowspan="1">구매 금액</th>

						</tr>
					</thead>

					<tbody></tbody>
				</table>
			</div>

			<div style="background: orange; padding: 3px;">
				<p>
					<span> 주문합계  <strong></strong>원

					</span>
				</p>
			</div>

		</div>



		<div align="right">총가격 : 1840d0원</div>
		<br>
		<br>
		<br>
		<div align="right">
			<button class="btn btn-default ">삭제</button>
			<button class="btn btn-default ">주문하기</button>
			<a href="javascript:history.go(-1)" class="btn btn-default ">돌아가기</a>
		</div>
	</div>




</body>
</html>