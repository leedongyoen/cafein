<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>
<title>Insert title here</title>
<script>
var price = 4100;
var no = 1;

var customerAdd;
var checklogin = "<%=(String) session.getAttribute("cId")%>";



//고객 마일리지 가져오기.
$(function(){
		getCostomerInfo();
		getstoremileageservice();
		getstoredeliverservice();
		
		//100원단위 마일리지 사용
		$('#reservebtn').on("click",function(){
			var mileage = $('#insertmileage').val();	//차감하려고 적은 마일리지 값
			var totalmileage =$('#usermileage').text();	//현재 회원의 적립금
			if( Number(mileage)%100 != 0 || Number(mileage) == 0){
				alert("100원 단위로만 사용가능합니다.");
				$('#insertmileage').val("0");				

			}else if(Number(mileage) > Number(totalmileage)){
				alert('사용가능한 적립금을 초과하였습니다.');
				
			}else{
				var v_totalprice =  $("input:text[name='total']").val();
				v_totalprice = Number(v_totalprice) - Number(mileage);
				 $("input:text[name='total']").val(v_totalprice);
				 var now_mile = (totalmileage*1)-(mileage*1);
				 $('#usermileage').text(now_mile);
				 $('#reservebtn').attr('disabled',true);
			}
		});
		
		// 적립금 사용 취소
		$('#reservecancelbtn').on("click",function(){
			// 사용자가 적은 적립금
			var mileage = $('#insertmileage').val();
			
			// 총 가격
			var v_totalprice =  $("input:text[name='total']").val();
			v_totalprice = Number(v_totalprice) + Number(mileage);
			 $("input:text[name='total']").val(v_totalprice);
			 
			$('#insertmileage').val("0");
			$('#reservebtn').attr('disabled',false);
		});
		
		


		var cart = '${cartListsmero}';

		var json = JSON.parse(cart);
		
		console.log(json);
		for(var c = 0;c<json.length;c++){
			console.log(json[c].cuoptionlist);
			
			var coplist = json[c].cuoptionlist;
			
				
			str = coplist.slice(0,-1);
			console.log(" 1str: "+str);
			str = str.substring(1);
			console.log(" 2str: "+str);
			var oplist = str.split(",");
			console.log(oplist);
			
			for(var t = 0;t<oplist.length;t++){
				
				oplist[t] = oplist[t].trim();
				$('input:checkbox[id="'+oplist[t]+'"]').attr("checked", true);
			}
		
			
		}
		//$('input:checkbox[id="checkbox_id"]').attr("checked", true);
		//============================================
		
		
		
		
	});
	

function getcustomermileage(){
	var v_storeId = $("#storeid").val();
	
	$.ajax({
		url:'customerreserve',
		type:'GET',
		dataType:'json',
		data: {cId: checklogin, sId: v_storeId},
		error:function(xhr,status,msg){
			/* alert("상태값 :" + status + " Http에러메시지 :"+msg); */
			$('#usermileage').html("0");
		},
		success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
			$('#usermileage').html(data.mileAge);
		}
	});
}

// 매장 마일리지 서비스 정보 가져오기
function getstoremileageservice(){
	var v_storeId = $("#storeid").val();
	$.ajax({
		url:'getstoremileageservice',
		type:'GET',
		data: {sId: v_storeId},
		error:function(xhr,status,msg){
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
		},
		success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
			
			if(data == 'N'){
				$('#reservetr').hide();
			}else{
				$('#reservetr').show();
				getcustomermileage();
			}
			
				
		}
	}); 
	
}

// 고객 마일리지 가져오기.
function getcustomermileage(){
	var v_storeId = $("#storeid").val();
	
	$.ajax({
		url:'customerreserve',
		type:'GET',
		dataType:'json',
		data: {cId: checklogin, sId: v_storeId},
		error:function(xhr,status,msg){
			/* alert("상태값 :" + status + " Http에러메시지 :"+msg); */
			$('#usermileage').html("0");
		},
		success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
			$('#usermileage').html(data.mileAge);
		}
	});
}

