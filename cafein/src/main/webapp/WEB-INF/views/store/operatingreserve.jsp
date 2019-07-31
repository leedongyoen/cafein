<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 영업 지출금</title>

<script>

	var i, sum;
	
	function inNumber(){
        if(event.keyCode<48 || event.keyCode>57){
           event.returnValue=false;
        }
    }

	// 추가 지출 추가 (빈칸 입력 시 alert 창 띄우기) --------------------------------------------------
	$('#addbtn').on("click",function(){

		var stName = $('#stName').val();
		var wareQty = $('#wareQty').val();
		sum = $('#sum').val();
		var warePrice = wareQty*sum;
		var stPayMethod = $('input[name="stPayMethod"]:checked').val();
		console.log('stPayMethod : ' + stPayMethod)
		
		// 현재 날짜
		var now = new Date();
	    var year= now.getFullYear();
	    var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	              
	    var sysdate = year + '-' + mon + '-' + day;		//chan_val
	    console.log('sysdate : ' + sysdate);
	    
	    if(stName != '' && wareQty != '' && sum != '') {
	    	
	    	// 배열에 들어갈 객체들을 list에 담는다
			var voList = {		// llist
					 wareDate : sysdate
				    , wareQty : wareQty
				    , warePrice : wareQty*removeCommas(sum)
				    , sum : removeCommas(sum)
				    , stName : stName
				    , sId : sId
				    , stPayMethod : stPayMethod
			};
			// 배열에 넣기
			addDataList.push(voList);
			// 문자열을 json 타입으로 변환
			var jsonVoList = JSON.stringify(addDataList);
			// json을 이용해 string 형식으로 만들어서 session storage에 저장
			sessionStorage.setItem("jsonVoList",jsonVoList);
	    }

		console.log('adddatalist : '+addDataList);
		
		warePrice = removeCommas(wareQty) * removeCommas(sum);
		
		if(stName == "") {
			alert("항목을 입력해 주세요.");
			$('#stName').focus();
			return;
		} else if(wareQty == "") {
			alert("수량을 입력해 주세요.");
			$('#wareQty').focus();
			return;
		} else if(sum == "") {
			alert("가격을 입력해 주세요.");
			$('#sum').focus();
			return;
		}

		$('<tr>')
		.append($('<td>').html(stName))
		.append($('<td>').html(wareQty))
		.append($('<td>').html(addCommas(sum)+'원'))
		.append($('<td>').html(addCommas(warePrice)+'원').attr('id','warePrice'))
		.append($('<td>').html(stPayMethod))
		.append($('<td>').append($('<input>').attr({
			type:'button',
			value:'삭제'
		}).addClass('delbtn')))
		.appendTo('#operatingreservTable tbody');
		
		addTotalSum += warePrice;
		
		console.log('stPayMethod val : '+stPayMethod)
		
		if(stPayMethod == '현금') {
			operatingreserveSum += warePrice;
		}
		
		console.log('addTotalSum : ' +addTotalSum)
		
		$('#totalSum').text(addCommas(addTotalSum)+'원');
		
		$('#stName').val('');
		$('#wareQty').val('');
		$('#sum').val('');
		$("#stPayMethod").val('카드').prop("selected", true);
		
		console.log("operatingreserv에서 daycal total.val : " + $('#totalSum').text())
		console.log('operatingreserveSum (operatingreserv.jsp) : ' +operatingreserveSum)
		
	});
	
	// 가격과 수량은 숫자만 입력 가능하고 3단위마다 콤마 생성
	$("input:text[numberOnly]").on("keyup", function() {
		$(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
    
	});

	// 삭제 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#operatingreservTable').on("click", ".delbtn", function() {
	   
	   // ''+ 를 해주지 않으면 문자열로 인식을 못함
	   var delSum =''+ $(this).parent().parent().children().eq(3).text();		// 지출액의 text
	   var len = $(this).parent().parent().children().eq(3).text().length;		// 지출액의 길이
	   var deleteRow = ''+ $(this).parent().parent().children().eq(0).text();
	  
	   console.log('delete row : ' + deleteRow)
	   // 배열에 담긴 데이터 삭제
	   Array.prototype.remove = function (index) { this.splice(index, 1); }
	   for (var i = 0; i < addDataList.length; i++) {
		
	       if (addDataList[i].stName == deleteRow) {
	    	   console.log('배열에서 항목 : '+addDataList[i].stName + ', 삭제될 항목 : ' + deleteRow);
	    	   addDataList.remove(i);
	    	   sessionStorage.setItem("jsonVoList",JSON.stringify(addDataList));
            }
        }

	   console.log("삭제 후 배열 : "+addDataList);
	   console.log('삭제된 항목의 지출액 : '+delSum.substr(0,len-1));										// 지출액의 마지막 '원'을 자른다
	   
	   addTotalSum -= removeCommas(delSum.substr(0,len-1));
	   operatingreserveSum -= removeCommas(delSum.substr(0,len-1));
	   
	   console.log('minTotalSum : ' + addTotalSum)
	   
	   $('#totalSum').text(addCommas(addTotalSum)+'원');
	   
	   $(this).closest("tr").remove();
	   
	});
	// 취소 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#backbtn').on("click",function(){
		$('#stName').val('');
		$('#wareQty').val('');
		$('#sum').val('');
		$("#stPayMethod").val('카드').prop("checked", true);
	})
	
	// 저장 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#savebtn').on("click",function(){
		$('#operatingreserveSave').text('수정 완료');
		$('#savebtn').attr('disabled',true);
		$('#addbtn').attr('disabled',true);
		$('#backbtn').attr('disabled',true);
		$('.delbtn').attr('disabled',true);
		$('.delbtn').attr('value','삭제불가');
		$('#stName').attr('readonly',true);
		$('#wareQty').attr('readonly',true);
		$('#sum').attr('readonly',true);
		$("input[name=stPayMethod]").attr('disabled',true); 


	})
	
	// 수정 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	// 저장 후 데이터 변경 못하게 할지 생각해보기
	$('#editbtn').on("click",function(){
		$('#operatingreserveSave').text('수정 전');
		$('#savebtn').attr('disabled',false);
		$('#addbtn').attr('disabled',false);
		$('#backbtn').attr('disabled',false);
		$('.delbtn').attr('disabled',false);
		$('.delbtn').attr('value','삭제');
		$('#stName').attr('readonly',false);
		$('#wareQty').attr('readonly',false);
		$('#sum').attr('readonly',false);
		$("input[name=stPayMethod]").attr('disabled',false); 
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
<h3 align = "center">매장 영업 지출금</h3><br>
<div class="container">
	<div class="row">
		<div class="col-12" style="height:350px;width:550px;overflow:auto;">
			<table class="table table-striped" id = "operatingreservTable">
				<thead>
				<tr>
					<th>항목</th>
					<th>수량</th>
					<th>가격</th>
					<th>지출액</th>
					<th>결제방식</th>
					<th>삭제</th>
				</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
				</tfoot>
			</table>
		</div>
		<div style="margin:auto;">
		<form id="addform">
		
			<table>
				<tr>
					<th class="thcolor">항목</th>
					<td><input type="text" id="stName"></td>
				</tr>
				<tr>
					<th class="thcolor">수량</th>
					<td><input type="text" id="wareQty"  onkeypress="inNumber()"></td>
				</tr>
				<tr>
					<th class="thcolor">가격</th>
					<td><input type="text" id="sum"  onkeypress="inNumber()" numberOnly></td>
				</tr>
				<tr>
					<th class="thcolor">결제방식</th>
					<td>
						<input type="radio" name="stPayMethod" id="card" value="카드" checked>카드
						<input type="radio" name="stPayMethod" id="cash" value="현금">현금
					</td>
				</tr>
				
			</table>
			<br><br>
			<div class="container">
				<button type="button" id="addbtn" class="btn btn-outline-info">추가</button>
				<button type="button" id="backbtn" class="btn btn-outline-info">취소</button>
				<button type="button" id="savebtn" class="btn btn-outline-info">저장</button>
				<button type="button" id="editbtn" class="btn btn-outline-info">수정</button>
			</div>
		</form>
		</div>
	</div>
</div>
</body>
</html>