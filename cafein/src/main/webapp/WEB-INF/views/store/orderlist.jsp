<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Insert title here</title>
</head>
<script>
	
	$(function(){
		getstoreorderlist();
	});

	// 주문번호
	var ordernum ="";
	
	// 주문번호의 메뉴번호
	var ordermnum="";
	
	// 승인 버튼 클릭 시 모달창 띄우기
	function apply(ordern){
		console.log(ordern);
		event.stopPropagation();
		$('#applyordernumber').val(ordern);
		$('#applyemodal').modal('show');
		
	}
	
	// 승인 모달창에서 승인 할 경우
	function applyorder(){
		
		var ordern = $('#applyordernumber').val();
		var taketime = $('select[name="takeTime"]').val();
		$.ajax({
			url: 'updateorderapply',
			type:'POST',
			data: {oNum : ordern , takeTime: taketime},
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){
				if(data == 1){
					alert("주문번호 : "+ordern+" 를 승인하셨습니다.");
				}
				
				getstoreorderlist();
			}
			
		});
	}
	
	// 거절 버튼 클릭 시 모달창 띄우기
	function refuse(ordern){
		event.stopPropagation();
		console.log(ordern);
		$('#cancelordernumber').val(ordern);
		$('#refusemodal').modal('show');
	}
	  
	// 거절 모달창에서 거절버튼 클릭시 DB update
	function cancelorder(){
		var ordern = $('#cancelordernumber').val(); //
		var cancelreason = $('input:text[name="refuseReason"]').val();
		var sId = '<%= session.getAttribute("sId") %>';
		$.ajax({
			url: 'updateordercancel',
			type:'POST',
			data: {oNum : ordern , refuseReason: cancelreason,sId:sId},
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){
				alert("주문번호 : "+ordern+" 를 거절하셨습니다.");
				getstoreorderlist();
			}
			
		});
	}
	
	// 옵션 내용 지우기
	function delterow(ordern){
		
		$("#op_tr"+ordern).empty();
	}
	
	// 주문 번호 클릭시 나오는 옵션들
	function menudetail(order_n){
		var sId = '<%= session.getAttribute("sId") %>';
		var menunum="";
		
		var test="";
		
		$.ajax({
			url: 'getstoreordermenuoptionlist',
			type:'GET',
			data: {sId: sId , oNum: order_n},
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){
				// 같은 정보가 또 추가되는 것을 막기 위해서 비우기
				console.log(data);
				$("#op_tr"+order_n).empty();
				
				// 옵션이 없을 경우
				if(data.length == 0){ 
				
					$('#table'+order_n).after($('<tr>').attr("class","optiontable").attr("id","op_tr"+order_n)
							.append($('<td>').html("해당 메뉴에는 옵션이 없습니다.").attr("colspan","6"))
							.append($('<button>').attr({
								type:"button",
								onclick:"delterow('"+order_n+"')"
							}).append("Close"))
							);	
						
				}else{ //있을 경우
					var menu_qty="0";
					$.each(data,function(idx,item){
						console.log(idx);
						if(menunum == ""){
							menunum = item.oDnum;
							test = item.mName+"-";
							menu_qty="0";
						}
						if(menunum == item.opDnum){
							if(menu_qty == "0" && item.oQty != "0"){
								test = test+"( "+item.oQty+" )개 - ";
								menu_qty=item.oQty;
							}
							test = test +" "+ item.opName;
							console.log("--- "+test);
							
						}
						if(menunum != item.opDnum){
							menunum = item.oDnum;
							menu_qty="0";
							test = test + "<br>" +item.mName+"-";
							test = test +" " +item.opName;
							console.log(test);
						}
					}); 
				
					$('#table'+order_n).after($('<tr>').attr("class","optiontable").attr("id","op_tr"+order_n)
							.append($('<td>').html(test).attr("colspan","6"))
							.append($('<button>').attr({
								type:"button",
								onclick:"delterow('"+order_n+"')"
							}).append("Close"))
					);	
				}
			}
		});
	}
	
	
	function getstoreorderlist(){
		
		var sId = '<%= session.getAttribute("sId") %>';
		$('#orderlisttable tbody').empty();
		$.ajax({
			url: 'getstoreorderlist',
			type:'GET',
			data: {sId: sId},
			dataType:'json',
			async: false,
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				
				//console.log(data);
				$('#orderlisttable tbody').empty();
				$.each(data,function(idx,item){
					
					if(item.cAdd == null) item.cAdd="";
					if(item.cAdd3 == null) item.cAdd3 = "";
					if(item.payMethod == 'card') item.payMethod="카드결제";
					if(item.payMethod == 'cash') item.payMethod="현금결제";
					if(item.receipt == 'delivery') item.receipt="배달";
					if(item.receipt == 'takeout') item.receipt="직접 수령";
					
					
					getorderdetails(item);
					
					
					
				});
			}
		});
		
	}
	
	function getorderdetails(item){
		var ordernumber = item.oNum;
		var ordermnum = item.mNum;
		var ordermenuname = item.mName;
		var orderopdnum = item.opDnum;
		var deliverstatus;
		
		//console.log(item);
		$.ajax({
			url: 'getstoreorderdetails',
			type:'GET',
			data: {oNum: ordernumber, mNum: ordermnum, opDnum: orderopdnum},
			dataType:'json',
			async: false,
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				
				// 수량 저장
				var oQty;
			
				// 옵션 정보 저장
				var option;
				option ="";
				
				if(data.length == 0){
					oQty = "0";
				}else{
					$.each(data,function(idx,list){
						 if( list.oQty != 0){
							 oQty = list.oQty;
						 }
						if(list.opName == null){
							list.opName="";
						}
	
						option = option+" "+list.opName;	
					});	 
				}
				
				
				if(item.deliveryStatus == 'C0') deliverstatus="주문확인";
				if(item.deliveryStatus == 'C1') deliverstatus="배달준비";
				if(item.deliveryStatus == 'C1' && item.receipt == '직접 수령') deliverstatus="메뉴 준비 ( web - 직접 수령 )";

				if(item.deliveryStatus == 'C3') deliverstatus="배달완료";
				if(item.deliveryStatus == 'C3' && item.receipt == '직접 수령') deliverstatus="주문 완료 ( web - 직접 수령 )";
				
				if(item.deliveryStatus == 'C4') deliverstatus="주문취소"; 
				if(item.deliveryStatus == 'C5') deliverstatus="POS 결제"; 
				if(item.deliveryStatus == 'C6') deliverstatus="POS 환불"; 
				
				//console.log(item.oNum+"  "+item.receipt+" : "+deliverstatus);
				
				if(ordernum == ""){
					ordernum = item.oNum;
					$('<tr>').attr({
						onclick:"menudetail('"+item.oNum+"')",
						id: "table"+item.oNum
					})
					.append($('<td>').html(item.oNum))
				//	.append($('<td>').attr("id",""+item.oNum+"").html(item.mName+"-"+ oQty +"개-("+option+")"))
					.append($('<td>').attr("id",""+item.oNum+"").html(item.mName+"("+ oQty +"개)"+option))
					.append($('<td>').html(item.total))
					.append($('<td>').html(item.payMethod))
					.append($('<td>').html(item.receipt))
					.append($('<td>').html(item.cAdd+" "+item.cAdd3))
					.append($('<td>').html(deliverstatus))
					.append($('<td>').append($('<button>').attr({
															type:"button",
															onclick:"apply('"+item.oNum+"')",										
															class: item.deliveryStatus
															}).append("승인") ))
					.append($('<td>').append($('<button>').attr({ 
															type:"button",
															onclick:"refuse('"+item.oNum+"')",								
															class: item.deliveryStatus
															}).append("거절") ))
					.appendTo('#orderlisttable tbody');
					
				}else{
					// 그 전 데이터의 주문번호와 지금 주문번호가 같으면
					if(ordernum == item.oNum){
						//var after = item.mName+"-"+ oQty +"개-("+option+")";
						var after = "<br>"+item.mName+"("+ oQty +"개)"+option;
						var before = $('#'+ordernum).html();
						before = before +","+after;
						$('#'+ordernum).html(before);
					}else if(ordernum != item.oNum){ // 다르면
						ordernum = item.oNum;
						ordermnum= item.mNum;
						$('<tr>').attr({
							onclick:"menudetail('"+item.oNum+"')",
							id: "table"+item.oNum
						})
						.append($('<td>').html(item.oNum))
						//	.append($('<td>').attr("id",""+item.oNum+"").html(item.mName+"-"+ oQty +"개-("+option+")"))
						.append($('<td>').attr("id",""+item.oNum+"").html(item.mName+"("+ oQty +"개)"+option))
						.append($('<td>').html(item.total))
						.append($('<td>').html(item.payMethod))
						.append($('<td>').html(item.receipt))
						.append($('<td>').html(item.cAdd+" "+item.cAdd3))
						.append($('<td>').html(deliverstatus))
						.append($('<td>').append($('<button>').attr({
																type:"button",
																onclick:"apply('"+item.oNum+"')",									
								 								class: item.deliveryStatus
																}).css("display","none")
																.append("승인") ))
						.append($('<td>').append($('<button>').attr({
																type:"button",
																onclick:"refuse('"+item.oNum+"')",										
																class: item.deliveryStatus
																}).css("display","none")
																.append("거절") ))
						.appendTo('#orderlisttable tbody');
					}
					
				}
				 
				
				$('.C0').css({ // 주문 대기
					display:"inline"
				});
				
				$('.C1').css({ // 베달 대기
					display:"none"
				});
				
				$('.C3').css({ //배달완료
					display:"none"
				});
				 
				$('.C4').css({ // 주문 취소
					display:"none"
				});
				 
				$('.C5').css({ // 현장 결제
					display:"none"
				});	
			}
		});
	}
	// 날짜 검색
	function searchDate(){
		var startDate = jQuery('#storeorderstartdate').val();
  		var endDate = jQuery('#storeorderenddate').val();
  		
  		
  		if(startDate > endDate){
  			alert('검색 날짜를 확인해주세요.');
  			return;
  		}else if(startDate == '' || endDate == ''){
  			alert('날짜를 입력해주세요.');
  			return;
  		}
  		console.log("startDate : "+ startDate);
  		console.log("endDate : "+ endDate);
  		var sId = '<%= session.getAttribute("sId") %>';
		$('#orderlisttable tbody').empty();
		$.ajax({
			url: 'getstoreorderlist',
			type:'GET',
			data: {sId: sId, startDate: startDate, endDate: endDate},
			dataType:'json',
			async: false,
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				
				$('#orderlisttable tbody').empty();
				$.each(data,function(idx,item){
					
					if(item.cAdd == null) item.cAdd="";
					if(item.cAdd3 == null) item.cAdd3 = "";
					if(item.payMethod == 'card') item.payMethod="카드결제";
					if(item.payMethod == 'cash') item.payMethod="현금결제";
					if(item.receipt == 'delivery') item.receipt="배달";
					if(item.receipt == 'takeout') item.receipt="직접 수령";
					
					
					getorderdetails(item);
					
					
					
				});
			}
		});
  		
	}

