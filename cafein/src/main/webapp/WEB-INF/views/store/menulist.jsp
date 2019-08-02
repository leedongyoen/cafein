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
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
	};
	
.btn-group .button {
  background-color: #4CAF50; /* Green */
  border: 1px solid green;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  cursor: pointer;
  width: 150px;
  display: block;
}

.btn-group .button:not(:last-child) {
  border-bottom: none; /* Prevent double borders */
}

.btn-group .button:hover {
  background-color: #3e8e41;
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


html, body { height:100%; overflow:hidden } 
.h-div {height:88%;}



</style>


<script>

//옵션 전역 변수
var opName = "";
var consum = 0.0;
var unit = "";
var opPrice = 0;

//레시피 전역변수
var turnNo = 0;
var stNumber = "";
var consume = 0;
var stUnit = "";
var recipeDetail = "";
var recipeNo = "";
var stanUnit = 0;


var aQty=0.0; 

<%--var storeid = "SH001";--%>
 var storeid = "<%= (String)session.getAttribute("sId") %>";  

//메뉴 전역변수
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
	$("#recipeDatailTable").hide();
	$("#optionDatailTable").hide();
	
	$("#menuTable tbody tr").click(function(){
		
		//tr 누를때 session에서 sid가져옴
		
		
		$("#recipeDatailTable").hide();
		$("#optionDatailTable").hide();
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
		saleState = td.eq(5).text();
		menuState = td.eq(7).text();
		menuImg = td.eq(8).text();
		
		if(mCate=='CACO'){mCate="CACO";}
		else if(mCate=='CADR'){mCate="CADR";}
		else if(mCate=='CADE'){mCate="CADE";}
		else if(mCate=='CAOP'){mCate="CAOP";}
		
		var imgurl = "${pageContext.request.contextPath}/image/"+menuImg;
		
		$("#mNum").val(mNum);
		$("#mName").val(mName);
		$("#mPrice").val(mPrice);
		$("#mCategory").val(mCate).prop('disabled',true);
		$('input[id="salestate"]').removeAttr('checked');
		$("input:radio[id=salestate]:input[value='"+saleState+"']").attr("checked", true);
		$('input[id="menustate"]').removeAttr('checked');
		$("input:radio[id=menustate]:input[value='"+menuState+"']").attr("checked", true);
		$("#menuImg").attr("src",imgurl);
		
		$("#fileupdateName").val(mNum);
	
		menulist(mNum);
		
	})
	

		$("#btnUpdate").on('click',function(){
			
			var up;
			
			up = confirm('수정 하시겠습니까?');

			if(up){
				menuUpdate();
			}
			
			//alert(JSON.stringify($("#menudetail").serializeObject()));
			
		
		});
		
		$("#btnInsert").on('click',function(){
		
			//alert(JSON.stringify($("#insertmenudetail").serializeObject()));
			
			var up;
			
			up = confirm('등록하시겠습니까?');

			if(up){
				menuInsert();
			}
			
		});

	
	$(document).on("click","#recipeTable tbody tr",function(){ 
		
		$("#recipeDatailTable").show();
		
		var str="";
		var tdArr = new Array();
		
		var tr = $(this);
		var td = tr.children();
		
		turnNo = td.eq(0).text();
		turnNo = turnNo *1;
		stNumber = td.eq(1).text();
		consume = td.eq(3).text();
		
		stUnit = td.eq(4).text();
		recipeDetail = td.eq(6).text();
		recipeNo = td.eq(7).text();
		stanUnit = td.eq(8).text();
		stanUnit = stanUnit*1;
		
		//console.log(recipeNo +" :: "+turnNo);
		$("#recipeNum").val(recipeNo);
		$("#turnNo").val(turnNo); 
		
		//행을 누를때 마다 ajax 실행
		

			$("#cmStname").val(td.eq(2).text());
			$("#consumee").val(consume);
			$("#stUnitt").val(stUnit);
			$("#recipeDetail").val(recipeDetail);
			$("#restanUnit").val(stanUnit);
			$("#recistNum2").val(stNumber);
			$("#recicaNum2").val(mCate);
		
		 });
	
	
	$(document).on("click","#optionTable tbody tr",function(){ 
		$("#optionDatailTable").show();
		var str="";
		var tdArr = new Array();
		
		var tr = $(this);
		var td = tr.children();
		
		opName = td.eq(0).text();
		consum = td.eq(1).text();
		unit = td.eq(2).text();
		opPrice = td.eq(3).text();
		recipeNo = td.eq(4).text();
		stName = td.eq(5).text();
		stNumber = td.eq(6).text();
		
		$("#opopname").val(opName);
		$("#opopconsum").val(consum);
		$("#opopunit").val(unit);
		$("#opopprice").val(opPrice);
		$("#optionDatailTable table tbody tr:eq(0) td").html(stName);
		
		$("#opopstnum").val(stNumber);
		$("#opoprecipe").val(recipeNo);
		
	});
	
	
	
	$(document).on("change","#reciSelect",function(){
		
		var json = $(this).val();
		var obj=JSON.parse(json);
		aQty=obj.value3;
		stanUnit = obj.value4;
        console.log(obj.value1+" : "+obj.value2+" : "+obj.value3+" : "+obj.value4+" : "+mCate+" : "+obj.value5);
        $("#recistNum").val(obj.value1);
		$("#recicaNum").val(mCate);
		$("#recistAqty").val(obj.value3);
		$("#recistStanunit").val(obj.value4);
		$("#reciUnit").val(obj.value5);
		//reciUnit
		
	});
	
	$(document).on("change","#opSelct",function(){
		
		var json = $(this).val();
		var obj=JSON.parse(json);
        console.log(obj.value1+" : "+obj.value2+" : "+obj.value3);
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
        	}else{
        		$("#opcaNum").val("CAOP");
        		$("#opName").val('');
        		$("#consume").val('');
        		$("#opPrice").val('');
        	}
        
        $("#opstNum").val(obj.value1);
		$("#opstUnit").val(obj.value3);
		
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
			$("#vmName").val(mName);
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
					var cnt = 0;
					$("#recipeTable tbody").empty();
					for(var i = 0;i<data.length;i++){
					
						if(data[i].caNum!='CAOP')
						{
							$('<tr>')
							.append($('<td>').html(data[i].turnNo))
							.append($('<td>').html(data[i].stNum))
							.append($('<td>').html(data[i].stName))
							.append($('<td>').html(data[i].consum*data[i].stanUnit))
							.append($('<td>').html(data[i].stUnit))
							.append($('<td>').html(Math.floor((data[i].stPrice*data[i].consum))+'원'))
							.append($('<td>').html(data[i].recipeDetail))
							.append($('<td style="display:none;">').html(data[i].recipeNo))
							.append($('<td style="display:none;">').html(data[i].stanUnit))
							
							.appendTo("#recipeTable tbody");
							// style="visibility:hidden;"
							totalWon = totalWon + (data[i].stPrice*data[i].consum);
							cnt = cnt +1;
						}
					}
					
					var msg = cnt +"개의 재료. 원가 : "+totalWon+"원. 수익: "+(mPrice-totalWon)+"원.";
					
					$("#recipeMsg").val(msg);
				}
		}
	});

	
	 $.ajax({
		url:'options',
		type:'GET',
		//contentType:'application/json;charset=utf-8',
		data:{sId:storeid,mNum:mNum},
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
							.append($('<td>').html(data[i].consum*data[i].stanUnit))
							.append($('<td>').html(data[i].stUnit))
							.append($('<td>').html(data[i].opPrice))
							.append($('<td style="display:none;">').html(data[i].recipeNo))
							.append($('<td style="display:none;">').html(data[i].stName))
							.append($('<td style="display:none;">').html(data[i].stNum))
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
	               
						$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'","value3":"'+data[i].stAqty+'","value4":"'+data[i].stanUnit+'","value5":"'+data[i].stUnit+'"}\'>' + data[i].stName + '</option>').appendTo('#reciSelect');
						
				}else if(mCate=='CADR'&& (data[i].caNum=='CAJP' || data[i].caNum=='CACM')){
					console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CAJP를 추가
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'","value3":"'+data[i].stAqty+'","value4":"'+data[i].stanUnit+'","value5":"'+data[i].stUnit+'"}\'>' + data[i].stName + '</option>').appendTo('#reciSelect');
					
				}else if(mCate=='CADE'&& (data[i].caNum=='CADP' || data[i].caNum=='CACM')){
					console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CADP를 추가
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'","value3":"'+data[i].stAqty+'","value4":"'+data[i].stanUnit+'","value5":"'+data[i].stUnit+'"}\'>' + data[i].stName + '</option>').appendTo('#reciSelect');
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

					
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'","value3":"'+data[i].stUnit+'"}\'>' + data[i].stName + '</option>').appendTo('#opSelct');
					
				}else if(mCate=='CADR'&& (data[i].caNum=='CAJP' || data[i].caNum=='CACM'|| data[i].caNum=='CAIC'|| data[i].caNum=='CAHT')){
					console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CAJP를 추가
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'","value3":"'+data[i].stUnit+'"}\'>' + data[i].stName + '</option>').appendTo('#opSelct');
					
				}else if(mCate=='CADE'&& (data[i].caNum=='CADP' || data[i].caNum=='CACM'|| data[i].caNum=='CAIC'|| data[i].caNum=='CAHT')){
					console.log(data[i].caNum);
					//data[i].caNum
					//옵션에 caNum이 CACM과 CADP를 추가
					$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'","value3":"'+data[i].stUnit+'"}\'>' + data[i].stName + '</option>').appendTo('#opSelct');
					
					}
				}
			}
		});
	}



