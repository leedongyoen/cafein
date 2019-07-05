<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>

<title>Customer Information Edit Page</title>
<script src="./js/json.min.js"></script>

<script>
 	var current_pw;
	function openModeal(){
		$("#checkpw").modal('show');
	}

	
	
	

	function edit() {
		$("#edit_after").css('display', 'inline');
		$("#edit_before").css('display', 'none');
		$("#c_infoedit").css('display', 'inline');
		$("#c_info").css('display', 'none');
		$("#c_nick").removeAttr("readonly");
		$("#c_pw").removeAttr("readonly");
		$("#c_name").removeAttr("readonly");
		$("#c_tel").removeAttr("readonly");
		$("#c_add").removeAttr("readonly");
		$("#date").removeAttr("readonly");

	}

	function editok() {

		$.ajax({
			url : 'customerinfo',
			type : 'PUT',
			contentType : 'application/json;charrset=utf-8',
			dataType : 'json',
			data : JSON.stringify($("#customerinfoForm").serializeObject()),
			success : function(data) {
				alert("수정완료되었습니다. ㅎㅎㅎㅎ")

			}
		});

		$("#edit_after").css('display', 'none');
		$("#edit_before").css('display', 'inline');
		$("#c_infoedit").css('display', 'none');
		$("#c_info").css('display', 'inline');
		$("#c_nick").attr("readonly", true);
		// 		$("#c_pw").attr("readonly", true);
		$("#c_name").attr("readonly", true);
		$("#c_tel").attr("readonly", true);
		$("#c_add").attr("readonly", true);
		$("#dob").attr("readonly", true);

	}

	$.ajax({
		url : 'customerinfo/' + '<%=(String)session.getAttribute("cId")%>',
		type : 'GET',
		dataType : 'json',
		error : function(xhr, status, msg) {
			alert("상태값 :" + status + " Http에러메시지 :" + msg);
		},
		success : function(data) {
			$('input:text[name="cId"]').val(data.cId);
			$('input:text[name="cNick"]').val(data.cNick);
			//$('input:text[name="cPw"]').val(data.cPw);
			current_pw=data.cPw;
			$('input:text[name="cName"]').val(data.cName);
			//c_tel
			$("#c_tel").val(data.cTel);
			//$('input:tel[name="cTel"]').val(data.cTel);
			$('input:text[name="cAdd"]').val(data.cAdd);
			// 			conso le.log(data.dob)
			$("#dob").val(data.dob.substring(0, 10));
		}

	});
	
	
	function checkpwbtn(){
		
		/* 현재 비밀번호가 진짜맞는지 
				맞으면 새 비밀번호끼리 맞는지 확인 후
					같다면 update
					다르면 alert로 다르다고 알리기
				다르면 alert로 현재비밀번호 틀렸다고 알리기
		*/
		
		if(current_pw == $("#c_pw").val()  ){
// 			console.log("==");
			if($("#new_pw").val() == $("#newck_pw").val()){
				$.ajax({
					url : 'customerpw/'+'<%=(String)session.getAttribute("cId")%>',
					type : 'PUT',
					contentType : 'application/json;charrset=utf-8',
					dataType : 'json',
					data : JSON.stringify($("#ckckpw").serializeObject()),
					success : function(data) {
						alert("비밀번호가 변경되었습니다.")
						$("#c_pw").val('');
						$("#new_pw").val('');
						$("#newck_pw").val('');
						$("#checkpw").modal('hide');
						

					}
				});
				 
			}
			
		}else{
			alert("비밀번호가 다릅니다. 다시입력해주세요.")
			$("#c_pw").val('');
			$("#new_pw").val('');
			$("#newck_pw").val('');
		}
		
		
	}
</script>
</head>
<body>

	<!-- 비밀번호 변경을 위한 모다르창 -->
	<div class="modal fade" id="checkpw" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">비밀번호 변경하기</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-borizontal" id="ckckpw" action="#" method="post">
						
						<table class="table">
							
							<tr>
								<th>현재 비밀번호</th>
								<th><input type="password" id="c_pw">
							</tr>
							<tr>
								<th>새 비밀번호</th>
								<th><input type="password" id="new_pw" name="cPw">
							</tr>
							<tr>
								<th>새 비밀번호 확인</th>
								<th><input type="password" id="newck_pw">
							</tr>
								
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" onclick="checkpwbtn()" class="btn btn-default">변경하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



	<div class="container" align="center">
		<!-- 수정완료 버튼에 .do 보내기 -->
		<form name="customerinfoForm" id="customerinfoForm"
			action="${pageContext.request.contextPath}/infoedit.do" method="post">
			<h3 id="c_info">회원 정보</h3>

			<h3 id="c_infoedit" style="display: none">회원 정보 수정</h3>
			<table class="table">
				<tr>
					<th>ID</th>
					<td><input type="text" name="cId" readonly></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" id="c_nick" name="cNick" readonly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<!-- 					<input type="text" id="c_pw" name="cPw" readonly> -->
						<button type="button" onclick="openModeal()">비밀번호 변경하기</button>

					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" id="c_name" name="cName" readonly></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="tel" id="c_tel" name="cTel" readonly></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="c_add" name="cAdd" readonly></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" id="dob" name="dob" readonly></td>
				</tr>
			</table>
			<a class="btn btn-default  pull-right" href="javascript:history.go(-1)">돌아가기</a> 
			<input type="button" class="btn btn-default" id="edit_before" value="수정하기" onclick="edit()"> <input style="display: none" type="button"
			class="btn btn-default" id="edit_after" value="수정완료"
			onclick="editok()">
		</form>
	</div>

</body>
</html>