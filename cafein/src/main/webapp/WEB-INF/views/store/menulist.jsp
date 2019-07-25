<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>메 뉴 관 리</title>
<style type="text/css">
input {
	border: none;
	border-right: 0px;
	border-top: 0px;
	boder-left: 0px;
	boder-bottom: 0px;
}

ul {
	list-style: none;
	width: 450px;
	margin-left: auto;
	margin-right: auto;
}

li {
	width: 450px;
}

hr {
	width: 400;
	align: left;
}

span {
	display: inline-block;
	width: 300px;
}

.sales {
	width: 175px;
}

p {
	text-align: center;
}

.truthlist {
	background-color: white;
}

.modal-dialog.modal-80size {
	width: 50%;
	height: 80%;
	margin: 0;
	padding: 20%;
}
</style>


<script>

var selRecinum = "";
var selStanunit = 0;
var aQty=0.0;

var storeid = "SH001";
<%-- var storeid = "<%= (String)session.getAttribute("sid") %>";  --%>

var mNum = "";
var mName = "";
var mPrice = "";
var mCate = "";
var saleState = "";
var menuState = "";
var menuImg = "";


$(function(){
	  
	$('#toggleTable').hide();
	$('#backgroundCoffee').show();
	
	$('#recipeTablediv').hide();
	$('#optionDiv').hide();
	
	$("#menuTable tbody tr").click(function(){
		
		//tr 누를때 session에서 sid가져옴
		
		
		$('#backgroundCoffee').hide();
		$('#toggleTable').show();
		$('#recipeTablediv').show();
		$('#optionDiv').show();
		
		var str="";
		var tdArr = new Array();
		
		var tr = $(this);
		var td = tr.children();
		
		console.log("row: "+tr.text());

		
		mNum = td.eq(0).text();
		mName = td.eq(1).text();
		mPrice = td.eq(2).text();
		mCate = td.eq(3).text();
		saleState = td.eq(4).text();
		menuState = td.eq(5).text();
		menuImg = td.eq(6).text();
		
		if(mCate=='CACO'){mCate="CACO";}
		else if(mCate=='CADR'){mCate="CADR";}
		else if(mCate=='CADE'){mCate="CADE";}
		else if(mCate=='CAOP'){mCate="CAOP";}
		
		var imgurl = "${pageContext.request.contextPath}/image/"+menuImg;
		
		$("#mNum").val(mNum);
		$("#mName").val(mName);
		$("#mPrice").val(mPrice);
		$("#mCategory").val(mCate);
		$('input[id="salestate"]').removeAttr('checked');
		$("input:radio[id=salestate]:input[value='"+saleState+"']").attr("checked", true);
		$('input[id="menustate"]').removeAttr('checked');
		$("input:radio[id=menustate]:input[value='"+menuState+"']").attr("checked", true);
		$("#menuImg").attr("src",imgurl);
		
		$("#fileupdateName").val(mNum);
	
		menulist(mNum);
		
	})
	

		$("#btnUpdate").on('click',function(){
			
			alert(JSON.stringify($("#menudetail").serializeObject()));
			menuUpdate();
		
		});
		
		$("#btnInsert").on('click',function(){
		
			alert(JSON.stringify($("#insertmenudetail").serializeObject()));
			menuInsert();
		});

	
	$(document).on("click","#recipeTable tbody tr",function(){ 
		var str="";
		var tdArr = new Array();
		
		var tr = $(this);
		var td = tr.children();
		
		selRecinum = td.eq(4).text();
		console.log(selRecinum);
		 });
	
	
	$(document).on("click","#optionTable tbody tr",function(){ 
		var str="";
		var tdArr = new Array();
		
		var tr = $(this);
		var td = tr.children();
		
		selRecinum = td.eq(3).text();
		console.log(selRecinum);
		
		 });
	
	
	
	$(document).on("change","#reciSelect",function(){
		
		var json = $(this).val();
		var obj=JSON.parse(json);
		aQty=obj.value3;
		selStanunit = obj.value4;
        console.log(obj.value1+" : "+obj.value2+" : "+obj.value3+" : "+obj.value4);
        $("#recistNum").val(obj.value1);
		$("#recicaNum").val(obj.value2);
		$("#recistAqty").val(obj.value3);
		$("#recistStanunit").val(obj.value4);
		
		
	});
	
	$(document).on("change","#opSelct",function(){
		
		var json = $(this).val();
		var obj=JSON.parse(json);
        console.log(obj.value1+" : "+obj.value2);
        if(obj.value2=='CAHT')
        	{
        		$("#opName").val("HOT");
        		$("#consum").val(0);
        		$("#opPrice").val(0);
        		$("#opcaNum").val("CAHT");
        	}else if(obj.value2=='CAIC'){
        		$("#opName").val("ICE");
        		$("#consume").val(0);
        		$("#opPrice").val(0);
        		$("#opcaNum").val("CAIC");
        	}
        
        $("#opstNum").val(obj.value1);
		//$("#opcaNum").val(obj.value2);
		
	});
	
});


