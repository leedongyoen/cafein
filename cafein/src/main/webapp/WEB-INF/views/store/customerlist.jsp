<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp"%>

<title>우리 매장 고객 조회</title>

<script>



	$(function(){
		customerList();
	});
	
	
	
	function customerList(){
		var storelogin = '<%= session.getAttribute("sid") %>';
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
	
	function customerListResult(data){
		$("#customerTbody").empty();
		console.log(data);
		$.each(data,function(idx, user){
				$('<tr>')
						.append($('<td>').html(user.cId))
						.append($('<td>').html(user.cNick))
						.append($('<td>').html(user.cName))
						.append($('<td>').html(user.cTel))
						.append($('<td>').html(user.mileage))
						.append($('<td>').html('<button type=\'button\' class=\'btn btn-primary\' data-toggle=\'modal\' data-target=\'#modalView\' class=\'btn btn-primary\' id=\'btnSelect\' onclick=\'modalSelect();\'>조회</button>'))
						.append($('<td>').val(user.cId))
						.appendTo('#customerTbody');
					
		});
					
	}
	


</script>



</head>
<body>
	<div class="container">
		<h2 align="center">우리 매장 고객 조회</h2>
		<hr>
	</div>
	<div class="container" align="center">
	

			<div align="right">
				날짜 입력: <input type="date" id="userdate" name="userdate" value="">~
				<input type="date" id="userdate" name="userdate" value=""> <input
					type="submit" value="조회">
			</div>

	


	

			<table class="table table-hover">

				<thead>
					<tr>
						<th>고객ID</th>
						<th>닉네임</th>
						<th>이름</th>
						<th>연락처</th>
						<th>마일리지</th>

					</tr>
				</thead>
				<tbody id="customerTbody">
				</tbody>
			</table>

	
	</div>

</body>
</html>