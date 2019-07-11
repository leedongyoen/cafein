<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>
<title>주문 목록</title>
</head>
<script>

	$(function(){
		getOrderList();
	});
	
	function getOrderList(){
		var checklogin = "<%=(String) session.getAttribute("cId")%>";
		var orderdate;
		$.ajax({
			url:'orderlist/'+checklogin,
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				$("#orderlist tbody").empty();
				
				$.each(data,function(idx,item){
					console.log(item.oDate);
					orderdate= new Date(item.oDate);
					if(item.payMethod == 'crd')
						item.payMethod = '카드';
					$('<tr>').attr("onclick","orderDetail('"+item.oNum+"')")//.addClass("openmodal")
					.append($('<td>').html(item.oNum))
					.append($('<td>').html(orderdate.toLocaleDateString()))
					.append($('<td>').html(item.sName))
					.append($('<td>').html(item.total+'원'))
					.append($('<td>').html(item.payMethod))
					.appendTo('#orderlist tbody');
				});
			} 
		});
	}
	
	function orderDetail(ordernum){
		$("#orderdetailmodal").modal('show');
	}
	

</script>
<body>
	<form action="updateBoard.do" method="post">
		<h2 align="center">주문 목록</h2>
		<br>
		<br>
		<div class="container">
			<p align="right">
				<b>등록순</b> <select name="선택">
					<optgroup>
						<option value="1" selected>일주일 이내</option>
						<option value="2">1개월 이내</option>
						<option value="3">3개월 이내</option>
						<option value="4">6개월 이내</option>
					</optgroup>
				</select>
			</p>
			<hr>

			<table id="orderlist" class="table table-hover">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문날짜</th>
						<th>매장명</th>
						<th>총 금액</th>
						<th>결제 방식</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>

			<hr>
			<br>
		</div>
		</form>
		
		
		
		<!-- 주문 상세  Modal -->
	<div class="modal fade" id="orderdetailmodal" role="dialog">
		<div class="modal-dialog">		
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
								<th>주문번호</th>
								<td></td>
							</tr>
							
							<tr>
								<th>매장명</th>
								<td></td>
							</tr>
							
							<tr>
								<th>메뉴명</th>
								<td></td>
							</tr>
							
							<tr>
								<th>수량</th>
								<td></td>
							</tr>
							
							<tr>
								<th>총 금액</th>
								<td></td>
							</tr>
							<tr>
								<th>결제 방식</th>
								<td></td>
							</tr>
						</table>
						</div>
					</form>
				
				</div>
				<div class="modal-footer">		
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>