// 고객 주소 가져오기 위한 함수
function getCostomerInfo(){
	
	var v_storeId = $("#storeid").val();
	console.log(v_storeId);
		$.ajax({
		url:'customerinfo/',
		type:'GET',
		dataType:'json',
		data: {cId: checklogin},
		error:function(xhr,status,msg){
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
		},
		success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
			customerAdd= data.cAdd;
			$('input:text[name="cAdd"]').val(customerAdd);
			$('input:text[name="cAdd2"]').val(data.cAdd2);
			$('input:text[name="cAdd3"]').val(data.cAdd3);
		}
	}); 
	
	
	
}
// 매장 배달 서비스 정보 가져오기
function getstoredeliverservice(){
	var v_storeId = $("#storeid").val();
	$.ajax({
		url:'getstoredeliverservice',
		type:'GET',
		data: {sId: v_storeId},
		error:function(xhr,status,msg){
			alert("상태 값 :" + status + " Http에러메시지 :"+msg);
		},
		success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
			
			console.log(data);
			if(data == 1){
				$('.deliverY').show();
				$('#delivery').attr("checked","checked");
				
			}else{
				$('.deliverN').show();
				$('#takeout').attr("checked","checked");
			}
			
				
		}
	}); 
	
}

function orderCartInsert(){

	var ordercart = $("#ordercartform").serializeObject();
	
	console.log(JSON.stringify(ordercart));
	
	$('[name="jsonData"]').val(JSON.stringify(ordercart));
	document.fCart.submit();
	
	
}

function plus(id_num) {
	//var price = $("input:text[name='price']").val();
	var cnt = id_num.substring(4);
	var price = $('#price'+ cnt).val();
	var qty = $('#qty'+ cnt).val();
	console.log(price+" "+qty);
	
	
	
	var v_totalprice = $("input:text[name='total']").val();
	var plusqty = (qty*1)+1;
	
	$('#qty'+ cnt).val(plusqty);
	
	v_totalprice = Number(v_totalprice) + Number(price);
	$("input:text[name='total']").val(v_totalprice);
	
	
}

function minus(id_num) {
	//var price = $("input:text[name='price']").val();
	var cnt = id_num.substring(5);
	var price = $('#price'+ cnt).val();
	var qty = $('#qty'+ cnt).val();
	console.log(price+" "+qty);
	
	var v_totalprice = $("input:text[name='total']").val();
	
	var minusqty = (qty*1)-1;
	if(minusqty == 0){
		minusqty = 1;
		alert("1개 이 상으로 주문해주세요.");
		return;
	}
	$('#qty'+ cnt).val(minusqty);
	
	v_totalprice = Number(v_totalprice) - Number(price);
	$("input:text[name='total']").val(v_totalprice);

	
}