function menulist(mNum){
	$.ajax({
		url:'recipes/'+storeid+'/'+mNum,
		type:'GET',
		//contentType:'application/json;charset=utf-8',
		dataType:'json',
		error:function(xhr,status,msg){
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
		},
		success:function(data){
			
			$("#cmNum").val(mNum);
			$("#cmName").val(mName);
			$("#omNum").val(mNum);
			$("#cmCate").val(mCate);	
			//전역변수의 값들 넣음
			$("#cPrice").val(mPrice);
			
			if(data.length==0){
				$("#recipeTable tbody").empty();
				console.log("noting");
			}
			else
				{
					console.log(data);
					var totalWon = 0;
					
					$("#recipeTable tbody").empty();
					for(var i = 0;i<data.length;i++){
					
						if(data[i].caNum!='CAOP')
						{
							$('<tr>')
							.append($('<td>').html(data[i].stName))
							.append($('<td>').append($('<input style="text-align:center; width:80px;">').val(data[i].consum*data[i].stanUnit)))
							.append($('<td>').append($('<input style="text-align:center; width:80px;">').val(data[i].stUnit)))
							.append($('<td>').html(Math.floor((data[i].stPrice*data[i].consum))+'원'))
							.append($('<td style="visibility:hidden;">').html(data[i].recipeNo))
							.append($('<td style="visibility:hidden;">').html(data[i].stanUnit))
							.appendTo("#recipeTable tbody");
							
							totalWon = totalWon + (data[i].stPrice*data[i].consum);
						}
					}
					
					var msg = data.length +"개의 재료. 원가 : "+totalWon+"원. 수익: "+(mPrice-totalWon)+"원.";
					
					
					$("#recipeMsg").val(msg);
				}
		}
	});

	
	 $.ajax({
		url:'options/'+storeid+'/'+mNum,
		type:'GET',
		//contentType:'application/json;charset=utf-8',
		dataType:'json',
		error:function(xhr,status,msg){
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
		},
		success:function(data){
				console.log(data);
				if(data.length==0){
					$("#optionTable tbody").empty();
					console.log("noting");
				}
				else{
					
					$("#optionTable tbody").empty();
					for(var i = 0;i<data.length;i++){
						console.log("dad: "+data[i].caNum);
						if(data[i].caNum=='CAOP'||data[i].caNum=='CAIC'||data[i].caNum=='CAHT')
						{
							
							$('<tr>')
							.append($('<td>').html(data[i].opName))
							.append($('<td>').append($('<input style="text-align:center; width:80px;">').val(data[i].consum)))
							.append($('<td>').append($('<input style="text-align:center; width:80px;">').val(data[i].opPrice)))
							.append($('<td style="visibility:hidden;">').html(data[i].recipeno))
							.appendTo("#optionTable tbody");
						}
						
					}
					
				}
		}
	}); 

	
	
	
	$.ajax({
		url:'recipes/'+storeid,
		type:'GET',
		//contentType:'application/json;charset=utf-8',
		dataType:'json',
		error:function(xhr,status,msg){
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
		},
		success:function(data){
			//console.log(data);
			
			
			
			
			$("#reciSelect").empty();
			$('<option value="">' + '카테고리 선택' + '</option>').appendTo('#reciSelect');
			
			for(var i = 0;i<data.length;i++){

				if(data[i].caNum=='CACP' || data[i].caNum=='CACM')
				{
					console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CACP를 추가
					// var option = $("<option>"+data[i].caNum+"</option>");
	               // $('#opSelct').append(option); 


						$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'","value3":"'+data[i].stAqty+'","value4":"'+data[i].stanUnit+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum+" : "+data[i].stAqty +" : "+data[i].stanUnit+ '</option>').appendTo('#reciSelect');
						


							
				}else if(mCate=='CADR'&& (data[i].caNum=='CAJP' || data[i].caNum=='CACM')){
					console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CAJP를 추가
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'","value3":"'+data[i].stAqty+'","value4":"'+data[i].stanUnit+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum +" : "+data[i].stanUnit+ '</option>').appendTo('#reciSelect');
					
				}else if(mCate=='CADE'&& (data[i].caNum=='CADP' || data[i].caNum=='CACM')){
					console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CADP를 추가
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'","value3":"'+data[i].stAqty+'","value4":"'+data[i].stanUnit+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum +" : "+data[i].stanUnit+ '</option>').appendTo('#reciSelect');
					}
				}
			
			
			$("#opSelct").empty();
			$('<option value="">' + '카테고리 선택' + '</option>').appendTo('#opSelct');
			$('<option value=\'{"value1":"","value2":"CAIC"}\'>' + 'ICE' + '</option>').appendTo('#opSelct');
			$('<option value=\'{"value1":"","value2":"CAHT"}\'>' + 'HOT' + '</option>').appendTo('#opSelct');
			
			for(var i = 0;i<data.length;i++){
				//console.log('hello: '+data[i].caNum);
				if(mCate=='CACO' && (data[i].caNum=='CACP' || data[i].caNum=='CACM'|| data[i].caNum=='CAIC'|| data[i].caNum=='CAHT'))
				{
					//console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CACP를 추가
					// var option = $("<option>"+data[i].caNum+"</option>");
	                //$('#opSelct').append(option);

					
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum + '</option>').appendTo('#opSelct');
					

							
				}else if(mCate=='CADR'&& (data[i].caNum=='CAJP' || data[i].caNum=='CACM'|| data[i].caNum=='CAIC'|| data[i].caNum=='CAHT')){
					console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CAJP를 추가
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum + '</option>').appendTo('#opSelct');
					
				}else if(mCate=='CADE'&& (data[i].caNum=='CADP' || data[i].caNum=='CACM'|| data[i].caNum=='CAIC'|| data[i].caNum=='CAHT')){
					console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CADP를 추가
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum + '</option>').appendTo('#opSelct');
					
					}
				}
			}
	});
}



