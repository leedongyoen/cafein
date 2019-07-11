﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <%@ include file="storehead.jsp" %> 
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>매장POS</title>
<style type="text/css">
.left {
  position:absolute;
  width:600px;
  height: 600px;
  border: 1px solid;
}
.content {
  position:relative;
  width:70%;
  left:600px;
  height:600px;
  border: 1px solid;
}

</style>
</head>
<body>
<script type="text/javascript">
//포스기 버튼
var sId="SH001"; //헤더에있는 Id로 교체
//jqgrid의 orderlist
   $(document).ready(function() {
	   $("#gridlist").jqGrid({
           url: 'pos/'+sId,
           mtype: "GET",
           datatype: "json",
           colModel: [
               { label: '메뉴명', name: 'mName', key: true, width: 75 },
               { label: '수량', name: 'mNum', width: 150  },
               { label: '금액', name: 'mPrice', width: 150  }
           ],
           viewrecords:true,
           caption:'주문목록', // 그리드 왼쪽 위에 캡션
           rownumbers:false,//왼쪽에 index 가 생김 1부터 시작
           rownumWidth:40,//로우넘의 가로길이
           rowNum:5,// 그리드에 보여줄 데이터의 갯수,-1하면 무한으로 보여준단다..
           width:600,//그리드의 총 가로길이
    //       rowList:[10,20,30],//몇개식 보여줄건지 선택가능하다, 배열형식이라 5,10,15,20,,,가능
           multiboxonly : true,
           multiselect : true,//체크박스 사라짐
           scrollrows : true, // set the scroll property to 1 to enable paging with scrollbar - virtual loading of records
  		   pager: "#pager",
           gridview : true
       });
   });

/*  $("#firstTable").jqGrid("setCell",rowid,"status","normal"); // 셀에 지정한 컬럼에 지정한 값 집어넣을수있음
var buffdata = $('#testGrid').jqGrid('getDataIDs'); // 테이블에 있는 모든 데이터를 수집한다.
$('#testGrid').jqGrid('addRowData',로우넘,localdata[i]); // 테이블에 데이터를 넣는다.
$('#testGrid').jqGrid('getGridParam','selarrrow') // 체크한줄 불러옴 배열로 가져옴
$("#testGrid").jqGrid('editRow', 로우넘,true,'clientArray'); // 동적으로 선택한애의 셀을 수정가능하게 변경
$("#testGrid").jqGrid('setRowData', 로우넘, {id:'changed', name:'changed', memo:'changed'}, {color:'red'}) // 선택한 로우의 데이터를 다 바꿀수있다
$("#testGrid").jqGrid('delRowData', rowids[i]); // 로우 삭제
$("#jourTable").getDataIDs(); // 모든 로우 ids 가져옴
var updateList = $("#schoolGrid").getChangedCells('all'); //<--셀에값이 변한 줄 불러옴
footerrow : true});
 $('#debtorTable').jqGrid('footerData', 'set', {accountName:'합계', amount:debTotal});  //footer 데이터  */

 
 //메뉴탭에서 매장메뉴 나오기

 $(document).ready(function getStoreMenuList(){
		$.ajax({
			url:'pos/'+sId,
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success: posMenuListResult
		});
	});	
	
 function posMenuListResult(data) {
		console.log(sId);
		console.log(data);
		$("#coffeetable tbody").empty();
		$("#beveragetable tbody").empty();
		$("#desserttable tbody").empty();
		$.each(data,function(idx,item){
			// 메뉴 상태에 따라, 카데고리에 따라 나누어서 출력하게 수정
			if(item.caNum == "CACO"){
				$('<tr>')
				.append($('<br>'))
				.append($('<input type=\'button\' id=\'coffee\'>').val(item.mName))
				.appendTo('#coffeetable tbody');
			}
			else if(item.caNum == "CADR"){
				$('<tr>')
				.append($('<br>'))
				.append($('<input type=\'button\' id=\'beverage\'>').val(item.mName))
				.appendTo('#beveragetable tbody');
			}else if(item.caNum == "CADE"){
				$('<tr>')
				.append($('<br>'))
				.append($('<input type=\'button\' id=\'dessert\'>').val(item.mName))
				.appendTo('#desserttable tbody');
			}
		});
	}
 $("#tab-content input").on("click",function(){
	 console.log(sId);
 });
 

</script>
<br><br>
<br><br>
<div class ="container">
<div class="left">
    <table id="gridlist"></table>
    <div id="pager"></div>
</div>
<!-- 메뉴 선택 창 -->
  <div class="content">
	<ul id="topclick" class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#coffee">커피</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#beverage">음료</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#dessert">디저트</a>
    </li>
  </ul>

  <!-- Tab panes -->
	<div class="tab-content">
		<div id="coffee" class="container tab-pane active"><br>
			<div class="table-responsive">
			<table id="coffeetable" class="table">
				<tbody id="coffeetable">
				
			</tbody>
			</table>
			</div>
  		</div>
   		<div id="beverage" class="container tab-pane fade"><br>
    		<table id="beveragetable" class="table">
				<tbody id="beveragetable">
				
				</tbody>
			</table>
   		</div>
   		<div id="dessert" class="container tab-pane fade"><br>
     		<table id="desserttable" class="table">
				<tbody id="desserttable">
				
				</tbody>
			</table>
   		</div>
 	</div>
  </div>


<hr>
	<div style="text-align:left">
	<button>전체취소</button>
	<button>선택취소</button>
	<button>수량변경</button>
	<button>-</button>
	<button>+</button>
	
	
	</div>
	<div style="text-align:right"> 총 가격 4600원</div>
			<div style="text-align:right">
			<button>회원검색</button>
			<button>현금</button>
			<button>카드</button>
			<button onclick="location.href='#'">결제하기</button>
		</div>
</div>




</body>
</html>