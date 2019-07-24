<%@page import="co.yedam.cafein.vo.RecipeVO"%>
<%@page import="co.yedam.cafein.vo.CartVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ include file="cushead.jsp"%>
<title>Insert title here</title>
<script>

var arrMenu = new Array();
var arrStock = new Array();
var arropName = new Array();

var arrStoreid = new Array();
var arrStorename = new Array();

var arrMnum = new Array();
var arrImg = new Array();

var local_cart = JSON.parse(localStorage.getItem("cartlist"));

$(function(){
		
	$("#CartList table tbody").empty();
	
	console.log(local_cart);
	
	if (local_cart == null) {
		local_cart = new Array();
		$("#CartListWrapper").hide();
	}else {
		
		var sumtotalPrice = 0;
		var state = "";
		var qty = 0;
		var price = 0;
		var id = "<%=(String) session.getAttribute("cId")%>";
		
		
		for(var i = 0;i<local_cart.length;i++){
			
			//local_storage에 qty를 orderqty로 
			local_cart[i].orderqty = local_cart[i].qty;

			qty = (local_cart[i].qty*1);
			price = (local_cart[i].totalPrice*1)/qty;
			sumtotalPrice = (qty*price) + sumtotalPrice;
			
			
			
			if(local_cart[i].hotice_option=="CAIC"){
					state="ICE";
				}
			else if(local_cart[i].hotice_option=="CAHT"){
				state="HOT";
			}
			
			
			$("#CartList div a").html(local_cart[i].sId);
			$("#CartList div a").val(local_cart[i].sId);
			$('<tr>')
			.append($('<td rowspan="2">').append($('<input>').attr({type: "checkbox", id:"cartnumlist"+i, name:"cartnumlist", value:i,onClick:"cartlist(this.value)",})))
			.append($('<td rowspan="2">'))    //.html()
			.append($('<td rowspan="2">'))
			.append($('<td>').html(local_cart[i].mName))   //.html(local_cart[i].mName))
			.append($('<td rowspan="2">').html(state))    //.html(state))
			.append($('<td rowspan="2">').append($('<input>').attr({type:"button", id:"plus"+i ,onClick:"plus(this.id)", value:"+"})).append($('<input>').attr({type: "text", name:"orderqty", id:"qty"+i,value:local_cart[i].qty})).append($('<input>').attr({type:"button", id:"minus"+i ,onClick:"minus(this.id)", value:"-"})))
			.append($('<td rowspan="2">').html(local_cart[i].totalPrice))
			.append($('<input>').attr({type:"hidden", id:"price"+i, value:local_cart[i].totalPrice}))
			.appendTo("#CartList table tbody");
		
			
			$('<tr>').append($('<td>').append($('<ul>'))).appendTo("#CartList table tbody");
			
			var storeName = "";
			var imgName="";
			//매장 이름
			for(var k = 0;k<arrStoreid.length;k++){
				if(local_cart[i].sId==arrStoreid[k])
					{
						storeName=arrStorename[k];
					}
			}
			
			//이미지 이름 넣기
			for(var k = 0;k<arrMnum.length;k++){
				if(local_cart[i].mNum==arrMnum[k])
					{
						imgName=arrImg[k];
					}
			}

			
			$('<img>').attr("src","${pageContext.request.contextPath}/image/"+imgName).css("width","100px").appendTo($('#CartList div table tbody tr:eq('+(2*i)+') td:eq(2)'));
			$('#CartList div table tbody tr:eq('+(2*i)+') td:eq(1)').html(storeName);
			
			//$('#CartList div table tbody tr:eq('+(2*i)+') td:eq(1)').html(storeName);
				
			
			if(local_cart[i].cuoptionlist != null){
				for(var j = 0;j<local_cart[i].cuoptionlist.length;j++){
					var detail = getOptionNaming(local_cart[i].mNum, local_cart[i].cuoptionlist[j]);
				
					$('<li>').html(detail).appendTo("#CartList table tbody tr:eq("+(2*i+1)+") ul");
					
				}
			} 
					
						//$('<li>').html(local_cart[i].cuNumList[j]);
						//console.log($test);
						//$('<li>').html(local_cart[i].cuNumList[j]).appendTo("#CartList table tbody tr:even td ul");
					
			//$("#CartList div p span strong").html(sumtotalPrice);
		}
		
	}
	
	
	

	
});


function plus(id_num) {
	var p_index = id_num.substring(4);	//index 번호 추가
	var qty_t = $('#qty'+p_index).val();
	var qty=qty_t*1;
	


		var price = $('#orderCartForm div table tbody tr:eq('+(p_index*2)+') td:eq(6)').text();
		var mPrice = (price*1)/(qty*1);
	
		console.log(mPrice);
		qty = qty+1;
	
	
		$('#qty'+p_index).val(qty);
		$('#orderCartForm div table tbody tr:eq('+(p_index*2)+') td:eq(6)').text(mPrice*qty);
	
	
}

function minus(id_num) {
	var m_index = id_num.substring(5);
	var qty_m = $('#qty'+m_index).val();
	console.log(qty_m);
	
	if(qty_m=='1'){
		
		alert("0이하는 입력할 수 없습니다."); 
		$('#qty'+m_index).val(1);
	}else{
		var qty=qty_m*1;
		var price = $('#orderCartForm div table tbody tr:eq('+(m_index*2)+') td:eq(6)').text();
		var mPrice = (price*1)/(qty*1);
	
		console.log(mPrice);
		qty = qty-1;
	
	
		$('#qty'+m_index).val(qty);
		$('#orderCartForm div table tbody tr:eq('+(m_index*2)+') td:eq(6)').text(mPrice*qty);
	}
	

}


