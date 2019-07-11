<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>Insert title here</title>



<script>


var selRecinum = "";
//c태그 받기 연습


$(function(){
	  
	
	//조회, 등록, 수정 폼 처음에 숨기기
	$('#toggleTable').hide();
	$('#insertMenuFormTable').hide();
	$('#recipeTablediv').hide();
	$('#optionDiv').hide();
	
	$("#menuTable tbody tr").click(function(){
		
		//tr 누를때 session에서 sid가져옴
		var storeid = "SH001";

		
		$('#insertMenuFormTable').hide();
		$('#toggleTable').show();
		$('#recipeTablediv').show();
		$('#optionDiv').show();
		
		var str="";
		var tdArr = new Array();
		
		var tr = $(this);
		var td = tr.children();
		
		console.log("row: "+tr.text());

		
		var mNum = td.eq(0).text();
		var mName = td.eq(1).text();
		var mPrice = td.eq(2).text();
		var mCate = td.eq(3).text();
		var saleState = td.eq(4).text();
		var menuState = td.eq(5).text();
		
		if(mCate=='CACO'){mCate="CACO";}
		else if(mCate=='CADR'){mCate="CADR";}
		else if(mCate=='CADE'){mCate="CADE";}
		else if(mCate=='CAOP'){mCate="CAOP";}
		console.log("sale : "+saleState);
		console.log("menu : "+menuState);
		$("#mNum").val(mNum);
		$("#mName").val(mName);
		$("#mPrice").val(mPrice);
		$("#mCategory").val(mCate);
		$('input[id="salestate"]').removeAttr('checked');
		$("input:radio[id=salestate]:input[value='"+saleState+"']").attr("checked", true);
		$('input[id="menustate"]').removeAttr('checked');
		$("input:radio[id=menustate]:input[value='"+menuState+"']").attr("checked", true);
		
		
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
				
				
				if(data.length==0){
					$("#recipeTable tbody").empty();
					console.log("noting");
				}
				else
					{
					
						$("#recipeTable tbody").empty();
						for(var i = 0;i<data.length;i++){
						
							if(data[i].caNum!='CAOP')
							{
								$('<tr>')
								.append($('<td>').html(data[i].stName))
								.append($('<td>').append($('<input style="text-align:center; width:80px;">').val(data[i].consum)))
								.append($('<td>').append($('<input style="text-align:center; width:80px;">').val(data[i].stAqty)))
								.append($('<td>').html(data[i].stanUnit))
								.append($('<td style="visibility:hidden;">').html(data[i].recipeNo))
								.appendTo("#recipeTable tbody");
							}
							console.log(data);
							
						}
						
						$("#optionTable tbody").empty();
						for(var i = 0;i<data.length;i++){
							if(data[i].caNum=='CAOP')
							{
								$('<tr>')
								.append($('<td>').html(data[i].opName))
								.append($('<td>').append($('<input style="text-align:center; width:80px;">').val(data[i].consum)))
								.append($('<td>').append($('<input style="text-align:center; width:80px;">').val(data[i].opPrice)))
								.append($('<td style="visibility:hidden;">').html(data[i].recipeNo))
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

					var json='{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}';
					if(data[i].caNum=='CACP' || data[i].caNum=='CACM')
					{
						console.log(data[i].caNum);
						//data[i].caNum
						//옵션에 caNum이 CACM과 CACP를 추가
						/* var option = $("<option>"+data[i].caNum+"</option>");
		                $('#opSelct').append(option);
 */
 						
 						$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum + '</option>').appendTo('#reciSelect');
						
 
 
 							
					}else if(mCate=='CADR'&& (data[i].caNum=='CAJP' || data[i].caNum=='CACM')){
						console.log(data[i].caNum);
						//data[i].caNum
						//옵션에 caNum이 CACM과 CAJP를 추가
						$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum + '</option>').appendTo('#reciSelect');
						
					}else if(mCate=='CADE'&& (data[i].caNum=='CADP' || data[i].caNum=='CACM')){
						console.log(data[i].caNum);
						//data[i].caNum
						//옵션에 caNum이 CACM과 CADP를 추가
						$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum + '</option>').appendTo('#reciSelect');
						
						}
					}
				
				
				$("#opSelct").empty();
				$('<option value="">' + '카테고리 선택' + '</option>').appendTo('#opSelct');
				
				for(var i = 0;i<data.length;i++){
					//console.log('hello: '+data[i].caNum);
					if(mCate=='CACO' && (data[i].caNum=='CACP' || data[i].caNum=='CACM'))
					{
						//console.log(data[i].caNum);
						//data[i].caNum
						//옵션에 caNum이 CACM과 CACP를 추가
						/* var option = $("<option>"+data[i].caNum+"</option>");
		                $('#opSelct').append(option);
 */
						
						$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum + '</option>').appendTo('#opSelct');
						
 
 							
					}else if(mCate=='CADR'&& (data[i].caNum=='CAJP' || data[i].caNum=='CACM')){
						console.log(data[i].caNum);
						//data[i].caNum
						//옵션에 caNum이 CACM과 CAJP를 추가
						$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum + '</option>').appendTo('#opSelct');
						
					}else if(mCate=='CADE'&& (data[i].caNum=='CADP' || data[i].caNum=='CACM')){
						console.log(data[i].caNum);
						//data[i].caNum
						//옵션에 caNum이 CACM과 CADP를 추가
						$('<option value=\'{"value1":"'+data[i].stNum+'","value2":"'+data[i].caNum+'"}\'>' + data[i].stName +" : "+mCate+" : "+data[i].caNum + '</option>').appendTo('#opSelct');
						
						}
					}
				}
				
				
				
				
			
			
		});
		
		
		
		
		
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
        console.log(obj.value1+" : "+obj.value2);
        $("#recistNum").val(obj.value1);
		$("#recicaNum").val(obj.value2);
		
		
	});
	
	$(document).on("change","#opSelct",function(){
		
		var json = $(this).val();
		var obj=JSON.parse(json);
        console.log(obj.value1+" : "+obj.value2);
        $("#opstNum").val(obj.value1);
		//$("#opcaNum").val(obj.value2);
		
		
	});
	
	
	
	
	
	 
});

