<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="storehead.jsp" %>
<title>Store Closing Page</title>
<style>
ul {
	list-style: none;
	width:450px;
	margin-left: auto;
  	margin-right: auto;
}
li {
	width:450px;
}
hr {
	width:400;
	align:left;
}
span {
	display:inline-block;
	width:300px;
}
.sales {
	width:175px;
}
p {
	text-align:center;
}
.truthlist {
	background-color:white;
}
.modal-dialog.modal-80size {
  width: 50%;
  height: 80%;
  margin: 0;
  padding: 20%;
}

</style>
<script>


	//영업 지출금 페이지 호출
	$(function startOperatingReserve() {
		$.ajax({
			url:"operatingreserve.do",		// request 보낼 서버경로
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				$('#content').html(data);
				getoperatingreserve();		// json 형식으로 변환된 데이터를 가지고 온다
			}
		});
	});

	var sId = "<%= (String)session.getAttribute("sid") %>";			// 로그인 한 매장 아이디(세션값 받아와야함) 
	var sum, listSum=0, totalSum=0, addTotalSum=0,i;	// 합계(row별), session의 합계(row별 총 합계), db의 총 합계, operatingreserve.jsp에서 추가하는 항목의 합계
	var addDataList, cashDataList, stockTruthList = new Array(), jsonStockList;			// sessionStorage 가 담길 배열 x 3
	var stockList = new Array(), truthQty; 		// 재고수량과 실수량이 들어갈 list, list 내의 실수량
	var operatingreserveSum=0, orSum=0;		// 영업 지출금 현금 지출액 합계(operatingreserve.jsp에서 사용), 영업 준비금 현금 지출액 합계(계속 더해질 용도)
	var jsonString, jsonData, DBdefaultCash, storeOpenTime, storeCloseTime;			// 매장의 기본 준비금을 알기위해 json으로 데이터를 변환할 때 사용하는 변수 2개, 기본준비금(db), 매장오픈시간, 매장마감시간
	var lackQty; 			// 재고상태의 기준수량
	var receiptCashList = new Array(), reaceiptMileageList = new Array();		// 영수증에 출력될 현금/카드 리스트, 영수증에 출력될 마일리지/총금액 리스트
	
	
	
	function getoperatingreserve(){
		
		$.ajax({
			url:"operatingreserve",		// request 보낼 서버경로
			type:'GET',			
			data:{sId:sId},						// 보낼 데이터 (매장id 보내야함)
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				//console.log(data);
				
				$('#operatingreservTable tbody').empty();
				$.each(data,function(idx,item){		// idx : length 와 비슷한 느낌, item : data
					//sum = item.wareQty*item.warePrice;
					sum = item.warePrice/item.wareQty;
					totalSum += Number(item.warePrice);
				
					if(item.stPayMethod == 'CARD') {
						$('<tr>')
						.append($('<td>').html(item.stName))
						.append($('<td>').html(addCommas(item.wareQty)))
						.append($('<td>').html(addCommas(sum)+'원'))
						.append($('<td>').html(addCommas(item.warePrice)+'원'))
						.append($('<td>').html('카드'))
						.append($('<td>').append($('<input>').attr({
							type:'button',
							id:'nonDelCheck',
							disabled:'disabled',
							value:'삭제불가'
						})))
						.appendTo('#operatingreservTable tbody');
					} else if(item.stPayMethod == 'CASH') {
						$('<tr>')
						.append($('<td>').html(item.stName))
						.append($('<td>').html(addCommas(item.wareQty)))
						.append($('<td>').html(addCommas(sum)+'원'))
						.append($('<td>').html(addCommas(item.warePrice)+'원'))
						.append($('<td>').html('현금'))
						.append($('<td>').append($('<input>').attr({
							type:'button',
							id:'nonDelCheck',
							disabled:'disabled',
							value:'삭제불가'
						})))
						.appendTo('#operatingreservTable tbody');
						orSum += Number(item.warePrice);		// 현금 영업준비금 때문에 필요
					}
				});
				
				console.log('total sum : ' + totalSum)
				
				addDataList = sessionStorage.getItem("jsonVoList");
				console.dir(addDataList)
				// session에 값이 있는지 확인 있으면 값을 가지고 뿌려주고 없으면 새로운 배열 생성
				if(addDataList == null) {
					// 추가버튼 클릭시 데이터 저장하는 배열
					addDataList = new Array();	
				} else {
					addDataList = JSON.parse(addDataList);
					// 함수 생성해서 배열에 있는 값을 뿌려줘야함
					console.log('addDataList : ' + addDataList);

					getList();
					for(i=0;i<addDataList.length;i++) {
						listSum += addDataList[i].warePrice;
						if(addDataList[i].stPayMethod == '현금') {
							orSum += addDataList[i].warePrice;
							console.log('session에 있는 현금  : ' + addDataList[i].stPayMethod)
						}
					}
					
					totalSum += listSum;
				}
				
				$('<tr>')
				.append($('<th>').html('총지출액'))
				.append($('<th>').html(addCommas(totalSum)+'원').attr('colspan','6').attr('id','totalSum').css('text-align','right'))
				.appendTo('#operatingreservTable tfoot');
				addTotalSum = totalSum;
				operatingreserveSum = orSum;
				
				console.log('영업 지출금 총 현금 지출액 : ' + operatingreserveSum)
				orSum=0;
				totalSum=0;
				listSum=0;
				console.log("addTotalSum(daycal) : "+addTotalSum)

			}
		});
	}
	
	// session에 값이 있을 면 화면에 뿌려주는 함수
	function getList() {
		for(i=0;i<addDataList.length;i++) {
			console.log('addDataList.stName : ' + addDataList[i].stName);
			$('<tr>').attr('id','deleteRow'+[i])
			.append($('<td>').html(addDataList[i].stName))
			.append($('<td>').html(addDataList[i].wareQty))
			.append($('<td>').html(addCommas(addDataList[i].sum)+'원'))
			.append($('<td>').html(addCommas(addDataList[i].warePrice)+'원').attr('id','warePrice'))
			.append($('<td>').html(addDataList[i].stPayMethod))
			.append($('<td>').append($('<input>').attr({
				type:'button',
				value:'삭제',
			}).addClass('delbtn')))
			.appendTo('#operatingreservTable tbody');
		}
		
		
		if($('#operatingreserveSave').text() == '수정 완료') {
			$('#savebtn').attr('disabled',true);
			$('#addbtn').attr('disabled',true);
			$('#backbtn').attr('disabled',true);
			$('.delbtn').attr('disabled',true);
			$('.delbtn').attr('value','삭제불가');
			$('#stName').attr('readonly',true);
			$('#wareQty').attr('readonly',true);
			$('#sum').attr('readonly',true);
			$("input[name=stPayMethod]").attr('disabled',true); 
		}
	}
	
	
	// 영업 지출금 (재고 입고, 인건비 등) 페이지 호출
	function operatingreserve() {
		$.ajax({
			url:"operatingreserve.do",		// request 보낼 서버경로
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				getoperatingreserve();		// json 형식으로 변환된 데이터를 가지고 온다
				$('#content').html(data);
			}
		});
	}
