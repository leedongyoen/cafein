<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b402787b02c7003da0294158d1b3c1f8&libraries=services"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<style>
input {
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}

table tbody tr td,
.table td{
	text-align: left;
	background-color: #F2F2F2;
 
} 
body{ 
			background: url(image/cusstoreselect.jpg) no-repeat center center fixed; 
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
}

tableth{
width: 50p;
}

.table {
  width: 70%;
  margin-bottom: $spacer;
  color: $table-color;
  background-color: $table-bg;
}
  th,
  td {
    padding: $table-cell-padding;
    vertical-align: top;
    border-top: $table-border-width solid $table-border-color;
  }

  thead th {
    vertical-align: bottom;
    border-bottom: (2 * $table-border-width) solid $table-border-color;
  }

  tbody + tbody {
    border-top: (2 * $table-border-width) solid $table-border-color;
  }
}

</style>
<script>
var price = 4100;
var no = 1;

var customerAdd;
var checklogin = "<%=(String) session.getAttribute("cId")%>";

//거리를 구하기 위해서 좌표를 저장하는 변수
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
	
	var cart = '${cartListsmero}';
	var json = JSON.parse(cart);
	var totalPrice = 0;
	
	console.log(json);
	
	
	for(var c = 0;c<json.length;c++){
		console.log(json[c].cuoptionlist);
		
		var coplist = json[c].cuoptionlist;
		
			
		str = coplist.slice(0,-1);
		str = str.substring(1);
		var oplist = str.split(",");
		
		for(var t = 0;t<oplist.length;t++){
			
			oplist[t] = oplist[t].trim();
			$('input:checkbox[id="'+oplist[t]+'"]').attr("checked", true);
		}
		
		totalPrice = totalPrice + (json[c].totalPrice*1);
		
	}
	
	$('#total').val(totalPrice);
	$('#orderbtn').attr('disabled',false);
	$('#takeout').attr("checked","checked");
	
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

//거리 계산을 위하여
function setSearchLine(searchpostion){
   	searchLine = new kakao.maps.Polyline({

       	path: [searchpostion]
       	
       });
}


//현재 선택된 매장 주소와 거리 계산 2
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

function orderCartInsert(){

	var ordercart = $("#ordercartform").serializeObject();
	//alert(ordercart);

	console.log(JSON.stringify(ordercart));
  	$('[name="jsonData"]').val(JSON.stringify(ordercart));
  	
  	var sid=$('[name="sId"]').val();
	var type ="cusorder";
	send(type,sid);
  	
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



function oplistcheck(menuno){
	
	//var num = $("#span_"+menuno).html();
	//console.log(num);
	var allOpPrice = 0;
	
	$("input[name="+menuno+"]:checked").each(function() {
		
		var test = $(this).val(); 
		console.log("test: "+test);
		for(var t = 0;t<test.length;t++){
			
		var addNum = $("#span_"+test).html();
		//console.log("allOpPrice: "+addNum);
		allOpPrice = allOpPrice + (addNum*1);
			//var addNum = $("#orderprice"+test).val();
			//allPrice = allPrice + (addNum*1);
		}
		
		console.log("allOpPrice: "+ (allOpPrice/5));	
		
	});
	
	
}




//고객 마일리지 가져오기.
$(function(){
		
		
	 // 옵션 선택시
 /*   	$(".checkoption").change(function(){//oQty
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

  	}); */ 
	 
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
					console.log(data.zonecode);
                	$('input:text[name="cAdd"]').val(data.address);
					$('input:text[name="cAdd2"]').val(data.zonecode);
		        		        	
		        }
		    }).open();
	});
		
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
		
		$('input[name="receipt"]').change(function() {
			// radio 옮기면서 주소 지워놓기.
		    $('input:text[name="cAdd"]').val("");
			$('input:text[name="cAdd2"]').val("");
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
		
		
	});
	

$("#check_module").click(function () {
	alert('hey');
var IMP = window.IMP; // 생략가능
IMP.init('imp82928353');
// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
IMP.request_pay({
pg: 'kakao', // version 1.1.0부터 지원.
/*
'kakao':카카오페이,
html5_inicis':이니시스(웹표준결제)
'nice':나이스페이
'jtnet':제이티넷
'uplus':LG유플러스
'danal':다날
'payco':페이코
'syrup':시럽페이
'paypal':페이팔
*/
pay_method: 'card',
/*
'samsung':삼성페이,
'card':신용카드,
'trans':실시간계좌이체,
'vbank':가상계좌,
'phone':휴대폰소액결제
*/
merchant_uid: 'merchant_' + new Date().getTime(),
/*
merchant_uid에 경우
https://docs.iamport.kr/implementation/payment
위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
참고하세요.
나중에 포스팅 해볼게요.
*/
name: '주문명:결제테스트',
//결제창에서 보여질 이름
amount: 1000,
//가격
buyer_email: 'iamport@siot.do',
buyer_name: '구매자이름',
buyer_tel: '010-1234-5678',
buyer_addr: '서울특별시 강남구 삼성동',
buyer_postcode: '123-456',
//m_redirect_url: 'https://www.yourdomain.com/payments/complete'
/*
모바일 결제시,
결제가 끝나고 랜딩되는 URL을 지정
(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
*/
}, function (rsp) {
console.log(rsp);
if (rsp.success) {
var msg = '결제가 완료되었습니다.';
msg += '고유ID : ' + rsp.imp_uid;
msg += '상점 거래ID : ' + rsp.merchant_uid;
msg += '결제 금액 : ' + rsp.paid_amount;
msg += '카드 승인번호 : ' + rsp.apply_num;
} else {
var msg = '결제에 실패하였습니다.';
msg += '에러내용 : ' + rsp.error_msg;
}
alert(msg);
});
});
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
					 <input type="hidden" name="deletenum" value="${cartlist.qty}">
					
					 <font color=orange><b>${cartlist.mName}</b></font>
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
							${recipeList.opName}
							<input type="checkbox" value="${recipeList.recipeno}" id="${recipeList.recipeno}" name="${recipeList.mNum}"  onClick="oplistcheck(this.name)" class="checkoption">
							<span id = "span_${recipeList.recipeno}">${recipeList.opPrice}</span> 원
						
							<br>
						</c:if>
					</c:forEach>
					
					 </td>
				</tr>
				<tr>
					<th>금 액</th>
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
					<th>적 립 금</th>
					<td><input type="text" name="mileage" id="insertmileage" size="10" value="0">
						<button type="button" id="reservebtn">사용</button>
						<button type="button" id="reservecancelbtn">취소</button>
						<br>현 적립금 : <span id="usermileage"></span>
						<p id="usermileageinfo" style="color: blue;">100단위로 사용가능합니다</p>
					</td>
				</tr>
				
					<tr class="deliverY" style="display: none;">
						<th>수 령  방 식</th>
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
				
					<tr class="deliverY" id="deliveryaddress" style="display: none;">
						<th>배 달 주 소</th>
						<td>
							<input type="text" placeholder="우편번호" name="cAdd2" readonly="readonly" > <br>
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
					<td><input name="total" id = "total" readonly></td>
					
				</tr>
			</table>

			<br>
			<div>
				<div align="right">
					<button type="button" id="orderbtn" onclick="orderCartInsert()" class="btn btn-default ">주문하기</button>
					&nbsp;&nbsp; <a href="javascript:history.go(-1)"
						class="btn btn-default ">돌아가기</a>
						<!-- <button id="check_module" type="button">아임 서포트 결제 모듈 테스트 해보기</button> -->
					</div>
				</div>
			</form>
		</div>
	</body>
</html>