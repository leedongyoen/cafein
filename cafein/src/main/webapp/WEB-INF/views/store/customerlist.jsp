<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>
<title>우리매장 고객</title>
<style type="text/css">


input {
	border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
}


.reallyrefund{
background-color: #FBEFF2

}
.sumTotal{
background-color: #E0F8F7
}


</style>
<script>
	var sId = "<%= (String)session.getAttribute("sId") %>";	
	var customerId = '';	
	$(function(){
		customerList();
		mileageServiceCheck();
		$("#customerTable tbody tr").click(function(){
			$('#toggleTable').show();
		})
		
		//검색
		$("#customerserch").on("keyup", function() {
		      var value = $(this).val().toLowerCase();
		      $("#customerTbody tr").filter(function() {
		         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		      });
		   });
		
		
		
	});
	
	function settingDate(){
		// startDate는 한달전
		var date = new Date(new Date().setMonth(new Date().getMonth()-1));
		var year = date.getFullYear();
		var mm =Number(date.getMonth())+1;
		var dd = date.getDate();
		
		if(mm < 10)
			mm = '0'+mm;
		if(dd <10)
			dd = '0'+dd;

		document.getElementById('startDate').value = year+'-'+mm+'-'+dd;
		
		// end date는 현재 날짜로 세팅하기
		document.getElementById('endDate').value = new Date().toISOString().substring(0, 10);
	}
	
	// 매장 마일리지 서비스 체크
	function mileageServiceCheck(){
		$.ajax({
			url:'getstoremileageservice',
			type:'GET',
			data: {sId: sId},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
			
				if(data == 'N'){
					$('.mileagecheck').hide();
				}else{   
					$('.mileagecheck').show();
				}
				
					
			}
		}); 
	}
	
	 //날짜검색
  	function dateSearch(){    	  													
  		var startDate = jQuery('#startDate').val();
  		var endDate = jQuery('#endDate').val();
  		
  		if(startDate != "" && endDate != ""){
  			alert("기간검색이 되었습니다.");
  		}
  		
  		$.ajax({
    		  url:'datesearch',
    		  type:'POST',
    		  dataType:'json',
    		data : {startDate : startDate,
    				endDate : endDate,
    				sId : sId,
    				cId : customerId
    				},
    		  error:function(status,msg){
    			  alert(status+"메세지"+msg);
    		  },
    		  success:function(data){
    					$('#historyTbody').empty();
    					
    					let oNumArr 	= [];
    					let ototalArr 	= [];
    					
    					var cId 		= "";
    					var oNum 		= "";
    					var mName 		= "총합";
    					var total 		= 0;
    					var payMethod 	= "";
    					var receipt 	= "";
    					
    					$.each(data,function(idx, user){
    						var isOverlap = false;
    						for(var i = 0; i < oNumArr.length; ++i){
    							if(oNumArr[i] == user.oNum){
    								isOverlap = true;
    								cId 		= user.cId;
    								oNum 		= user.oNum;
    								mName 		= "총합";
    								total 		+= user.total;
    								payMethod 	= user.payMethod;
    								receipt 	= user.receipt;
    								break;
    							}
    						}
    						
    						//중복되는지 IF
    						if(isOverlap == false){
    							oNumArr.push(user.oNum);
    							ototalArr.push(0);
    							//아이디가 같지않으면-
    							if(cId != ""){
    								console.log("총합");
    								$('<tr>').addClass("sumTotal")
    								.append($('<td>').html(cId))
    								.append($('<td>').html(oNum))
//    			 					.append($('<td>').html(user.gd))
    								.append($('<td>').html(mName))
    								.append($('<td>').html(total))
    								.append($('<td>').html(payMethod))
    								.append($('<td>').html(receipt))
    								.append($('<td>').html())
    								.appendTo('#historyTbody');
    								
    								cId 		= "";
    								oNum 		= "";
    								mName 		= "총합";
    								total 		= 0;
    								payMethod 	= "";
    								receipt 	= "";
    							}
    							
    							cId 		= user.cId;
    							oNum 		= user.oNum;
    							mName 		= "총합";
    							total 		+= user.total;
    							payMethod 	= user.payMethod;
    							receipt 	= user.receipt;
    						}
    						
    						for(var i = 0; i < oNumArr.length; ++i){
    							if(oNumArr[i] == user.oNum){
    								isOverlap = true;
    								ototalArr[i] += user.total;
    							}
    						}
    						
    						$('<tr>')
    								.append($('<td>').html(user.cId))
    								.append($('<td>').html(user.oNum))
//    			 					.append($('<td>').html(user.gd))
    								.append($('<td>').html(user.mName))
    								.append($('<td>').html(user.total))
    								.append($('<td>').html(user.payMethod))
    								.append($('<td>').html(user.receipt))
    								.append($('<td>').html())
    								.appendTo('#historyTbody');
    					});
    					
    					if(cId != ""){
    						$('<tr>')
    						.append($('<td>').html(cId))
    						.append($('<td>').html(oNum))
//    						.append($('<td>').html(user.gd))
    						.append($('<td>').html(mName))
    						.append($('<td>').html(total))
    						.append($('<td>').html(payMethod))
    						.append($('<td>').html(receipt))
    						.append($('<td>').html())
    						.appendTo('#historyTbody');
    						console.log(ototalArr + "------");
    					}
    			
    		  }
    	  });
	}
	
	
	
	//매장 고객 리스트 요청
	function customerList(){
		var storelogin = '<%=session.getAttribute("sId")%>';
		console.log(storelogin);
 		$.ajax({
 			url : 'allcustomerlist',
			type : 'GET',
			dataType : 'json',
			data: {sId: storelogin},
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:customerListResult
			
		}); 
	}
	//매장 고객리스트 받아오기
	function customerListResult(data){
		$("#customerTbody").empty();
		console.log(data);
		$.each(data,function(idx, user){
				$('<tr>').attr("onclick","customerSelect('"+user.cId+"')")
						.append($('<td>').html(user.cId))
						.append($('<td>').html(user.cName))
						.append($('<td>').val(user.cId))
						.appendTo('#customerTbody');
					
		});
					
	}
	//매장- 선택한 고객  조회 요청
	function customerSelect(cId){
		var storelogin = '<%=session.getAttribute("sId")%>';
		customerId = cId;
		$('#toggleTable').show();
		console.log(cId);
		$.ajax({
			url : 'getcustomerdetail/' + cId + '/' + storelogin,
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : customerSelectResult
		});
	}
	// 매장 고객 단건조회 결과 뿌리기
	function customerSelectResult(data) {
		$('input:text[name="cId" ]').val(data.cId);
		$('input:text[name="cNick"]').val(data.cNick);
		$('input:text[name="cName"]').val(data.cName);
		$('input:text[name="cTel"]').val(data.cTel);
		$('input:text[name="cAdd"]').val(data.cAdd);
		$('input:text[name="cJoin"]').val(data.cJoin); 
		$('input:text[name="mileage"]').val(data.mileage)
		
		history(data.cId);

	}//stockSelectResult
	//고객 구매이력 요청
	function history(cId){
		var storelogin = '<%=session.getAttribute("sId")%>';
		$('#c_history').show();
		console.log(cId);
		$.ajax({
			url : 'customerhistory/' + cId + '/' + storelogin,
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : historyResult
		});
	}
	//고객 구매이력 받아오기
	function historyResult(data) {
		
		$('#historyTbody').empty();
		console.log(data);
		settingDate();
		let oNumArr 	= [];
		let ototalArr 	= [];
		
		var cId 		= "";
		var oNum 		= "";
		var mName 		= "총합";
		var total 		= 0;
		var payMethod 	= "";
		var receipt 	= "";
		
		$.each(data,function(idx, user){
			var isOverlap = false;
			for(var i = 0; i < oNumArr.length; ++i){
				if(oNumArr[i] == user.oNum){
					isOverlap = true;
					cId 		= user.cId;
					oNum 		= user.oNum;
					mName 		= "총합";
					total 		+= user.total;
					payMethod 	= user.payMethod;
					receipt 	= user.receipt;
					break;
				}
			}
			
			//중복되는지 IF
			if(isOverlap == false){
				oNumArr.push(user.oNum);
				ototalArr.push(0);
				//아이디가 같지않으면-
				if(cId != ""){
					console.log("총합");
					$('<tr>')
					.addClass("sumTotal")
					.append($('<td>').html(cId))
					.append($('<td>').html(oNum))
// 					.append($('<td>').html(user.gd))
					.append($('<td>').html(mName))
					.append($('<td>').html(total))
					.append($('<td>').html(payMethod))
					.append($('<td>').html(receipt))
					.append($('<td>').html())
					.appendTo('#historyTbody');
					
					cId 		= "";
					oNum 		= "";
					mName 		= "총합";
					total 		= 0;
					payMethod 	= "";
					receipt 	= "";
				}
				
				cId 		= user.cId;
				oNum 		= user.oNum;
				mName 		= "총합";
				total 		+= user.total;
				payMethod 	= user.payMethod;
				receipt 	= user.receipt;
			}
			
			for(var i = 0; i < oNumArr.length; ++i){
				if(oNumArr[i] == user.oNum){
					isOverlap = true;
					ototalArr[i] += user.total;
				}
			}
			
			$('<tr>')
					.append($('<td>').html(user.cId))
					.append($('<td>').html(user.oNum))
// 					.append($('<td>').html(user.gd))
					.append($('<td>').html(user.mName))
					.append($('<td>').html(user.total))
					.append($('<td>').html(user.payMethod))
					.append($('<td>').html(user.receipt))
					.append($('<td>').html())
					.appendTo('#historyTbody');
		});
		
		if(cId != ""){
			console.log("총합1");
			$('<tr>').addClass("sumTotal")
			.append($('<td>').html(cId))
			.append($('<td>').html(oNum))
//			.append($('<td>').html(user.gd))
			.append($('<td>').html(mName))
			.append($('<td>').html(total))
			.append($('<td>').html(payMethod))
			.append($('<td>').html(receipt))
			.append($('<td>').html())
			.appendTo('#historyTbody');
			console.log(ototalArr + "------");
		}
		
		console.log(oNumArr);
		console.log(ototalArr);
	}
	
	