//---------------------------------------------------------------------------------------------------------------------
	
	var cashSum=0, usedMile=0, totalcash=0;		// 현금 매출액, 사용된 마일리지, 총 현금 시재
	var defaultcash=50000, totalcashsales=0;	// 기본준비금, 총 현금 매출액
	
	function getStoreOpen() {
		$.ajax({
			url:"storeopen",		// request 보낼 서버경로
			type:'GET',			
			data:{sId:sId},				// 보낼 데이터 (매장id 보내야함)
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				console.log(data)
				jsonString = JSON.stringify(data);
				jsonData = JSON.parse(jsonString);
				console.log('store open data parse : ' + jsonData.defaultCash)
				
				DBdefaultCash = jsonData.defaultCash;
				storeOpenTime = jsonData.openTime;
				storeCloseTime= jsonData.closeTime;
				
				$('#defaultCash').val(DBdefaultCash);
				$('#defaultCash').text(addCommas(DBdefaultCash)+'원');
			}
		});
	}
	
	
	// 현금 시재 정산 페이지 호출
	function getCashAdvance() {
		$.ajax({
			url:"cashadvance",		// request 보낼 서버경로
			type:'GET',			
			data:{sId:sId},				// 보낼 데이터 (매장id 보내야함)
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				$.each(data,function(idx,item){		// idx : length 와 비슷한 느낌, item : data
					
					cashSum += item.total;
					usedMile += item.mileage;
					
				});
				// 총 현금 매출액 = 현금 매출액 - 마일리지 - 영업준비금 ..?
				totalcashsales = cashSum - usedMile - operatingreserveSum;
				console.log('cashSum : '+cashSum+', usedMile : '+usedMile+', operatingreserveSum : '+operatingreserveSum)
				
				$('#cashSales').text(addCommas(cashSum)+'원');
				$('#usedMileage').text('P'+addCommas(usedMile));
				$('#totalCashSales').text(addCommas(totalcashsales)+'원');
				
				
				cashDataList = sessionStorage.getItem("jsonCashList");
				//console.log('cashDataList : '+cashDataList)
				// session에 값이 있는지 확인 있으면 값을 가지고 뿌려주고 없으면 새로운 배열 생성
				if(cashDataList == null) {
					// 추가버튼 클릭시 데이터 저장하는 배열
					cashDataList = new Array();	
					
				} else {
					
					cashDataList = JSON.parse(cashDataList);
					// 함수 생성해서 배열에 있는 값을 뿌려줘야함
					//console.log('cashDataList : ' + cashDataList);
					getCashList();	
					
				} 
				
				
				cashSum=0;
				usedMile=0;
			}
		});
	}
	
	// session에 값이 있을 면 화면에 뿌려주는 함수
	function getCashList() {

		var len = cashDataList.length-1;	// 입력한 현금 배열의 길이 -1
		console.log(cashDataList)
		// 배열의 마지막 값을 value에 담아준다
		$('#totalCash').text(addCommas(cashDataList[len].cash)+'원');
		$('#difference').text(addCommas(cashDataList[len].difference)+'원');
		$('#cash50000').val(cashDataList[len].c50000);
		$('#totalcash50000').val(addCommas($('#cash50000').val()*50000));
		$('#cash10000').val(cashDataList[len].c10000);
		$('#totalcash10000').val(addCommas($('#cash10000').val()*10000));
		$('#cash5000').val(cashDataList[len].c5000);
		$('#totalcash5000').val(addCommas($('#cash5000').val()*5000));
		$('#cash1000').val(cashDataList[len].c1000);
		$('#totalcash1000').val(addCommas($('#cash1000').val()*1000));
		$('#cash500').val(cashDataList[len].c500);
		$('#totalcash500').val(addCommas($('#cash500').val()*500));
		$('#cash100').val(cashDataList[len].c100);
		$('#totalcash100').val(addCommas($('#cash100').val()*100));
		
		
		
		
		if($('#cashadvanceSave').text() == '수정 완료') {
			$('#cashInsert').attr('disabled',true);
			$('#cashBack').attr('disabled',true);
			$('.cash').attr('readonly',true);
			$('.totalcash').attr('readonly',true);
		}
	}
	
	
	// 현금 시재 정산 페이지 호출
	function cashadvance() {
		$.ajax({
			url:"cashadvance.do",		// request 보낼 서버경로
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				getStoreOpen();
				getCashAdvance();
				$('#content').html(data);
			}
		});
	}
