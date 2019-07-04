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
			url:'customerinfo',
			type:'PUT',
			contentType:'application/json;charrset=utf-8',
			dataType:'json',
			data :JSON.stringify($("#customerinfoForm").serializeObject()),
			success: function(data){
				alter("수정완료되었습니다. ㅎㅎㅎㅎ")
				
			}
		});
		
		$("#edit_after").css('display', 'none');
		$("#edit_before").css('display', 'inline');
		$("#c_infoedit").css('display', 'none');
		$("#c_info").css('display', 'inline');
		$("#c_nick").attr("readonly", true);
		$("#c_pw").attr("readonly", true);
		$("#c_name").attr("readonly", true);
		$("#c_tel").attr("readonly", true);
		$("#c_add").attr("readonly", true);
		$("#dob").attr("readonly", true);
		
		
	}
	
	$.ajax({
		url:'customerinfo/'+'ju123',
		type:'GET',
		dataType:'json',
		error:function(xhr,status,msg){
			alert("상태값 :" + status + " Http에러메시지 :"+msg);
		},
		success : function(data){
			$('input:text[name="cId"]').val(data.cId);
			$('input:text[name="cNick"]').val(data.cNick);
// 			$('input:text[name="cPw"]').val(data.cPw);
			$('input:text[name="cName"]').val(data.cName);
			//c_tel
			$("#c_tel").val(data.cTel);
			//$('input:tel[name="cTel"]').val(data.cTel);
			$('input:text[name="cAdd"]').val(data.cAdd);
// 			conso le.log(data.dob)
			$("#dob").val(data.dob.substring(0,10));
		}
		
	});
	
</script>
</head>
<body>


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
					<td><input type="text" id="c_pw" name="cPw" readonly></td>
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
			<a class="btn btn-default  pull-right"
				href="javascript:history.go(-1)">돌아가기</a> <input type="button"
				class="btn btn-default" id="edit_before" value="수정하기" onclick="edit()"> <input style="display: none" type="button"
				class="btn btn-default" id="edit_after" value="수정완료" onclick="editok()">
		</form>
	</div>

</body>
</html>