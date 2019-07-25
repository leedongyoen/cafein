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

$(function() {
	loginCheck();
	storeList();
});


/* 	$(function storeList(){ 
			$.ajax({
				url : 'storelist.do',
				type : 'GET',
				dataType : 'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:function(data){
					getstoreList();
				}
			
		}); 
		
	}); */
	
	function storeList(){
		console.log('function in');
	
		$.ajax({
			url : 'storelist',
			type : 'GET',
			dataType : 'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){
				$("#storelist").empty();
				console.log(data);
				$.each(data,function(idx, store){
						$('<tr>')
								.append($('<td>').html(store.sname))
								.append($('<td>').html(store.sid))
								.append($('<td>').html(store.sadd))
								.append($('<td>').html(store.sadd2))
								.append($('<td>').html(store.stel))
								.append($('<td>').html(store.stdeliservice))
								.append($('<td>').html(store.stopentime))
								.append($('<td>').html(store.stclosetime))
								.append($('<td>').html(store.stmileservice))
								.appendTo('#storelist');
				});
			}
		
		}); 
	
	}
	

/* 	function storeListResult(){
		$("#storelist").empty();
		console.log(data);
		$.each(data,function(idx, store){
				$('<tr>')
						.append($('<td>').html(store.sid))
						.append($('<td>').html(store.sname))
						.append($('<td>').html(store.sadd))
						.append($('<td>').html(store.sadd2))
						.append($('<td>').html(store.stel))
						.append($('<td>').html(store.stdeliservice))
						.append($('<td>').html(store.stopentime))
						.append($('<td>').html(store.stclosetime))
						.append($('<td>').html(store.stmileservice))
						.appendTo('#customerTbody');
		});
					
	} */

</script>


</head>
<body>
	<hr>
	<p align="center" class="titlefont">매장LIST</p>
	<hr>
	<div class="container">

		<div style="text-align: right">
			<input type='text' name='word' value=''>
			<button>검색</button>
		</div>
		<br>
		<table class = "table" id="storeTable">
			<thead>
				<tr class="tableth">
					<th>매장명</th>
					<th>ID</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>전화번호</th>
					<th>배달</th>
					<th>적립금</th>
					<th>오픈시간</th>
					<th>마감시간</th>
				</tr>
			</thead>
			<tbody id=storelist>
			</tbody>

		</table>
		<div style="text-align: right">
			<button class="btn btn-secondary" onclick="location.href='adminMainForm.do'">돌아가기</button>
		</div>
	</div>
</body>
</html>