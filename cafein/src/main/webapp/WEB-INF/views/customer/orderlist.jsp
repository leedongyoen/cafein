<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>
<link rel="stylesheet" href="./css/orderlist.css" >
<title>주문 목록</title>
</head>
<script>

	$(function(){
		getOrderList();
	});
	
	function refuse(ordernum,sId){
		event.stopPropagation();
		if (confirm("정말 주문을 취소하시겠습니까??") == true){    //확인
		    console.log(ordernum,sId);
		    $.ajax({
				url:'updatecusordercancel',
				type:'GET',
				dataType:'json',
				data: {sId: sId, oNum: ordernum},
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:function(data){ 
					
					alert('주문 취소 되었습니다.');
					 getOrderList();
				} 
			});
		   
		}else{   //취소
			return false;
		}
	}
	
	function getOrderList(){
		var checklogin = "<%=(String) session.getAttribute("cId")%>";
		var orderdate;
		var controller = $('[name="controlllist"]').val(); 
		console.log(controller);
		$.ajax({
			url:'orderlist',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			data: {cId: checklogin, orderlistcontroller:controller},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				$("#orderlist tbody").empty();
				
				$.each(data,function(idx,item){

					orderdate= new Date(item.oDate);
					if(item.payMethod == 'card')
						item.payMethod = '카드';
					if(item.payMethod == 'cash')
						item.payMethod = '현금';
					if(item.receipt == 'takeout' && item.deliveryStatus == 'C3'){
						item.detailNm = '주문 완료 ( 직접 수령 )';
					}
					
					$('<tr>').attr("onclick","orderDetail('"+item.oNum+"')").attr("class","tr"+item.deliveryStatus)
					.append($('<td>').html(item.oNum))
					.append($('<td>').html(orderdate.toLocaleDateString()))
					.append($('<td>').html(item.sName))
					.append($('<td>').html(item.total+'원'))
					.append($('<td>').html(item.payMethod))
					.append($('<td>').html(item.detailNm))
					.append($('<td>').append($('<button>').attr({
															type:"button",
															onclick:"refuse('"+item.oNum+"','"+item.sId+"')",										
			 												class: item.deliveryStatus
				 											}).css("display","none")
															.append("결제 취소") ))
					.appendTo('#orderlist tbody');
				});
				
				$('.C0').css({
					display:"inline"
				});
				
				
			} 
		});
	}
	
	//주문 상세
	function orderDetail(ordernum){
		console.log(ordernum);
		$('#ordernum').html(ordernum);
		// 주문에 따른 옵션을 구별하기 위해서
		var v_oDnum = "";
		var v_mNum = "";
		var v_mName ="";
		var v_option ="";
		var v_hotice ="";
		var v_qty="";
		
		$('#orderstatusview').hide();
		$('#orderstatus').html("");
		$('#ordertaketime').hide();
		$('#taketime').html("");
		$('.postcancel').show();
		$('#postcancelnumber').html("주문번호");
		$.ajax({
			url:'getcustomerordermenudetail',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			async:false,
			data: {oNum :ordernum },
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				console.log(data);
				var total ="";
				$.each(data,function(idx,item){
					if(item.opName == null) item.opName=" ";
					// 처음 들어왔을때ㅣ
					if(v_oDnum == ""){
						v_oDnum = item.oDnum;
						v_mName = item.mName;
						if(item.caNum == 'CAIC' || item.caNum == 'CAHT' ){
							v_hotice = item.opName;							
						}else{ // 그 밖 옵션들
							v_option = v_option+" "+item.opName;
							v_qty = item.oQty;
						}
					}else if(v_oDnum == item.oDnum){ // 해당 메뉴의 옵션일 경우
						
						if(item.caNum == 'CAIC' || item.caNum == 'CAHT' ){
							v_hotice = item.opName;							
						}else{ // 그 밖 옵션들
							v_option = v_option+" "+item.opName;
							v_qty = item.oQty;
						}
					}else if(v_oDnum != item.oDnum){ // 다른 메뉴일 경우
						console.log("v_oDnum : "+v_oDnum+" v_mName : "+v_mName+" v_hotice : "+v_hotice+" v_option : "+v_option);
						total = total +(v_mName+"("+v_hotice+"/"+v_qty+"개)"+" - "+v_option+"<br>");
						v_oDnum = item.oDnum;
						v_mName = item.mName;
						v_option ="";
						if(item.caNum == 'CAIC' || item.caNum == 'CAHT' ){
							v_hotice = item.opName;							
						}else{ // 그 밖 옵션들
							v_option = v_option+" "+item.opName;
							v_qty = item.oQty;
						}
					}
				
					
				});
				console.log("v_oDnum : "+v_oDnum+" v_mName : "+v_mName+" v_hotice : "+v_hotice+" v_option : "+v_option);
				total = total +(v_mName+"("+v_hotice+"/"+v_qty+"개)"+" - "+v_option+"<br>");
				$('#orderdetail').html(total);
			} 
		});
		$.ajax({
			url:'getcustomeroderdetail',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			data: {oNum :ordernum },
			async:false,
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ 
				console.log(data);
				var delivery="";
				if(data.receipt == 'delivery') {
					if(data.cAdd3 == null) data.cAdd3= " ";
					if(data.cAdd == null) data.cAdd= " ";
					delivery="배달<br>주소 : "+data.cAdd+" "+data.cAdd3;
				}else if(data.receipt == 'takeout'){
					delivery="직접 수령";
				}
				
				if(data.deliveryStatus == 'C4'){
					$('#orderstatusview').show();
					$('#orderstatus').html(data.refuseReason);
				}else if(data.deliveryStatus == 'C1' && data.receipt == 'delivery'){
					$('#ordertaketime').show();
					$('#taketime').html(data.takeTime+" 도착 예정");
				}else if(data.deliveryStatus == 'C1' && data.receipt == 'takeout'){
					$('#ordertaketime').show();
					$('#taketime').html(data.takeTime+" 준비 완료");
				}else if(data.deliveryStatus == 'C6'){
					$('.postcancel').hide();
					var ordernumber = $('#ordernum').html();
					$('#ordernum').html("주문 번호 : "+ordernumber);
					$('#postcancelnumber').html("환불");
				}
					
				
				$('#deliverydetail').html(delivery);
				$('#storename').html(data.sName);
				$('#price').html(data.total+"원");
			} 
		});
		
		$("#orderdetailmodal").modal('show');
	}
	

