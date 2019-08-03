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
<title>장 바 구 니</title>
<style type="text/css">
input {
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	};
	
.btn-group .button {
  background-color: #4CAF50; /* Green */
  border: 1px solid green;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  cursor: pointer;
  width: 150px;
  display: block;
}

.btn-group .button:not(:last-child) {
  border-bottom: none; /* Prevent double borders */
}

.btn-group .button:hover {
  background-color: #3e8e41;
}

.ulstyle{
	list-style: none;
    margin: 0px;
    padding: 0px;
    color: #6E6E6E;
}
.listyle{
	list-style: none;
    margin: 0px;
    padding: 0px;
}

</style>

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
			
			//alert("#CartList_"+local_cart[i].sId+" div a");
			
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
			
			var detail = "";
			var option_plus = "";
			
			if(local_cart[i].cuoptionlist != null){
				for(var j = 0;j<local_cart[i].cuoptionlist.length;j++){
					
					detail = getOptionNaming(local_cart[i].mNum, local_cart[i].cuoptionlist[j]);
					option_plus = option_plus + "<li>"+detail+"</li>";
				}
				
				//console.log("option_plus: "+option_plus);
				
			}
			
			$("#CartList_"+local_cart[i].sId+" div a").html(local_cart[i].sName);
			$('<tr>')
			.append($('<td rowspan="2">').css("width","100px").append($('<input>').attr({type: "checkbox", id:"cartnumlist"+i, name:"cartnumlist", value:i ,onClick:"cartlist(this.value,'"+local_cart[i].sId+"')",})))
			.append($('<td rowspan="2">').html(storeName).css("width","100px"))    //.html()
			.append($('<td rowspan="2">').css("width","200px").append($('<img>').attr("src","${pageContext.request.contextPath}/image/"+imgName).css("width","150px").css("padding","5px")))
			.append($('<td>').css("width","300px").html(local_cart[i].mName))   //.html(local_cart[i].mName))
			.append($('<td rowspan="2">').html(state).css("width","100px"))    //.html(state))
			.append($('<td rowspan="2">').css("width","150px").append($('<input>').attr({type:"button", id:"plus"+i ,onClick:"plus(this.id,'"+local_cart[i].sId+"')", value:"+"}).css("background-color","#A9F5E1").css("color","white").css("border","none")).append($('<input>').attr({type: "text", name:"orderqty",size:'3', id:"qty"+i,value:local_cart[i].qty}).css("text-align","center")).append($('<input>').attr({type:"button", id:"minus"+i ,onClick:"minus(this.id,'"+local_cart[i].sId+"')", value:"-"}).css("background-color","#A9F5E1").css("color","white").css("border","none")))
			.append($('<td rowspan="2">').css("width","150px").append($('<input>').attr("readonly",true).attr({type: "text", id:"orderprice"+i,value:local_cart[i].totalPrice}).css("text-align","center")))
			.append($('<input>').attr({type:"hidden", id:"price"+i, value:local_cart[i].totalPrice}).css("color","#04B4AE"))
			.appendTo("#CartList_"+local_cart[i].sId+" table tbody");
		
			
			$('<tr>').append($('<td>').append($('<ul>').append(option_plus).addClass("ulstyle"))).appendTo("#CartList_"+local_cart[i].sId+" table tbody");
			
			
			
			//.appendTo($('#CartList_'+local_cart[i].sId+' div table tbody tr:eq('+(2*i)+') td:eq(2)'));
			//$('#CartList_'+local_cart[i].sId+' div table tbody tr:eq('+(2*i)+') td:eq(1)').css("background","red"); //;
			
			//$('#CartList div table tbody tr:eq('+(2*i)+') td:eq(1)').html(storeName);
				
			
					
			$("#orderCartForm_"+local_cart[i].sId).css("display","block");
						//$('<li>').html(local_cart[i].cuNumList[j]);
						//console.log($test);
						//$('<li>').html(local_cart[i].cuNumList[j]).appendTo("#CartList table tbody tr:even td ul");
					//$("#CartList div p span strong").html(sumtotalPrice);
		}
	}
});


function plus(id_num,stname) {
	var p_index = id_num.substring(4);	//index 번호 추가
	var qty_t = $('#qty'+p_index).val();
	var qty=qty_t*1;
	
	console.log(stname);
	

		var price = $('#orderprice'+p_index).val();
		var mPrice = (price*1)/(qty*1);
	
		console.log(mPrice);
		qty = qty+1;
	
	
		$('#qty'+p_index).val(qty);
		
		$('#orderprice'+p_index).val(mPrice*qty);
		
		cartlist(p_index,stname);
}

function minus(id_num,stname) {
	var m_index = id_num.substring(5);
	var qty_m = $('#qty'+m_index).val();
	console.log(qty_m);
	
	if(qty_m=='1'){
		
		alert("0이하는 입력할 수 없습니다."); 
		$('#qty'+m_index).val(1);
	}else{
		var qty=qty_m*1;
		var price = $('#orderprice'+m_index).val();
		
		
		var mPrice = (price*1)/(qty*1);
	
		console.log(mPrice);
		qty = qty-1;
	
	
		$('#qty'+m_index).val(qty);
		$('#orderprice'+m_index).val(mPrice*qty);
		
		
	}
	
	cartlist(m_index,stname);

}


