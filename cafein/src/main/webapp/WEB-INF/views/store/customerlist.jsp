<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>

<title>우리매장 고객</title>

<script>

	$(function(){
		customerList();
		
		
		$("#customerTable tbody tr").click(function(){
			$('#toggleTable').show();
			
		})
	});
	
	
	//매장 고객 리스트 요청
	function customerList(){
		var storelogin = '<%=session.getAttribute("sId")%>';
		console.log(storelogin);
 		$.ajax({
 			url : 'allcustomerlist',
			type : 'GET',
			dataType : 'json',
			data: {sId: storelogin},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:customerListResult
			
		}); 
	}
	//매장 고객리스트 받아오기
	function customerListResult(data){
		$("#customerTbody").empty();
		console.log(data);
		$.each(data,function(idx, user){
				$('<tr>').attr("onclick","customerSelect('"+user.cId+"')")
						.append($('<td>').html(user.cId))
						.append($('<td>').html(user.cName))
						.append($('<td>').val(user.cId))
						.appendTo('#customerTbody');
					
		});
					
	}
	//매장 고객 단건 조회 요청
	function customerSelect(cId){
		var storelogin = '<%=session.getAttribute("sId")%>';
		$('#toggleTable').show();
		console.log(cId);
		$.ajax({
			url : 'getcustomerdetail/' + cId + '/' + storelogin,
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : customerSelectResult
		});
	}
	// 매장 고객 단건조회 결과 뿌리기
	function customerSelectResult(data) {
		$('input:text[name="cId" ]').val(data.cId);
		$('input:text[name="cNick"]').val(data.cNick);
		$('input:text[name="cName"]').val(data.cName);
		$('input:text[name="cTel"]').val(data.cTel);
		$('input:text[name="cAdd"]').val(data.cAdd);
		$('input:text[name="cJoin"]').val(data.cJoin);
		$('input:text[name="mileage"]').val(data.mileage)
		
		history(data.cId);

	}//stockSelectResult
	//고객 구매이력 요청
	function history(cId){
		var storelogin = '<%=session.getAttribute("sId")%>';
		$('#c_history').show();
		console.log(cId);
		$.ajax({
			url : 'customerhistory/' + cId + '/' + storelogin,
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : historyResult
		});
	}
	//고객 구매이력 받아오기
	function historyResult(data) {
		
		$('#historyTbody').empty();
		console.log(data);
		
		let oNumArr 	= [];
		let ototalArr 	= [];
		
		var cId 		= "";
		var oNum 		= "";
		var mName 		= "총합";
		var total 		= 0;
		var payMethod 	= "";
		var receipt 	= "";
		
		$.each(data,function(idx, user){
			var isOverlap = false;
			for(var i = 0; i < oNumArr.length; ++i){
				if(oNumArr[i] == user.oNum){
					isOverlap = true;
					cId 		= user.cId;
					oNum 		= user.oNum;
					mName 		= "총합";
					total 		+= user.total;
					payMethod 	= user.payMethod;
					receipt 	= user.receipt;
					break;
				}
			}
			
			if(isOverlap == false){
				oNumArr.push(user.oNum);
				ototalArr.push(0);
				
				if(cId != ""){
					console.log("총합");
					$('<tr>')
					.append($('<td>').html(cId))
					.append($('<td>').html(oNum))
// 					.append($('<td>').html(user.gd))
					.append($('<td>').html(mName))
					.append($('<td>').html(total))
					.append($('<td>').html(payMethod))
					.append($('<td>').html(receipt))
					.append($('<td>').html())
					.appendTo('#historyTbody');
					
					cId 		= "";
					oNum 		= "";
					mName 		= "총합";
					total 		= 0;
					payMethod 	= "";
					receipt 	= "";
				}
			}
			
			for(var i = 0; i < oNumArr.length; ++i){
				if(oNumArr[i] == user.oNum){
					isOverlap = true;
					ototalArr[i] += user.total;
				}
			}
			
			$('<tr>')
					.append($('<td>').html(user.cId))
					.append($('<td>').html(user.oNum))
// 					.append($('<td>').html(user.gd))
					.append($('<td>').html(user.mName))
					.append($('<td>').html(user.total))
					.append($('<td>').html(user.payMethod))
					.append($('<td>').html(user.receipt))
					.append($('<td>').html())
					.appendTo('#historyTbody');
		});
		
		if(cId != ""){
			console.log("총합");
			$('<tr>')
			.append($('<td>').html(cId))
			.append($('<td>').html(oNum))
//				.append($('<td>').html(user.gd))
			.append($('<td>').html(mName))
			.append($('<td>').html(total))
			.append($('<td>').html(payMethod))
			.append($('<td>').html(receipt))
			.append($('<td>').html())
			.appendTo('#historyTbody');
		}
		
		console.log(oNumArr);
		console.log(ototalArr);
	}
</script>



</head>
<body>

	<div style="position: absolute; width: 100%">
		<div style="overflow: scroll; height: 800px; float: left; width: 30%;">
			<div class="container">
				<h2 align="center">우리 매장 고객</h2>
				<hr>
			</div>
			<div class="container" align="center">
				<table class="table table-hover" id="customerTable">

					<thead>
						<tr>
							<th>고객ID</th>
							<th>이름</th>

						</tr>
					</thead>
					<tbody id="customerTbody">
					</tbody>
				</table>
			</div>
		</div>

		<!--고객 상세 정보 -->
		<div style="overflow: scroll; height: 800px; float: left; width: 70%;"
			id="toggleTable">

			<div class="container">
				<h2 align="center">고객 상세</h2>
				<hr>
			</div>
			<div>
				<form id="form1">
					<table border="1" class="table table-hover">
						<tr>
							<th>ID</th>
							<td><input type="text" id="cId" name="cId" readonly></td>
						</tr>
						<tr>
							<th>NICKNAME</th>
							<td><input type="text" id="cNick" name="cNick" readonly></td>
						</tr>
						<tr>
							<th>NAME</th>
							<td><input type="text" id="cName" name="cName" readonly></td>
						</tr>
						<tr>
							<th>TEL</th>
							<td><input type="text" id="cTel" name="cTel" readonly></td>
						</tr>
						<tr>
							<th>address</th>
							<td><input type="text" id="cAdd" size=50 name="cAdd"
								readonly></td>
						</tr>
						<tr>
							<th>loginRoot</th>
							<td><input type="text" id="cJoin" name="cJoin" readonly></td>
						</tr>
						<tr>
							<th>MILEAGE</th>
							<td><input type="text" id="mileage" name="mileage" readonly></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="container">
				<h2 align="center">구매이력</h2>
				<hr>
			</div>
			<div>
				<table border="1" class="table table-hover" id="c_history">
					<thead>
						<tr>
							<th>ID</th>
							<th>주문번호</th>
<!-- 							<th>메뉴/옵션</th> -->
							<th>메뉴</th>
							<th>TOTALS</th>
							<th>결제방식</th>
							<th>수령방식</th>
						</tr>
					</thead>
					<tbody id=historyTbody>
					</tbody>
				</table>
			</div>

		</div>



	</div>

</body>
</html>