</script>
<body>
<hr>
<div class = "container" align = "center">
	<h2 align="center">주문 내역</h2>
	<hr>	
</div>
<div class = "container" align = "center">
  
    <div align="right">

    <input type="date" class="btn btn-secondary" name="storeorderstartdate" id="storeorderstartdate">~
    <input type="date" class="btn btn-secondary" name="storeorderenddate" id="storeorderenddate">
    <input type="button" class="btn btn-success" onclick="searchDate()" value="조회">
    <input type="button" class="btn btn-success" onclick="getstoreorderlist()" value="초기화">
    </div>


		<table id="orderlisttable" class="table table-hover">

			<thead>
				<tr>
					<th>주문번호</th>
					<th>주문 메뉴</th>
					<th>총 금액</th>
					<th>결제방식</th>
					<th class="delivery">수령 방식</th>
					<th class="delivery">배달위치</th>
					<th class="delivery">배달상태</th>
					<th>승인</th>
					<th>거절</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>

	<!-- 승인  Modal -->
	<div class="modal fade" id="applyemodal" role="dialog">
		<div class="modal-dialog">		
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" align="center">승인</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<form class="form-borizontal" >
						<input class="form-control" id="applyordernumber" type="text" style="display: none;">
						<div class="table-responsive">
						<table class="table">
							
							<tr> 
								<th>소요시간</th>
								<td>
									<select name="takeTime">
									  <option value="30">30분</option>
									  <option value="40">40분</option>
									  <option value="50">50분</option>
									  <option value="60">60분</option>
									</select>
								</td>
							</tr>
							
						</table>
						</div>
					</form>
				
				</div>
				<div class="modal-footer">		
					<button type="button" class="btn btn-outline-primary" onclick="applyorder()" data-dismiss="modal">승인</button>
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 거절  Modal -->
	<div class="modal fade" id="refusemodal" role="dialog">
		<div class="modal-dialog">		
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" align="center">거절</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<form class="form-borizontal">
						<input class="form-control" id="cancelordernumber" type="text" style="display: none;">
						<div class="table-responsive">
						<table class="table">
							
							<tr> 
								<th>거절사유</th>
								<td>
									<input type="text" name="refuseReason">
								</td>
							</tr>
							
						</table>
						</div>
					
				
				</form>
				</div>
				<div class="modal-footer">		
					<button type="button" class="btn btn-outline-primary" onclick="cancelorder()" data-dismiss="modal">거절</button>
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
				
			</div>
		</div>
	</div>
</div>
	
	
	
</body>
</html>