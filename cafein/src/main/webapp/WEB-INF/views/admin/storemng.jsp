<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="adminhead.jsp"%>
<title>Insert title here</title>
<script src="./js/json.min.js"></script>
<link rel="stylesheet" href="./css/orderlist.css" >

<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">

<script>

	$(function(){
		loginCheck();
		storepermissionList();
		
		 $("#storeserch").on("keyup", function() {
		      var value = $(this).val().toLowerCase();
		      $("#storepermissionlist tr").filter(function() {
		         $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		      });
		   });
	});
	
	

	function storepermissionList(){
		console.log('function==============')
		$.ajax({
			url : 'storepermissionlist',
			type : 'GET',
			dataType : 'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){
				$("#storepermissionlist").empty();
				console.log(data);
				$.each(data,function(idx, store){
						$('<tr>')
								.append($('<td>').html(store.sname))
								.append($('<td>').html(store.sid))
								.append($('<td>').html(store.sadd))
								.append($('<td>').html(store.sadd3))
								.append($('<td>').html(store.stel))
								.append($('<td>').html(store.stdeliservice))
								.append($('<td>').html(store.stopentime))
								.append($('<td>').html(store.stclosetime))
								.append($('<td>').html(store.stmileservice))
								.append($('<td>').html('<input type=\'checkbox\' name=\'sid\' class=\'checkbox\' value=\'' + store.sid+'\' />'))
								.appendTo('#storepermissionlist');
				});
			}
		
		}); 
		Storepermission();
	};

	function Storepermission(){
		$('body').on('click','#btnCkPermission', function(){
			var result = confirm("체크된 매장들을 승인하시겠습니까?");
			var ckPermission = [];
			$('input[name=sid]:checked').each(function(idx, store){
				ckPermission.push(store.value);
				console.log(store.value);
			}); 
			
			
			if(result){
				$.ajax({
					url : 'storepermissionlist',
					type : 'PUT',
					contentType : 'application/json;charset=utf-8',
					dataType: 'json',
					data : JSON.stringify(ckPermission),
					error : function(xhr, status, msg){
						console.log("상태값 : " + status + "Http에러메시지 : " + msg);
					},
					success : function(data){
						storepermissionList();
					}
				
				});
			}
		});
		
	}


</script>
</head>
<body>
	<hr>
	<p align="center" class="titlefont">매장등록신청내역</p>
	<hr>
	<div class="container">
	<form id="frm">
	
		<input class="form-control" id="storeserch" type="text" placeholder="Search.."><hr>
		
		<table class = "table ">
			
			<thead class ="tableth trth">
				<tr>
				<th>매장명</th>
				<th>ID</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>전화번호</th>
				<th>배달</th>
				<th>적립금</th>
				<th>오픈시간</th>
				<th>마감시간</th>
				<th>승인 선택</th>
			</tr>
			</thead>
			<tbody id="storepermissionlist" class="trtd" ></tbody>
		</table>
	</form>
		<div style="text-align: right">
			<button class="btn btn-default btn-success" type="button" id="btnCkPermission">승인</button>
			<button class="btn btn-secondary" onclick="location.href='adminMainForm.do'">돌아가기</button>
		</div>
	</div>
</body>
</html>