function upload(){
	$("#frm").ajaxForm({
		url : "/upload.do",
		enctype : "multipart/form-data",
		dataType : "json",
		error : function(){
			alert("에러") ;
		},
		success : function(result){
			alert("성공") ;
		}
	});

	$("#frm").submit() ;
}


function insertMenuForm(){
	$('#toggleTable').hide();
	$('#recipeTablediv').hide();
	$('#optionDiv').hide();
	$('#insertMenuFormTable').show();
	
}


function menuInsert(){

	
/* 	
	$.ajaxForm({ //보내기전 validation check가 필요할경우 
		url: "menues",
		beforeSubmit: function (data, frm, opt) { alert("전송전!!"); return true; }, 
		dataType: 'json',
		data: JSON.stringify($("#insertmenudetail").serializeObject()),
		contentType: 'application/json',
		//submit이후의 처리 
		success: function(responseText, statusText){ alert("전송성공!!"); }, 
		//ajax error 
		error: function(){ alert("에러발생!!"); } }); 
	 */
	
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
			window.location.reload();
		}
	});
}

function menuUpdate() {
	$.ajax({
		url: "menues",
		type: 'PUT',
		dataType: 'json',
		data: JSON.stringify($("#menudetail").serializeObject()),
		contentType: 'application/json',
		success: function(data) { 
			window.location.reload();
		}
		
	});  
}

function recipeInsert(){
	
	alert(JSON.stringify($("#recipeTableForm").serializeObject()));
	
	$.ajax({
		url: "recipes",
		type: 'POST',
		dataType: 'json',
		data: JSON.stringify($("#recipeTableForm").serializeObject()),
		contentType: 'application/json',
		success: function(data) {
			if(data.result == true) {
				console.log(data);
				window.location.reload();
	    	}
			
		}
		
	}); 
}
function recipeDelete(){
	
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
			window.location.reload();
		}
	}); 
}



function optionInsert(){
	
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
				window.location.reload();
	    	}
			
		}
		
	});  
}

function optionDelete(){
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
			window.location.reload();
		}
	});
	 
}


</script>
</head>
<body>

<div style="position: absolute; padding: 3px; width:100%">
<div style="float: left; width: 50%;   padding: 3px;">
<!-- 메뉴 List-->
			<div class = "container">
				
				<form action="#">
					<table border="1" id="menuTable" class = "table table-hover" >
						<thead>
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
									
								</tr>

							</c:forEach>

						</tbody>
					</table>

					<input type="button" value="추가" onclick="insertMenuForm()">



				</form>
			</div>