</script>
</head>

	<body>
	
	
	
		<h1 align="center">주 문</h1>
		<div class="container" >
		
		<form action="ordercartmany" method="post" name="fCart">
			<input type="hidden" name="jsonData">
		</form>
		
		<form class="form-borizontal" id="ordercartform" name="ordercartform" method="POST" >
			
		
			 <input id="storeid" value="${selectmenu.sId}" name="sId" style="display: none" >
			 <input id="storeid" value="${selectmenu.cId}" name="cId" style="display: none" >  
			 			
		
	
			
			<table class="table">
				<tr>
					<th>매 장  명</th>
					<td>${cartLists[0].sName}</td>
				</tr>
		<c:forEach items="${cartLists}" var="cartlist" varStatus="status">
				
				<tr>
					<th>메 뉴 명</th>
					<td>
					 <input type="hidden" name="mNum" value="${cartlist.mNum}">
					
					 ${cartlist.mName}
					 <c:choose>
				    <c:when test="${cartlist.hotice_option eq 'CAHT'}">
				       ( HOT )
						<input type="hidden" name=hotice_option value="CAHT">
				    </c:when>
				
				    <c:when test="${cartlist.hotice_option eq 'CAIC'}">
				       ( ICE )
						<input type="hidden" name=hotice_option value="CAIC">
				    </c:when>
				    <c:otherwise>
				        
						<input type="hidden" name=hotice_option value=" ">
				    </c:otherwise>
				</c:choose>
				

					</td>

				</tr>
				<tr>
					<th>옵션</th>
					<td>
					
					
					<c:forEach items="${optionname}" var="recipeList">
						<c:if test="${recipeList.mNum eq cartlist.mNum}">
							<input type="text" value="${recipeList.opName}">
							<input type="checkbox" value="${recipeList.recipeno}" id="${recipeList.recipeno}" name="${recipeList.recipeno}" class="checkoption">
							<br>
						</c:if>
					</c:forEach>
					
					

					 </td>
				</tr>
				<tr>
					<th>금e 액</th>
					<td><input id="price${status.count}" value="${cartlist.mPrice}" size="6" readonly> &nbsp;&nbsp;
						<button type="button" id = "plus${status.count}" onclick="plus(this.id)">+</button>
							<input name="oQty" id = "qty${status.count}" size="1" value="${cartlist.orderqty}" readonly>
						<button type="button" id = "minus${status.count}" onclick="minus(this.id)">-</button></td>
				</tr>
				
				</c:forEach>
				</table>
				<br>				
				<br>
				<table class="table">
				
				<tr id="reservetr" style="display: none;">
					<th>적 @립 금</th>
					<td><input type="text" name="mileage" id="insertmileage" size="10" value="0">
						<button type="button" id="reservebtn">사용</button>
						<button type="button" id="reservecancelbtn">취소</button>
						<br>현 적립금 : <span id="usermileage"></span>
						<p id="usermileageinfo" style="color: blue;">100단위로 사용가능합니다</p>
					</td>
				</tr>
				
					<tr class="deliverY" style="display: none;">
						<th>수 령   방~ 식</th>
						<td>
							<input type="radio" name="receipt" value="delivery" id="delivery" > 
							<label for="delivery">배달로하기</label> 
							
							<input type="radio" name="receipt" value="takeout" id="dtakeout"> 
							<label for="dtakeout">직접받아가기</label>
						</td>
					</tr>
					<tr class="deliverN" style="display: none;">
						<th>수 령 방 식</th>
						<td>					
							<input type="radio" name="receipt" value="takeout" id="takeout" > 
							<label for="takeout">직접 수령</label>
						</td>
					</tr>
				
					<tr class="deliverY" style="display: none;">
						<th>배 달 주 소</th>
						<td>
							<input type="text" placeholder="우편번호" readonly="readonly" > <br>
							<input type="text" name="cAdd" style="width: 500px;" placeholder="주소" readonly="readonly">	<br>
							<input type="text" name="cAdd3" style="width: 500px;" placeholder="상세 주소 입력"> <br>					
							<button type="button" onclick="getCostomerInfo()">현 주소로하기</button>
							<button type="button" id="changeAdd" >새	주소로하기</button>
						</td>
					</tr>				
				
				<tr>
					<th>결 제! 방 식</th>
					<td><input type="radio" name="payMethod" value="card" id="card"
						checked> <label for="card">카드 결제</label></td>
				</tr>
				<tr>
					<th>총 금 액</th>
					<td><input name="total" value="${cartLists[0].totalPrice}" readonly></td>
					
				</tr>
			</table>

			<br>
			<div>
				<div align="right">
					<button type="button" id="orderbtn" onclick="orderCartInsert()" class="btn btn-default ">주문하기</button>
					&nbsp;&nbsp; <a href="javascript:history.go(-1)"
						class="btn btn-default ">돌아가기</a>
				</div>
				
			</div>
			</form>
		</div>


</body>
</body>
</html>