function menuInsert(){

	 $.ajax({
		url: "menues/"+storeid,
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
	 
	 $("#menuModal").modal("hide");
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
			console.log("상태 값 :" + status + " Http에러메시지 :"+msg);
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
			//menulist(menuId);
			window.location.reload();
		}
		
	});  
}



// 레시피 조회부터 다시


function recipeInsert(){
	var menuId = $("#mNum").val();
	var reQty1 = $("#consum").val();
	
	//alert(JSON.stringify($("#insertRecipeDetail").serializeObject()));
	
	$.ajax({
		
		url: "recipes/"+storeid,  
		type: 'POST',
		dataType: 'json',
		data: JSON.stringify($("#insertRecipeDetail").serializeObject()),
		contentType: 'application/json',
		success: function(data) {
			if(data.result == true) {
				console.log(data);
				menulist(menuId);
	    	}
		}
	});  
	
	$("#recipeModal").modal("hide");
}




function recipeUpdate(){
	var menuId = $("#mNum").val();
	
	var up;
	up = confirm('삭제하시겠습니까?');

	if(up){
		$.ajax({
			url: "recipes/"+storeid,
			type: 'PUT',
			dataType: 'json',
			data: JSON.stringify($("#recipeTableForm").serializeObject()),
			contentType: 'application/json',
			success: function(data) { 
				menulist(menuId);
			}
		});
	}
	

}