function menuInsert(){

	 $.ajax({
		url: "menues",
		type: 'POST',
		dataType: 'json',
		data: JSON.stringify($("#insertmenudetail").serializeObject()),
		contentType: 'application/json',
		success: function(data) {
			if(data.result == true) {
				window.location.reload();
	    	}
			
		}
		
	}); 
	 
}



function menuDelete(){
	var menuId = $("#mNum").val();
	console.log(menuId);
	$.ajax({
		url:'menues/'+menuId,  
		type:'DELETE',
		contentType:'application/json',
		dataType:'json',
		error:function(xhr,status,msg){
			console.log("상태값 :" + status + " Http에러메시지 :"+msg);
		}, success:function(xhr) {
			console.log(xhr.result);
			menulist(menuId);
		}
	});
}

function menuUpdate() {
	var menuId = $("#mNum").val();
	$.ajax({
		url: "menues",
		type: 'PUT',
		dataType: 'json',
		data: JSON.stringify($("#menudetail").serializeObject()),
		contentType: 'application/json',
		success: function(data) { 
			menulist(menuId);
		}
		
	});  
}

function recipeInsert(){
	var menuId = $("#mNum").val();
	var reQty1 = $("#consum").val();
	
	var reQty2 = aQty*selStanunit;
		//$("#recistAqty").val();
	
	if(reQty1 >= reQty2){
		reQty2 = reQty1;
		//$("#reciAqty").val(reQty1);
		console.log(reQty1+" >= "+reQty2);
	}else{
		//$("#reciAqty").val(reQty2);
		console.log(reQty1+" < "+reQty2);
	}
	
	
	alert(JSON.stringify($("#recipeTableForm").serializeObject()));
	//=====================================================================================
 	$.ajax({
		url: "recipes/"+storeid+'/'+(reQty1)+'/'+(selStanunit),   
		type: 'POST',
		dataType: 'json',
		data: JSON.stringify($("#recipeTableForm").serializeObject()),
		contentType: 'application/json',
		success: function(data) {
			if(data.result == true) {
				console.log(data);
				menulist(menuId);
	    	}
			
		}
		
	});  
}


