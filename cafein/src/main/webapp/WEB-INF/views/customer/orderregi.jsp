<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b402787b02c7003da0294158d1b3c1f8&libraries=services"></script>
<title>Insert title here</title>
<%

 Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
 
 String today = sf.format(now);
 

%>
<style type="text/css">
input {
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}
</style>
<script type="text/javascript">
	var price = 4100;
	var no = 1;
	
	var customerAdd;
	var checklogin = "<%=(String) session.getAttribute("cId")%>";
	
	$(function(){
		getCostomerInfo();
		getstoremileageservice();
		getstoredeliverservice();
		
	});

	function add(num) {
		//var price = $("input:text[name='price']").val();
		var price = $("#price").val();
		var v_totalprice = $("input:text[name='total']").val();
		
		var no = $("input:text[name='oQty']").val();
		var sum_optionprice=0;
		
 		$("input[name=optionlist]:checked").each(function() {
			var test = $(this).val(); 
			var recipeno = $('#option'+test).val();
			sum_optionprice =Number(sum_optionprice)+ Number(price);

		}); 
		console.log(sum_optionprice);
		if (num == -1) {
			if (Number(no) == 1) {
				alert("1개 이상으로 주문해주세요.");
				return;
			}
			no = Number(no) - 1;
			v_totalprice = Number(v_totalprice) - Number(price);
		} else if (num == 1) {
			no = Number(no) + 1;
			v_totalprice = Number(v_totalprice) + Number(price);
		}
		$("input:text[name='total']").val(v_totalprice);
		$("input:text[name='oQty']").val(no);
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
	


	
	$(function(){

		
		 // 옵션 선택시
	  	$(".checkoption").change(function(){
	  		var optionprice = $("#price"+$(this).val()).val();
	  		console.log($(this).val());
	  		console.log(optionprice);
	  		var v_totalprice =  $("input:text[name='total']").val();
	  		if($(this).is(":checked")){
					v_totalprice = Number(v_totalprice)+Number(optionprice);
			}else{
				v_totalprice = Number(v_totalprice) - Number(optionprice);
			}
	  		 $("input:text[name='total']").val(v_totalprice);

	  	});
		 
		// 새 주소로 주문
		$("#changeAdd").on("click",function(){
			 new daum.Postcode({
			        oncomplete: function(data) {
			        	var addr = data.address; 
			        	var addr2 = data.zonecode;
			        	$('input:text[name="cAdd"]').val(addr);
						$('input:text[name="cAdd2"]').val(addr2);		        	
			        }
			    }).open();
		});
		
		
		
		// 적립금 사용하게 되면 100단위로만 사용가능하게
		$('#reservebtn').on("click",function(){
			var mileage = $('#insertmileage').val();
			var totalmileage =$('#usermileage').text();
			if( Number(mileage)%100 != 0 || Number(mileage) == 0){
				alert("100원 단위로만 사용가능합니다.");
				$('#insertmileage').val("0");				

			}else if(Number(mileage) > Number(totalmileage)){
				alert('사용가능한 적립금을 초과하였습니다.');
				
			}else{
				var v_totalprice =  $("input:text[name='total']").val();
				v_totalprice = Number(v_totalprice) - Number(mileage);
				 $("input:text[name='total']").val(v_totalprice);
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
			
		});
		
	});
	
	//getordernumber

	
</script>
</head>
	<body>
		<h1 align="center">주 문</h1>
		<div class="container" >
		<form class="form-borizontal" id="orderform" name="orderform" action="insertcustomerorder" method="POST" >
			<input id="storeid" value="${selectmenu.sId}" name="sId" style="display: none" >
			<input id="storeid" value="${selectmenu.cId}" name="cId" style="display: none" >
			<table class="table">
			
<!-- 				<tr>
					<th>주 문 번 호</th>
					<td>(주문코드)OR20190617001)</td>
				</tr> -->
<%-- 				<tr>
					<th>주 문 날 짜</th>
					<td><%= today %></td>
				</tr> --%>
	
				<tr>
					<th>매 장 명</th>
					<td>${selectmenu.sName}</td>
				</tr>
				<tr>
					<th>메 뉴 명</th>
					<td><input type="hidden" name="mNum" value="${selectmenu.mNum}">
						${selectmenu.mName}
						<c:if test="${selectmenu.hotice_option eq 'CAHT'}">
							( HOT )
						<input type="hidden" name=hotice_option value="CAHT">
						</c:if>
						<c:if test="${selectmenu.hotice_option eq 'CAIC'}">
							( ICE )
						<input type="hidden" name=hotice_option value="CAIC">
						</c:if>
					</td>

				</tr>
				<tr>
					<th>옵션</th>
					<td>				
						<c:forEach items="${option}" var="option"> 
							<c:forEach items="${selectmenu.cuoptionlist}" var="select">
								<c:if test="${option.stNum eq select}">
									
									<input type="checkbox" class="checkoption" id="${option.recipeno}" name="optionlist" value="${option.recipeno}" checked="checked">
									<label for="${option.recipeno}">${option.opName}(${option.opPrice})</label>
									<input type="hidden" id="price${option.recipeno}" value="${option.opPrice}"><br>
									<c:set var="check" value="O"/>
								</c:if>
								
							</c:forEach>
							<c:if test="${check != 'O'}">
								
									<input type="checkbox" class="checkoption" id="${option.recipeno}" name="optionlist" value="${option.recipeno}">
									<label for="${option.recipeno}">${option.opName}(${option.opPrice})</label>
									<input type="hidden" id="price${option.recipeno}" value="${option.opPrice}"><br>
							</c:if>
							<c:remove var="check"/>
						</c:forEach>

					 </td>
				</tr>
				<tr>
					<th>금 액</th>
					<td><input id="price" value="${selectmenu.mPrice}" size="2" readonly> &nbsp;&nbsp;
						<button type="button" onclick="add(1)">+</button> <input name="oQty" size="1" value="${selectmenu.orderqty}" readonly>
						<button type="button" onclick="add(-1)">-</button></td>
				</tr>
				
				
				
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
					<td><input name="total" value="${selectmenu.totalPrice}" readonly></td>
				</tr>
			</table>

			<br>
			<div>
				<div align="right">
					<button type="submit" id="orderbtn" class="btn btn-default ">주문하기</button>
					&nbsp;&nbsp; <a href="javascript:history.go(-1)"
						class="btn btn-default ">돌아가기</a>
				</div>
				
			</div>
			</form>
		</div>


</body>
</html>