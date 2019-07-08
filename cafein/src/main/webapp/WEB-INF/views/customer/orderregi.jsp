<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>
<title>Insert title here</title>
<%

 Date now = new Date();
 SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 E요일");
 
 String today = sf.format(now);
%>
<script type="text/javascript">
	var price = 4100;
	var no = 1;
	
	var customerAdd;
	

	
	function add(num) {
		if (num == -1) {
			if (no == 1) {
				alert("1개 이상으로 주문해주세요.");
				return;
			}
			no--;
			price = price - 4100;
		} else if (num == 1) {
			no++;
			price = price + 4100;
		}

		var tno = document.getElementById("no");
		var sumCost = document.getElementById("cost");

		tno.innerHTML = no + "개";
		sumCost.innerHTML = price + "원";
	}
	
	// 고객 주소 가져오기 위한 함수
	function getCostomerInfo(){
		
		var checklogin = "<%=(String) session.getAttribute("cId")%>";
		console.log(checklogin);
		if(checklogin == null || checklogin =="null"){
			alert('로그인이 필요합니다.');
		}else{
			var v_storeId = $("#storeid").val();
			$.ajax({
				url:'customerinfo/'+checklogin,
				type:'GET',
				//contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
					customerAdd= data.cAdd;
					$('input:text[name="cAdd"]').val(customerAdd);
					$('input:text[name="cAdd"]').val(customerAdd);
				}
			});
			// 고객 마일리지 가져오기.
			$.ajax({
				url:'customerreserve',
				type:'GET',
				dataType:'json',
				data: {cId: checklogin, sId: v_storeId},
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
					
					$('input:text[name="mileage"]').attr("placeholder",data.mileAge);
				}
			});
		}
		
		
	}
	
	// 새 주소로 주문
	$("#changeAdd").on("click",function(){
		
	});
	
	// 
	$("#DBcusadd").on("click",function(){
		
	});
	
	
</script>
</head>
	<body>
		<h1 align="center">주 문</h1>
		<div class="container">
			<input id="storeid" value="${store.sid}" style="display: none" >
			<table class="table">
			
				<tr>
					<th>주 문 번 호</th>
					<td>(주문코드)OR20190617001)</td>
				</tr>
				<tr>
					<th>주 문 날 짜</th>
					<td><%= today %></td>
				</tr>
	
				<tr>
					<th>매 장 명</th>
					<td>${selectmenu.sName}</td>
				</tr>
				<tr>
					<th>메 뉴 명</th>
					<td>${selectmenu.mName} ( ${selectmenu.hotice} )</td>
				</tr>
				<tr>
					<th>옵션</th>
					<td>
						<c:if test="${selectmenu.whipping eq 'Y'}">
							휘핑 추가 
						</c:if>
						<c:if test="${selectmenu.syrup eq 'Y'}">
							시럽 추가 
						</c:if>
						<c:if test="${selectmenu.shot eq 'Y'}">
							샷 추가 
						</c:if>
					 </td>
				</tr>
				<tr>
					<th>금 액</th>
					<td><span id="cost">${selectmenu.price}</span>&nbsp;&nbsp;
						<button onclick="add(1)">+</button> <span id="no">${selectmenu.qty}</span>
						<button onclick="add(-1)">-</button></td>
				</tr>
				
				
				
				<tr>
					<th>적립금</th>
					<td><input type="text" name="mileage" size="10"
						placeholder="###원">
						<button type="button" onclick="alert('###원 만큼 사용하였습니다.')">사용</button>

					</td>
				</tr>
				<c:if test="${store.stdeliservice eq 'Y'}">
					<tr>
						<th>수 령 방 식</th>
						<td><input type="radio" name="receipt" value="delivery "
							id="delivery" checked> <label for="delivery ">배달로
								하기</label> <input type="radio" name="receipt" value="takeout"
							id="takeout"> <label for="takeout">직접받아가기</label></td>
					</tr>
				
					<tr>
						<th>배 달 주 소</th>
						<td>
						<c:if test="${selectmenu.cAdd !='' }">
							<input type="text" name="cAdd" value="${selectmenu.cAdd}" style="width: 500px;">
						</c:if>
						<c:if test="${selectmenu.cAdd =='' }">
							<script>
								getCostomerInfo();
							</script>
							<input type="text" name="cAdd" style="width: 500px;">
						</c:if>
							<button type="button" onclick="getCostomerInfo()">현 주소로하기</button>
							<button type="button" id="changeAdd" onclick="alert('새 주소로 변경되었습니다.')">새
								주소로하기</button>
						</td>
					</tr>
				</c:if>
				<c:if test="${store.stdeliservice eq 'N'} ">
					<tr>
						<th>수 령 방 식</th>
						<td>
							<input type="radio" name="receipt" value="takeout" id="takeout" checked="checked"> 
							<label for="takeout">직접받아가기</label>
							</td>
					</tr>
				
				</c:if>
				<tr>
					<th>결 제 방 식</th>
					<td><input type="radio" name="payplan" value="card" id="card"
						checked> <label for="card">카드 결제</label></td>
				</tr>
				<tr>
					<th>총 금 액</th>
					<td>${selectmenu.totalPrice}</td>
				</tr>
			</table>

			<br>
			<div>
				<div align="right">
					<button onclick="location='deliveryForm.do'" class="btn btn-default ">주문하기</button>
					&nbsp;&nbsp; <a href="javascript:history.go(-1)"
						class="btn btn-default ">돌아가기</a>
				</div>
			</div>

		</div>


</body>
</html>