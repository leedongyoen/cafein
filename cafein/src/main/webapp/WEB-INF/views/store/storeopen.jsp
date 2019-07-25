<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Store Opening Page</title>
<script>
	
	var sId = "<%= (String)session.getAttribute("sId") %>";
	var openTotalCash = 0; //영업준비시재 합계
// 	$('#orSum').text(addCommas(operatingreserveSum)+'원');
	
	//비로그인시 예외처리
	$(function() {
		loginCheck();		
	});
	
	//onkeypress 이벤트
	function inNumber(){
        if(event.keyCode<48 || event.keyCode>57){
           event.returnValue=false;
        }
	}
	// 숫자 3단위마다 콤마 생성
	function addCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//모든 콤마 제거
	function removeCommas(x) {
	    if(!x || x.length == 0) return "";
	    else return x.split(",").join("");
	}
	
	//keyup 할 이벤트
	function call() {
		if($('#cash50000').val() != '') {
			$('#totalcash50000').val(addCommas($('#cash50000').val()*50000));
		} else {
			$('#totalcash50000').val(0);
		}
		
		if($('#cash10000').val() != '') {
			$('#totalcash10000').val(addCommas($('#cash10000').val()*10000));
		} else {
			$('#totalcash10000').val(0);
		}
		
		if($('#cash5000').val() != '') {
			$('#totalcash5000').val(addCommas($('#cash5000').val()*5000));
		} else {
			$('#totalcash5000').val(0);
		}
		
		if($('#cash1000').val() != '') {
			$('#totalcash1000').val(addCommas($('#cash1000').val()*1000));
		} else {
			$('#totalcash1000').val(0);
		}
		
		if($('#cash500').val() != '') {
			$('#totalcash500').val(addCommas($('#cash500').val()*500));
		} else {
			$('#totalcash500').val(0);
		}
		
		if($('#cash100').val() != '') {
			$('#totalcash100').val(addCommas($('#cash100').val()*100));
			
		} else {
			$('#totalcash100').val(0);
		}
		//변수에  텍스트 총값 더해주기
		openTotalCash = parseInt(removeCommas($('#totalcash50000').val())) + parseInt(removeCommas($('#totalcash10000').val())) + 
						parseInt(removeCommas($('#totalcash5000').val())) + parseInt(removeCommas($('#totalcash1000').val())) +
						parseInt(removeCommas($('#totalcash500').val())) + parseInt(removeCommas($('#totalcash100').val()));
		$("#openTotalCash").val(addCommas(openTotalCash));
	}
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click', function() {
			$('#form1').each(function() {
				this.reset();
			});
		});
	}//init
	
	function selectOpen(){
		var sId = "<%= (String)session.getAttribute("sId") %>";
		$.ajax({
  			url:'getOpen.do',
  			type: 'POST',
  			data: JSON.stringify({sId : sId}) ,
  			contentType: 'application/json;charset=utf-8',
			mimeType : 'application/json',
  			dataType: 'json',
  			success : function(data){
  				var openTimeVal = data.openTime;
//   				alert(openTimeVal);
  				localStorage.setItem("openTime",JSON.stringify(openTimeVal));
  				var openTimeLocal = localStorage.getItem("openTime");
// 				alert(openTimeLocal);
  			},
  			error : function(data){
  				alert("selectOpen 에러");
  			}
  		});
		
	
	}
	
	function makeData(){
			//객체에 제이슨형태로 담기. 오픈시간/매장아이디/영업준비금
  		var JsonData ={"sId" : sId, "defaultCash" : openTotalCash};
			
		//제이슨 객체를  스트링으로 변환
  		console.log(JSON.stringify(JsonData));
		
//   	ajax로 데이터 전송->insertOpen 으로.
  		$.ajax({
  			url:'insertstoreopen.do',
  			type: 'POST',
  			data: JSON.stringify(JsonData),
  			contentType: 'application/json;charset=utf-8',
			mimeType : 'application/json',
  			dataType: 'json',
  			success : function(data){
  				if(data == 0){
  					alert('오픈 시제가 정상 입금되었습니다.');
  				}else{
  					alert('익일 마감하였습니다.'); 					
  				}
  			},
  			error : function(data){
  				alert("상태값 :" + status + " Http에러메시지 :" + msg);
  			}
  		});
	
		
	}
		

</script>
	
	
</head>
<body>
	
	<div class="container">
	<h3 align = "center">오픈 시재 입금</h3><br>
		
	<hr>
	<div class="col-11">
		<form id="form1">
		<table id="inputCash" class="table text-center table-striped">
			<tr>
				<th>단위</th><th>수량</th><th>금액</th>
			</tr>
			<tr>
				<th>5만원 </th>
				<td><input type="text" class="cash" id="cash50000" style="width:50px" autofocus onkeyup="call()" onkeypress="inNumber()"></td>
				<td><input type="text" class="totalcash" id="totalcash50000" readonly ></td>
			</tr>
			<tr>
				<th>1만원 </th>
				<td><input type="text" class="cash" id="cash10000" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
				<td><input type="text" class="totalcash" id="totalcash10000" readonly></td>
			</tr>
			<tr>
				<th>5천원 </th>
				<td><input type="text" class="cash" id="cash5000" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
				<td><input type="text" class="totalcash" id="totalcash5000" readonly></td>
			</tr>
			<tr>
				<th>1천원 </th>
				<td><input type="text" class="cash" id="cash1000" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
				<td><input type="text" class="totalcash" id="totalcash1000" readonly></td>
			</tr>
			<tr>
				<th>5백원 </th>
				<td><input type="text" class="cash" id="cash500" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
				<td><input type="text" class="totalcash" id="totalcash500" readonly></td>
			</tr>
			<tr>
				<th>1백원 </th>
				<td><input type="text" class="cash" id="cash100" style="width:50px" onkeyup="call()" onkeypress="inNumber()"></td>
				<td><input type="text" class="totalcash" id="totalcash100" readonly></td>
			</tr>
			<tr>
				<th>총 현금 시재</th>
				<td><input type="text" class="totalcash" id="openTotalCash" readonly></td>
			</tr>
		</table>
		</form>
		<div class="btn-group"  style="float:right;">	
			<button id="openBack" class="btn btn-secondary" onclick="location.href='storemainform.do'">취소</button>
			<button id="btnInit" class="btn btn-primary" onclick="init();" >초기화</button>
			<button id="openInsert" class="btn btn-success" onclick="makeData();">시재등록 </button>
		</div>
	</div>
</div>
</body>
</html>