function recipeDelete(){
	var menuId = $("#mNum").val();
	console.log(selRecinum);
	$.ajax({
		url:'recipes/'+selRecinum,  
		type:'DELETE',
		contentType:'application/json',
		dataType:'json',
		error:function(xhr,status,msg){
			console.log("상태값 :" + status + " Http에러메시지 :"+msg);
		}, success:function(xhr) {
			console.log(xhr.result);
			menulist(menuId);
		}
	}); 
}



function optionInsert(){
	var menuId = $("#mNum").val();
 	alert(JSON.stringify($("#optionTableForm").serializeObject()));
	
 	$.ajax({
		url: "options",
		type: 'POST',
		dataType: 'json',
		data: JSON.stringify($("#optionTableForm").serializeObject()),
		contentType: 'application/json',
		success: function(data) {
			if(data.result == true) {
				console.log(data);
				menulist(menuId);
	    	}
			
		}
		
	});  
}

function optionDelete(){
	var menuId = $("#mNum").val();
	console.log(selRecinum);
	 $.ajax({
		url:'options/'+selRecinum,  
		type:'DELETE',
		contentType:'application/json',
		dataType:'json',
		error:function(xhr,status,msg){
			console.log("상태값 :" + status + " Http에러메시지 :"+msg);
		}, success:function(xhr) {
			console.log(xhr.result);
			menulist(menuId);
		}
	});
	 
}

	function fileUpload() {

		$('#fileForm').ajaxForm({
			url : "/testFile.do",
			enctype : "multipart/form-data",
			success : function(result) {
				alert(result);
			}
		});
		
		$("#fileForm").submit();

	}
	

	
	
	function insertMenu(){
		
		// 모달창의 배경을 눌렀을 때 닫히는 이벤트를 막아준다
		$('#menuModal').modal({keyboard: false}) ;
		// 마감 내역 모달창 show
		$("#menuModal").modal('show');
		
	}
	
