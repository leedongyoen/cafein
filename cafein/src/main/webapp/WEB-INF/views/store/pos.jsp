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
  body{
background-color:#424242;
}
         
.left {
  position:absolute;
  width:900px;
  height: 600px;
}
.content {
  position:relative;
  width:740px;
  left:900px;
  height:600px;
}
.grid-container {
  display: inline-grid;
  grid-template-columns: auto auto auto auto;
  background-color: #424242;
  padding: 1px;
  grid-column-gap:25px;
  grid-row-gap: 25px;
}

.grid-item {
  background-color: #424242;

  text-align: center;
}
.mbutton{
	font-size: 1.3em;
	width:150px;
  height:100px;
}
.opbutton{
  font-size: 1.3em;
  width:150px;
  height:60px;
}
.mbutton {
  display: inline-block;
  padding: 0.5em 1.0em;
  margin-bottom: 10px;
  background: #EEE;
  border: none;
  border-radius: 7px;
  background-image: linear-gradient( to bottom, hsla(0, 0%, 0%, 0), hsla(0, 0%, 0%, 0.2) );
  color: #222;
  font-family: sans-serif;
  font-size: 16px;
  text-shadow: 0 1px white;
  cursor: pointer;
}

.mbutton:hover{
	transition-duration: 4s;
background-image: linear-gradient(to bottom,
	rgba(0,0,0,0),rgba(0,0,0,0.5));
	}

.mbutton:active,
.mbutton.is-checked {
  background-color: #28F;
}

.mbutton.is-checked {
  color: white;
  text-shadow: 0 -1px hsla(0, 0%, 0%, 0.8);
}

.mbutton:active {
  box-shadow: inset 0 1px 10px hsla(0, 0%, 0%, 0.8);
}
.opbutton {
  display: inline-block;
  padding: 0.5em 1.0em;
  margin-bottom: 10px;
  background: #EEE;
  border: none;
  border-radius: 7px;
  background-image: linear-gradient( to bottom, hsla(0, 0%, 0%, 0), hsla(0, 0%, 0%, 0.2) );
  color: #222;
  font-family: sans-serif;
  font-size: 16px;
  text-shadow: 0 1px white;
  cursor: pointer;
}

.opbutton:hover{
	transition-duration: 4s;
background-image: linear-gradient(to bottom,
	rgba(0,0,0,0),rgba(0,0,0,0.5));
	}

.opbutton:active,
.opbutton.is-checked {
  background-color: #28F;
}

.opbutton.is-checked {
  color: white;
  text-shadow: 0 -1px hsla(0, 0%, 0%, 0.8);
}

