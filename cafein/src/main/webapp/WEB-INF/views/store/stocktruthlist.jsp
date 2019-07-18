<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실수량 확인</title>
<script>

	// 취소 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#truthbackbtn').on("click",function(){
		$('.truthQty').val('');
	})
	
	// input 태그에 값을 입력하면 class를 추가, 값을 지우면 class도 제거 (input 태그에 값이 들어갔는지를 확인하기 위한 처리)
	$('#inputId').on('change','.truthQty',function(){
		if($(this).val()=='') {
			$(this).removeClass('truthlist');
		} else {
			$(this).addClass('truthlist');
		}
	})
	
	// 저장 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#truthsavebtn').on("click",function(){
	
		sessionStorage.removeItem("jsonStockList");
		stockTruthList = new Array();

		// 실수량 sessionStorage에 담기 ---------------------------------------------
		var len = $('#inputId tr').length;
		
		for(i=0;i<len;i++) {
			
			stockList = {
					sId:sId,
					stName:$('#inputId tr').eq(i).find('td').eq(1).text(),
					stNum:$('#inputId tr').eq(i).find('td').eq(4).text(),
					stQty:$('#inputId tr').eq(i).find('td').eq(2).text(),
					truthQty:$('#inputId tr').eq(i).find('input').val(),
					stLoss:($('#inputId tr').eq(i).find('input').val())-($('#inputId tr').eq(i).find('td').eq(2).text())
			};
			
			stockTruthList.push(stockList);

			//stockList.push($($('.truthQty').get(i)).val());		// $('.truthQty').get(i).value 와 같음
			//console.log('stockTruthList : ' + stockTruthList.stNum)

		}

		jsonStockList = JSON.stringify(stockTruthList);
		console.log('jsonStockList : ' + jsonStockList)
		sessionStorage.setItem("jsonStockList",jsonStockList);

		$('#stocktruthlistSave').text('수정 완료');
		$('#truthbackbtn').attr('disabled',true);
		$('.truthQty').attr('readonly',true);
	})
	
	// 수정 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#trutheditbtn').on("click",function(){
		
		sessionStorage.removeItem("jsonStockList");
		
		$('#stocktruthlistSave').text('수정 전');
		$('#truthbackbtn').attr('disabled',false);
		$('.truthQty').attr('readonly',false);
		stockTruthList = new Array();
	})
	
</script>
</head>
<body>
	<h3 align="center">실수량 확인</h3>
	<br>
	<form id = "">
	<div class="container" align="center">
		<table class="table table-hover" id="stocktruthlistTable">
			<thead>
			<tr>
				<th>순번</th>
				<th>재고 명</th>
				<th>수량</th>
				<th>실 수량</th>
			</tr>
			</thead>
			<tbody id="inputId">
			</tbody>
		</table>
	</div>
	<div class="container" align="right">
		<button type="button" id="truthbackbtn">취소</button>
		<button type="button" id="truthsavebtn">저장</button>
		<button type="button" id="trutheditbtn">수정</button>
	</div>
	</form>
</body>
</html>