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
	var checklogin = "<%=(String) session.getAttribute("cId")%>";
	
	$(function(){
		getCostomerInfo();
	});
	
	
	function add(num) {
		var price = $("input:text[name='price']").val();
		var v_totalprice = $("input:text[name='total']").val();
		
		var no = $("input:text[name='qty']").val();
		if (num == -1) {
			if (Number(no) == 1) {
				alert("1개 이상으로 주문해주세요.");
				return;
			}
			no = Number(no) - 1;
			v_totalprice = Number(v_totalprice) - Number(price);
		} else if (num == 1) {
			no = Number(no) + 1;
			v_totalprice = Number(v_totalprice) + Number(price);
		}
		$("input:text[name='total']").val(v_totalprice);
		$("input:text[name='qty']").val(no);
	}
	
	// 고객 주소 가져오기 위한 함수
	function getCostomerInfo(){
		
		var v_storeId = $("#storeid").val();
		console.log(v_storeId);
/* 		$.ajax({
			url:'customerinfo/'+checklogin,
			type:'GET',
			contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				customerAdd= data.cAdd;
				$('input:text[name="cAdd"]').val(customerAdd);
			}
		}); */
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
	
	// 새 주소로 주문
	$("#changeAdd").on("click",function(){
		
	});
	

	
	$(function(){
		// 배달선택시 배달주소가 보이게, 미선택시 안보이게
		$("input:radio[name=receipt]").click(function(){
		       console.log("in");
		    if($("input:radio[name=receipt]:checked").val()=='delivery'){
		    	$("#deliveryaddress").show();
		        //$("#deliveryaddress").attr("style","display: inline;");
		    }else if($("input:radio[name=receipt]:checked").val()=='takeout'){
		    	$("#deliveryaddress").hide();
		    	//$("#deliveryaddress").attr("style","display: none;");
		    }
		});
		
		 // 옵션 선택시
	  	$(".checkoption").change(function(){
	  		console.log("option in");
	  		var v_totalprice = $("input:text[name='total']").val();
	  		if($(this).is(":checked")){
					v_totalprice = Number(v_totalprice)+500;
			}else{
				v_totalprice = Number(v_totalprice)-500;
			}
	  		 $("input:text[name='total']").val(v_totalprice);

	  	});
	});
	
	

	
</script>
</head>
	<body>
		<h1 align="center">주 문</h1>
		<div class="container" >
			<input id="storeid" value="${selectmenu.sId}" style="display: none" >
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
					<td>${selectmenu.mName}
						<c:if test="${selectmenu.hotice_option eq 'CAHT'}">
							( HOT )
						</c:if>
						<c:if test="${selectmenu.hotice_option eq 'CAIC'}">
							( ICE )
						</c:if>
					</td>
					<%-- <c:if test="${selectmenu.hotice eq 'CAIC'}">
						<td>${selectmenu.mName} ( ICE )</td>
					</c:if>
					<c:if test="${selectmenu.hotice eq 'CAHT'}">
						<td>${selectmenu.mName} ( HOT )</td>
					</c:if> --%>
				</tr>
				<tr>
					<th>옵션</th>
					<td>				
						<c:forEach items="${selectmenu.cuoptionlist}" var="option"> 
							<input type="text" value="${option}">
						
						</c:forEach>
<%-- 						<c:if test="${selectmenu.whipping eq 'Y'}">
							<input type="checkbox" class="checkoption" name="whipping" value="Y" checked="checked">휘핑크림 추가(+500)<br>
						</c:if>
						<c:if test="${selectmenu.whipping ne 'Y'}">
							<input type="checkbox" class="checkoption" name="whipping" value="Y" >휘핑크림 추가(+500)<br>
						</c:if>
						
						<c:if test="${selectmenu.syrup eq 'Y'}">
							<input type="checkbox" class="checkoption" name="syrup" value="Y" checked="checked">시럽 추가(+500)<br>
						</c:if>
						<c:if test="${selectmenu.syrup ne 'Y'}">
							<input type="checkbox" class="checkoption" name="syrup" value="Y" >시럽 추가(+500)<br>
						</c:if>
						
						<c:if test="${selectmenu.shot eq 'Y'}">
							<input type="checkbox" class="checkoption" name="shot" value="Y" checked="checked">샷 추가(+500)
						</c:if>
						<c:if test="${selectmenu.shot ne 'Y'}">
							<input type="checkbox" class="checkoption" name="shot" value="Y" >샷 추가(+500)
						</c:if> --%>
					 </td>
				</tr>
				<tr>
					<th>금 액</th>
					<td><input name="price" value="${selectmenu.mPrice}" size="2" readonly> &nbsp;&nbsp;
						<button onclick="add(1)">+</button> <input name="qty" size="1" value="${selectmenu.orderqty}" readonly>
						<button onclick="add(-1)">-</button></td>
				</tr>
				
				
				
				<tr id="reservetr">
					<th>적립금</th>
					<td><input type="text" name="mileage" size="10"
						placeholder="###원">
						<button type="button" onclick="alert('###원 만큼 사용하였습니다.')">사용</button>

					</td>
				</tr>
				
					<tr>
						<th>수 령 방 식</th>
						<td>
							<input type="radio" name="receipt" value="delivery" id="delivery" checked> 
							<label for="delivery">배달로하기</label> 
							
							<input type="radio" name="receipt" value="takeout" id="takeout"> 
							<label for="takeout">직접받아가기</label>
						</td>
					</tr>
				
					<tr id="deliveryaddress">
						<th>배 달 주 소</th>
						<td>
							<input type="text" name="cAdd2" > <br>
							<input type="text" name="cAdd" style="width: 500px;">						
							<button type="button" onclick="getCostomerInfo()">현 주소로하기</button>
							<button type="button" id="changeAdd" onclick="alert('새 주소로 변경되었습니다.')">새
								주소로하기</button>
						</td>
					</tr>				
				
				<tr>
					<th>결 제 방 식</th>
					<td><input type="radio" name="payplan" value="card" id="card"
						checked> <label for="card">카드 결제</label></td>
				</tr>
				<tr>
					<th>총 금 액</th>
					<td><input name="total" value="${selectmenu.totalPrice}" readonly></td>
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