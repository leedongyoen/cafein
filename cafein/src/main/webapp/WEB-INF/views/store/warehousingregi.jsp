<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>재고 입고</title>
<script>
	var sId = "<%= (String)session.getAttribute("sId") %>";
	$(function() {
		loginCheck();
		stockList();
		
		 // 재고 검색
	    $("#stockserch").on("keyup", function() {
	     var value = $(this).val().toLowerCase();
	     $("#stockTbody tr").filter(function() {
	        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	   		});
		});
	});
	
	//입고할 재고 목록 요청하기
	function stockList() {
		$.ajax({
			url : 'stocks/'+sId,
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : stockListResult
		});
	}//stockList
	
	//입고할 재고 목록 받아오기
	function stockListResult(data) {
		
		console.log(data);
		$("#stockTbody").empty();
		$.each(data, function(idx, item) {
							$('<tr>').append($('<td>').html(item.stNum))
									.append($('<td>').html(item.stName))
									.append($('<td>').html(item.stPrice))
									.append($('<td>').html(item.stQty))
									.append($('<td>').html('<input type=\'text\' name=\'enterQty\' class=\'form-control\'>'))
									.append($('<input type=\'hidden\' id=\'hidden_stNum\'>')
									.val(item.stNum)).appendTo('#stockTbody');
						});
	}
	
	//입고 처리 함수
	function makeData(){
		let list = []; //재고번호, 매장아이디, 결제방식(ST_PAY_METHOD), 가격, 수량
		//객체에 제이슨형태로 담기.
		$("#stockTbody tr").each( function(){
				var obj = {};
				var td = $(this).children();
				var enterQty = td.eq(4).find("input").val();
				var stPayMethod = $("input[name=payRadio]:checked").val();
			if (enterQty == '') {
				
			}else{
				var stNum = td.eq(0).text();
<%-- 				var sId = "<%= (String)session.getAttribute("sid") %>"; --%>
				var stPrice = td.eq(2).text();
				var warePrice = parseInt(stPrice) * parseInt(enterQty);
					
				obj["enterQty"] = enterQty;
				obj["stNum"] = stNum;
				obj["sId"] = sId;
				obj["warePrice"] = warePrice;
				obj["stPayMethod"] = stPayMethod;
				//목록에 담기
				list.push(obj);
	      		}
		});
		
			// 	객체를 제이슨으로 변환 후 확인
			console.log(JSON.stringify(list));
			
		
			// 	ajax로 데이터 전송-> updateEnterStock
			$.ajax({ 
				url:'enterQty.do',
				type: 'PUT',
				data: JSON.stringify(list),
				contentType: 'application/json;charset=utf-8',
			mimeType : 'application/json',
				dataType: 'json',
				success : function(data){
					alert(data+'건  정상 입고 되었습니다.');
					stockList();
					
	// 				location.href = "storemainform.do";
				},
				error : function(data){
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				}
			})
			
			$.ajax({ 
				url:'insertEnter.do',
				type: 'POST',
				data: JSON.stringify(list),
				contentType: 'application/json;charset=utf-8',
			mimeType : 'application/json',
				dataType: 'json',
				success : function(data){
					alert(data+'건의 입고 내역이 저장되었습니다');
					
					
	// 				location.href = "storemainform.do";
				},
				error : function(data){
					alert("상태값 :" + status + " Http에러메시지 :" + msg);
				}
			})
			
	}


</script>
</head>
<body>
<div class="container">
		<h2>재고 입고</h2>
		<!-- 	<form action="deleteStock.do"> -->
		<input class="form-control" id="stockserch" type="text" placeholder="Search..">
		<table class="table text-cente	r">
			<thead>
				<tr>
					<th class="text-center">재고 명</th>
					<th class="text-center">재고 단가</th>
					<th class="text-center">재고 수량</th>
					<th class="text-center">입고 수량</th>
					<th class="text-center">추가 수량</th>
				</tr>
			</thead>
			<tbody id="stockTbody"></tbody>

		</table>
		
		<div class="btn-group" style="float:right;">
		<div class="custom-control custom-radio">
			<input type="radio" name="payRadio" id="jb-radio-1" class="custom-control-input" 
				value="CASH" >
			<label class="custom-control-label" for="jb-radio-1" >현금 결제</label>
		</div>
		<div class="custom-control custom-radio">
			<input type="radio" name="payRadio" id="jb-radio-2" class="custom-control-input"
			 value="CARD" checked="checked" >
			<label class="custom-control-label" for="jb-radio-2">카드 결제</label>
		</div>
			&nbsp;
			<button type="button" class="btn btn-success" id="enterStock" onclick="makeData();">입고 등록</button>
			<button type="button" class="btn btn-primary" onclick="location.href='stocklist.do'">재고 변경</button>
		</div>
	</div>

</body>
</html>