<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
/* The Close Button */
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

</style>

</head>
<body>
	<h1 align="center">나만의 메뉴</h1>
	<hr>
	<br>	
	<div class="container">
		<div id="play" align="right">
		<form name="searchFrm">
		정렬기준<select name="sort" onchange="myMenuList()" >
			<option value="S_NAME">상호명
			<option value="M_NAME">메뉴명
		</select>
		</form>
		<script type="text/javascript">
		searchFrm.sort.value = "${ViewMymenuVO.sort}" == "" ? searchFrm.sort.options[0].value
				: "${ViewMymenuVO.sort}";
		</script>
		<br>
			<a href="${pageContext.request.contextPath}/customerstorelist.do" id="addddd"
				class="test btn">추가</a>
				<a class="test btn" href="javascript:deleteMymenu()" id="deletemymenu">삭제</a>
				<br>
			<div id="somediv" title="" style="display: none;">
				<div id="thedialog"></div>
			</div>

		</div>

			<div class ="row" id="GoToDetail"></div>

<div class="deleteCheckon" align="right">
<a class="deletetest btn" href="javascript:deleteMymenu()" id="deletemymenuon">삭제하기</a>
<a class="offtest btn" href="javascript:deleteMymenu()" id="offtest">돌아가기</a>
</div>
</div>




<!--모달 나만의 메뉴-->
<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">		
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">나만의메뉴상세</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
				
					<form class="form-borizontal" name="mymenudetailForm" id="mymenudetailcart" action="customerorder" method="POST">
						<div class="table-responsive">
						<input type="text" name="mNum" style="display: none;" >
						<input type="text" name="sId" style="display: none;" >
						<input type="text" name="cId" style="display: none;" >
						<input type="text" name="orderqty" style="display: none;">
						<table id="detailtable" class="table table-hover">
		<tr>
			<th>매 장 명</th>
			<td><input type="text" id="sName" name="sName"
						readonly="readonly"></td>
		</tr>
		<tr>
			<th>메 뉴 명</th>
			<td><input type="text" id="mName" name="mName"
						readonly="readonly"></td>
		</tr>
		
		<tr>
			<th>가 격</th>
			<td><input type="text" id="mPrice" name="mPrice"
						readonly="readonly"></td>
		</tr>
		<tr>
			<th>수 량</th>
			<td>
			
				<input type="button" onclick="add(-1)" value="-">
				<span id="ordernum">1 </span>
				<input type="button" onclick="add(1)" value="+">
			</td>
		</tr>
		<tr>
			<th>HOT/ICE</th>
			<td>
				<input  type="radio" id="ice" name="hotice_option" value="CAIC">ice
				<input  type="radio"  id="hot" name="hotice_option" value="CAHT">hot
			</td>
		</tr>
		<tr>
			<th>OPTION</th>
			<td id="menudetailoption"></td>
		</tr>
		<tr>
			<th>총 금 액</th>
			<td><input type="text" id="totalPrice" name="totalPrice"
						readonly="readonly"></td>
		</tr>
	</table>
						</div>
					</form>
				
				</div>
				<div class="modal-footer">
					<button class="btn btn-outline-primary" id="cu_orderbtn">주문</button>&nbsp;&nbsp;
					<button class="btn btn-outline-primary" id="cartbtn">담기</button>&nbsp;&nbsp;		
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

	var datas;
	var totalcheckboxnum;
	
	$(function(){
		myMenuList();
	});
	//화면에 뿌리기.
	function myMenuList() {
		
		$("#myModal").modal('hide');
		$.ajax({
			url : 'customer/',
			data :{sort:$('[name="sort"]').val()},
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function myMenuListResult(data){
				
				datas=data;
				$("#GoToDetail").empty();
				$.each(data, function(idx, item) {
					console.log(item.cuNum);
					var imgurl = "${pageContext.request.contextPath}/image/"+item.uploadFileName;
				$("#GoToDetail").append("<div class=\"col-md-4\"><div><img src='"+imgurl+"' onclick=detailmyMenuList('"+item.cuNum+"')  style=\"width:200px; height:200px;\"></div><div>"
									+item.mName+"</div><div>"+item.sName
									+"</div><div class=\"deleteCheck\"><input type='checkbox' name=\"checkDel\" id='hidden_cuNum"+idx+"'value='"
									+item.cuNum+"'></div></div>");
				})
				$(".deleteCheck").hide();
				$(".deleteCheckon").hide();
				$("#addddd").show();
				$("#deletemymenu").show();
			}
		});
	}
	

	// 세부화면 모달창
	function detailmyMenuList(cuNum) {
		console.log(cuNum);
		$("#ordernum").text("1");
		$.ajax({
			url : 'mymenuop/'+cuNum,
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : detailmyMenuListResult
		});
	}
						
		function detailmyMenuListResult(datas){
			console.log(datas);
			$("#myModal").modal('show');
		$("#detailtable table").empty();
		$("#menudetailoption").html("");
		var pl = 0;
		var mP;
		$.each(datas, function(data, item) {
			console.log(item);
			$('input:text[name="sId"]').val(item.sId);
			$('input:text[name="cId"]').val(item.cId);
			$('input:text[name="mNum"]').val(item.mNum);
			$('input:text[name="cuNum"]').val(item.cuNum);
			$('input:text[name="sName"]').val(item.sName);
			$('input:text[name="mName"]').val(item.mName);
			mP = item.mPrice;
			console.log(mP);
				if(item.opName =="ICE"){
 
					$("#ice").attr("checked","checked");
					
				}else if(item.opName =="HOT"){
					$("#hot").attr("checked","checked");	
				}
				else if(item.caNum =="CAOP"){
					
					$("<input>").attr({ 
					     type: "checkbox",
					     name: "cuoptionlist", 
					     id: item.stNum,
					     value: item.stNum,
					     checked:"checked"
			//		     disabled:"disabled"
					   	})
					   	.attr("class","checkoption")
					   	.appendTo("#menudetailoption");			
					$("<label>").attr("for",item.stNum)
								.append(item.opName+"("+item.opPrice+"원 추가)")
								.appendTo("#menudetailoption");
					$("<input>").attr({
						type:'hidden',
						id : 'option'+item.stNum,
						value: item.opPrice
					}).appendTo("#menudetailoption");
					$("<br>").appendTo("#menudetailoption");
					
					pl = Number(pl) + Number(item.opPrice);
							/* $("#selecOp").append("<input type='checkbox' name='checkbox' id='"
							+item.stNum+"' value='"+item.stNum+"'><label for='"+item.stNum+"'><input type='text' name='"+item.opPrice+"' value='"+item.opPrice+"'>"+
							"<input type='hidden' name='cuoptionlist' value='"+item.stNum+"'>");	 */

				}
				else if(item.caNum =="CACP" || item.caNum =="CACM"){

					/* $("#mPrice").val(item.mPrice);
					pl += item.mPrice; */

				}

			
		});
		$("#mPrice").val(mP);
		var totalprice = Number(mP)+Number(pl);	
		console.log(totalprice);
		$("#totalPrice").val(totalprice);
	}; 
	//삭제창
	function deleteMymenu(cuNum) {
		$(".deleteCheckon").show();
		$(".deleteCheck").show();
		$("#addddd").hide();
		$("#deletemymenu").hide();
		
		$("#deletemymenuon").on("click",function(){
			if(confirm("삭제하시겠습니까??")){
				var checked = [];
				$('input[name=checkDel]:checked').each(function(idx, item){
					checked.push(item.value);
				});
				console.log(checked);
				$.ajax({
					url : 'customer',
					type : 'DELETE',
					dataType : 'json',
					data: JSON.stringify({ cuNumList: checked}),
					contentType: 'application/json',
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success :function(data) {
							myMenuList();
							
					}
				});
			}
		});
		$("#offtest").on("click",function(){
			myMenuList();
		});
	};
	
	
	
	//수량
	function add(num) {
		
		var price = $('#mPrice').val();
		var v_totalprice = $('#totalPrice').val();
		var no = $("#ordernum").html();
		var opt = $("#opPrice").val();
		var sum_optionprice=0;
		$("input[name=cuoptionlist]:checked").each(function() {
			var test = $(this).val(); 
			var sprice = $('#option'+test).val();
			sum_optionprice =Number(sum_optionprice)+ Number(sprice);

		});
		if (num == -1) {
			if (Number(no) == 1) {
				alert("1개 이상으로 주문해주세요.");
				return;
			}
			no = Number(no) - 1;
			v_totalprice = Number(v_totalprice) - Number(sum_optionprice)- Number(price);
		} else if (num == 1) {
			no = Number(no) + 1;
			v_totalprice = Number(v_totalprice) + Number(sum_optionprice)+ Number(price);
		}
		$('#totalPrice').val(v_totalprice);
		$("#ordernum").html(no);
		$('input:text[name="qty"]').val(no);
	}
	
	