.opbutton:active {
  box-shadow: inset 0 1px 10px hsla(0, 0%, 0%, 0.8);
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
var ordernum ="";
   $(document).ready(function() {

	   $("#gridlist").jqGrid({
           colModel: [
        	   { label: 'recipeno',  name:'optionlist', hidden:true},
        	   { label: 'mNum',  name:'mNum', hidden:true},
               { label: '메뉴명',  name: 'mName',  width: 130 },
               { label: '옵션',   name: 'opName', width: 150  },
               { label: '금액',   index:'Price',name: 'Price', width: 75 ,formatter:'integer'},
               { label: '수량',   name: 'oQty', width: 75},
               { label: 'hotice_option', name:'hotice_option',hidden:true},
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
           width:900,//그리드의 총 가로길이
           rowList:[10,20,30],//몇개식 보여줄건지 선택가능하다, 배열형식이라 5,10,15,20,,,가능
    		height:500,
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
	   
	   //그리드 새로고침
	   $("#clearRow").on("click",function(){
		   $("#gridlist").jqGrid("clearGridData", true).trigger("reloadGrid");
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
   

/* 
var buffdata = $('#testGrid').jqGrid('getDataIDs'); // 테이블에 있는 모든 데이터를 수집한다.
$('#testGrid').jqGrid('getGridParam','selarrrow') // 체크한줄 불러옴 배열로 가져옴

$("#jourTable").getDataIDs(); // 모든 로우 ids 가져옴
var updateList = $("#schoolGrid").getChangedCells('all'); //<--셀에값이 변한 줄 불러옴
footerrow : true});*/

 
 //메뉴탭에서 매장메뉴 나오기
 $(document).ready(function(){
	 $("#aftersearch").hide();
	
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
		
	 getstoremileageservice();
	// 매장 마일리지 서비스 정보 가져오기
	 function getstoremileageservice(){
			$.ajax({
				url:'getstoremileageservice',
				type:'GET',
				data: {sId: sId},
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:function(data){ 
					//
					$("input:text[name='stMileageService']").val(data);
					
						
				}
			}); 
			
		}
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
	
		//100원단위 마일리지 사용
		$('#reservebtn').on("click",function(){
			var mileage = $('#useMile').val();	//차감하려고 적은 마일리지 값
			var totalmileage =$('#cusMile').val();	//현재 회원의 적립금
			if( Number(mileage)%100 != 0 || Number(mileage) == 0){
				alert("100원 단위로만 사용가능합니다.");
				$('#useMile').val("0");				

			}else if(Number(mileage) > Number(totalmileage)){
				alert('사용가능한 적립금을 초과하였습니다.');
				
			}else{
				var PSum = $("#gridlist").jqGrid('getCol','Price',false,'sum');
				var sPSum = Number(PSum) - Number(mileage);
				console.log(sPSum);
				 $("input:text[name='total']").val(sPSum);
				 var now_mile = (totalmileage*1)-(mileage*1);
				 $('#cusMile').val(now_mile);
				 $('#reservebtn').attr('disabled',true);
			}
		});
		$('#reservecancelbtn').on("click",function(){
			// 사용자가 적은 적립금
			var mileage = $('#useMile').val();
			var totalmileage =$('#cusMile').val();
			// 총 가격
			totalmileage = Number(totalmileage) + Number(mileage);
			 $("input:text[name='total']").val(totalmileage);
			 
			$('#useMile').val("0");
			$('#cusMile').val(totalmileage);
			$('#reservebtn').attr('disabled',false);
		});
	 	
	
	// 최종 주문하기버튼 결제하기
	 $('#orderbtn').on("click",function(){
			var selectop = [];
			var grid = $("#gridlist");
			var dataIDs =  grid.jqGrid('getDataIDs');
			console.log("전체다 " + dataIDs);
			//고객 정보 가지고 오기
			var cId = $("#cusId").val();
			var mileage=$("#useMile").val();
			console.log(cId, mileage);
			$("input:text[name='cId']").val(cId);
			$("input:text[name='mileage']").val(mileage);
			
			//주문한 데이터 모두 가져오기
			var mNum=[];
			var oQty=[];
			var optionlist=[];
			var v_mnum;
			var v_parentMNum = "";
			//jq grid에 있는 정보 가지고 오기
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
			ordercart.optionlist = v_total_menu;
			console.log(" serializeObject "+ordercart);
			$('[name="jsonData"]').val(JSON.stringify(ordercart));
			//console.log($('[name="jsonData"]').val());
			console.log(JSON.stringify(ordercart));
			document.posorderinsert.submit();
	 });
	});	
	//탭키 누를 때 옵션 empty
	$(document).on("click","#click", function(){
		$("#coffeetableoption").empty();
 		$("#beveragetableoption").empty();
 		$("#desserttableoption").empty();	
	});

//매장별 메뉴출력
 function posMenuListResult(data) {
		console.log(sId);
		console.log(data);
 		
		$("#coffeetable").empty();
		$("#beveragetable").empty();
		$("#desserttable").empty();

		$.each(data,function(idx,item){
			// 메뉴 상태에 따라, 카데고리에 따라 나누어서 출력하게 수정
			if(item.caNum == "CACO" && item.opName == null){
				$('<div class="grid-item">')
				.append($('<input type=\'button\'class=\'mbutton btn btn-dark\'  id=\'coffee\'>').val(item.mName))
				.append($('<input type=\'hidden\' id=\'hidden_mNum\'>').val(item.mNum))
				.append($('<input type=\'hidden\' id=\'hidden_mPrice\'>').val(item.mPrice))
				.append($('<input type=\'hidden\' id=\'hidden_recipeno\'>').val(item.recipeno))
				.appendTo('#coffeetable');
			}
			else if(item.caNum == "CADR" && item.opName == null){
				$('<div class="grid-item">')
				.append($('<input type=\'button\' class=\'mbutton btn btn-dark\' id=\'beverage\'>').val(item.mName))
				.append($('<input type=\'hidden\' id=\'hidden_menuId2\'>').val(item.mNum))
				.append($('<input type=\'hidden\' id=\'hidden_mPrice2\'>').val(item.mPrice))
				.append($('<input type=\'hidden\' id=\'hidden_recipeno2\'>').val(item.recipeno))
				.appendTo('#beveragetable');
			}else if(item.caNum == "CADE" && item.opName == null){
				$('<div class="grid-item">')
				.append($('<input type=\'button\' class=\'mbutton btn btn-dark\' id=\'dessert\'>').val(item.mName))
				.append($('<input type=\'hidden\' id=\'hidden_menuId3\'>').val(item.mNum))
				.append($('<input type=\'hidden\' id=\'hidden_mPrice3\'>').val(item.mPrice))
				.append($('<input type=\'hidden\' id=\'hidden_recipeno3\'>').val(item.recipeno))
				.appendTo('#desserttable');
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
      initdata : {optionlist:recipeno, mNum:mNum, mName:mName, Price:Price, oQty:oQty, parentMNum:currNo,sonMNum:valNo},
       position :"last",           
       useDefValues : false,
       useFormatter : false,
       addRowParams : {extraparam:{}}    
}); 
	});
 //메뉴 옵션 나타내기
 	function getOptionList(data){
 		$("#coffeetableoption").empty();
 		$("#beveragetableoption").empty();
 		$("#desserttableoption").empty();
 		var mNum = $('#hidden_mNum').val();

	    $.each(data, function(idx,item){
	    	 $('<div class="grid-item">')
	          .append($('<input type=\'button\'class=\'opbutton btn btn-dark\' id=\''+item.opName+'\'>').val(item.opName))
	          .append($('<input type=\'hidden\' id=\'hidden_menuId4\'>').val(item.mNum))
	          .append($('<input type=\'hidden\' id=\'hidden_mPrice4\'>').val(item.opPrice))
	          .append($('<input type=\'hidden\' id=\'hidden_recipeno4\'>').val(item.recipeno))
	          .append($('<input type=\'hidden\' id=\'hotice_option\'>').val(""))
	          .appendTo('#coffeetableoption');
	    	 $('<div class="grid-item">')
	          .append($('<input type=\'button\'class=\'opbutton btn btn-dark\' id=\''+item.opName+'\'>').val(item.opName))
	          .append($('<input type=\'hidden\' id=\'hidden_menuId4\'>').val(item.mNum))
	          .append($('<input type=\'hidden\' id=\'hidden_mPrice4\'>').val(item.opPrice))
	          .append($('<input type=\'hidden\' id=\'hidden_recipeno4\'>').val(item.recipeno))
	          .append($('<input type=\'hidden\' id=\'hotice_option\'>').val(""))
	          .appendTo('#beveragetableoption tbody');
	    	 $('<div class="grid-item">')
	          .append($('<input type=\'button\'class=\'opbutton btn btn-dark\' id=\''+item.opName+'\'>').val(item.opName))
	          .append($('<input type=\'hidden\' id=\'hidden_menuId4\'>').val(item.mNum))
	          .append($('<input type=\'hidden\' id=\'hidden_mPrice4\'>').val(item.opPrice))
	          .append($('<input type=\'hidden\' id=\'hidden_recipeno4\'>').val(item.recipeno))
	          .append($('<input type=\'hidden\' id=\'hotice_option\'>').val(""))
	          .appendTo('#desserttableoption');
	    	 
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
	    	 $("<tr onclick=aftersearch('"+item.cId+"','"+item.cName+"','"+item.cTel+"','"+item.mileage+"')>")
	    	 .append($('<td>').html(item.cId))
	          .append($('<td>').html(item.cName))
	          .append($('<td>').html(item.cTel))
	          .append($('<td>').html(item.mileage))
	          .appendTo('#customertable tbody');
	    }); 
 		
 	}
 	function aftersearch(Id,Name,Tel,mileage){
 		$('#cusSearchModal').modal("hide");
 		 $("#aftersearch").show();
 			console.log(Id,Name,Tel,mileage);
 			$("#aftersearch tbody").empty();
 		    	 $('<tr>')
 		    	 .append($('<td><input type=\'text\'class=\'data0\' id=\'cusId\' value=\''+Id+'\'>'))
 		          .append($('<td><input type=\'text\'class=\'data1\' id=\'cusName\' value=\''+Name+'\'>'))
 		          .append($('<td><input type=\'text\' class=\'data2\' id=\'cusTel\' value=\''+Tel+'\'>'))
 		          .append($('<td><input type=\'text\' class=\'data3\' id=\'cusMile\' value=\''+mileage+'\'>'))
 		          .appendTo('#aftersearch tbody');
 		      
 		}
 	//결제하기
 	$(document).on("click","#payment", function(){

 		$('#cash').removeAttr('disabled');
 		$('#card').removeAttr('disabled');
 		$('#getmoney').val('0');
 		$('#resultmoney').val('0');
 		$("#paymentModal").modal('show');
 		$("#payresult").empty();
 		$("#cash").empty();
 		$("#card").empty();

		var grid = $("#gridlist");
		var dataIDs =  grid.jqGrid('getDataIDs');
		var PSum = $("#gridlist").jqGrid('getCol','Price',false,'sum');
		var mileage = $('#useMile').val();
		//		$("#payresult").empty();
		var sPSum = Number(PSum) - Number(mileage);
		$("<input>").attr({
			type:"text",
			name:"total",
			value:sPSum})
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
			  for( var i=1; i< cnt; i++){
			     var sum = parseInt($(this).val() || 0 );
			     sum++
			  }
			var minus = parseInt($("#getmoney").val() || 0);
			var sum = minus-PSum;

			$("#resultmoney").val(sum);
		});
		

		
	});
 	
 	//환불 날짜별 검색
 	function getCusRefund() {
 		 
		//날짜 데이터 같이 보내기
		var startDate = jQuery('#startDate').val();
		var endDate = jQuery('#endDate').val();
		
		if(startDate > endDate){
  			alert('검색 날짜를 확인해주세요.');
  			return;
  		}else if(startDate == '' || endDate == ''){
  			alert('날짜를 입력해주세요.');
  			return;
  		}
  		console.log("startDate : "+ startDate);
  		console.log("endDate : "+ endDate);
  		$('#orderlisttable tbody').empty();
		$.ajax({
			url : 'searchorder',
			type : 'GET',
			dataType : 'json',
			data : {startDate : startDate,endDate : endDate,sId : sId},
			error : function(status, msg) {
				alert(status + "메세지" + msg);
			},
			success : function(data) {
				
				
				$.each(data,function(idx,item){
					
					if(item.cId == null) item.cId="";
					if(item.refuseReason == null) item.refuseReason="";
					
					$('<tr>').attr({
						onclick:"menudetail('"+item.oNum+"')",
						name:"really",
						id: "table"+item.oNum
					})
					.append($('<td><input type=\'text\'id=\'oNum4\' value=\''+item.oNum+'\'>'))
					.append($('<td><input type=\'text\'id=\'oDate4\' value=\''+item.oDate+'\'>'))
					.append($('<td><input type=\'text\'id=\'cId4\' value=\''+item.cId+'\'>'))
					.append($('<td><input type=\'text\'id=\'payMethod4\' value=\''+item.payMethod+'\'>'))
					.append($('<td><input type=\'text\'id=\'total4\' value=\''+item.total+'\'>'))
					.append($('<td><input type=\'text\'id=\'refuseReason4\' value=\''+item.refuseReason+'\'>'))
					.appendTo('#orderlisttable tbody');
					
					if(item.refuseReason != "") $('.really').css("background-color", "pink");
				});
				
				}
		});	
					
				
			} 
 	function menudetail(orderNum){ 
 		var reason = $('#refuseReason4').val();
 		var menu_qty="0";
		var menunum="";
		var test="";
		console.log(reason);
		console.log(orderNum);
 		$.ajax({
			url: 'searchdetails',
			type:'GET',
			dataType:'json',
			data: {oNum: orderNum},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success: function (data){
		 		console.log(data);
		 		$("#op_tr"+orderNum).empty();
		 		$.each(data,function(idx,item){
		 			console.log(item);
					if(menunum == ""){
						menunum = item.oDnum;
						test = item.mName+" - ";
						menu_qty="0";
					}
					if(menunum == item.opDnum){
						if(menu_qty == "0" && item.oQty != "0"){
							test = test+" "+item.oQty+" 개 - ";
							menu_qty=item.oQty;
						}
						test = test +" "+ item.opName;
						console.log("--- "+test);
						
					}
					if(menunum != item.opDnum){
						menunum = item.oDnum;
						menu_qty="0";
						test = test + "<br>" +item.mName+" - ";
						test = test +" " +item.opName;
						console.log(test);
					}
				}); 
		 		console.log(test);
		 			$('#table'+orderNum).after($('<tr>').attr("class","optiontable").attr("id","op_tr"+orderNum)
		 					.append($('<td>').html("메뉴명 : <br>"+test).attr("colspan","2"))
							.append($('<td>').html("고객성함 : " +data[0].cName))
							.append($('<td>').html("사용한 마일리지 : " +data[0].mileage))
							.append($('<td>').html("총 금액 : "+data[0].total+"원"))
							.append($('<button>').attr({
								type:"button",
								onclick:"refund('"+orderNum+"')"
							}).append("환불하기"))
							);
			}
			});	
			}
 	
 	function refund(orderNum){
 		$.ajax({
			url: 'refoundsuccess',
			type:'POST',
			dataType:'json',
			data: {oNum: orderNum},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success: function (data){
				console.log(data);
				alert("환불이 완료되었습니다.");
			}
				
			});
 		
 		
 	}
 	
 	

</script>
<div>
<div class="left">
<form class="form-borizontal" name="girdForm" action="customerorder" method="POST">
    <table id="gridlist"></table>
    <div id="pager"></div>
</form>
</div>

<!-- 메뉴 선택 창 -->
  <div id="btn_group" class="content">
	<ul id="topclick" class="nav nav-tabs">
    <li class="nav-item" id="click">
      <a class="nav-link active" data-toggle="tab" href="#coffee">커피</a>
    </li>
    <li class="nav-item" id="click">
      <a class="nav-link" data-toggle="tab" href="#beverage">음료</a>
    </li>
    <li class="nav-item" id="click">
      <a class="nav-link" data-toggle="tab" href="#dessert">디저트</a>
    </li>
  </ul>

  <!-- Tab panes -->
	<div class="tab-content">
		<div id="coffee" class="container tab-pane active"><br>
			<div class="table-responsive">
			<div id="coffeetable" class="grid-container"></div>
			<hr>
			<div id="coffeetableoption" class="grid-container"></div>
			</div>
  		</div>
   		<div id="beverage" class="container tab-pane fade"><br>
   		<div id="beveragetable" class="grid-container"></div>
   		<br>
   		<div id="beveragetableoption" class="grid-container"></div>
   		</div>
   		<div id="dessert" class="container tab-pane fade"><br>
   		<br>
   		<div id="desserttable" class="grid-container"></div>
   		<div id="desserttableoption" class="grid-container"></div>
   		</div>
 	</div>
  </div>
<br><br><br><br><br>
<div>
<div id="aftersearch">
<table>
<thead>
<tr>
	<th>ID</th>
	<th>NAME</th>
	<th>TEL</th>
	<th>MILEAGE</th>
	
</tr>
</thead>
<tbody>
</tbody>
</table>
<a id="insertmileage" style="color:white">사용할 마일리지 : <input type="text" id="useMile" value="0">
<button type="button" id="reservebtn">사용</button>
<button type="button" id="reservecancelbtn">취소</button>
</a>
</div>
</div>



	<div style="text-align:left">
	<input type="button" id="clearRow" class="btn btn-outline-light" value="전체취소">
	<input type="button" id="deleteRow" class="btn btn-outline-light" value="선택취소">
	</div>
			<div style="text-align:right">
			<input type="button" class="btn btn-outline-light" id="customersearch" value="회원검색">
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
								<th>ID</th>
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
	
	<input type="button"class="btn btn-outline-light" id="orderList" value="결제정보">
	<!-- 결제내역조회 모달 -->
	<div class="modal fade" id="orderListModal" role="dialog" >
		<div class="modal-dialog" style="width: 100px; display: table;">		
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
							<input type="button" value="검색" class="btn btn-outline-dark"
								id="btnSearch" onclick="getCusRefund()">
						</div>
						<div class="table-responsive" style="text-align:left">
						<table id="orderlisttable" class="table" >
							<thead>
							<tr> 
								<th>주문번호</th>
								<th>DATE</th>
								<th>고객 아이디</th>
								<th>결제방식</th>
								<th>결제금액</th>
								<th>비고</th>
							</tr>
							</thead>
							<tbody>
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
						<input type="text" name="stMileageService" value="N"  style="display: none;" >
						
						<div class="table-responsive" style="text-align:left">
						<div style="text-align:right">
							<input type="button" name="pay" id="cash" value="현금">
							<input type="button" name="pay"  id="card" value="카드">
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
					<input type="button" id="orderbtn" class="btn btn-outline-dark"  value="결제하기">		
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
				</form>
			</div>
		</div>
	</div>
			<input type="button" id="payment" class="btn btn-outline-light" value="결제하기">
		</div>
</div>
</body>
</html>