function recipeDelete(){
	var menuId = $("#mNum").val();
	//console.log(recipeNo);
	
	var up;
	up = confirm('삭제하시겠습니까?');

	if(up){
		$.ajax({
			url:'recipes/'+storeid+'/'+recipeNo+'/'+turnNo,  
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
}



function optionInsert(){
	var menuId = $("#mNum").val();
 	//alert(JSON.stringify($("#insertOptionDetail").serializeObject()));
	
 	$.ajax({
		url: "options/"+storeid,
		type: 'POST',
		dataType: 'json',
		data: JSON.stringify($("#insertOptionDetail").serializeObject()),
		contentType: 'application/json',
		success: function(data) {
			if(data.result == true) {
				console.log(data);
				menulist(menuId);
	    	}
		}
	});  
 	
 	$("#optionModal").modal("hide");
}

function optionDelete(){
	var menuId = $("#mNum").val();
	//console.log(recipeNo);
	
	var up;
	up = confirm('삭제하시겠습니까?');

	if(up){
		$.ajax({
			url:'options/'+storeid+'/'+recipeNo,  
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
	 
}


function optionUpdate(){
	//console.log($("#optionTableForm").serializeObject());
	var menuId = $("#mNum").val();
	
	var up;
	up = confirm('수정하시겠습니까?');

	if(up){
		$.ajax({
			url: "options/"+storeid,
			type: 'PUT',
			dataType: 'json',
			data: JSON.stringify($("#optionTableForm").serializeObject()),
			contentType: 'application/json',
			success: function(data) { 
				menulist(menuId);
			}
			
		});
	}
	
	
}


	function fileUpload() {

		$('#fileForm').ajaxForm({
			url : "/testFile.do",
			enctype : "multipart/form-data",
			success : function(result) {
				alert("사진을 업로드 하였습니다.");
			}
		});
		
		$("#fileForm").submit();

}
	
function insertMenu(){
		
	$('#menuModal').modal({keyboard: false}) ;
	$("#menuModal").modal('show');
		
}
	
	
function insertRecipe(){
	
	$('#recipeModal').modal({keyboard: false}) ;
	$("#recipeModal").modal('show');
	
}

function insertOption(){
	
	$('#optionModal').modal({keyboard: false}) ;
	$("#optionModal").modal('show');
		
}


</script>
</head>
<body>

	<div style="position: absolute; width: 100%" class="h-div">
		
			
		
		<div style="overflow: scroll; height: 100%; float: left; width: 45%;">
		<h3>[메뉴 관리]</h3>
			<!-- 메뉴 List-->
			<div class="container" style="width: 100%">

				<form action="#">
					<table border="1" id="menuTable" class="table table-hover"
						style="width: 100%">
						<thead class="thead-dark">
							<tr>
								<th>메뉴 번호</th>
								<th>메뉴 이름</th>
								<th>메뉴가격</th>
								<th colspan = "2">카테고리</th>
								<th colspan = "2">판매 상태</th>
								<!-- 메뉴 판매 가능상태?(ex,계절메뉴) -->
								<th>메뉴 상태</th>
								<!-- sold out -->
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${storemenu}" var="menu">

								<c:choose>
								<c:when test="${menu.mStat eq 'A2'}">
									<tr style="color:red;">
								</c:when>
									<c:otherwise>
									<tr style="color:black;">
									</c:otherwise>
								</c:choose>
									<!-- ****tr 1번 클릭 시, 레시피 상세조회 페이지가 등장 -->
									<!-- ****tr 2번 더블 클릭 시, 메뉴 상세조회 페이지가 등장 -->
									<td>${menu.mNum}</td>
									<td>${menu.mName}</td>
									<td>${menu.mPrice}</td>
									<td>${menu.caNum}</td>
									<td>${menu.ca_num_nm}</td>
									<td>${menu.mStat}</td>
									<td>${menu.m_stat_nm}</td>
									<td>${menu.menuSale}</td>
									<td style="display: none;">${menu.uploadFileName}</td>
								
								</tr>
								
							</c:forEach>

						</tbody>
					</table>

					<input type="button" class="button btn btn-info" value="추가" onclick="insertMenu()">



				</form>
			</div>
		</div>
		<div
			style="overflow: scroll; height: 100%; float: right; width: 55%;">


			<div id="backgroundCoffee" style="width: 100%; height: 100%;">
				<img id="backImg" style="width: 100%; height: 100%; opacity: 0.2;"
					src="${pageContext.request.contextPath}/image/backcoffee.jpg">
			</div>

			<!-- 메뉴 상세조회&수정 -->
			<div style="width: 100%;" id="toggleTable">

				<form id="menudetail">
					<input type="button" class="button btn btn-info" value="수정" id="btnUpdate">
					<!-- <input type="button" value="삭제" id="btnMenuDelete" onclick="menuDelete()"> -->
					<!-- <input type="hidden" id="sId" name="sId" value="SH001"> -->
					<table border="1" class="table table-hover">


						<tr>
							<th>메뉴 번호</th>
							<td><input type="text" style="text-align:center; width:100px;" id="mNum" name="mNum" readonly></td>
						</tr>
						<tr>
							<th>메뉴 이름</th>
							<td><input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="mName" name="mName"></td>
						</tr>
						<tr>
							<th>메뉴 가격(원)</th>
							<td><input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="mPrice" name="mPrice"></td>
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
 									<img id="menuImg" style="width: 200px; height: 200px;">
							</td>
							

						</tr>
							</form>	
						<tr>
							<form action="imgUpdate.do" id = "imgUp" encType="multipart/form-data" method="post">
								<td>
									<input id="fileupdateName" type="hidden" name="mNum">
									<input type="file" name="uploadFile" />
									<input type="submit" class="button btn btn-info" value="사진 제출">
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
					<div id="recipeTablediv" style="padding: 5px;">
						<hr>
						<h3 align="center">
							<input style="text-align:center;" type="text" id="cmName" readonly>
						</h3>
						<h5 align="right">상세 레시피</h5>
						<hr>
						
						
							<input type="hidden" id="cPrice" readonly>
							<input type="text" id="recipeMsg" style="text-align: right; width: 300px;" value="" readonly>
							<input type="hidden" id="recistAqty">
							
							<input type="hidden" id="recipeNum" name="recipeno">
							<input type="hidden" id="turnNo" name = "turnNo">
							<input type="hidden" id ="restanUnit" name="stanUnit">
							<input type="hidden" id="recicaNum2" name="caNum"> 
							<input type="hidden" id="recistNum2" name="stNum">
							
							
						<table border="1" id="recipeTable" class="table table-hover">
								<thead>
									<tr>
										<th>제 작 순 번</th>
										<th colspan="2">재 료</th>
										<th>사 용 량</th>
										<th>단 위</th>
										<th>원 가</th>
										<th colspan="3">제 작 방 법</th>
									</tr>
								</thead>
								<tbody></tbody>

						</table>
						
						<input type="button" class="button btn btn-info" value="레시피 등록" onclick="insertRecipe()">
						
						<!--  <input type="hidden" id="reciAqty" name="stAqty"> -->
						
						<div id="recipeDatailTable">
						
						<br>
						<div align="right" class="btn-group">
							<input type="button" class="button btn btn-info" value="레시피 수정 " onclick="recipeUpdate()">
							<input type="button" class="button btn btn-danger" value="삭제 " onclick="recipeDelete()">
						</div>
						
						<table  border="1" class="table">
							<tr>
								<!-- <th>카테고리</th>
								<td><input type="text" id="cmCate"></td>
								 -->
								
								<th>재료</th>
								<td><input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="cmStname"></td>
							</tr>
							<tr>
								<th>소 모 량</th>
								<td>
										<input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="consumee" name="consum"> 
										<input type="text" style="text-align:center; width:100px;"id="stUnitt" name="stUnit" readonly> 
								</td>
							</tr>

							<tr>
								<th>제 작 방 법</th>
								<td>
								<textarea style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
										rows=3 id="recipeDetail" name="recipeDetail">
										</textarea></td>
							</tr>
						</table>
						
						</div>
					</div>
				</form>
			</div>


			<!-- 메뉴 옵션 추가 CRUD -->
			<div style="float: left; padding: 5px; width: 100%;" id="optionDiv">

				<hr>
				<h4 align="center"><input style = "text-align:center;" type="text" id="vmName" readonly> 옵션 관리</h4>
				<h6 align="right"><font  color="gray">나만의 메뉴에 등록할 옵션을 설정합니다.</font></h6>
				<hr>
				<form id="optionTableForm">
				
				<table border="1" id="optionTable" class="table table-hover">
					<thead>
						<tr>
							<th>옵 션 이 름</th>
							<th>소 모 량</th>
							<th>단 위</th>
							<th rowspan="2">옵 션 가 격</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
				<input type="button" class="button btn btn-info" value=" 옵션 추가 " onclick="insertOption()">
				<br>
				<br>
				<div id = "optionDatailTable">
					<div align="right" class="btn-group">
						<input type="button" class="button btn btn-info" value=" 옵션 수정 " onclick="optionUpdate()">
							<input type="button" class="button btn btn-danger" value=" 옵션 삭제 " onclick="optionDelete()">
					</div>
					<table border="1" class="table table-hover">
						<tr>
							<th>재 료 이 름</th>
							<td></td>
						</tr>
						<tr>
							<th>옵 션 이 름</th>
							<td><input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="opopname" name="opName"> 
										</td>
						</tr>
						<tr>
							<th>소 모 량</th>
							<td><input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="opopconsum" name="consum">
							<input type="text" id="opopunit" name="stUnit" readonly></td>
						</tr>
						<tr>
							<th>옵 션 가 격</th>
							<td><input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="opopprice" name="opPrice">원</td>
						

					</table>
					<!-- <input type="hidden" id="omNum" name="mNum">
					<input type="hidden" id="opcaNum" name="caNum">-->
					<input type="hidden" id="opopstnum" name="stNum">
					<input type="hidden" id="opoprecipe" name="recipeno"> 
				</div>
				</form>

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
											<td><input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="mmName" name="mName"></td>
										</tr>
										<tr>
											<th>메뉴 가격(원)</th>
											<td><input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="mmPrice" name="mPrice"></td>
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

									
									<input type="button" class="button btn btn-info" value="등록" id="btnInsert">
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal fade" id="recipeModal" role="dialog">
				<div class="modal-dialog" style="max-width: 40%; width: auto;">
					<div class="modal-content">
						<div class="modal-body">

							
							<div style="width: 100%;" id="insertRecipeFormTable">



								<h3>[레시피 추가]</h3>

								<form id="insertRecipeDetail" method="post">
								
								<input type="hidden" id="cmNum" name="mNum">
								<input type="hidden" id="recicaNum" name="caNum"> 
								<input type="hidden" id="recistNum" name="stNum">
								<input type="hidden" id="recistStanunit" name = "stanUnit">
								
									<table border="1" class="table">
										<tr>
								<!-- <th>카테고리</th>
								<td><input type="text" id="cmCate"></td>
								 -->
								<th>재료 선택</th>
								<td><select id="reciSelect"></select></td>

							</tr>
							<tr>
								<th>사 용 량</th>
								<td colspan="3">
										<input type="text" style="text-align:center; width:100px; text-decoration: underline;" name="consum"> 
										<input type="text" id="reciUnit" readonly>
								</select></td>
							</tr>

							<tr>
								<th>제 작 방 법</th>
								<td colspan="3">
								<textarea style="width: 100%; border: 1; overflow: visible; text-overflow: ellipsis;"
										rows=3 name="recipeDetail"></textarea></td>
							</tr>
								</table>
						
									<input type="button" class="button btn btn-info" value="등록" onclick="recipeInsert()">
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="optionModal" role="dialog">
				<div class="modal-dialog" style="max-width: 40%; width: auto;">
					<div class="modal-content">
						<div class="modal-body">

							<div style="width: 100%;" id="insertOptionFormTable">

								<h3>[옵션 추가]</h3>
								<form id="insertOptionDetail" method="post">
								<table border="1" class="table table-hover">
									<tr>
										<th>재고 이름</th>
										<td><select id="opSelct">
										</select></td>
									</tr>
									<tr>
										<th>옵션 이름</th>
										<td><input type="text"  style="text-align:center; width:100px; text-decoration: underline;" id="opName" name="opName"></td>
									</tr>
									<tr>
										<th>소모량</th>
										<td>
										<input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="consume" name="consum">
										<input type="text" style="text-align:center; width:100px;" id="opstUnit">
										</td>
									</tr>
									<tr>
										<th>옵션 가격</th>
										<td><input type="text" style="text-align:center; width:100px; text-decoration: underline;" id="opPrice" name="opPrice">원</td>
									</tr>
									
								</table>
								<input type="button" class="button btn btn-info" value="등록" onclick="optionInsert()">
								<input type="hidden" id="omNum" name="mNum">
								<input type="hidden" id="opcaNum" name="caNum">
								<input type="hidden" id="opstNum" name="stNum">
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