</script>



</head>
<body>

	<div style="position: absolute; width: 100%">
		<div style="overflow: scroll; height: 800px; float: left; width: 30%;">
			<div class="container">
				<p align="center" class="titlefont"><%= session.getAttribute("sName")%> 고객 조회 </p>
				<hr>
			</div>
			<div class="container" align="center">
				<input class="form-control" id="customerserch" type="text" placeholder="Search..">
				<hr> 
				<table class="table table-hover" id="customerTable">

					<thead>
						<tr>
							<th>고객ID</th>
							<th>이름</th>

						</tr>
					</thead>
					<tbody id="customerTbody" style="cursor:pointer;">
					</tbody>
				</table>
			</div>
		</div>

		<!--고객 상세 정보 -->
		<div style="overflow: scroll; height: 800px; float: left; width: 70%;"
			id="toggleTable">

			<div class="container">
				<p align="center" class="titlefont">고객 상세</p>
				<hr>
			</div>
			<div>
				<form id="form1" style="margin:0% 10% 0% 10%">
					
					<table border="1" class="table" >
						<tr>
							<th class="tableth" width="50" >ID</th>
							<td width="150"><input type="text" size="50" style="text-align:center" id="cId" name="cId" readonly></td>
						</tr>
						<tr>
							<th class="tableth">NICKNAME</th>
							<td><input type="text" size="50" style="text-align:center"id="cNick" name="cNick" readonly></td>
						</tr>
						<tr>
							<th class="tableth">NAME</th>
							<td><input type="text" size="50" style="text-align:center"id="cName" name="cName" readonly></td>
						</tr>
						<tr>
							<th class="tableth">TEL</th>
							<td><input type="text" size="50" style="text-align:center"id="cTel" name="cTel" readonly></td>
						</tr>
						<tr>
							<th class="tableth">address</th>
							<td><input type="text" size="50" style="text-align:center"id="cAdd" name="cAdd" readonly ></td>
						</tr>
						<tr>
							<th class="tableth">loginRoot</th>
							<td><input type="text" size="50" style="text-align:center"id="cJoin" name="cJoin" readonly></td>
						</tr>
						<tr class="mileagecheck" style="display: none;">
							<th class="tableth">MILEAGE</th>
							<td><input type="text" size="50" style="text-align:center"id="mileage" name="mileage" readonly></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="container">
				<p align="center" class="titlefont">구매이력</p>
				<hr>
			</div>  
			<div class="btn-group" align="right"> 
				<input type="date" class="btn btn-secondary" id="startDate" name="startDate">&nbsp; 
					<input type="date" class="btn btn-secondary" id="endDate" name="endDate">&nbsp;
				<input type="button" value="검색" class="btn btn-success" id="btnSearch" onclick="dateSearch()">
			</div>

				<table border="1" class="table " id="c_history">
					<thead>
						<tr>
							<th>ID</th>
							<th>주문번호</th>
<!-- 							<th>메뉴/옵션</th> -->
							<th>메뉴</th>
							<th>TOTALS</th>
							<th>결제방식</th>
							<th>수령방식</th>
						</tr>
					</thead>
					<tbody id="historyTbody">
					</tbody>
				</table>
			</div>

		</div>

</body>
</html>