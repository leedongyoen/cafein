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
.chbtn {
	color: red;
}

</style>
</head>
<body>
<script type="text/javascript">
//포스기 버튼
var sId='<%= session.getAttribute("sId") %>'; //헤더에있는 Id로 교체
//jqgrid의 orderlist
var oQty = 1;
var currNo=0;
var valNo;
var lastSel;

var editableCells = ['oQty'];
   $(document).ready(function() {

	   $("#gridlist").jqGrid({
           colModel: [
        	   { label: 'recipeno',  name:'optionlist', hidden:true},
        	   { label: 'mNum',  name:'mNum', hidden:true},
               { label: '메뉴명',  name: 'mName',  width: 130 },
               { label: '옵션',   name: 'opName', width: 150  },
               { label: '금액',   index:'Price',name: 'Price', width: 75 ,formatter:'integer'},
               { label: '수량',   name: 'oQty', width: 75},
               { label: 'hotice_option', name:'hotice_option'},
               { label: 'parentMNum', name:'parentMNum',hidden:true},
               { label: 'sonMNum', name:'sonMNum',hidden:true}
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
           rowList:[10,20,30],//몇개식 보여줄건지 선택가능하다, 배열형식이라 5,10,15,20,,,가능
//           multiboxonly : false,
//           multiselect : true,//체크박스 사라짐
    		height:300,
    		scroll:1,
           scrollrows : true, // set the scroll property to 1 to enable paging with scrollbar - virtual loading of records
           gridview : true,
           closeAfterEdit: true,
           cellEdit:true,
           forceFit : true,
           cellsubmit:"clientArray",
           footerrow:true,
           userDataOnFooter:true,
     //      userData: { Price: Price },
           hoverrows: false,
           autoencode: true,
           ignoreCase: true,
           grouping:true,
	      	groupingView : {
	       		groupField : ['parentMNum'],
	       		groupColumnShow : [false],
	       		groupText : ["{0}"],
	       		groupcheckbox: true
	       	},
	       	/*수량처리
	       	
	       	ondblClickRow: function(rowid, iRow, iCol, e){
	       		$("#gridlist").jqGrid('getGridParam', {editable: true,cellEdit: true});        	
	       	}, 
	       	
	       	*/
	      //합계
	 	   afterInsertRow: function () {
	 	   var grid = $("#gridlist");
	 	   var PSum = grid.jqGrid('getCol','Price',false,'sum');
	 	   		grid.jqGrid("footerData", "set", {mName:"합계",Price:PSum});
	 	   		
	 	   console.log(PSum);
	 	   //		grid.jqGrid("footerData", "set", {mName:"합계",qty:QSum});
	 	   }
	       	
	       	
       });
	   
	   
	   //그리드내 행 삭제
	   $("#deleteRow").on("click",function(){
			var grid = $("#gridlist");
			
			var rowKey = grid.getGridParam("selrow");
			var sonMNum =  grid.jqGrid("getCell",rowKey,"sonMNum");
			var parentMNum = grid.jqGrid("getCell",rowKey,"parentMNum");
			if(sonMNum == parentMNum){
				var dataIDs = grid.getDataIDs(); 
				for(i = 0; i < dataIDs.length; i++)
				{
					var rowData = grid.jqGrid ('getRowData', dataIDs[i]);
					if(rowData.parentMNum ==sonMNum) {
					    console.log(dataIDs[i]);
						console.log(rowData);
					    $("#gridlist").jqGrid('delRowData',dataIDs[i]);	
				    }
				}
			}else if(sonMNum == ''){
					$("#gridlist").jqGrid('delRowData',rowKey);	
					console.log(rowKey);
			}
			var PSum = grid.jqGrid('getCol','Price',false,'sum');
		 	   var QSum = grid.jqGrid('getCol','oQty',false,'sum');
		 	   		grid.jqGrid("footerData", "set", {mName:"합계", Price:PSum, qty:QSum});
			
		});
	   
	   
   });
     
   //gird전체삭제
   $("#clearRow").on("click",function(){
   		$("#gridlist").jqGrid('clearGridData');
   });

   

/* 
var buffdata = $('#testGrid').jqGrid('getDataIDs'); // 테이블에 있는 모든 데이터를 수집한다.
$('#testGrid').jqGrid('getGridParam','selarrrow') // 체크한줄 불러옴 배열로 가져옴

$("#jourTable").getDataIDs(); // 모든 로우 ids 가져옴
var updateList = $("#schoolGrid").getChangedCells('all'); //<--셀에값이 변한 줄 불러옴
footerrow : true});*/

 
 //메뉴탭에서 매장메뉴 나오기
 $(document).ready(function(){
	 $("#paymentModal").modal('hide');
	 $("#cusSearchModal").modal('hide');
	 $("#orderListModal").modal('hide');
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
	 	
	
	// 최종 주문하기버튼 결제하기
	 $('#orderbtn').on("click",function(){
			var selectop = [];
			var grid = $("#gridlist");
			var dataIDs =  grid.jqGrid('getDataIDs');
			console.log("전체다 " + dataIDs);
			//주문한 데이터 모두 가져오기
			var mNum=[];
		
			var oQty=[];
			var optionlist=[];
			var v_mnum;
			var v_parentMNum = "";
			
			var v_total_menu = [];
			for(i = 0; i < dataIDs.length; i++)
			{
				var rowData = grid.jqGrid ('getRowData', dataIDs[i]);
				console.log(rowData);
				
				if(v_parentMNum == ""){
					v_parentMNum = rowData.parentMNum;
					mNum.push(rowData.mNum);
					oQty.push(rowData.oQty);
		
				}else if(v_parentMNum == rowData.parentMNum){

					if(rowData.optionlist != "")
						optionlist.push(rowData.optionlist);
				}else if(v_parentMNum != rowData.parentMNum){
					var v_menu =[];
					v_menu.push(mNum);
					v_menu.push(oQty);
					
					v_menu.push(optionlist);
					v_total_menu.push(v_menu);
					
					v_parentMNum = rowData.parentMNum;
					mNum = [];
					oQty = [];
					
					optionlist=[];
					mNum.push(rowData.mNum);
					oQty.push(rowData.oQty);
					
				}


			}
			var v_menu =[];
			v_menu.push(mNum);
			v_menu.push(oQty);
			
			v_menu.push(optionlist);
			v_total_menu.push(v_menu);

			console.log("v_total_menu : "+v_total_menu);		
			var ordercart = $("#orderposform").serializeObject();
			
/* 			ordercart.mNum = mNum;
			ordercart.hotice_option = hotice_option;
			ordercart.oQty = oQty;
			ordercart.optionlist = optionlist; */
			ordercart.optionlist = v_total_menu;
			console.log(" serializeObject "+ordercart);
			$('[name="jsonData"]').val(JSON.stringify(ordercart));
			//console.log($('[name="jsonData"]').val());
			console.log(JSON.stringify(ordercart));
			document.posorderinsert.submit();
	 });
	});	
	
  function orderLast(data){
}
//매장별 메뉴출력
 function posMenuListResult(data) {
		console.log(sId);
		console.log(data);
		$("#coffeetable tbody tr").empty();
		$("#beveragetable tbody tr").empty();
		$("#desserttable tbody tr").empty();
		$.each(data,function(idx,item){
			// 메뉴 상태에 따라, 카데고리에 따라 나누어서 출력하게 수정
			if(item.caNum == "CACO" && item.opName == null){
				$('<td>')
				.append($('<br>'))
				.append($('<input type=\'button\'class=\'mbutton\'  id=\'coffee\'>').val(item.mName))
				.append($('<input type=\'hidden\' id=\'hidden_mNum\'>').val(item.mNum))
				.append($('<input type=\'hidden\' id=\'hidden_mPrice\'>').val(item.mPrice))
				.append($('<input type=\'hidden\' id=\'hidden_recipeno\'>').val(item.recipeno))
				.appendTo('#coffeetable tbody tr');
			}
			else if(item.caNum == "CADR" && item.opName == null){
				$('<td>')
				.append($('<br>'))
				.append($('<input type=\'button\' class=\'mbutton\' id=\'beverage\'>').val(item.mName))
				.append($('<input type=\'hidden\' id=\'hidden_menuId2\'>').val(item.mNum))
				.append($('<input type=\'hidden\' id=\'hidden_mPrice2\'>').val(item.mPrice))
				.append($('<input type=\'hidden\' id=\'hidden_recipeno2\'>').val(item.recipeno))
				.appendTo('#beveragetable tbody tr');
			}else if(item.caNum == "CADE" && item.opName == null){
				$('<td>')
				.append($('<br>'))
				.append($('<input type=\'button\' class=\'mbutton\' id=\'dessert\'>').val(item.mName))
				.append($('<input type=\'hidden\' id=\'hidden_menuId3\'>').val(item.mNum))
				.append($('<input type=\'hidden\' id=\'hidden_mPrice3\'>').val(item.mPrice))
				.append($('<input type=\'hidden\' id=\'hidden_recipeno3\'>').val(item.recipeno))
				.appendTo('#desserttable tbody tr');
			}
		});
	}
 //버튼 클릭시 옵션메뉴 출력
 $(document).on("click",".mbutton", function(){
   		 var mName = $(this).val();
	     var mNum = $(this).next().val();
	     var Price = $(this).next().next().val();
	     var recipeno = $(this).next().next().next().val();
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
	 currNo++;
	 valNo = currNo;
	 
	 jQuery("#gridlist").jqGrid('addRow', {
//       rowID : mNum,          //중복되지 않게 rowid설정
      initdata : {optionlist:recipeno, mNum:mNum, mName:mName, Price:Price, oQty:oQty, parentMNum:currNo,sonMNum:valNo},
       position :"last",           
       useDefValues : false,
       useFormatter : false,
       addRowParams : {extraparam:{}}    
}); 
	});
 //메뉴 옵션 나타내기
 	function getOptionList(data){
	 
 		var mNum = $('#hidden_mNum').val();
 		$("#coffeetableoption tbody").empty();
	    $.each(data, function(idx,item){
	    	 $('<tr>')
	          .append($('<br>'))
	          .append($('<input type=\'button\'class=\'opbutton\' id=\''+item.opName+'\'>').val(item.opName))
	          .append($('<input type=\'hidden\' id=\'hidden_menuId4\'>').val(item.mNum))
	          .append($('<input type=\'hidden\' id=\'hidden_mPrice4\'>').val(item.opPrice))
	          .append($('<input type=\'hidden\' id=\'hidden_recipeno4\'>').val(item.recipeno))
	          .append($('<input type=\'hidden\' id=\'hotice_option\'>').val(""))
	          .appendTo('#coffeetableoption tbody');
	    });
	    
 	}
 //옵션 메뉴 gird에 출력
 	$(document).on("click",".opbutton", function(){
 		var opName = $(this).val();
		var mNum = $(this).next().val();
		var Price = $(this).next().next().val();
		var recipeno = $(this).next().next().next().val();
		if(opName == 'HOT'){
			$("#hotice_option").val("CAHT");
			$("#ICE").hide();
			$("#HOT").hide();
		}else if(opName == 'ICE'){
			$("#hotice_option").val("CAIC");
			$("#HOT").hide();
			$("#ICE").hide();
		} 
		var hotice_option = $(this).next().next().next().next().val();
	//	currNo++;
 	 jQuery("#gridlist").jqGrid('addRow', {
//	       rowID : mNum,          //중복되지 않게 rowid설정
	       initdata : {optionlist:recipeno,hotice_option:hotice_option,opName:opName, Price:Price, oQty:oQty, parentMNum:currNo},
	       position :"last",           //first, last
	       useDefValues : false,
	       useFormatter : false,
	       addRowParams : {extraparam:{}}

	});
 	 
 	});

 	
 	//주문내역 검색 모달창
 	$(document).on("click","#orderList", function(){
 		$("#orderListModal").modal('show');
 	});
 
 	//회원검색창 띄우기
 	$(document).on("click","#customersearch", function(){
 		$("#cusSearchModal").modal('show');
 	});
 	//회원검색후 나오는 값
 	function getCus(data){ 
 		$("#customertable tbody").empty();
 		$.each(data, function(idx,item){
	    	 $("<tr onclick=aftersearch('"+item.cName+"','"+item.cTel+"','"+item.mileage+"')>")
	          .append($('<td>').html(item.cName))
	          .append($('<td>').html(item.cTel))
	          .append($('<td>').html(item.mileage))
	          .appendTo('#customertable tbody');
	    }); 
 		
 	}
 	function aftersearch(Name,Tel,mileage){
 		$('#cusSearchModal').modal("hide");
 			console.log(Name,Tel,mileage);
 			$("#aftersearch tbody").empty();
 		    	 $('<tr>')
 		          .append($('<td><input type=\'text\' class=\'data1\' id=\'data1\' value=\''+Name+'\'>'))
 		          .append($('<td><input type=\'text\' class=\'data2\' id=\'data2\' value=\''+Tel+'\'>'))
 		          .append($('<td><input type=\'text\' class=\'data2\' id=\'data3\' value=\''+mileage+'\'>'))
 		          .appendTo('#aftersearch tbody');
 		      
 		}
 	
 	
 	
 	
 	//결제하기
 	$(document).on("click","#payment", function(){

 		$('#cash').removeAttr('disabled');
 		$('#card').removeAttr('disabled');
 		$("#paymentModal").modal('show');
 		$("#payresult").empty();
 		$("#cash").empty();
 		$("#card").empty();
 //		var list =  $("#girdForm").serializeObject();

		var grid = $("#gridlist");
			var dataIDs =  grid.jqGrid('getDataIDs');
		
		//주문한금액 전체 가져오기
		var PSum = grid.jqGrid('getCol','Price',false,'sum');
		console.log(PSum);
		//		$("#payresult").empty();
		
		$("<input>").attr({
			type:"text",
			name:"total",
			value:PSum})
			.attr("class","pay")
			.appendTo("#payresult");
		
		//현금or카드 결제 
	 	$(document).on("click","#cash", function(){
	 		$('#card').attr('disabled', true);
	 		$('[name=payMethod]').val("cash");
			});
	 	$(document).on("click","#card", function(){
	 		$('[name=payMethod]').val("card");
	 		$('#cash').attr('disabled', true);
			$('#getmoney').val($('.pay').val());
			$('#resultmoney').val('0');
	 		
		});
		//현금 선택시 받으신금액 입력
		$('input.numOnly').on('keyup',function(){
			var cnt = $(".exam input.num_sum").length;     
//	          console.log(cnt);
	          
			  for( var i=1; i< cnt; i++){
			     var sum = parseInt($(this).val() || 0 );
			     sum++
//			    console.log(sum);
			  }
			var minus = parseInt($("#getmoney").val() || 0);
			var sum = minus-PSum;
//			console.log(sum);
			$("#resultmoney").val(sum);
		});
		
//		orderLast(selectop);
		
	});
 	
 	//환불 날짜별 검색
/* 	function dateSearch() {
		//날짜 데이터 같이 보내기
		var startDate = jQuery('#startDate').val();
		var endDate = jQuery('#endDate').val();

		//   		if(startDate == '' || endDate == ''){
		//   			alert('날짜를 선택해 주세요.');
		//   			return;
		//   		}

		//alert(jQuery('#startDate').val());
		//alert(jQuery('#endDate').val());

		$.ajax({
			url : 'dateSearch',
			type : 'POST',
			dataType : 'json',
			data : {
				startDate : startDate,
				endDate : endDate,
				sId : sId
			},
			
			error : function(status, msg) {
				alert(status + "메세지" + msg);
			},
			success : function(data) {
				warehousingListResult(data);
				chartData = [];
				chartData.push([ '재고명', '수량' ])
				
				for (i = 0; i < data.length; i++) {
					var datas = [ data[i].stName, data[i].wareQty ];
					//							data[i].warePrice, data[i].stLoss];
					chartData.push(datas);
					console.log(datas);
				}
				if(datas == null){
					alert("기간에 맞는 데이터가 없습니다.");
				}
				drawChart();
				
			}
		});
	} */
	
	
</script>
<br><br>
<br><br>
<div class ="container">
<div class="left">
<form class="form-borizontal" name="girdForm" action="customerorder" method="POST">
    <table id="gridlist"></table>
    <div id="pager"></div>
</form>
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
				<tbody>
				<tr></tr>
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
				<tbody>
				<tr></tr>
				</tbody>
			</table>
   		</div>
   		<div id="dessert" class="container tab-pane fade"><br>
     		<table id="desserttable" class="table">
				<tbody>
				<tr></tr>
				</tbody>
			</table>
   		</div>
 	</div>
  </div>

<hr>
<div>
<table id="aftersearch">
<thead>
<tr>
	<th>NAME</th>
	<th>TEL</th>
	<th>MILEAGE</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

</div>
사용할 마일리지 : <input type="text" id="useMile" value="0">
<p></p>
	<div style="text-align:left">
	<input type="button" id="clearRow" value="전체취소">
	<input type="button" id="deleteRow" value="선택취소">
	</div>
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
	
	<button id="orderList">결제정보</button>
	<!-- 결제내역조회 모달 -->
	<div class="modal fade" id="orderListModal" role="dialog">
		<div class="modal-dialog">		
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">ORDER LIST</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-borizontal" action="#" method="POST">
						<div class="btn-group">
							<input type="date" class="btn btn-secondary" id="startDate"
								name="startDate">&nbsp; <input type="date"
								class="btn btn-secondary" id="endDate" name="endDate">&nbsp;
							<input type="button" value="검색" class="btn btn-success"
								id="btnSearch" onclick="dateSearch()">
						</div>
						<div class="table-responsive">
						<table id="orderlisttable" class="table">
							<thead>
							<tr> 
								<th>DATE</th>
								<th>DATE</th>
								<th>MILEAGE</th>
							</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
						</div>
					</form>
				
				</div>
				<div class="modal-footer">
					<input type="button" value="환불하기">		
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 결제하기 모달창 -->
	<div class="modal fade" id="paymentModal" role="dialog">
		<div class="modal-dialog">		
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Payment</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form action="posorder" method="post" name="posorderinsert" >
					<input type="hidden" name="jsonData">
				</form>
				<form class="form-borizontal"  id="orderposform" >
				<div class="modal-body">
						<input type="text" name="cAdd" style="display: none;" >
						<input type="text" name="cAdd3" style="display: none;" >
						<input type="text" name="receipt" value="takeout" style="display: none;" >
						<input type="text" name="mileage" value="0"  style="display: none;" >
						<input type="text" name="sId" value='<%= session.getAttribute("sId") %>'  style="display: none;" >
						<input type="text" name="cId"  style="display: none;" >
						<input type="text" name="optionlist"  style="display: none;" >
						<input type="text" name="payMethod"  style="display: none;" >
						
						
						<div class="table-responsive" style="text-align:left">
						<div style="text-align:right">
							<input type="button" name="payMethod" id="cash" value="현금">
							<input type="button" name="payMethod"  id="card" value="카드">
						</div>
						<table id="payNow" class="exam">
							<thead>
							<tr> 
								<th>받으신 돈</th>
								<td><input type="text" id="getmoney" class="numOnly num_sum"></td>
							</tr>
							<tr> 
								<th>받으실 돈</th>
								<td id="payresult" class="numOnly num_sum"></td>
							</tr>
							<tr> 
								<th>거스름 돈</th>
								<td><input type="text" id="resultmoney" class="numOnly num_sum"></td>
							</tr>
							</thead>
						</table>
						</div>
					
				
				</div>
				<div class="modal-footer">
					<input type="button" id="orderbtn" value="결제하기">		
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
				</form>
			</div>
		</div>
	</div>
			<input type="button" id="payment" value="결제하기">
		</div>
</div>
</body>
</html>