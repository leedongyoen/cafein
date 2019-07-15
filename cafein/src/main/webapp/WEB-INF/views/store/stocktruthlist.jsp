<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실수량 확인</title>
<script>
	
	// 취소 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#truthbackbtn').on("click",function(){
		$('.truthQty').val('');
	})
	
	// 저장 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#truthsavebtn').on("click",function(){
		
		if(!$('.truthQty')) {
			alert('수량을 모두 입력해주세요.');
			return;
		}
		
		console.log('value : '+$('.truthQty').val() + ', text : ' +$('.truthQty').text() + ', length : ' + $('.truthQty').length )
		
		
		$('#stocktruthlistSave').text('수정 완료');
		$('#truthbackbtn').attr('disabled',true);
		$('.truthQty').attr('readonly',true);
	})
	
	// 수정 버튼 클릭 시 실행 ------------------------------------------------------------------------------
	$('#trutheditbtn').on("click",function(){
		$('#stocktruthlistSave').text('수정 전');
		$('#truthbackbtn').attr('disabled',false);
		$('.truthQty').attr('readonly',false);
	})
</script>
</head>
<body>
	<h3 align="center">실수량 확인</h3>
	<br>
	<div class="container" align="center">
		<table class="table table-hover" id="stocktruthlistTable">
			<thead>
			<tr>
				<th>순번</th>
				<th>재고 명</th>
				<th>수량</th>
				<th>실 수량</th>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<div class="container" align="right">
		<button id="truthbackbtn">취소</button>
		<button id="truthsavebtn">저장</button>
		<button id="trutheditbtn">수정</button>
	</div>
</body>
</html>