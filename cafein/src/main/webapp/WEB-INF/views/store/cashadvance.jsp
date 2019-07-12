<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마감 시재 정산</title>
<script>

	console.log('operatingreserveSum (cashadvance.jsp) : ' +operatingreserveSum)
	$('#orSum').text(addCommas(operatingreserveSum)+'원');

	// 현금의 장수 입력 시 금액*장 수 가 계산되어 바로 입력 되도록
	function call() {
		if($('#cash50000').val() != '') {
			$('#totalcash50000').val(addCommas($('#cash50000').val()*50000));
		} else {
			$('#totalcash50000').val('');
		}
		
		if($('#cash10000').val() != '') {
			$('#totalcash10000').val(addCommas($('#cash10000').val()*10000));
		} else {
			$('#totalcash10000').val('');
		}
		
		if($('#cash5000').val() != '') {
			$('#totalcash5000').val(addCommas($('#cash5000').val()*5000));
		} else {
			$('#totalcash5000').val('');
		}
		
		if($('#cash1000').val() != '') {
			$('#totalcash1000').val(addCommas($('#cash1000').val()*1000));
		} else {
			$('#totalcash1000').val('');
		}
		
		if($('#cash500').val() != '') {
			$('#totalcash500').val(addCommas($('#cash500').val()*500));
		} else {
			$('#totalcash500').val('');
		}
		
		if($('#cash100').val() != '') {
			$('#totalcash100').val(addCommas($('#cash100').val()*100));
		} else {
			$('#totalcash100').val('');
		}
		
	}


	// 시재 등록 및 저장 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#cashInsert').on("click",function(){
		
		//console.log('input val(class) : '+$('.cash').val()+', input text(class) : '+$('.cash').text())
		//console.log('input val(id) : '+$('#cash50000').val()+', input text(id) : '+$('#cash50000').text())
		
		$('#operatingreserveSave').text('수정 완료');
		$('#cashInsert').attr('disabled',true);
		$('#cashBack').attr('disabled',true);
		$('.cash').attr('readonly',true);
		$('.totalcash').attr('readonly',true);
	
	})
	
	// 취소 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#cashBack').on("click",function(){
		$('.cash').val('');
		$('.totalcash').val('');

	})
	
	// 시재 재등록 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	// 저장 후 데이터 변경 못하게 할지 생각해보기
	$('#cashEdit').on("click",function(){
		$('#operatingreserveSave').text('수정 전');
		$('#cashInsert').attr('disabled',false);
		$('#cashBack').attr('disabled',false);
		$('.cash').attr('readonly',false);
	
	})
	
	
	
	
	
</script>
</head>
<body>
<h3 align = "center">마감 시재 정산</h3><br>
<div class="container">
	<div class="row">
		<div class="col-11" style="height:350px;width:550px;overflow:auto;">
			<table class="table table-striped">
				<tr>
					<th>기본 준비금</th>
					<td><p id="defaultCash">50,000원</p></td>
				</tr>
				<tr>
					<th>영업 준비금(현금 결제건)</th>
					<td><p id="orSum"></p></td>
				</tr>
				<tr>
					<th>현금 매출</th>
					<td><p id="cashSales"></p></td>
				</tr>
				<tr>
					<th>현금 결제 시 사용된 포인트</th>
					<td><p id="usedMileage"></p></td>
				</tr>
			</table>
		</div>
		<hr>
		<div class="col-6">
			<table id="inputCash">
				<tr>
					<th>5만원 </th>
					<td><input type="text" class="cash" id="cash50000" style="width:50px" autofocus onkeyup="call()"></td>
					<td><input type="text" class="totalcash" id="totalcash50000" readonly ></td>
				</tr>
				<tr>
					<th>1만원 </th>
					<td><input type="text" class="cash" id="cash10000" style="width:50px" onkeyup="call()"></td>
					<td><input type="text" class="totalcash" id="totalcash10000" readonly></td>
				</tr>
				<tr>
					<th>5천원 </th>
					<td><input type="text" class="cash" id="cash5000" style="width:50px" onkeyup="call()"></td>
					<td><input type="text" class="totalcash" id="totalcash5000" readonly></td>
				</tr>
				<tr>
					<th>1천원 </th>
					<td><input type="text" class="cash" id="cash1000" style="width:50px" onkeyup="call()"></td>
					<td><input type="text" class="totalcash" id="totalcash1000" readonly></td>
				</tr>
				<tr>
					<th>5백원 </th>
					<td><input type="text" class="cash" id="cash500" style="width:50px" onkeyup="call()"></td>
					<td><input type="text" class="totalcash" id="totalcash500" readonly></td>
				</tr>
				<tr>
					<th>1백원 </th>
					<td><input type="text" class="cash" id="cash100" style="width:50px" onkeyup="call()"></td>
					<td><input type="text" class="totalcash" id="totalcash100" readonly></td>
				</tr>
			</table>
		</div>
		<div class="col-6">
			<table id="resultTable" style="visibility:hidden;">	<!-- 시재 등록 버튼 클릭 시 보이게 visible (수정 누르면 다시 안보이게) -->
				<tr>
					<th>총 현금 매출액</th>
					<td><p id="totalCashSales"></p></td>
				</tr>
				<tr>
					<th>총 현금 시재</th>
					<td><p id="totalCash"></p></td>
				</tr>
				<tr>
					<th>차액</th>
					<td><p id="difference"></p></td>
				</tr>
			</table>
		</div>
	</div>
</div>

<button id="cashInsert">시재등록 및 저장</button>
<button id="cashBack">취소</button>
<button id="cashEdit">시재 재등록</button>
</body>
</html>