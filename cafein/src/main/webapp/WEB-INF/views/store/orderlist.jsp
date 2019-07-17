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
	
	
	function apply(ordern){
		console.log(ordern);
		// 승인 시
	}
	
	function refuse(ordern){
		// 거절시
		console.log(ordern);
	}
	
	
	function getstoreorderlist(){
		
		var sId = '<%= session.getAttribute("sid") %>';
		$('#orderlisttable tbody').empty();
		$.ajax({
			url: 'getstoreorderlist',
			type:'GET',
			data: {sId: sId},
			dataType:'json',
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
					if(item.deliveryStatus == 'C0') item.deliveryStatus="주문확인";
					if(item.deliveryStatus == 'C1') item.deliveryStatus="배달준비";
					if(item.deliveryStatus == 'C2') item.deliveryStatus="배달 중";
					if(item.deliveryStatus == 'C3') item.deliveryStatus="배달완료";
					
					getorderdetails(item);
					
					
					
				});
			}
		});
		
	}
	
	function getorderdetails(item){
		var ordernumber = item.oNum;
		var ordermnum = item.mNum;
		var ordermenuname = item.mName;
		//console.log(item);
		$.ajax({
			url: 'getstoreorderdetails',
			type:'GET',
			data: {oNum: ordernumber, mNum: ordermnum},
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				
				
				// 옵션 정보 저장
				var option;
				option ="";
				
				// 수량 저장
				var oQty;
				$.each(data,function(idx,list){
					
					oQty = list.oQty;
					option = option+" "+list.opName;						
				});	
			
				if(ordernum == ""){
					ordernum = item.oNum;
					$('<tr>')
					.append($('<td>').html(item.oNum))
					.append($('<td>').attr("id",""+item.oNum+"").html(item.mName+"-"+ oQty +"개-("+option+")"))
					.append($('<td>').html(item.total))
					.append($('<td>').html(item.payMethod))
					.append($('<td>').html(item.receipt))
					.append($('<td>').html(item.cAdd+" "+item.cAdd3))
					.append($('<td>').html(item.deliveryStatus))
					.append($('<td>').append($('<button>').attr({
															type:"button",
															onclick:"apply('"+item.oNum+"')"										
					
															}).append("승인") ))
					.append($('<td>').append($('<button>').attr({
															type:"button",
															onclick:"refuse('"+item.oNum+"')"										
					
															}).append("거절") ))
					.appendTo('#orderlisttable tbody');
					
				}else{
					// 그 전 데이터의 주문번호와 지금 주문번호가 같으면
					if(ordernum == item.oNum){
						var after = item.mName+"-"+ oQty +"개-("+option+")";
						var before = $('#'+ordernum).html();
						before = before +","+after;
						$('#'+ordernum).html(before);
					}else{ // 다르면
						ordernum = item.oNum;
						ordermnum= item.mNum;
						$('<tr>')
						.append($('<td>').html(item.oNum))
						.append($('<td>').attr("id",""+item.oNum+"").html(item.mName+"-"+ oQty +"개-("+option+")"))
						.append($('<td>').html(item.total))
						.append($('<td>').html(item.payMethod))
						.append($('<td>').html(item.receipt))
						.append($('<td>').html(item.cAdd+" "+item.cAdd3))
						.append($('<td>').html(item.deliveryStatus))
						.append($('<td>').append($('<button>').attr({
																type:"button",
																onclick:"apply('"+item.oNum+"')"										
						
																}).append("승인") ))
						.append($('<td>').append($('<button>').attr({
																type:"button",
																onclick:"refuse('"+item.oNum+"')"										
						
																}).append("거절") ))
						.appendTo('#orderlisttable tbody');
					}
					
				}
				
				
				
				
				
					
			}
		});
	}

</script>
<body>
<div class = "container" align = "center">
	<h2 align="center">주문 내역</h2>
	<hr>	
</div>
<div class = "container" align = "center">

<form id="" action="">
    
    <div align="right">
        날짜 입력:
    <input type="date" id="userdate" name="userdate"
                value="">~
    <input type="date" id="userdate" name="userdate"
                value="">
    <input type="submit" value="조회">
    </div>
	
</form>

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


	</div>
</body>
</html>