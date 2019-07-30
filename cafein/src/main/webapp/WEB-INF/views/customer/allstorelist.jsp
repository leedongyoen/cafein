<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b402787b02c7003da0294158d1b3c1f8&libraries=services"></script>

<title>매장</title>
<style type="text/css">
.storelist{
	background-color: #F2F2F2;
}


body{ 
			background: url(image/cusstoreselect.jpg) no-repeat center center fixed; 
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
}


</style>
</head>
<body>
<p></p>

<div class="container" align="center">
	<!-- <div id="map" style="width:500px;height:400px;" ></div> -->

	<hr>
		<div class="titlefont" align="center">모든 매장</div>
		<hr>
	    
			<!-- 메뉴 선택 -->
		<!-- Nav tabs -->
	  <ul id="topclick" class="nav nav-tabs">
	    <li class="nav-item">
	      <a class="nav-link active" data-toggle="tab" href="#seoul">서울</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#daegu">대구</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#ulsan">울산</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="tab" href="#nnoe">그 외</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
		<div class="tab-content">
			<div id="seoul" class="container tab-pane active"><br>
				<div class="table-responsive">
				<table id="seoulstoretable" class="table">
					<thead>
						<tr><th>매장명</th><th>주소</th><th>전화번호</th>

					</thead>
					<tbody id="searchTable">
						
					</tbody>
				</table>
				</div>
	  		</div>
	   		<div id="daegu" class="container tab-pane fade"><br>
	    		<table id="daegustoretable" class="table">
	    			<thead>
						<tr><th>매장명</th><th>주소</th><th>전화번호</th>

					</thead>
					<tbody id="searchTable">
					
					</tbody>
				</table>
	   		</div>
	   		<div id="ulsan" class="container tab-pane fade"><br>
	     		<table id="ulsanstoretable" class="table">
	     			<thead>
						<tr><th>매장명</th><th>주소</th><th>전화번호</th>

					</thead>
					<tbody id="searchTable">
					
					</tbody>
				</table>
	   		</div>
	   		<div id="nnoe" class="container tab-pane fade"><br>
	     		<table id="nnoestoretable" class="table">
	     			<thead>
						<tr><th>매장명</th><th>주소</th><th>전화번호</th>

					</thead>
					<tbody id="searchTable">
					
					</tbody>
				</table>
	   		</div>
	 	</div>
</div>
	
	
	<!-- 매장 선택하면 나오는 Modal -->
	<div class="modal fade" id="storedetailModal" role="dialog">
		<div class="modal-dialog">
		
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<form class="form-borizontal" id="menudetailForm" >
				<div class="modal-body">
						<h3 id="sName" align="center"></h3>
						<table class="table">
							<tr>
								<th>주소</th>
								<td id="sadd">
								
							</tr>
							<tr>
								<th>전화번호</th>
								<td id="stel">
							</tr>
							<tr>
								<th>배달 서비스</th>
								<td id="deliservice">
								</td>
							</tr>
							<tr>
								<th>OPEN</th>
								<td id="open" >
							</tr>
							<tr>
								<th>CLOSE</th>
								<td id="close" ></td>
							</tr>
							<tr>
								<th>마일리지 서비스</th>
								<td id="mileservice"></td>
							</tr>
						</table>
					
				
				</div>
				<div class="modal-footer">		
					<button type="button" class="btn modalbottom" data-dismiss="modal">Close</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	
<script>


/* 	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
	 */
	$(function(){
		allstroelist();
	});
	 

	
	function storeDetail(sid){
		$.ajax({
			url:'getstoredetail/'+sid,
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){
				console.log(data);
				$("#sadd").html(data.sadd);
				//$("#stel").val(data.stel);
				$("#stel").html(data.stel);
				if(data.stdeliservice == 'Y'){
					$("#deliservice").html("배달 가능");
				}else if(data.stdeliservice == 'N'){
					$("#deliservice").html("배달 불가능");
				}
				$("#open").html(data.stopentime);
				$("#close").html(data.stclosetime);
				if(data.stmileservice == 'Y'){
					$("#mileservice").html("사용");
				}else if(data.stmileservice == 'N'){
					$("#mileservice").html("사용 안함");
				}

				$("#sName").html(data.sname);
				$('#storedetailModal').modal('show');
				
			}
		});
	}
	
	// 모든 매장 리스트 보여주기
	function allstroelist(){
		$.ajax({
			url:'storelistmenu',
			type:'GET',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:allstroedetail
		});
	}
	
	function allstroedetail(data){

		$.each(data,function(idx,item){
			storeregi = ''+item.sadd;
			storeregi=storeregi.substr(0,2);
			if(storeregi == '대구'){
				$('<tr>').attr("onclick","storeDetail('"+item.sid+"')").attr("class","storelist")
				.append($('<td>').html(item.sname))
				.append($('<td>').html(item.sadd))
				.append($('<td>').html(item.stel))
				.appendTo('#daegustoretable tbody');
			}else if(storeregi == '울산'){
				$('<tr>').attr("onclick","storeDetail('"+item.sid+"')").attr("class","storelist")
				.append($('<td>').html(item.sname))
				.append($('<td>').html(item.sadd))
				.append($('<td>').html(item.stel))
				.appendTo('#ulsanstoretable tbody');
			}else if(storeregi == '서울'){
				$('<tr>').attr("onclick","storeDetail('"+item.sid+"')").attr("class","storelist")
				.append($('<td>').html(item.sname))
				.append($('<td>').html(item.sadd))
				.append($('<td>').html(item.stel))
				.appendTo('#seoulstoretable tbody');
			}else{ 
				$('<tr>').attr("onclick","storeDetail('"+item.sid+"')").attr("class","storelist")
				.append($('<td>').html(item.sname))
				.append($('<td>').html(item.sadd))
				.append($('<td>').html(item.stel))
				.appendTo('#nnoestoretable tbody');
			}
		});

	}
</script>

</body>
</html>