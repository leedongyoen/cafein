<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마감 시재 정산</title>
<script>

	var totalcashSum, minusCash;		// 총 현금 시재, 차액
	
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
	
	// input 태그에 숫자만 입력받기 위한 함수
	function inNumber(){
        if(event.keyCode<48 || event.keyCode>57){
           event.returnValue=false;
        }
    }


	// 시재 등록 및 저장 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#cashInsert').on("click",function(){
		
		sessionStorage.removeItem("jsonCashList");
		cashDataList = new Array();
		
		// 총 현금 시재
		totalcashSum = Number(removeCommas($('#totalcash50000').val())) + Number(removeCommas($('#totalcash10000').val())) + Number(removeCommas($('#totalcash5000').val())) 
					+ Number(removeCommas($('#totalcash1000').val())) + Number(removeCommas($('#totalcash500').val())) + Number(removeCommas($('#totalcash100').val()));
		
		console.log('totalcashSum : ' + addCommas(totalcashSum));
		
		$('#totalCash').text(addCommas(totalcashSum)+'원');
		
		
		console.log('operatingreserveSum 저장 시 (cashadvance.jsp) : ' +operatingreserveSum)
		
		minusCash = totalcashSum - totalcashsales;		// 차액 = 총 현금 시재 - 총 현금 매출액
		
		$('#difference').text(addCommas(minusCash)+'원');
		
		if($('.cash').val() != '') {

			// input 태그에 입력한 값을 sessionStorage에 담기 위한 배열
			// cash : 현금시재, defference : 차액, orCash : 영업준비금, netIncome : 순수익
			var cashList = {
					sId:sId,
					c50000:$('#cash50000').val(),
					c10000:$('#cash10000').val(),
					c5000:$('#cash5000').val(),
					c1000:$('#cash1000').val(),
					c500:$('#cash500').val(),
					c100:$('#cash100').val(),
					cash:totalcashSum,
					difference:minusCash,
					orCash:operatingreserveSum,
					netIncome:totalcashsales,
					defaultCash:DBdefaultCash,
					openTime:storeOpenTime,
					closeTime:storeCloseTime
			};
			
			// 배열에 넣기
			cashDataList.push(cashList);
			// json stringify 타입으로 변환
			var jsonCashList = JSON.stringify(cashDataList);
			// json을 이용해 string 형식으로 만들어서 session storage에 저장
			sessionStorage.setItem("jsonCashList",jsonCashList);
			
			
		}
		console.log('jsonCashList : ' + jsonCashList)
		
		
		// input 태그에 값이 없으면 저장이 되지 않도록 하기 위함
		if($('#cash50000').val() == "") {
			alert("5만원 권수를 입력해 주세요.");
			$('#cash50000').focus();
			return;
		} else if($('#cash10000').val() == "") {
			alert("1만원 권수를 입력해 주세요.");
			$('#cash10000').focus();
			return;
		} else if($('#cash5000').val() == "") {
			alert("5천원 권수를 입력해 주세요.");
			$('#cash5000').focus();
			return;
		} else if($('#cash1000').val() == "") {
			alert("1천원 권수를 입력해 주세요.");
			$('#cash1000').focus();
			return;
		} else if($('#cash500').val() == "") {
			alert("5백원 권수를 입력해 주세요.");
			$('#cash500').focus();
			return;
		} else if($('#cash100').val() == "") {
			alert("1백원 권수를 입력해 주세요.");
			$('#cash100').focus();
			return;
		}
		
		

		//console.log('input val(class) : '+$('.cash').val()+', input text(class) : '+$('.cash').text())
		//console.log('input val(id) : '+$('#cash50000').val()+', input text(id) : '+$('#cash50000').text())
		//$('#resultTable').css('visibility','visible');
		$('#cashadvanceSave').text('수정 완료');
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
		sessionStorage.removeItem("jsonCashList");
		cashDataList = new Array();
		//$('#resultTable').css('visibility','hidden');
		$('#cashadvanceSave').text('수정 전');
		$('#cashInsert').attr('disabled',false);
		$('#cashBack').attr('disabled',false);
		$('.cash').attr('readonly',false);
	
	})

</script>
<style>
.thcolor {
	background-color:white;
	color:black;
}
</style>
</head>
<body>
<h3 align = "center">마감 시재 정산</h3><br>
<div class="container">
	<div class="row">
		<div class="col-11" style="height:350px;width:550px;overflow:auto;">
			<table class="table table-striped">
				<tr>
					<th>기본 준비금</th>
					<td><p id="defaultCash"></p></td>
				</tr>
				<tr>
					<th>영업 지출금(현금 결제건)</th>
					<td><p id="orSum"></p></td>
				</tr>
				<tr>
					<th>현금 매출</th>
					<td><p id="cashSales"></p></td>
				</tr>
				<tr>
					<th>현금 결제 시 사용된 적립금</th>
					<td><p id="usedMileage"></p></td>
				</tr>
			</table>
		</div>
		<hr>
		<div class="col-6">
			<table id="inputCash">
				<tr>
					<th class="thcolor">5만원 </th>
					<td><input type="text" class="cash" id="cash50000" style="width:50px" autofocus onkeyup="call()" onkeypress="inNumber()"></td>
					<td><input type="text" class="totalcash" id="totalcash50000" readonly ></td>
				</tr>
				<tr>
					<th class="thcolor">1만원 </th>
					<td><input type="text" class="cash" id="cash10000" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
					<td><input type="text" class="totalcash" id="totalcash10000" readonly></td>
				</tr>
				<tr>
					<th class="thcolor">5천원 </th>
					<td><input type="text" class="cash" id="cash5000" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
					<td><input type="text" class="totalcash" id="totalcash5000" readonly></td>
				</tr>
				<tr>
					<th class="thcolor">1천원 </th>
					<td><input type="text" class="cash" id="cash1000" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
					<td><input type="text" class="totalcash" id="totalcash1000" readonly></td>
				</tr>
				<tr>
					<th class="thcolor">5백원 </th>
					<td><input type="text" class="cash" id="cash500" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
					<td><input type="text" class="totalcash" id="totalcash500" readonly></td>
				</tr>
				<tr>
					<th class="thcolor">1백원 </th>
					<td><input type="text" class="cash" id="cash100" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
					<td><input type="text" class="totalcash" id="totalcash100" readonly></td>
				</tr>
			</table>
		</div>
		<div class="col-6">
			<table id="resultTable" >	<!-- style="visibility:hidden;" 시재 등록 버튼 클릭 시 보이게 visible (수정 누르면 다시 안보이게) -->
				<tr>
					<th class="thcolor">총 현금 시재</th>
					<td><p id="totalCash"></p></td>
				</tr>
				<tr>
					<th class="thcolor">순 현금 매출액</th>
					<td><p id="totalCashSales"></p></td>
				</tr>
				<tr>
					<th class="thcolor">차액</th>
					<td><p id="difference"></p></td>
				</tr>
			</table>
		</div>
	</div>
</div>

<button id="cashInsert" class="btn btn-outline-info">시재등록 및 저장</button>
<button id="cashBack" class="btn btn-outline-info">취소</button>
<button id="cashEdit" class="btn btn-outline-info">시재 재등록</button>
</body>
</html>