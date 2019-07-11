<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store Closing Page</title>
<%@ include file="storehead.jsp" %>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script>

	var sId = 'SH001';
	var sum, totalSum=0;
	var listnum;
	
	function getoperatingreserve(){
		
		$.ajax({
			url:"operatingreserve",		// request 보낼 서버경로
			type:'GET',			
			data:{sId:sId},						// 보낼 데이터 (매장id 보내야함)
			error:function(){
				alert('통신 실패');
			},
			success:function(data){
				console.log(data);
				
				$('#operatingreservTable tbody').empty();
				$.each(data,function(idx,item){		// idx : length 와 비슷한 느낌, item : data
					sum = item.wareQty*item.warePrice;
					totalSum += sum;
					
					if(item.stPayMethod == 'CARD') {
						$('<tr>')
						.append($('<td>').html(idx+1))
						.append($('<td>').html(item.stName))
						.append($('<td>').html(item.wareQty))
						.append($('<td>').html(item.warePrice))
						.append($('<td>').html(sum))
						.append($('<td>').html('카드'))
						.appendTo('#operatingreservTable tbody');
						listnum =idx+1;
					} else if(item.stPayMethod == 'CASH') {
						$('<tr>')
						.append($('<td>').html(idx+1))
						.append($('<td>').html(item.stName))
						.append($('<td>').html(item.wareQty))
						.append($('<td>').html(item.warePrice))
						.append($('<td>').html(sum))
						.append($('<td>').html('현금'))
						.appendTo('#operatingreservTable tbody');
						listnum =idx+1;
					}
				});
				$('<tr>')
				.append($('<th>').html('총금액'))
				.append($('<th>').html(totalSum).attr('colspan','5').attr('id','totalSum').css('text-align','right'))
				.appendTo('#operatingreservTable tfoot');
				totalSum=0;
			}
		});
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
	
	/* var i = 0;
	var stName = $('#stName').val();
	var wareQty = $('#wareQty').val();
	var warePrice = $('#warePrice').val();
	var stPayMethod = $('#stPayMethod').val(); */		// selected도 val인지 확인
	
	
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
						<td>수정 전</td>
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
			<div class="col-7" id="content" style="border:1px dotted;height:700px;overflow:auto;">
			</div><br><br>
			<div class="col-4">
				<button>마감정산</button>
				<button>엑셀저장</button>
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