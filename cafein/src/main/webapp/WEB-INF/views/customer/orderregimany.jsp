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
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
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
	
	
	  /*  var list = new Array();
	   var list2 = new Array();
	   $("input[name$='hello']:checked").each(function(){
		   list.push($(this).val());
	   });
		
	   console.log(list);
	   console.log("::::"+$("input[name$='hello']").val()); 
	   $("input[name=optionlist]").val();*/
	var ordercart = $("#ordercartform").serializeObject();
	
	console.log(JSON.stringify(ordercart));
	
	$('[name="jsonData"]').val(JSON.stringify(ordercart));
	document.fCart.submit();
	
	
}


</script>
</head>

	<body>
		<h1 align="center">주 2문</h1>
		<div class="container" >
		
		<form action="ordercartmany" method="post" name="fCart">
			<input type="hidden" name="jsonData">
		</form>
		
		<form class="form-borizontal" id="ordercartform" name="ordercartform" method="POST" >
			
		
			 <input id="storeid" value="${selectmenu.sId}" name="sId" style="display: none" >
			 <input id="storeid" value="${selectmenu.cId}" name="cId" style="display: none" >  
			 			
		
	
			
			<table class="table">
				<tr>
					<th>매 장 명</th>
					<td>${cartLists[0].sName}</td>
				</tr>
		<c:forEach items="${cartLists}" var="cartlist">
				<tr>
					<th>메 뉴e 명</th>
					<td>
					
					 <input type="hidden" name="mNum" value="${cartlist.mNum}">
					
					 	
					 
					 ${cartlist.mName}
						<c:if test="${cartlist.hotice_option eq 'CAHT'}">
							( HOT )
						<input type="hidden" name=hotice_option value="CAHT">
						 </c:if>
						<c:if test="${cartlist.hotice_option eq 'CAIC'}">
							( ICE )
						<input type="hidden" name=hotice_option value="CAIC">
						 </c:if> 
					</td>

				</tr>
				<tr>
					<th>옵션</th>
					<td>
						<%-- <c:forEach items="${optionname}" var="oplist"> --%>
							<c:forEach var = "entry" items="${menumap}">
								<c:if test="${cartlist.mNum eq entry.key}">
										<c:forEach items="${entry.value}" var="opvalue">
										${opvalue}
											<c:forEach items="${cartlist.cuoptionlist}" var="culist" varStatus="status">
											
												<c:if test="${culist eq opvalue}">
											
													!
													
													<!-- hap = [${culist}+${culist}+....] -->
													 <input type="checkbox" class="checkoption"  id="${cartlist.mNum}" name="${cartlist.mNum}" value="${opvalue}" checked="checked">
													 
													 <input type="hidden" id="optionlist" name="optionlist">
													 
													 
													<label for="${oplist.recipeno}">${oplist.opName}(${oplist.opPrice})</label>
													<input type="hidden" id="price${oplist.recipeno}" value="${oplist.opPrice}"><br>
													 
													
													
												</c:if>
												
											</c:forEach>
										</c:forEach>
									<%-- <c:if test="${oplist.stNum eq entry.value}">
							
									<input type="checkbox" class="checkoption" id="${oplist.recipeno}" name="optionlist" value="${oplist.recipeno}" checked="checked">
									<label for="${oplist.recipeno}">${oplist.opName}(${oplist.opPrice})</label>
									<input type="hidden" id="price${oplist.recipeno}" value="${oplist.opPrice}"><br>
									</c:if> --%>
								</c:if>
							</c:forEach>
						<%-- </c:forEach> --%>
						
		 
					<%-- 손님이 선택한 옵션->
						<c:forEach items="${cartlist.cuoptionlist}" var="culist">
							<input type="text" value="${culist}">	<!-- for돌려 더 출력 -->
						</c:forEach>
						<br>
						장바구니에서 선택한 메뉴 번호와 전체 옵션이름들->
						<c:forEach var = "entry" items="${menumap}">
						<div>${entry.key}</div>
						<div>${entry.value}</div>
					
						</c:forEach>
						
						
						 
					mNum stNum option->
						<c:forEach items="${optionname}" var="oplist">
							<input type="text" value="${oplist.mNum}">
							<input type="text" value="${oplist.stNum}">
							<input type="text" value="${oplist.recipeno}">
							<input type="text" value="${oplist.opName}">	<!-- for돌려 더 출력 -->
							<br>
						</c:forEach> --%> 
		
		
		
		
		
						<%-- <c:forEach items="${menumap}" var="menuop">
							<input type="text" value="${menuop.recipeno}">
						</c:forEach> --%>
		
					<!--  			
						<c:forEach items="${option}" var="option"> 
							<c:forEach items="${selectmenu.cuoptionlist}" var="select">
								<c:if test="${option.stNum eq select}">
									-->
									<%-- List<MenuOrderVO> meorvo --%>
									<input type="checkbox" class="checkoption" id="${option.recipeno}" name="optionlist" value="${option.recipeno}" checked="checked">
									<label for="${option.recipeno}">${option.opName}(${option.opPrice})</label>
									<input type="hidden" id="price${option.recipeno}" value="${option.opPrice}"><br>
							<!--		<c:set var="check" value="O"/>
								</c:if>
								5
							</c:forEach>
							 <c:if test="${check != 'O'}"> -->
								
									<input type="checkbox" class="checkoption" id="${option.recipeno}" name="optionlist" value="${option.recipeno}">
									<label for="${option.recipeno}">${option.opName}(${option.opPrice})</label>
									<input type="hidden" id="price${option.recipeno}" value="${option.opPrice}"><br>
							<!-- </c:if> 
							<c:remove var="check"/>
						</c:forEach>-->

					 </td>
				</tr>
				<tr>
					<th>금 액</th>
					<td><input id="price" value="${cartlist.mPrice}" size="6" readonly> &nbsp;&nbsp;
						<button type="button" onclick="add(1)">+</button> <input name="oQty" size="1" value="${cartlist.orderqty}" readonly>
						<button type="button" onclick="add(-1)">-</button></td>
				</tr>
				
				</c:forEach>
				</table>
				<br>				
				<br><br><br>
				<table>
				
				
				
				
				
				
				<tr id="reservetr" style="display: none;">
					<th>적립금</th>
					<td><input type="text" name="mileage" id="insertmileage" size="10" value="0">
						<button type="button" id="reservebtn">사용</button>
						<button type="button" id="reservecancelbtn">취소</button>
						<br>현 적립금 : <span id="usermileage"></span>
						<p id="usermileageinfo" style="color: blue;">100단위로 사용가능합니다</p>
					</td>
				</tr>
				
					<tr class="deliverY" style="display: none;">
						<th>수 령 방 식</th>
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
					<th>결 제 방 식</th>
					<td><input type="radio" name="payMethod" value="card" id="card"
						checked> <label for="card">카드 결제</label></td>
				</tr>
				<tr>
					<th>총 금 액</th>
					<td><input name="total" value="1010" readonly></td>
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