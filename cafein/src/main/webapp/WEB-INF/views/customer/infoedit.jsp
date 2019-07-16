<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>

<title>Customer Information Edit Page</title>
<script src="./js/json.min.js"></script>

<META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">

<script>
//최소길이 & 최대길이 제한
var minimum = 8;
var maximun = 12;

var submitcheck = false;

function chkPw(obj, viewObj) {
	var paramVal = obj.value;	

	var msg = chkPwLength(obj);

	if(msg =="") {
		msg = "안전한 비밀번호 입니다.";
		$("#changepwbtn").removeAttr("disabled");
	}else{
		$("#changepwbtn").attr("disabled","disabled");
	}
	document.getElementById(viewObj).innerHTML=msg;
}

/* function changecheck(obj) {

	console.log("in");
	submitcheck = chkPwLength(obj); 
	if(submitcheck == "") submitcheck = true;
	console.log(submitcheck);
}
 */
// 글자 갯수 제한
function chkPwLength(paramObj) {

	var paramCnt = paramObj.value.length;

	if(paramCnt < minimum) {
		msg = "최소 암호 글자수는 <b>" + minimum + "</b> 입니다.";
		
	} else if(paramCnt > maximun) {
		msg = "최대 암호 글자수는 <b>" + maximun + "</b> 입니다.";
	
	} else {
		msg = chkPwNumber(paramObj);
		
	}
	return msg;
}

// 암호 유용성 검사
function chkPwNumber(paramObj) {
	var  msg = "";

	// 특수 문자 포함 이라면 주석을 바꿔 주시기 바랍니다.
	// if(!paramObj.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/))
	if(!paramObj.value.match(/([a-zA-Z0-9])|([a-zA-Z0-9])/)) {
		// msg = "비밀번호는 영어, 숫자, 특수문자의 조합으로 6~16자리로 입력해주세요.";
		msg = "비밀번호는 영어, 숫자의 조합으로 6~16자리로 입력해주세요.";
		
	} else {
		msg = chkPwContinuity(paramObj);
		
	}
	return msg;
}

// 암호 연속성 검사 및 동일 문자
function chkPwContinuity(paramObj) {
	var msg = "";
	var SamePass_0 = 0; //동일문자 카운트
	var SamePass_1_str = 0; //연속성(+) 카운드(문자)
	var SamePass_2_str = 0; //연속성(-) 카운드(문자)
	var SamePass_1_num = 0; //연속성(+) 카운드(숫자)
	var SamePass_2_num = 0; //연속성(-) 카운드(숫자)

	var chr_pass_0;
	var chr_pass_1;
	var chr_pass_2;
	
	for(var i=0; i < paramObj.value.length; i++) {
		chr_pass_0 = paramObj.value.charAt(i);
		chr_pass_1 = paramObj.value.charAt(i+1);

		//동일문자 카운트
		if(chr_pass_0 == chr_pass_1)
		{
			SamePass_0 = SamePass_0 + 1
		}


		chr_pass_2 = paramObj.value.charAt(i+2);
		
		if(chr_pass_0.charCodeAt(0) >= 48 && chr_pass_0.charCodeAt(0) <= 57) {
			//숫자
			//연속성(+) 카운드
			if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1)
			{
				SamePass_1_num = SamePass_1_num + 1
			}
			
			//연속성(-) 카운드
			if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1)
			{
				SamePass_2_num = SamePass_2_num + 1
			}
		} else {
			//문자
			//연속성(+) 카운드
			if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == 1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == 1)
			{
				SamePass_1_str = SamePass_1_str + 1
			}
			
			//연속성(-) 카운드
			if(chr_pass_0.charCodeAt(0) - chr_pass_1.charCodeAt(0) == -1 && chr_pass_1.charCodeAt(0) - chr_pass_2.charCodeAt(0) == -1)
			{
				SamePass_2_str = SamePass_2_str + 1
			}
		}
	}
	
	if(SamePass_0 > 1) {
		msg = "동일숫자 및 문자를 3번 이상 사용하면 비밀번호가 안전하지 못합니다.(ex : aaa, bbb, 111)";
		return msg;
	}

	if(SamePass_1_str > 1 || SamePass_2_str > 1 || SamePass_1_num > 1 || SamePass_2_num > 1)
	{
		msg = "연속된 문자열(123 또는 321, abc, cba 등)을\n 3자 이상 사용 할 수 없습니다.";
		return msg;
	}

	return msg;
}	





////////////////////////////////////////////////////////


	 
 	var current_pw;
	function openModeal(){
		$("#checkpw").modal('show');
	}
	
	$(function(){
		
		
		
		readcustomerinfo();
	});

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
		$("#dob").removeAttr("readonly");

	}

	function editok() {

		$.ajax({
			url : 'customerinfo',
			type : 'PUT',
			contentType : 'application/json;charrset=utf-8',
			dataType : 'json',
			data : JSON.stringify($("#customerinfoForm").serializeObject()),
			success : function(data) {
				alert("수정완료되었습니다.")

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
	
	function readcustomerinfo(){
		console.log('<%=(String) session.getAttribute("cJoin")%>');
		var v_cjoin = '<%=(String) session.getAttribute("cJoin")%>';
		$.ajax({
			url : 'customerinfo/',
			type : 'GET',
			dataType : 'json',
			data:{ cJoin: v_cjoin , cId:'<%=(String) session.getAttribute("cId")%>'},
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function(data) {
				console.log(data);
				$('input:text[name="cId"]').val(data.cId);
				$('input:text[name="cNick"]').val(data.cNick);
				//$('input:text[name="cPw"]').val (data.cPw);
				current_pw=data.cPw;
				$('input:text[name="cName"]').val(data.cName);
				//c_tel
				$("#c_tel").val(data.cTel);
				//$('input:tel[name="cTel"]').val(data.cTel);
				$('input:text[name="cAdd"]').val(data.cAdd);
				// 			console.log(data.dob)
				$("#dob").val(data.dob);
				console.log(data.cJoin);
				if(data.cJoin!="web"){
					$('.notweb').hide();
				}
			}
	
		});
	
		
	}

	
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
					url : 'customerpw/'+'<%=(String) session.getAttribute("cId")%>',
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
						readcustomerinfo();
					}
				});
				

			}

		} else {
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
								<th><input type="password" id="new_pw" name="cPw" onKeyUp="javascript:chkPw(this, 'chkPwView');">
								<br><span id="chkPwView"></span>
								</th>
							</tr>
							<tr>
								<th>새 비밀번호 확인</th>
								<th><input type="password" id="newck_pw" ></th>
							</tr>

						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" onclick="checkpwbtn()" id="changepwbtn"
						class="btn btn-default" disabled="disabled" >변경하기</button>
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
				<tr class="notweb">
					<th>ID</th>
					<td><input type="text" name="cId" readonly></td>
				</tr>
				<tr class="notweb">
					<th>닉네임</th>
					<td><input type="text" id="c_nick" name="cNick" readonly></td>
				</tr>
				<tr class="notweb">
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
			<a class="btn btn-default  pull-right"
				href="javascript:history.go(-1)">돌아가기</a> <input type="button"
				class="btn btn-default" id="edit_before" value="수정하기"
				onclick="edit()"> <input style="display: none" type="button"
				class="btn btn-default" id="edit_after" value="수정완료"
				onclick="editok()">
		</form>
	</div>

</body>
</html>