function allCheck(val){
	console.log(val);
}

function cartlist(val){
	console.log(val);
	var allPrice = 0;
	
	$("input[name=cartnumlist]:checked").each(function() {
		
		
		var test = $(this).val(); 
		//console.log("test: "+test);
		for(var t = 0;t<test.length;t++){
			//console.log("te33st: "+test[t]);
			var addNum = $("#orderCartForm div table tbody tr:eq("+(test[t]*2)+") td:eq(6)").html();
			allPrice = allPrice + (addNum*1);
		}
		
		
		//console.log("test: "+addNum);
		
		//sum_optionprice =Number(sum_optionprice)+ Number(price);

	});
	
	console.log(allPrice);
	$("#orderCartForm div p span strong").html(allPrice);
	$("#orderCartForm div p span input").val(allPrice);
}

function orderDeleteClick(){
	
	var ordercart = $("#orderCartForm").serializeObject();
	var arr = JSON.parse(localStorage.getItem("cartlist"));
	console.log("arr: "+arr);
	
	for(var k = arr.length-1;k>=0;k--){
		//console.log("ordercart.cartnumlist[k]: "+ordercart.cartnumlist[k]+"  k: "+k);
		for(var m = 0;m<ordercart.cartnumlist.length;m++){
			if(ordercart.cartnumlist[m]==k){
				arr.splice(k,1);
				console.log("k: "+k);
			}
		}
		
	}
	local_cart=JSON.stringify(arr);
	localStorage.setItem("cartlist",local_cart);
	//alert(local_cart);
	window.location.reload(true);
}

function orderBtnClick(){

	var ordercart = $("#orderCartForm").serializeObject();
	var arr = [];

	
	for(var k = 0;k<ordercart.cartnumlist.length;k++){
		arr.push(local_cart[ordercart.cartnumlist[k]]);
	}
	
	console.log(JSON.stringify(arr));
	//alert 로 선택한 리스트와 수량이 넘어옴

	
	//controller 타고 넘겨주기...... 
/* 
	$.ajax({
		url: 'cartorder',
		type: "POST",
		data: JSON.stringify(arr),		
		dataType: 'json',
//		processData : false,
		
		contentType : "application/json",
		success: function() {
			console.log('d');
		},

		error: function(xhr) {
		  console.log('실패 - ', xhr);
		}
	}); */

$('[name="jsonData"]').val(JSON.stringify(arr));
	document.fCart.submit();
	
	
	
	
	
}

function getOptionNaming(mnumber, stnumber){
	var optionName = "";
	//이미지 이름 넣기
	for(var k = 0;k<arrMenu.length;k++){
		if(arrMenu[k]==mnumber)
			{
				if(arrStock[k]==stnumber){
					optionName=arropName[k];
				}				
			}
	}
	return optionName;
}
</script>


</head>
<body>

	<form action="cartorder" method="post" name="fCart">
		<input type="hidden" name="jsonData">
	</form>
	<div
		style="width: 100%; text-align: center; padding: 3px; border: 1px solid pink;"
		id="CartListWrapper">
		<h3 align="center">장바 구니</h3>

		<c:forEach var="cart" items="${optionname}" varStatus="i">
			<script>
				arrMenu[${i.index}] = "${cart.mNum}"; arrStock[${i.index}] = "${cart.stNum}"; arropName[${i.index}] = "${cart.opName}";
			</script>
		</c:forEach>

		<c:forEach var="stoname" items="${storename}" varStatus="i">
			<script>
			arrStoreid[${i.index}]="${stoname.sid}";	arrStorename[${i.index}]="${stoname.sname}";
			</script>
		</c:forEach>
		<c:forEach var="mimg" items="${menuimg}" varStatus="i">
			<script>
			arrMnum[${i.index}]="${mimg.mNum}";
			arrImg[${i.index}]="${mimg.uploadFileName}";
			</script>
		</c:forEach>

		<div
			style="padding: 3px; border: 1px solid orange; display: inline-block; text-align: center;"
			id="CartList">
			<!-- display: inline-block; -->

			<form id="orderCartForm" name="orderCartForm" action="cartorder" method="POST">

				<div style="background: gray;">
					<label><input type="checkbox" onClick="allCheck(this.value)"></label> <a href="#"></a>
				</div>
				<div style="text-align: center;">

					<table border="1">


						<thead>
							<tr>
								<th rowspan="1"></th>
								<th rowspan="1">매 장 명</th>
								<th colspan="2">상품/옵션정보</th>
								<th rowspan="1">ICE/HOT</th>
								<th rowspan="1">수 량</th>
								<th rowspan="1">구매 금액</th>

							</tr>
						</thead>

						<tbody></tbody>
					</table>
				</div>

				<div style="background: orange; padding: 3px;">
					<p>
						<span> 주문합계 <input type="hidden" name="totalPrice" value="0"><strong>0</strong>원</span>
					</p>
				</div>
				<input type="button" value="주문" id="orderBtn" onclick="orderBtnClick()">
			</form>
		</div>

		<br> <br> <br>
		<div align="right">
			<button class="btn btn-default" onclick="orderDeleteClick()">삭제</button>
			<a href="javascript:history.go(-1)" class="btn btn-default ">돌아가기</a>
		</div>
	</div>




</body>
</html>