</script>
<body>
		<hr>
		<p align="center" class="titlefont">주문 목록</p>
		<hr>
		<div class="container">
			<form name="searchForm">
			<p align="right">
				<label class="selectlabel" for="select">
				<select name="controlllist" required="required" onchange="getOrderList()">
					<optgroup>
						<option value="7" selected>7일 이내</option>
						<option value="1">1개월 이내</option>
						<option value="3">3개월 이내</option>
						<option value="6">6개월 이내</option>
					</optgroup>
				</select>
				</label>
			</p>
			</form>
			<hr>

			<table id="orderlist" class="table table-hover ">
				<thead>
					<tr class="tableth">
						<th>주문번호</th>
						<th>주문날짜</th>
						<th>매장명</th>
						<th>총 금액</th>
						<th>결제 방식</th>
						<th>주문 상태</th>
						<th id="ordercancel">결제 취소</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>

			<hr>
			<br>
		</div>
	
		
		
		
		<!-- 주문 상세  Modal -->
	<div class="modal fade" id="orderdetailmodal" role="dialog">
		<div class="modal-dialog ">		
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">매장</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-borizontal" action="#">
						<div class="table-responsive">
						<table id="orderdetailtable" class="table">
						
							<tr>
								<th id="postcancelnumber">주문번호</th>
								<td id="ordernum"></td>
							</tr>
							<tr id="orderstatusview" style="display: none;">
								<th>주문 취소 사유</th>
								<td id="orderstatus"></td>
							</tr>
							<tr id="ordertaketime" style="display: none;">
								<th>소요 시간</th>
								<td id="taketime"></td>
							</tr>
	
							<tr>
								<th>매장명</th>
								<td id="storename"></td>
			
							</tr>
							
							<tr class="postcancel">
								<th>주문 내역</th>
								<td id="orderdetail"></td>
							</tr>
							
							<tr>
								<th>수령방식</th>
								<td id="deliverydetail"></td>
							</tr>
							
							<tr>
								<th>총 금액</th>
								<td id="price"></td>
							</tr>

						</table>
						</div>
					</form>
				
				</div>
				<div class="modal-footer">		
					<button type="button" class="btn modalbottom" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>