function allCheck(val){
	console.log(val);
}

function cartlist(val,stname){
	//console.log(val);
	var allPrice = 0;
	
	$("input[name=cartnumlist]:checked").each(function() {
		
		var test = $(this).val(); 
		//console.log(test);
		for(var t = 0;t<test.length;t++){
			
			var addNum = $("#orderprice"+test).val();
			
			allPrice = allPrice + (addNum*1);
		}
		
		console.log("allPrice: "+allPrice);
	});
	
	//totalPrice_'stname'
	console.log("stname: "+stname);
	$("#orderCartForm_"+stname+" div p span strong").html(allPrice);
	$("#totalPrice_"+stname).val(allPrice);
	
	//$("#orderCartForm_"+stname+" div p span strong").html(allPrice);
	//$("#orderCartForm_"+stname+" div p span input").val(allPrice);
}

function orderDeleteClick(stname){
	
	var ordercart = $("#orderCartForm_"+stname).serializeObject();
	var arr = JSON.parse(localStorage.getItem("cartlist"));
	
	//alert(ordercart.cartnumlist);
	if(ordercart.cartnumlist !=null){
		
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
		
	}else{
		alert("선택이 비어있습니다.");
	}
 	
	 
	//alert(local_cart); 
	window.location.reload(true); 
}

function orderBtnClick(stname){
	
	var up;
	
	up = confirm('주문하겠습니까?');

	if(up){
		
		var ordercart = $("#orderCartForm_"+stname).serializeObject();
		var arr = [];
		
		
		for(var k = 0;k<ordercart.cartnumlist.length;k++){
			var newOrder = $("#qty"+ordercart.cartnumlist[k]).val();
			var newPrice = $("#orderprice"+ordercart.cartnumlist[k]).val();
			var newMprice = (newPrice*1)/(newOrder*1);
			
			console.log(newOrder);
			local_cart[ordercart.cartnumlist[k]].orderqty = newOrder;
			local_cart[ordercart.cartnumlist[k]].totalPrice = newPrice;
			local_cart[ordercart.cartnumlist[k]].mPrice = newMprice;
			local_cart[ordercart.cartnumlist[k]].qty = ordercart.cartnumlist[k];
			arr.push(local_cart[ordercart.cartnumlist[k]]);
		}
		
		//local storage  하나씩 꺼내서  orderqty 만 값 바꿔서 넘기기
/* 		for(var m = 0;m<arr.length;m++){
			console.log(arr[m]);
		} */
		
		
	 alert(JSON.stringify(arr)); 

 	 $('[name="jsonData"]').val(JSON.stringify(arr));
		document.fCart.submit();
 		
		
	}
	
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
<body style="background: url(image/back2.jpg) no-repeat center center; background-size: cover;">
		

<div id="backgroundCoffee" style="width: 100%; height: 100%;" > 
		
		
		
	<form action="cartorder" method="post" name="fCart">
		<input type="hidden" name="jsonData">
	</form>

	<div style="width: 100%; text-align: center; padding: 3px;" id="CartListWrapper"> <!-- border: 1px solid pink; -->
		
		<hr>
		<div class="titlefont" align="center">장 바 구 니</div> 
		
		<hr>
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
		
		<!--  매장별로 form을 반복문  -->
		<c:forEach var="stidname" items="${storename}">
			
			
	<form id="orderCartForm_${stidname.sid}" name="orderCartForm_${stidname.sid}" action="cartorder" method="POST" style="display:none;">
		<div style="padding: 3px; display: inline-block; text-align: center; width:70%;" id="CartList_${stidname.sid}"> <!-- border: 1px solid orange; -->
			<!-- display: inline-block; -->

				<div style="background: #D8D8D8;">
					<label><input type="checkbox" onClick="allCheck(this.value)"></label><a href="#">선택</a>
				</div>
				<div style="text-align: center;">

					<table border = "1" style="width:100%; border: 1px solid #F2F2F2;">

						<thead>
							<tr style="height:50px;">
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

				<div style="padding: 3px; background: #F5D0A9; height:60px;">
					<p  style="padding-top:20px;">
						<span> 주 문 합 계 <input type="hidden" id="totalPrice_${stidname.sid}" name="totalPrice" value="0"><strong>0</strong>원</span>
					</p>
				</div>
			</div>

		<br> <br> <br>
		<div align="right" class="btn-group">
			<input type="button" class="button btn btn-info" onclick="orderBtnClick('${stidname.sid}')" value="주문">
			<button type="button" class="button btn btn-danger" onclick="orderDeleteClick('${stidname.sid}')">삭제</button>
			<!-- <a href="javascript:history.go(-1)" class="button">돌아가기</a> -->
		</div> 
		</form>
		
	</c:forEach>
		
	</div>
	<%-- <img style="width:90%; height:120%; opacity:0.8; position: absolute;" src="${pageContext.request.contextPath}/image/note.jpg">
	 --%>
	 
	 </div>
</body>
</html>