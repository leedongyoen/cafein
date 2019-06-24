<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
	var price = 4100;
	var no = 1;
	function add(num){
		if(num == -1){
			if(no == 1){
				alert("1개 이상으로 주문해주세요.");
				return;
			}
			no --;
			price = price - 4100;
		}else if (num == 1){
			no++;
			price = price + 4100;
		}
		
		var tno = document.getElementById("no");
		var sumCost = document.getElementById("cost");
		
		tno.innerHTML = no + "개";
		sumCost.innerHTML = price + "원";
	}
</script>
</head>
<body>
	<h1 align="center">주 문</h1>
	<div class = "container">
		
		<table class="table">
			<tr>
				<th>주 문 번 호</th>
				<td>(주문코드)OR20190617001)</td>
			</tr>
			<tr>
				<th>주 문 날 짜</th>
				<td>(현 시간)sysdate))</td>
			</tr>
			<tr>
				<th>매 장 명</th>
				<td>(카페명)린 CAFE</td>
			</tr>
			<tr>
				<th>메 뉴 명</th>
				<td>(메뉴명)아메리카노(ice))</td>
			</tr>
			<tr>
				<th>금 액</th>
				<td><span id="cost">4100원</span>&nbsp;&nbsp;
					<button onclick="add(1)">+</button>
					<span id="no">1개 </span>
					<button onclick="add(-1)">-</button>
				</td>
			</tr>
			<tr>
				<th>적립금</th>
				<td>
				<input type="text" name="mileage" size="10" placeholder="###원" >
				<button type="button" onclick="alert('###원 만큼 사용하였습니다.')">사용</button>
				
				</td>
			</tr>
			<tr>
				<th>수 령 방 식</th>
				<td>
					<input type="radio" name="receipt" value="delivery " id="delivery" checked> 
							<label for="delivery ">배달로 하기</label>
					<input type="radio" name="receipt" value="takeout" id="takeout" > 
							<label for="takeout">직접받아가기</label>
				</td>
			</tr>
			<tr>
				<th>배 달 주 소</th>
				<td>(DB안에있는 현주소@@@@@)
					<button type="button" onclick="alert('현 주소로 변경되었습니다.')">현 주소로하기</button>
					<button type="button" onclick="alert('새 주소로 변경되었습니다.')">새 주소로하기</button>
				</td>
			</tr>
			<tr>
				<th>결 제 방 식</th>
				<td>
					<input type="radio" name="payplan" value="card" id="card" checked> 
							<label for="card">카드 결제</label>
				</td>
			</tr>
			<tr>
				<th>총 금 액</th>
				<td>(총금액수)</td>
			</tr>
			
		</table>

		<br>
		<div>
		<div align ="right">
		<button onclick="location='delivery.jsp'" class="btn btn-default ">주문하기</button>
		&nbsp;&nbsp; <a href="javascript:history.go(-1)" class="btn btn-default ">돌아가기</a>
		</div>
		</div>
		
	</div>


</body>
</html>