//---------------------------------------------------------------------------------------------------------------------
	// 재고 실수량 확인
	function getStockTruthList() {
		$.ajax({
			url:"stocktruthlist",		
			type:'GET',			
			data:{sId:sId},				
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				$('#stocktruthlistTable tbody').empty();
				$.each(data,function(idx,item){		// idx : length 와 비슷한 느낌, item : data
					
					$('<tr>')
					.append($('<td>').html(idx+1))
					.append($('<td>').html(item.stName))
					.append($('<td>').html(item.stQty))
					.append($('<td>').append($('<input>').attr({
						type:'text',
						'class':'truthQty',
						name:'truthQtyName',
						onKeyup:"this.value=this.value.replace(/[^0-9]/g,'')",
						value:item.stQty
					})))
					.append($('<td>').html(item.stNum).attr('hidden','hidden'))
					.append($('<td>').html(item.lackQty).attr('hidden','hidden'))
					.appendTo('#stocktruthlistTable tbody');
				});
				
				stockTruthList = sessionStorage.getItem("jsonStockList");
				
				if(stockTruthList == null) {
					// 추가버튼 클릭시 데이터 저장하는 배열
					stockTruthList = new Array();	
					
				} else {
					
					stockTruthList = JSON.parse(stockTruthList);
					// 함수 생성해서 배열에 있는 값을 뿌려줘야함
					//console.log('cashDataList : ' + cashDataList);
					getstockTruthList();	
					
				} 
				
			}
		});
	}

	function getstockTruthList() {
		var len = stockTruthList.length;
		
		for(i=0;i<len;i++) {
			$('#inputId tr').eq(i).find('input').val(stockTruthList[i].truthQty);
		}
		
		if($('#stocktruthlistSave').text() == '수정 완료') {
			$('#truthsavebtn').attr('disabled',true);
			$('#truthbackbtn').attr('disabled',true);
			$('.truthQty').attr('readonly',true);
		}
	}
	
	// 재고 실수량 확인
	function stocktruthlist() {
		$.ajax({
			url:"stocktruthlist.do",		// request 보낼 서버경로
			//data:,						// 보낼 데이터 (매장id 보내야함)
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				getStockTruthList();
				$('#content').html(data);
			}
		});
	}
	
	var receiptCashString, receiptCashData, receiptMileageString, receiptMileageData; 
	
	// 마감 영수증을 위한 결제내역(현금/카드) 조회
	function getCloseReceiptCash() {
		$.ajax({
			url:"closereceiptcash",		// request 보낼 서버경로
			type:'GET',			
			data:{sId:sId},				// 보낼 데이터 (매장id 보내야함)
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				console.log(data)
				receiptCashString = JSON.stringify(data);
				receiptCashData = JSON.parse(receiptCashString);
				console.log('receiptCashData : ' + receiptCashData.total)
			}
		});
	}
	
	// 마감 영수증을 위한 결제내역(마일리지/총매출액) 조회
	function getCloseReceiptMileage() {
		$.ajax({
			url:"closereceiptmileage",		// request 보낼 서버경로
			type:'GET',			
			data:{sId:sId},				// 보낼 데이터 (매장id 보내야함)
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				console.log(data)
			}
		});
	}
	
