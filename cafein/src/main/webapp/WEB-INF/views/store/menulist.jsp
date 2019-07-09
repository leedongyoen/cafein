<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>Insert title here</title>
<script src="./js/json.min.js"></script>
<script src="./js/jquery-3.2.1.min.js"></script>
<script src="./js/jquery.form.min.js"></script>



<script>


var selRecinum = "";

$(function(){
	  
	
	//조회, 등록, 수정 폼 처음에 숨기기
	$('#toggleTable').hide();
	$('#insertMenuFormTable').hide();
	$('#recipeTablediv').hide();
	
	$("#menuTable tbody tr").click(function(){
		
		//tr 누를때 session에서 sid가져옴
		var storeid = "SH001";
		
		
		$('#insertMenuFormTable').hide();
		$('#toggleTable').show();
		$('#recipeTablediv').show();
		
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
								.append($('<td>').html(data[i].consum))
								.append($('<td>').html(data[i].stAqty))
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
								.append($('<td>').html(data[i].consum))
								.append($('<td>').html(data[i].opPrice))
								.appendTo("#optionTable tbody");
							}
							
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



</script>
</head>
<body>

<div style="width:100%">
        <div class="left">
        <!-- 메뉴 CRUD -->
		<div style="float: left; width: 50%; border: 1px solid pink;">

			<!-- 메뉴 List-->
			<div class = "container">
				<h3>[메뉴 목록]</h3>
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
        
        
        
        
        
        
        <div class="right">
        
        			<!-- 등록폼 사진 추가 작업-->
			<div style="border: 1px solid orange; margin: 3px"
				id="insertMenuFormTable">
				<h3>[메뉴 추가]</h3>

				<form id="insertmenudetail" enctype="multipart/form-data"
					method="post">
					<table border="1" >


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
			<div style="border: 1px solid orange; margin: 3px" id="toggleTable">
				<h3>[메뉴 상세 조회/수정]</h3>

				<form id="menudetail">
					<table border="1" >


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

		</div>
        
		<!-- 레시피 CRUD-->
		<div style="float: left; border: 1px solid pink;">
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
				<select name="stNum">
				
					<c:forEach items="${recistock}" var="stock">
						<option value="${stock.stNum}">${stock.stName}</option>
						
					</c:forEach>
				</select> <input type="text" value="0" id="consum" name="consum">


				
			<input type="button" value=" + " onclick="recipeInsert()">
			<input type="button" value=" - " onclick="recipeDelete()">

			
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
		<div style="float: left; border: 1px solid blue"; padding="2px">
		
		
		<h4>옵션 추가</h4>
					<select id="" name="">
							<option value="">재고</option>
							<option value="">테이블에서</option>
							<option value="">현재 메뉴번호에 맞는</option>
							<option value="">옵션리스트를</option>
							<option value="">가져온다</option>
					</select>
					
				<input type="text" value="휘핑 추가">
				<input type="text" value="0.3">
				<button> + </button><button> - </button>
		
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



<form name="frm" id="frm" method="post" enctype="multipart/form-data">
	<input type="file" name="upfile" id="upfile">
</form>


<a href="javascript:upload();">등록</a>




</body>
</html>