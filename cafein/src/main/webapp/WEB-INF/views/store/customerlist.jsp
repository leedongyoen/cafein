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
		$('#modalView').modal("hide"); //닫기
		$("#customerTbody").empty();
		console.log(data);
		$.each(data,function(idx, user){
				$('<tr>')
						.append($('<td>').html(user.cId))
						.append($('<td>').html(user.cNick))
						.append($('<td>').html(user.cName))
						.append($('<td>').html(user.cTel))
						.append($('<td>').html(user.mileage))
						.append($('<td>').html('<button type=\'button\' class=\'btn btn-primary\' data-toggle=\'modal\' data-target=\'#modalView\' class=\'btn btn-primary\' name=\'Selectbtn\' onclick=\'modalshow("'+user.cId+'");\'>조회</button>'))
						.append($('<td>').html('<button type=\'button\' class=\'btn btn-primary\' data-toggle=\'modal\' data-target=\'#modalView\' class=\'btn btn-primary\' name=\'orderlistbtn\' onclick=\'modalordershow("'+user.cId+'");\'>구매이력</button>'))
						.append($('<td>').val(user.cId))
						.appendTo('#customerTbody');
					
		});
					
	}
	function modalshow(cId){
		$('#modalView').modal('show');
		console.log(cId);
		$.ajax({
			url : 'customer/' + cId ,
			type : 'GET',
			contentType : 'application/json;charset=utf-8',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : customerSelectResult
		});
	}
	

	function customerSelectResult(data) {

		$('input:text[name="cId" ]').val(data.cId);
		$('input:text[name="cNick"]').val(data.cNick);
		$('input:text[name="cName"]').val(data.cName);
		$('input:text[name="cTel"]').val(data.cTel);
		$('input:text[name="cAdd"]').val(data.cAdd);
		$('input:text[name="cJoin"]').val(data.cJoin);
	}//stockSelectResult
	
	
	
	
	


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
						<th>고객조회</th>
						<th>이력</th>

					</tr>
				</thead>
				<tbody id="customerTbody">
				</tbody>
			</table>

	
	</div>
	
	<!-- Modal -->
<div class="modal fade" id="modalView" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">조회</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       	<div class="col-12">
	       	<form id="form1" class="form-horizontal">
				<div class="form-group">
					<label>ID</label> 
					<input type="text" class="form-control" name="cId" readonly>
				</div>
				<div class="form-group">
					<label>NICKNAME</label> 
					<input type="text" class="form-control" name="cNick" readonly>
				</div>
				<div class="form-group">
					<label>이름</label> 
					<input type="text" class="form-control" name="cName" readonly>
				</div>
				<div class="form-group">
					<label>번호</label> 
					<input type="text" class="form-control" name="cTel" readonly>
				</div>
				<div class="form-group">
					<label>주소</label> 
					<input type="text" class="form-control" name="cAdd" readonly>
				</div>
				<div class="form-group">
					<label>로그인방식</label> 
					<input type="text" class="form-control" name="cJoin" readonly>
				</div>
	
				<div class="btn-group">
				</div>
			</form>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>