$(function(){
//장바구니
	$("#cartbtn").on("click",function(){
		var list =  $("#mymenudetailcart").serializeObject();
		var selectop = [];
		var selectoptionck=false;

		
		$('[name=cuoptionlist]:checked').each(function(){
			selectop.push($(this).val());
			selectoptionck=true;
		});
		if(selectoptionck){
			
			list.cuoptionlist = selectop;
		}else{
			list.cuoptionlist = null;
		}
		list.qty = $('#ordernum').html();
		

		var local_cart = localStorage.getItem("cartlist");
		if(local_cart == null){
			local_cart = new Array();
		}else {
			
			local_cart = JSON.parse(local_cart);
			
		}
		
		console.log(local_cart);
		
		local_cart.push(list);

		localStorage.setItem("cartlist",JSON.stringify(local_cart));
		console.log("localStorage : "+localStorage.getItem("cartlist"));
		var result = confirm('장바구니로 이동하시겠습니까?'); 
		if(result) { //yes 
			location.replace("${pageContext.request.contextPath}/cartmng"); 
		} 

	});
	//주문하기
	$("#cu_orderbtn").on("click",function(){
		var list =  $("#mymenudetailForm").serializeObject();
		var selectop = [];
		var selectoptionck=false;
		$('[name=cuoptionlist]:checked').each(function(){
			selectop.push($(this).val());
			selectoptionck=true;
		});
		if(selectoptionck){
			
			list.cuNumList = selectop;
		}else{
			list.cuNumList = null;
		}
		
		$('[name=orderqty]').val($('#ordernum').html());
		console.log(JSON.stringify(list));
		
		document.mymenudetailForm.submit();
	});
	});
</script>
</body>
</html>