//---------------------------------------------------------------------------------------------------------------------
	// 숫자 3단위마다 콤마 생성
	function addCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//모든 콤마 제거
	function removeCommas(x) {
	    if(!x || x.length == 0) return "";
	    else return x.split(",").join("");
	}
	
//---------------------------------------------------------------------------------------------------------------------
	
	var receiptJsonString, receipt;		// 영수증 출력 시 필요한 데이터를 json parse를 위한 변수
	
	// 마감 정산 버튼 클릭 시
	function closeCheck(){
		if($('#operatingreserveSave').text() == '수정 전') {
			alert('영업 지출금 마감을 완료해주세요.');
			return;
		} else if($('#cashadvanceSave').text() == '수정 전') {
			alert('시재 정산 마감을 완료해주세요.');
			return;
		} else if($('#stocktruthlistSave').text() == '수정 전') {
			alert('재고 수량 마감을 완료해주세요.');
			return;
		}
		
		var closeSign = confirm('마감을 완료 하시겠습니까?');
		if(closeSign) {
			$.ajax({
				url:"dateInsertUpdate.do",
				data:JSON.stringify({store:cashDataList, stock:stockTruthList, warehousingLoss:stockTruthList, warehousingAddStock:addDataList}),
				contentType:'application/json',
				type:'POST',
				error:function(){
					alert('error');
				},
				success:function(data){
					getCloseReceiptCash();
					getCloseReceiptMileage();
					
					receiptJsonString = JSON.stringify(data);
					console.log('opentime, closetime : ' + receiptJsonString.openTime + ', ' + receiptJsonString.closeTime);
					
					receipt = JSON.parse(receiptJsonString);
					console.log('opentime, closetime : ' + receipt.store.openTime + ', ' + receipt.closeTime);
					
					$('#opentime').text('2019');
					
					
					// 마감 내역 모달창 show
					$("#receiptmodal").modal('show');
					console.log('store : '+data.store)
					console.log('warehousing : '+data.warehousing)
					console.log(data)
				}
			});
			/* 
			$('#cashadvanceInsert').val(JSON.stringify(cashDataList));
			$('#stocktruthInsert').val(JSON.stringify(stockTruthList));
			$('#operationreservInsert').val(JSON.stringify(addDataList));
			document.dataInsertForm.submit(); */
		} else {
			return;
		}

	}


