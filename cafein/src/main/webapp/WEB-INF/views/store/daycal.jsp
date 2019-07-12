<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="storehead.jsp" %>
<title>Store Closing Page</title>

<script>

	var sId = 'SH001';
	var sum, listSum=0, totalSum=0, addTotalSum=0,i;
	var listnum;
	var addDataList;
	
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
					sum = item.wareQty*item.warePrice;
					totalSum += sum;
					
					
					if(item.stPayMethod == 'CARD') {
						$('<tr>')
						.append($('<td>').html(item.stName))
						.append($('<td>').html(addCommas(item.wareQty)))
						.append($('<td>').html(addCommas(item.warePrice)+'원'))
						.append($('<td>').html(addCommas(sum)+'원'))
						.append($('<td>').html('카드'))
						.appendTo('#operatingreservTable tbody')
						.append($('<td>').append($('<input>').attr({
							type:'button',
							id:'nonDelCheck',
							disabled:'disabled',
							value:'삭제불가'
						})));
					} else if(item.stPayMethod == 'CASH') {
						$('<tr>')
						.append($('<td>').html(item.stName))
						.append($('<td>').html(addCommas(item.wareQty)))
						.append($('<td>').html(addCommas(item.warePrice)+'원'))
						.append($('<td>').html(addCommas(sum)+'원'))
						.append($('<td>').html('현금'))
						.appendTo('#operatingreservTable tbody')
						.append($('<td>').append($('<input>').attr({
							type:'button',
							id:'nonDelCheck',
							disabled:'disabled',
							value:'삭제불가'
						})));
					}
				});
				
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
						listSum += addDataList[i].sum;
					}
					totalSum += listSum;
				}
				
				$('<tr>')
				.append($('<th>').html('총금액'))
				.append($('<th>').html(addCommas(totalSum)+'원').attr('colspan','6').attr('id','totalSum').css('text-align','right'))
				.appendTo('#operatingreservTable tfoot');
				addTotalSum = totalSum;
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
			.append($('<td>').html(addCommas(addDataList[i].warePrice)+'원'))
			.append($('<td>').html(addCommas(addDataList[i].sum)+'원').attr('id','sum'))
			.append($('<td>').html(addDataList[i].stPayMethod))
			.append($('<td>').append($('<input>').attr({
				type:'button',
				value:'삭제',
			}).addClass('delbtn')))
			.appendTo('#operatingreservTable tbody');
			console.log("i : " + i)
		}
		
		
		if($('#operatingreserveSave').text() == '수정 완료') {
			$('#addbtn').attr('disabled',true);
			$('#backbtn').attr('disabled',true);
			$('.delbtn').attr('disabled',true);
			$('.delbtn').attr('value','삭제불가');
		}
	}
	
	// 영업 준비금 (재고 입고, 인건비 등) 페이지 호출
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
	
	// 현금 시재 정산
	function cashadvance() {
		$.ajax({
			url:"cashadvance.do",		// request 보낼 서버경로
			//data:,						// 보낼 데이터 (매장id 보내야함)
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				$('#content').html(data);
			}
		});
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
				$('#content').html(data);
			}
		});
	}
	
	// 숫자 3단위마다 콤마 생성
	function addCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
</head>
<body>
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
						<td>영업 준비금</td>
						<td id = "operatingreserveSave">수정 전</td>
					</tr>
					<tr onclick="cashadvance()">
						<td>정산</td>
						<td>시재 정산</td>
						<td>수정 전</td>
					</tr>
					<tr onclick="stocktruthlist()">
						<td>재고</td>
						<td>마감 재고</td>
						<td>수정 전</td>
					</tr>
				</table>
			</div>
			<div class="col-7" id="content" style="border:1px dotted;height:680px;overflow:auto;">
			</div><br><br>
			<div class="col-4">
				<button>마감정산</button>
				<button>PDF저장</button>
				<button>종료</button>
			</div>
			<div class="col-7">
				<table>
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
				</table>
			</div><br>
		</div>
	</div>
</div>
</body>
</html>