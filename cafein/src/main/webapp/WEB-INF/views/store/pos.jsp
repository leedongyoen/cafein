<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
var qty = 1;
var cnt =0;
   $(document).ready(function() {
	   $("#gridlist").jqGrid({
           colModel: [
        	   { label: 'cnt', name:'cnt', key:true, hidden:true},
        	   { label: 'mNum', name:'mNum', hidden:true},
               { label: '메뉴명', name: 'mName',  width: 130 },
               { label: '옵션', name: 'opName', width: 150  },
               { label: '금액', name: 'Price', width: 75 ,formatter:'integer' },
               {label: '수량', name: 'qty', width: 75, editable:true}
           ],
           formatter:{
        	   integer:{thousandsSeparator:",",defaultValue:'0'}
           },
           viewrecords:true,
           caption:'주문목록', // 그리드 왼쪽 위에 캡션
           rownumbers: true,//왼쪽에 index 가 생김 1부터 시작
           rownumWidth:40,//로우넘의 가로길이
           rowNum:5,// 그리드에 보여줄 데이터의 갯수,-1하면 무한으로 보여준단다..
           width:600,//그리드의 총 가로길이
    //       rowList:[10,20,30],//몇개식 보여줄건지 선택가능하다, 배열형식이라 5,10,15,20,,,가능
    //       multiboxonly : true,
           multiselect : true,//체크박스 사라짐
    		height:300,
    		scroll:1,
           scrollrows : true, // set the scroll property to 1 to enable paging with scrollbar - virtual loading of records
           gridview : true,
           footerrow:true,
           userDataOnFooter:true,
           
           cmTemplate: {sortable: false},
           hoverrows: false,
           autoencode: true,
           ignoreCase: true,
           beforeSelectRow: function () {
               return false;
           }
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

 $(document).ready(function(){
	 $("#cusSearchModal").modal('hide');
		//메뉴로드
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
	//고객검색이벤트로드
		$("#customerserch").on("keyup", function() {
	 		var value = $(this).val().toLowerCase();
	 		if (value.length>=3){
	 		$.ajax({
				url:'searchcuslist/',
				data:{sId:sId,cTel:value},
				type:'GET',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success: getCus
			});
			
	 		}
	 	});
	});	
//매장별 메뉴출력
 function posMenuListResult(data) {
		console.log(sId);
		console.log(data);
		$("#coffeetable tbody").empty();
		$("#beveragetable tbody").empty();
		$("#desserttable tbody").empty();
		$.each(data,function(idx,item){
			// 메뉴 상태에 따라, 카데고리에 따라 나누어서 출력하게 수정
			if(item.caNum == "CACO" && item.opName == null){
				$('<tr>')
				.append($('<br>'))
				.append($('<input type=\'button\'class=\'mbutton\'  id=\'coffee\'>').val(item.mName))
				.append($('<input type=\'hidden\' id=\'hidden_mNum\'>').val(item.mNum))
				.append($('<input type=\'hidden\' id=\'hidden_mPrice}\'>').val(item.mPrice))
				.appendTo('#coffeetable tbody');
			}
			else if(item.caNum == "CADR" && item.opName == null){
				$('<tr>')
				.append($('<br>'))
				.append($('<input type=\'button\' class=\'mbutton\' id=\'beverage\'>').val(item.mName))
				.append($('<input type=\'hidden\' id=\'hidden_menuId2\'>').val(item.mNum))
				.append($('<input type=\'hidden\' id=\'hidden_mPrice2}\'>').val(item.mPrice))
				.appendTo('#beveragetable tbody');
			}else if(item.caNum == "CADE" && item.opName == null){
				$('<tr>')
				.append($('<br>'))
				.append($('<input type=\'button\' class=\'mbutton\' id=\'dessert\'>').val(item.mName))
				.append($('<input type=\'hidden\' id=\'hidden_menuId3\'>').val(item.mNum))
				.append($('<input type=\'hidden\' id=\'hidden_mPrice3}\'>').val(item.mPrice))
				.appendTo('#desserttable tbody');
			}
		});
	}
 //버튼 클릭시 옵션메뉴 출력
 $(document).on("click",".mbutton", function(){
   		 var mName = $(this).val();
	     var mNum = $(this).next().val();
	     var Price = $(this).next().next().val();
	 $.ajax({
			url:'pos/',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			data: {sId: sId, mNum:mNum},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:getOptionList
		});
	 jQuery("#gridlist").jqGrid('addRow', {
	       rowID : mNum,          //중복되지 않게 rowid설정
	       initdata : {mNum, mName, Price, qty},
	       position :"last",           //first, last
	       useDefValues : false,
	       useFormatter : false,
	       addRowParams : {extraparam:{}},
	       sortname: 'mName',
	      	grouping:true,
	      	groupingView : {
	       		groupField : ['mName'],
	       		groupColumnShow : [false],
	       		groupText : ['<b>{0} - {1} '+mName+'</b>']
	       	}
	       
	});
	});
 
 //메뉴 옵션 나타내기
 	function getOptionList(data){
	 
 		var mNum = $('#hidden_mNum').val();
 		$("#coffeetableoption tbody").empty();
	    $.each(data, function(idx,item){
	    	 $('<tr>')
	          .append($('<br>'))
	          .append($('<input type=\'button\'class=\'opbutton\' id=\'cooption\'>').val(item.opName))
	          .append($('<input type=\'hidden\' id=\'hidden_menuId4\'>').val(item.mNum))
	          .append($('<input type=\'hidden\' id=\'hidden_menuId5\'>').val(item.opPrice))
	          .appendTo('#coffeetableoption tbody');
	    });
	    
 	}
 	$(document).on("click",".opbutton", function(){
 		var opName = $(this).val();
		var mNum = $(this).next().val();
		var Price = $(this).next().next().val();
 	 jQuery("#gridlist").jqGrid('addRow', {

	       rowID : mNum,          //중복되지 않게 rowid설정
	       initdata : {opName, Price, qty},
	       position :"last",           //first, last
	       useDefValues : false,
	       useFormatter : false,
	       addRowParams : {extraparam:{}}

	});
 	});
 	
 	
 	 
 
 	//회원검색창 띄우기
 	$(document).on("click","#customersearch", function(){
 		$("#cusSearchModal").modal('show');
 	});
 	//회원검색후 나오는 값
 	function getCus(data){ 
 		$("#customertable tbody").empty();
 		$.each(data, function(idx,item){
	    	 $('<tr>')
	          .append($('<td>').html(item.cName))
	          .append($('<td>').html(item.cTel))
	          .append($('<td>').html(item.mileage))
	          .appendTo('#customertable tbody');
	    });    
 	}
 	
	
 	
</script>
<br><br>
<br><br>
<div class ="container">
<div class="left">
    <table id="gridlist"></table>
    <div id="pager"></div>
</div>
<!-- 메뉴 선택 창 -->
  <div id="btn_group" class="content">
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
			<thead></thead>
				<tbody>
			</tbody>
			
			</table>
			<table id="coffeetableoption" class="table">
			<thead></thead>
				<tbody>
				</tbody>
				
			</table>
			</div>
  		</div>
   		<div id="beverage" class="container tab-pane fade"><br>
    		<table id="beveragetable" class="table">
    		<thead></thead>
				<tbody>
				</tbody>
			</table>
   		</div>
   		<div id="dessert" class="container tab-pane fade"><br>
     		<table id="desserttable" class="table">
     		<thead></thead>
				<tbody>
				</tbody>
			</table>
   		</div>
 	</div>
  </div>

<hr>
<p></p>
	<div style="text-align:left">
	<button>전체취소</button>
	<button>선택취소</button>
	<button>수량변경</button>
	<button>-</button>
	<button>+</button>
	
	
	</div>
	<div style="text-align:right"> 총 가격 4600원</div>
			<div style="text-align:right">
			<button id="customersearch">회원검색</button>
		<!-- 고객 검색 모달창 -->	
	<div class="modal fade" id="cusSearchModal" role="dialog">
		<div class="modal-dialog">		
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">CUSTOMER SEARCH</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-borizontal" action="#" method="POST">
						<input class="form-control" id="customerserch" type="text" placeholder="Search..">
						<div class="table-responsive">
						<table id="customertable" class="table">
							<thead>
							<tr> 
								<th>NAME</th>
								<th>TEL</th>
								<th>MILEAGE</th>
							</tr>
							</thead>
							<tbody id="searchTable">
							</tbody>
						</table>
						</div>
					</form>
				
				</div>
				<div class="modal-footer">		
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
			<button>현금</button>
			<button>카드</button>
			<button onclick="location.href='#'">결제하기</button>
		</div>
</div>




</body>
</html>