</script>
</head>
<body>

	<div style="position: absolute; width: 100%">
		<div style="background-color: black; color: #92B3B7">
			<h3>[메뉴 관리]</h3>
		</div>
		<div style="overflow: scroll; height: 800px; float: left; width: 45%;">
			<!-- 메뉴 List-->
			<div class="container" style="width: 100%">

				<form action="#">
					<table border="1" id="menuTable" class="table table-hover"
						style="width: 100%">
						<thead class="thead-dark">
							<tr>
								<th>메뉴 번호</th>
								<th>메뉴 이름</th>
								<th>메뉴 가격</th>
								<th>카테고리</th>
								<th>판매 상태</th>
								<!-- 메뉴 판매 가능상태?(ex,계절메뉴) -->
								<th>메뉴 상태</th>
								<!-- sold out -->
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${storemenu}" var="menu">
								<tr>
									<!-- ****tr 1번 클릭 시, 레시피 상세조회 페이지가 등장 -->
									<!-- ****tr 2번 더블 클릭 시, 메뉴 상세조회 페이지가 등장 -->
									<td>${menu.mNum}</td>
									<td>${menu.mName}</td>
									<td>${menu.mPrice}</td>
									<td>${menu.caNum}</td>
									<td>${menu.mStat}</td>
									<td>${menu.menuSale}</td>
									<td style="display: none;">${menu.uploadFileName}</td>
								</tr>

							</c:forEach>

						</tbody>
					</table>

					<input type="button" value="추가" onclick="insertMenu()">



				</form>
			</div>
		</div>
		<div
			style="overflow: scroll; height: 800px; float: right; width: 55%;">


			<div id="backgroundCoffee" style="width: 100%; height: 100%;">
				<img id="backImg" style="width: 100%; height: 100%; opacity: 0.2;"
					src="${pageContext.request.contextPath}/image/backcoffee.jpg">
			</div>

			<!-- 메뉴 상세조회&수정 -->
			<div style="width: 100%;" id="toggleTable">

				<form id="menudetail">
					<input type="button" value="확정" id="btnUpdate">
					<!-- <input type="button" value="삭제" id="btnMenuDelete" onclick="menuDelete()"> -->
					<input type="hidden" id="sId" name="sId" value="SH001">
					<table border="1" class="table table-hover">


						<tr>
							<th>메뉴 번호</th>
							<td><input type="text" id="mNum" name="mNum" readonly></td>
						</tr>
						<tr>
							<th>메뉴 이름</th>
							<td><input type="text" id="mName" name="mName"></td>
						</tr>
						<tr>
							<th>메뉴 가격(원)</th>
							<td><input type="text" id="mPrice" name="mPrice"></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td><select id="mCategory" name="caNum">
									<option value="">선택</option>
									<option value="CACO">커피</option>
									<option value="CADR">음료</option>
									<option value="CADE">디저트</option>
									<option value="CAOP">옵션</option>
							</select></td>
						</tr>

						<tr>
							<th>판매 상태</th>
							<td><input type="radio" id="salestate" name="mStat"
								value="A1">판매 가능 <input type="radio" id="salestate"
								name="mStat" value="A2">sold out</td>
						</tr>
						<tr>
							<th>메뉴 상태</th>
							<td><input type="radio" id="menustate" name="menuSale"
								value="Y">Y <input type="radio" id="menustate"
								name="menuSale" value="N">N</td>

						</tr>
						<tr>
							<th rowspan="2">메뉴 사진</th>
							<td>
								<!-- <form id="fileForm" action="/imgUpload.do"
									enctype="multipart/form-data">

									form에 두껍게 처리 된 부분은 ajaxForm에서 설정해주어도 괜찮지만 여기에 이렇게 명시해주어도 괜찮다

									<input type="file" name="testFile" id="testFile" />

								</form>
 --> 
 									<img id="menuImg" style="width: 200px; height: 200px;">
							</td>
							</form>

						</tr>

						<tr>
							<form action="imgUpdate.do" encType="multipart/form-data" method="post">
								<td>
									<input id="fileupdateName" type="hidden" name="mNum">
									<input type="file" name="uploadFile" /> <input type="submit" value="사진제출">
									</td>
							</form>

						</tr>
					</table>
					<!-- hidden 으로 sId 넘기기 -->
			</div>
			<!-- 레시피 CRUD-->
			<div style="float: left; width: 100%;">

				<!-- 레시피 등록, 메뉴 하나 Select된 에서 레시피 레시피 조회가능, 등록 버튼 활성화 -->

				<form id="recipeTableForm">
					<!-- Recipe Detail List로 표현-->
					<div id="recipeTablediv" style="padding: 5px;">
						<hr>
						<h3 align="center">
							<input type="text" id="cmName" readonly>
						</h3>
						<h5 align="right">상세 레시피</h5>
						<hr>
						<input type="hidden" id="cPrice" readonly>
						<div text-align="center">
							<table border="1" id="recipeTable" class="table table-hover">
								<thead>
									<tr>
										<th>제 작 순 번</th>
										<th>재 료</th>
										<th>사 용 량</th>
										<th>단 위</th>
										<th>원 가</th>
										<th>제 작 방 법</th>
									</tr>
								</thead>
								<tbody></tbody>

							</table>
						</div>
						<input type="text" id="recipeMsg"
							style="text-align: right; width: 300px;" value="">
						<!-- <th>적정 수량</th> 레시피 추가하면서 필요시 update-->
						<input type="hidden" id="recistAqty"> <input type="hidden"
							id="recistStanunit"> <br> <br>
						<!-- 레시피 추가 테이블 -->
						<input type="button" value=" 재료 추가 " onclick="recipeInsert()">
						<input type="button" value=" 재료 삭제 " onclick="recipeDelete()"><br>
						<table border="1" class="table table-hover">
							<tr>
								<th>카테고리</th>
								<td><input type="hidden" id="cmNum" name="mNum"> <input
									type="text" id="cmCate"></td>
								<th>재료 선택</th>
								<td><select id="reciSelect"></select></td>

							</tr>
							<tr>
								<th>소모량</th>
								<td colspan="3"><input type="text" value="0" id="consum"
									name="consum"> <select id="stUnit" name="stUnit">
										<option value="">선 택</option>
										<option value="ML">ml</option>
										<option value="G">g</option>
										<option value="EA">EA</option>
								</select></td>
							</tr>

							<tr>
								<th>제 작 방 법</th>
								<td colspan="3"><textarea
										style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
										rows=3></textarea></td>
							</tr>

						</table>
						<input type="hidden" id="recicaNum" name="caNum"> <input
							type="hidden" id="recistNum" name="stNum">
						<!--  <input type="hidden" id="reciAqty" name="stAqty">
						-->
					</div>
				</form>
			</div>



			<!-- 메뉴 옵션 추가 CRUD -->
			<div style="float: left; padding: 5px; width: 100%;" id="optionDiv">

				<hr>
				<h4 align="center">옵션 추가</h4>
				<hr>
				<form id="optionTableForm">
					<table border="1" class="table table-hover">
						<tr>
							<th>재고 이름</th>
							<td><select id="opSelct">
							</select></td>
						</tr>
						<tr>
							<th>옵션 이름</th>
							<td><input type="text" id="opName" name="opName"></td>
						</tr>
						<tr>
							<th>소모량</th>
							<td><input type="text" id="consume" name="consum"></td>
						</tr>
						<tr>
							<th>옵션 가격</th>
							<td><input type="text" id="opPrice" name="opPrice">원</td>
						</tr>
						<tr>
						<tr>
							<td><input type="button" value=" 옵션 추가 "
								onclick="optionInsert()"></td>
							<td><input type="button" value=" 옵션 삭제 "
								onclick="optionDelete()"></td>
						</tr>

					</table>
					<input type="hidden" id="sId" name="sId" value="SH001"> <input
						type="hidden" id="omNum" name="mNum"> <input type="hidden"
						id="opcaNum" name="caNum"> <input type="hidden"
						id="opstNum" name="stNum">

				</form>



				<table border="1" id="optionTable" class="table table-hover">
					<thead>
						<tr>
							<th>옵션 이름</th>
							<th>소모량</th>
							<th>옵션 가격</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>

			</div>


			<div class="modal fade" id="menuModal" role="dialog">
				<div class="modal-dialog" style="max-width: 40%; width: auto;">
					<div class="modal-content">
						<div class="modal-body">

							<!-- 등록폼 사진 추가 작업-->
							<div style="width: 100%;" id="insertMenuFormTable">



								<h3>[메뉴 추가]</h3>

								<form id="insertmenudetail" encType="multipart/form-data"
									method="post">
									<table border="1" class="table">


										<tr>
											<th>메뉴 이름</th>
											<td><input type="text" id="mmName" name="mName"></td>
										</tr>
										<tr>
											<th>메뉴 가격(원)</th>
											<td><input type="text" id="mmPrice" name="mPrice"></td>
										</tr>
										<tr>
											<th>카테고리</th>
											<td><select id="mmCategory" name="caNum">
													<option value="">선 택</option>
													<option value="CACO">커피</option>
													<option value="CADR">음료</option>
													<option value="CADE">디저트</option>
											</select></td>
										</tr>

									</table>
									<!-- hidden 으로 sId 넘기기 -->

									<input type="hidden" id="sId" name="sId" value="SH001">
									<input type="button" value="등록" id="btnInsert">
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>