</div>
<div style="float: right; width: 50%;  padding: 3px;">
		<!-- 등록폼 사진 추가 작업-->
			<div style="border: 1px solid orange; padding: 3px; width: 100%;"
				id="insertMenuFormTable">
				<h3>[메뉴 추가]</h3>

				<form id="insertmenudetail" enctype="multipart/form-data"
					method="post">
					<table border="1" class = "table table-hover">


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
									<option value="">선택</option>
									<option value="CACO">커피</option>
									<option value="CADR">음료</option>
									<option value="CADE">디저트</option>
									<option value="CAOP">옵션</option>
							</select></td>
						</tr>

						<tr>
							<th>메뉴 사진</th>

							<td><input type="file" value="사진 선택" name="uploadFile" />
						</tr>
						
					</table>
					<!-- hidden 으로 sId 넘기기 -->

					<input type="hidden" id="sId" name="sId" value="SH001"> <input
						type="button" value="등록" id="btnInsert">
				</form>
			</div>
<!-- 메뉴 상세조회&수정 -->
			<div style=" padding: 3px; width: 100%;" id="toggleTable">
				<h3>[메뉴 상세 조회/수정]</h3>

				<form id="menudetail">
					<table border="1" class = "table table-hover">


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
							<th>메뉴 사진</th>
							<td><input type="file" value="파일 선택" name="file" /></td>
						</tr>
					</table>
					<!-- hidden 으로 sId 넘기기 -->

					<input type="hidden" id="sId" name="sId" value="SH001"> <input
						type="button" value="확정" id="btnUpdate"> <input
						type="button" value="삭제" id="btnMenuDelete" onclick="menuDelete()">
					<input type="button" value="취소" id="btnCancle">
				</form>
			</div>
<!-- 레시피 CRUD-->
		<div style="float: left;  padding: 3px; width: 100%;" >
		
			<!-- 레시피 등록, 메뉴 하나 Select된 상태에서 레시피 레시피 조회가능, 등록 버튼 활성화 -->

		<form id="recipeTableForm">
			<!-- Recipe Detail List로 표현-->
			<div id="recipeTablediv" style="border: 1px solid gray;">

				<h3>상세 레시피</h3>
				<table border="1" class = "table table-hover">
					<tr>
						<th>메뉴 번호</th>
						<td><input type="text" id="cmNum" name="mNum" readonly></td>
					</tr>
					<tr>
						<th>메뉴 이름</th>
						<td><input type="text" id="cmName" readonly></td>
					</tr>
				</table>
					
						<h4>재료 추가</h4>
						<table border="1" class = "table">
							<tr>
								<th>카테고리 선택</th>
								<td><select id="reciSelect">

								</select></td>
							</tr>
							<tr>
								<th>소모량</th>
								<td><input type="text" value="0" id="consum" name="consum"></td>
							</tr>
							<tr>
								<td><input type="button" value=" + "
									onclick="recipeInsert()"></td>
								<td><input type="button" value=" - "
									onclick="recipeDelete()"></td>
							</tr>
						</table>


						<input type="hidden" id="recicaNum" name="caNum">
						<input type="hidden" id="recistNum" name="stNum">
				
			
				<br>
				<table border="1"  id="recipeTable" class = "table table-hover">
					<thead>
					<tr>
						<th>재료명</th>
						<th>소모량</th>
						<th>재료 적정수량</th>
						<th>기준 단위</th>
					</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
			
			
			
        </form>




		</div>
		<!-- 메뉴 옵션 추가 CRUD -->
		<div style="float: left; border: 1px solid black; padding: 3px; width: 100%;" id="optionDiv">


				<h4>옵션 추가</h4>
			<form id="optionTableForm">
				<table border="1" class = "table">
					<tr>
						<th>재고 이름</th>
						<td><select id="opSelct">
						</select></td>
					</tr>
					<tr>
						<th>옵션 이름</th>
						<td><input type="text" name="opName"></td>
					</tr>
					<tr>
						<th>소모량</th>
						<td><input type="text" name="consum"></td>
					</tr>
					<tr>
						<th>옵션 가격</th>
						<td><input type="text" name="opPrice">원</td>
					</tr>
					<tr>

					<tr>
						<td><input type="button" value=" + " onclick="optionInsert()"></td>
						<td><input type="button" value=" - " onclick="optionDelete()"></td>
					</tr>

				</table>
						<input type="hidden" id="sId" name="sId" value="SH001">
						<input type="hidden" id="omNum" name="mNum">
						<input type="hidden" id="opcaNum" value="CAOP" name="caNum">
						<input type="hidden" id="opstNum" name="stNum">

			</form>



				<table border="1"  id="optionTable" class = "table table-hover">
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
</div>
</div>


</body>
</html>