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

table tbody tr td,
.table td{
	text-align: left;
 
} 

tableth{
width: 50p;
}

</style>
<script type="text/javascript">
	var price = 4100;
	var no = 1;
	
	var customerAdd;
	var checklogin = "<%=(String) session.getAttribute("cId")%>";
	
	// 거리를 구하기 위해서 좌표를 저장하는 변수
	var searchLine;
	
	// 기준이 되는 매장 좌표
	var searchPostion;
	
	// 사용자가 입력한 주소가 매장과의 거리를 계산하여 배달이 가능한 지역인지 확인용도
	var deliverycheck=false;
	
	//주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
	
	$(function(){

		getstoremileageservice();
		getstoredeliverservice();
		
	});

	function add(num) {
		//var price = $("input:text[name='price']").val();
		//optionlist
		var price = $("#price").val();
		var v_totalprice = $("input:text[name='total']").val();
		
		var no = $("input:text[name='oQty']").val();
		var sum_optionprice=0;
		
 		$("input[name=optionlist]:checked").each(function() {
			var test = $(this).val(); 

			var recipeno = $('#price'+test).val();

			sum_optionprice =Number(sum_optionprice)+ Number(recipeno)*(Number(no)+Number(num));

		}); 
		console.log("옵션*구매갯수 합계"+sum_optionprice);
		if (num == -1) {
			if (Number(no) == 1) {
				alert("1개 이상으로 주문해주세요.");
				return;
			}
			no = Number(no) - 1;
			v_totalprice = Number(price)*Number(no) + Number(sum_optionprice);
		} else if (num == 1) {
			no = Number(no) + 1;
			v_totalprice = Number(price)*Number(no) + Number(sum_optionprice);
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
					$('#deliveryaddress').hide();					
				}else{
					$('.deliverN').show();
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
					$("input:text[name='mileageservice']").val('N');
					$('#reservetr').hide();
				}else{
					$("input:text[name='mileageservice']").val('Y');
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
	
	// 거리 계산을 위하여
    function setSearchLine(searchpostion){
	   	searchLine = new kakao.maps.Polyline({
	
	       	path: [searchpostion]
	       	
	       });
    }
	
    // DB정보로 거리 계산 3
    function getDBStoreDistance(sid,sname,saddress){
    	// 주소로 좌표를 검색합니다
    	geocoder.addressSearch(saddress, function(result, status) {
	    	console.log("for문 안 ge "+saddress);
	    	
	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {
	
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	            console.log(saddress+'  : '+coords);
	            // 거리 계산
	            var path= searchLine.getPath();
	            path.push(coords);
	            searchLine.setPath(path);
	            
	            var distance = Math.round(searchLine.getLength());
	            console.log(sname+' 거리  : '+distance+"m");
	           
	            if(distance < 300){
	            	alert('배달 가능 지역입니다');
	            	deliverycheck=true;
	            	$('#deliveryaddress').show();
	            	$('#delivery').prop("checked", true);
	            	$('#orderbtn').attr('disabled',false);
	            	
	            }else{
	            	alert('현재 설정된 주소에서는 배달 서비스가 되지 않습니다.');
	            	deliverycheck=false;
	            	//$('#delivery').removeAttr("checked");
	            	$('#deliveryaddress').hide();
	            	$('#dtakeout').prop("checked", true);
	            	$('#orderbtn').attr('disabled',false);
	            	
	            	$('input:text[name="cAdd"]').val("");
					$('input:text[name="cAdd2"]').val("");
	            	
	            }
	            
	            // 다른 매장과 거리 계산을 위해 초기화
	            searchLine.setMap(null);
	        	searchLine = null;
	        	
	        	// 기준 매장 주소를 다시 넣는다.
	            setSearchLine(searchPostion);
	        } 
	    }); 
    }
	
	
 // 현재 선택된 매장 주소와 거리 계산 2
    function getstorelist(){
    	var v_storeId = $("#storeid").val();
		$.ajax({
			url:'getorderstoreaddress',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			data:{sid: v_storeId},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){
				getDBStoreDistance(data.sid,data.sname,data.sadd);
			}
		});
    }
	
	// 고객 주소 가져오기 위한 함수 1
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
			
				geocoder.addressSearch(data.cAdd, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        searchPostion = new daum.maps.LatLng(result.y, result.x);
                        
                             	        	
                        
                        // 거리 계산을 위해서 설정.
                        setSearchLine(searchPostion);  
                        
                        // 선택한 매장 위치 기준.
                        getstorelist();
                    }
                });
				if(deliverycheck){
					
					$('input:text[name="cAdd"]').val(customerAdd);
					$('input:text[name="cAdd2"]').val(data.cAdd2);
					$('input:text[name="cAdd3"]').val(data.cAdd3);	
				}
			}
		}); 
		
		
		
	}
	


	
	$(function(){

		
		 // 옵션 선택시
	  	$(".checkoption").change(function(){//oQty
	  		var optionprice = $("#price"+$(this).val()).val();
	  		console.log($(this).val());
	  		console.log(optionprice);
	  		var v_totalprice =  $("input:text[name='total']").val();
	  		var v_qty = $("input:text[name='oQty']").val();
	  		
	  		
	  		if($(this).is(":checked")){
					v_totalprice = Number(v_totalprice)+Number(optionprice)*Number(v_qty);
			}else{
				v_totalprice = Number(v_totalprice) - Number(optionprice)*Number(v_qty);
			}
	  		 $("input:text[name='total']").val(v_totalprice);

	  	});
		 
		// 새 주소로 주문
		$("#changeAdd").on("click",function(){
			 new daum.Postcode({
			        oncomplete: function(data) {
			        	var addr = data.address; 
			        	var addr2 = data.zonecode;
			        	
			        	// 주소로 상세 정보를 검색
		                geocoder.addressSearch(data.address, function(results, status) {
		                    // 정상적으로 검색이 완료됐으면
		                    if (status === daum.maps.services.Status.OK) {

		                        var result = results[0]; //첫번째 결과의 값을 활용

		                        // 해당 주소에 대한 좌표를 받아서
		                        searchPostion = new daum.maps.LatLng(result.y, result.x);
		                        
		                    
		        	        	
		                        
		                        // 거리 계산을 위해서 설정.
		                        setSearchLine(searchPostion);  
		                        
		                        // db에서 기준 매장 도시이름으로 검색
		                        getstorelist();
		                    }
		                });

	                	$('input:text[name="cAdd"]').val(data.address);
						$('input:text[name="cAdd2"]').val(data.zonecode);
			        		        	
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
		$('input[name="receipt"]').change(function() {
		    // 모든 radio를 순회한다.
		    if( $('input[name="receipt"]:checked').val() == 'takeout'){
		    	//$('#delivery').removeAttr("checked");
		    	$('#orderbtn').attr('disabled',false);
            	$('#dtakeout').prop("checked", true);
		    	$('#deliveryaddress').hide();
		    }else{
		    	//$('#dtakeout').removeAttr("checked");
		    	$('#orderbtn').attr('disabled','disabled');
            	$('#delivery').prop("checked", true);
		    	$('#deliveryaddress').show();
		    }
		});

/* 		$('#dtakeout').click(function() {
			$('#deliveryaddress').hide();
		});
		
		$('#delivery').click(function() {
			$('#deliveryaddress').show();
		}); */
		//$('#deliveryaddress').show();
	});
	

	function menuorder(){
		// 소켓 연결
		
		document.orderform.submit();
	}
</script>
</head>
	<body>	
		<div class="container">
		<hr>
		<div class="titlefont" align="center">주 문</div>
		<hr>
		
		<form class="form-borizontal" id="orderform" name="orderform" action="insertcustomerorder" method="POST" >
			<input id="storeid" value="${selectmenu.sId}" name="sId" style="display: none" >
			<input id="cid" value="${selectmenu.cId}" name="cId" style="display: none" >
			<input  value="${selectmenu.cId}" name="mileageservice" style="display: none" >
			
			<div align="center">
			<div class=”table-responsive“>
			
			<table class="table"> 
			
<!-- 				<tr>
					<th>주 문 번 호</th>
					<td>(주문코드)OR20190617001)</td>
				</tr> -->
<%-- 				<tr>
					<th>주 문 날 짜</th>
					<td><%= today %></td>
				</tr>  --%>
	
				<tr>
					<th class="tableth">매 장 명</th>
					<td>${selectmenu.sName}</td>
				</tr>
				<tr>
					<th class="tableth">메 뉴 명</th>
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
					<th class="tableth">옵션</th>
					<td>				
						<c:forEach items="${option}" var="option"> 
							<c:forEach items="${selectmenu.cuoptionlist}" var="select">
								<c:if test="${option.stNum eq select}">
									
									<input type="checkbox" class="checkoption checkbox" id="${option.recipeno}" name="optionlist" value="${option.recipeno}" checked="checked">
									<label for="${option.recipeno}">${option.opName}(${option.opPrice})</label>
									<input type="hidden" id="price${option.recipeno}" value="${option.opPrice}"><br>
									<c:set var="check" value="O"/>
								</c:if>
								
							</c:forEach>
							<c:if test="${check != 'O'}">
								
									<input type="checkbox" class="checkoption checkbox" id="${option.recipeno}" name="optionlist" value="${option.recipeno}">
									<label for="${option.recipeno}">${option.opName}(${option.opPrice})</label>
									<input type="hidden" id="price${option.recipeno}" value="${option.opPrice}"><br>
							</c:if>
							<c:remove var="check"/>
						</c:forEach>

					 </td>
				</tr>
				<tr>
					<th class="tableth">금 액</th>
					<td><input id="price" value="${selectmenu.mPrice}" size="4" readonly> &nbsp;&nbsp;
						<button type="button" class="btn btn-outline-dark btn-sm" onclick="add(1)">+</button> <input name="oQty" style="text-align: center;" size="1" value="${selectmenu.orderqty}" readonly>
						<button type="button" class="btn btn-outline-dark btn-sm" onclick="add(-1)">-</button></td>
				</tr>
				
				
				
				<tr id="reservetr" style="display: none;">
					<th class="tableth">적립금</th>
					<td><input type="text" name="mileage" id="insertmileage" size="10" value="0">
						<button type="button" class="btn btn-outline-primary" id="reservebtn">사용</button>
						<button type="button" class="btn btn-outline-danger" id="reservecancelbtn">취소</button>
						<br>현 적립금 : <span id="usermileage"></span>
						<p id="usermileageinfo" style="color: blue;">100단위로 사용가능합니다</p>
					</td>
				</tr>
				
					<tr class="deliverY" style="display: none;">
						<th class="tableth">수 령 방 식</th>
						<td>
							<input type="radio" class="checkbox" name="receipt" value="delivery" id="delivery" > 
							<label for="delivery">배달로하기</label> 
							 <br>
							<input type="radio" class="checkbox" name="receipt" value="takeout" id="dtakeout" checked="checked"> 
							<label for="dtakeout">직접받아가기</label>
						</td>
					</tr>
					<tr class="deliverN" style="display: none;">
						<th class="tableth">수 령 방 식</th>
						<td>					
							<input type="radio" name="receipt" value="takeout" id="takeout" checked="checked" > 
							<label for="takeout">직접 수령</label>
						</td>
					</tr>
				
					<tr class="deliverY" id="deliveryaddress" style="display: none;">
						<th class="tableth">배 달 주 소</th>
						<td>
							<input type="text"  placeholder="우편번호" name="cAdd2" readonly="readonly" > <br>
							<input type="text" name="cAdd" style="width: 500px;" placeholder="주소" readonly="readonly">	<br>
							<input type="text" name="cAdd3" style="width: 500px;" placeholder="상세 주소 입력"> <br>					
							<button type="button" class="btn btn-outline-success" onclick="getCostomerInfo()">현 주소로하기</button>
							<button type="button" class="btn btn-outline-info" id="changeAdd" >새	주소로하기</button>
						</td>
					</tr>				
				
				<tr>
					<th class="tableth">결 제 방 식</th>
					<td><input type="radio" name="payMethod" value="card" id="card"
						checked> <label for="card">카드 결제</label></td>
				</tr>
				<tr>
					<th class="tableth">총 금 액</th>
					<td><input name="total" value="${selectmenu.totalPrice}" readonly></td>
				</tr>
			</table>
			</div>
			</div>
			<br>
			<div>
				<div align="right">
					<button type="button" id="orderbtn" onclick="menuorder()" class="btn btn-outline-primary">주문하기</button>
					&nbsp;&nbsp; <a href="javascript:history.go(-1)"
						class="btn btn-outline-danger ">돌아가기</a>
				</div>
				
			</div>
			</form>
		</div>

</body>
</html>