</script>
</head>
<body>
<!-- <form method="post" action="dateInsertUpdate.do" name="dataInsertForm">
	<input type="hidden" name="cashadvanceInsert" id="cashadvanceInsert">
	<input type="hidden" name="stocktruthInsert" id="stocktruthInsert">
	<input type="hidden" name="operationreservInsert" id="operationreservInsert">
</form> -->
<br>
<div class="container">
	<div class="row border align-items-start" >
		<div class="row justify-content-around">
			<div class="col-12" style="text-align:center;">
				<h3>카페 린 영업 마감</h3><br>
			</div>
			<div class="col-4">
				<table class="table table-hover">
					<tr>
						<th>구분</th>
						<th>이름</th>
						<th>상태</th>
					</tr>
					<tr onclick="operatingreserve()">
						<td>지출</td>
						<td>영업 지출금</td>
						<td id = "operatingreserveSave">수정 전</td>
					</tr>
					<tr onclick="cashadvance()">
						<td>정산</td>
						<td>시재 정산</td>
						<td id = "cashadvanceSave">수정 전</td>
					</tr>
					<tr onclick="stocktruthlist()">
						<td>재고</td>
						<td>마감 재고</td>
						<td id = "stocktruthlistSave">수정 전</td>
					</tr>
				</table>
			</div>
			<div class="col-7" id="content" style="border:1px dotted;height:680px;overflow:auto;">
			</div><br><br>
			<div class="col-4">
				<button type="button" onclick = "closeCheck()">마감정산</button>
				<button type="button" >PDF저장</button>
			</div>
			<div class="col-7">
				<!-- <table>
					<tr>
						<th><button>1</button></th><th><button>2</button></th><th><button>3</button></th>
						<th><button>4</button></th><th><button>5</button></th><th><button>6</button></th>
						<th><button>←</button></th><th rowspan="2"><button>enter</button></th>
					</tr>
					<tr>
						<th><button>7</button></th><th><button>8</button></th><th><button>9</button></th>
						<th><button>0</button></th><th><button>00</button></th><th><button>000</button></th>
						<th><button>C</button></th>
					</tr>
				</table> -->
			</div><br>
		</div>
	</div>
	
	<!-- 마감 영수증  Modal -->
	<div class="modal fade" id="receiptmodal" role="dialog">
		<div class="modal-dialog" style="max-width: 40%; width: auto;">		
			<div class="modal-content">
				<div class="modal-body">
					<form class="form-borizontal" action="#" method="POST">
						<div class="table-responsive">
							<ul>
								<li>
									<p>*** <%= session.getAttribute("sName") %> 마감 결과 ***</p>
								</li>
								<hr>
								<!-- 오픈, 마감 일시 -->
								<li>
									<span>오픈일시</span>
									<label id="opentime"></label>
								</li>
								<li>
									<span>마감일시</span>
									<label id="closetime"></label>
								</li>
								<hr>
								<!-- 매출 -->
								<li>
									<p>직접수령</p>
								</li>
								<hr>
								<li>
									<span class="sales">현금</span>
									<span class="sales" id="takeoutCashCnt"></span>
									<label id="takeoutCashSum"></label>
								</li>
								<li>
									<span class="sales">카드</span>
									<span class="sales" id="takeoutCardCnt"></span>
									<label id="takeoutCardSum"></label>
								</li>
								<li>
									<span class="sales">합계</span>
									<span class="sales" id="takeoutSumCnt"></span>
									<label id="takeoutSum"></label>
								</li>
								<hr>
								<li>
									<p>배달주문</p>
								</li>
								<hr>
								<li>
									<span class="sales">현금</span>
									<span class="sales" id="deliveryCashCnt"></span>
									<label id="deliveryCashSum"></label>
								</li>
								<li>
									<span class="sales">카드</span>
									<span class="sales" id="deliveryCardCnt"></span>
									<label id="deliveryCardSum"></label>
								</li>
								<li>
									<span class="sales">합계</span>
									<span class="sales" id="deliverySumCnt"></span>
									<label id="deliverySum"></label>
								</li>
								<hr>
								<li>
									<p>포인트 내역</p>
								</li>
								<hr>
								<li>
									<span class="sales">포인트사용</span>
									<span class="sales" id="pointMinusCnt"></span>
									<label id="pointMinusSum"></label>
								</li>
								<li>
									<span class="sales">포인트적립</span>
									<span class="sales" id="pointPlusCnt"></span>
									<label id="pointPlusSum"></label>
								</li>
								<li>
									<span class="sales">환불포인트</span>
									<span class="sales" id="refundPointCnt"></span>
									<label id="refundPointSum"></label>
								</li>
								<hr>
								<li>
									<p>환불내역</p>
								</li>
								<hr>
								<li>
									<span class="sales">현금</span>
									<span class="sales" id="refundCashCnt"></span>
									<label id="refundCashSum"></label>
								</li>
								<li>
									<span class="sales">카드</span>
									<span class="sales" id="refundCardCnt"></span>
									<label id="refundCardSum"></label>
								</li>
								<li>
									<span class="sales">합계</span>
									<span class="sales" id="refundSumCnt"></span>
									<label id="refundSum"></label>
								</li>
								<hr>
								<li>
									<span>총매출</span>
									<label id="storeTotalSum"></label>
								</li>
								<hr>
								<!-- 시재 -->
								<li>
									<p>현금 관리</p>
								</li>
								<li>
									<span>현금시재</span>
									<label id="storeCash"></label>
								</li>
								<li>
									<span>현금매출</span>
									<label id="storeCashSum"></label>
								</li>
								<li>
									<span>준비금</span>
									<label id="storeDefaultCash"></label>
								</li>
								<li>
									<span>영업지출금</span>
									<label id="storeOrSum"></label>
								</li>
								<li>
									<span>포인트사용</span>
									<label id="storeCashPoint"></label>
								</li>
								<hr>
								<li>
									<span>순수익</span>
									<label id="storeNetIncome"></label>
								</li>
								<hr>
								<li>
									<span>차액</span>
									<label id="storeDefference"></label>
								</li>
								<hr>
							</ul>
						</div>
					</form>
				
				</div>
				<div class="modal-footer">		
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal" onclick="location.href='storemainform.do'">Close</button>
				</div>
			</div>
		</div>
	</div>
	
</div>
</body>
</html>