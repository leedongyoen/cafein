<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="storehead.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>재고 목록</title>
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="./js/json.min.js"></script>
<script type="text/javascript">
	$(function() {
		stockList();

		stockSelect();

		stockDelete();

		stockInsert();

		stockUpdate();

		init();
	});

	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click', function() {
			$('#form1').each(function() {
				this.reset();
			});
		});
	}//init

	//재고 삭제 요청
	function stockDelete() {
		//삭제 버튼 클릭
		$('body').on('click', '#btnCkStockDel', function() {
			var result = confirm("체크된 재고를 정말로 삭제하시겠습니까?");
			var ckStockDelete =  [];
			$('input[name=ckDelete]:checked').each(function(idx, item){
				ckStockDelete.push(item.value);
			});
// 				console.log(ckStockDelete);
			if (result) {
				$.ajax({
					url : 'stocks',
					type : 'DELETE',
					contentType : 'application/json;charset=utf-8',
					dataType : 'json',
					data : JSON.stringify({
						stNumList : ckStockDelete
						}),

					error : function(xhr, status, msg) {
						console.log("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success : function(data) {
// 						console.log(data.result);
						stockList();
					}
				});
			}//if
		}); //삭제 버튼 클릭
	}//stockDelete

	//재고 조회 요청
	function stockSelect() {
		//조회 버튼 클릭
		$('body').on('click', '#btnSelect', function() {
			var stNum = $(this).closest('tr').find('#hidden_stNum').val();
			//하나의 재고 요청
			$.ajax({
				url : 'stocks/' + stNum,
				type : 'GET',
				contentType : 'application/json;charset=utf-8',
				dataType : 'json',
				error : function(xhr, status, msg) {
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				},
				success : stockSelectResult
			});
		}); //조회 버튼 클릭
	}//stockSelect

	//재고 조회 응답
	function stockSelectResult(stock) {
		if (stock.stStatus == 'B1') {
			var stStatusResult = '충분'
		} else if (stock.stStatus == 'B2') {
			var stStatusResult = '부족'
		} else if (stock.stStatus == 'B3') {
			var stStatusResult = '없음'
		}

		$('input:text[name="stNum" ]').val(stock.stNum);
		$('input:text[name="sId"]').val(stock.sId);
		$('input:text[name="stName"]').val(stock.stName);
		$('input:text[name="stQty"]').val(stock.stQty);
		$('input:text[name="stAqty"]').val(stock.stAqty);
		$('input:text[name="stPrice"]').val(stock.stPrice);
		$('select[name="caNum"]').val(stock.caNum).attr("selected", "selected");
		$('input:text[name="stanUnit"]').val(stock.stanUnit);
		$('input:text[name="stStatus"]').val(stStatusResult);
		// 		$('input:text[name="truthQty"]').val(stock.truthQty);
	}//stockSelectResult

	//재고 수정 요청
	function stockUpdate() {
		//수정 버튼 클릭
		$('#btnUpdate').on('click', function() {
			var stNum = $('input:text[name="stNum"]').val();
			var sId = $('input:text[name="sId"]').val();
			var stName = $('input:text[name="stName"]').val();
			var stQty = $('input:text[name="stQty"]').val();
			var stAqty = $('input:text[name="stAqty"]').val();
			var stPrice = $('input:text[name="stPrice"]').val();
			var caNum = $('select[name="caNum"]').val();
			var stanUnit = $('input:text[name="stanUnit"]').val();
			var stStatus = $('input:text[name="stStatus"]').val();
			// 			var truthQty = $('input:text[name="truthQty"]').val();

			$.ajax({
				url : "stocks",
				type : 'PUT',
				dataType : 'json',
				// 			    data: JSON.stringify($("#form1").serializeObject()),
				data : JSON.stringify({
					stNum : stNum,
					sId : sId,
					stName : stName,
					stQty : stQty,
					stAqty : stAqty,
					stPrice : stPrice,
					caNum : caNum,
					stanUnit : stanUnit,
					stStatus : stStatus
				}),
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(data) {
					stockList();
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});//수정 버튼 클릭
	}//stockUpdate

	//재고 등록 요청
	function stockInsert() {
		//등록 버튼 클릭
		$('#btnInsert').on('click', function() {
			$("#form1")

			$.ajax({
				url : "stocks",
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify($("#form1").serializeObject()),
				// 				data: $("#form1").serialize();
				contentType : 'application/json',
				mimeType : 'application/json',
				success : function(response) {
					if (response.result == true) {
						stockList();
					}
				},
				error : function(xhr, status, message) {
					alert(" status: " + status + " er:" + message);
				}
			});
		});//등록 버튼 클릭
	}//stockInsert

	//재고 목록 조회 요청
	function stockList() {
		$.ajax({
			url : 'stocks',
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : stockListResult
		});
	}//stockList

	//재고 목록 조회 응답
	function stockListResult(data) {
		console.log(data);
		$("tbody").empty();
		$
				.each(
						data,
						function(idx, item) {
							if (item.stStatus == 'B1') {
								var stStatusResult = '충분'
							} else if (item.stStatus == 'B2') {
								var stStatusResult = '부족'
							} else if (item.stStatus == 'B3') {
								var stStatusResult = '없음'
							}
							if (item.caNum == 'CACM') {
								var caNumResult = '공통'
							} else if (item.caNum == 'CACP') {
								var caNumResult = '커피용품'
							} else if (item.caNum == 'CAJP') {
								var caNumResult = '음료용품'
							} else if (item.caNum == 'CADP') {
								var caNumResult = '디저트용품'
							} else if (item.caNum == '') {
								var caNumResult = '없음'
							}

							$('<tr>')
									.append(
											$('<td>').html('<input type=\'checkbox\'  name=\'ckDelete\' value=\''+item.stNum+'\' />'))
									.append($('<td>').html(item.stNum))
									.append($('<td>').html(item.sId))
									.append($('<td>').html(item.stName))
									.append($('<td>').html(item.stQty))
									.append($('<td>').html(item.stAqty))
									.append($('<td>').html(item.stPrice))
									.append($('<td>').html(caNumResult))
									.append($('<td>').html(item.stanUnit))
									.append($('<td>').html(stStatusResult))
									// 			.append($('<td>').html(item.truthQty))

									.append(
											$('<td>')
													.html(
															'<button id=\'btnSelect\' class=\'btn btn-primary\'>조회</button>'))
									.append(
											$('<td>')
													.html(
															'<button id=\'btnDelete\' class=\'btn btn-primary\'>삭제</button>'))
									.append(
											$(
													'<input type=\'hidden\' id=\'hidden_stNum\'>')
													.val(item.stNum)).appendTo(
											'tbody');
						});//each
	}//stockListResult
</script>
</head>
<body>

	<hr />
	<div class="container">
		<form id="form1" class="form-horizontal">
			<h2>재고 등록/수정</h2>
			<div class="form-group">
				<label>재고 번호</label> <input type="text" class="form-control"
					name="stNum" readonly>
			</div>
			<div class="form-group">
				<label>매장 명</label> <input type="text" class="form-control"
					name="sId">
			</div>
			<div class="form-group">
				<label>재고 명</label> <input type="text" class="form-control"
					name="stName">
			</div>
			<div class="form-group">
				<label>재고 수량</label> <input type="text" class="form-control"
					name="stQty">
			</div>
			<div class="form-group">
				<label>적정 소모량</label> <input type="text" class="form-control"
					name="stAqty">
			</div>
			<div class="form-group">
				<label>재고 단가</label> <input type="text" class="form-control"
					name="stPrice">
			</div>

			<div class="form-group">
				<label>카테고리 :</label> <select class="form-control" name="caNum">
					<option value="CACM">공통</option>
					<option value="CACP">커피용품</option>
					<option value="CAJP">음료용품</option>
					<option value="CADP">디저트용품</option>

				</select>
			</div>
			<div class="form-group">
				<label>재고 단위</label> <input type="text" class="form-control"
					name="stanUnit">
			</div>
			<div class="form-group">
				<label>재고 상태</label> <input type="text" class="form-control"
					name="stStatus" readonly>
			</div>
			<!-- 			<div class="form-group"> -->
			<!-- 				<label>재고 실수량</label> <input type="text" class="form-control" -->
			<!-- 					name="truthQty"> -->
			<!-- 			</div> -->
			<div class="btn-group">
				<input type="button" class="btn btn-primary" value="등록"
					id="btnInsert" /> <input type="button" class="btn btn-primary"
					value="수정" id="btnUpdate" /> <input type="button"
					class="btn btn-primary" value="초기화" id="btnInit" />
			</div>
		</form>
	</div>
	<hr />
	<div class="container">
		<h2>재고 목록</h2>
		<!-- 	<form action="deleteStock.do"> -->
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">선택</th>
					<th class="text-center">재고 번호</th>
					<th class="text-center">매장 아이디</th>
					<th class="text-center">재고 명</th>
					<th class="text-center">재고 수량</th>
					<th class="text-center">적정 소모량</th>
					<th class="text-center">재고 단가</th>
					<th class="text-center">카테고리</th>
					<th class="text-center">단위</th>
					<th class="text-center">재고 상태</th>
					<!-- 					<th class="text-center">재고 실수량</th> -->
				</tr>
			</thead>
			<tbody></tbody>

		</table>
		<div class="btn-group">
			<button type="button" class="btn btn-primary" id="btnCkStockDel">선택 삭제</button>
		</div>
		<br>
	</div>
</body>
</html>