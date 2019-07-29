<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Store Information Edit Page</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

 <META NAME="Generator" CONTENT="EditPlus">
<META NAME="Author" CONTENT="">
<META NAME="Keywords" CONTENT="">
<META NAME="Description" CONTENT="">
 <style type="text/css">
 table tbody tr td,
.table td{
	text-align: left;
 
} 
 
 </style>
<script>
//최소길이 & 최대길이 제한
var minimum = 8;
var maximun = 12;
var sid = "<%=(String)session.getAttribute("sId")%>";
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
	
	
	
	
	
	///////////////////////////////////////
	var current_pw;
	function openModeal(){
		$("#checkpw").modal('show');
	}
	
function checkpwbtn(){
		if(current_pw == $("#s_pw").val()  ){
			if($("#new_pw").val() == $("#newck_pw").val()){
				$.ajax({
					url : 'storepw/'+ sid,
					type : 'PUT',
					contentType : 'application/json;charrset=utf-8',
					dataType : 'json',
					data : JSON.stringify($("#ckckpw").serializeObject()),
					success : function(data) {
						alert("비밀번호가 변경되었습니다.")
						$("#s_pw").val('');
						$("#new_pw").val('');
						$("#newck_pw").val('');
						$("#checkpw").modal('hide');
						readstoreinfo();
					}
				});
			}
		} else {
			alert("비밀번호가 다릅니다. 다시입력해주세요.")
			$("#s_pw").val('');
			$("#new_pw").val('');
			$("#newck_pw").val('');
		}
	}


	$(function(){
		readstoreinfo();
	});
	
	function readstoreinfo(){
		
		$.ajax({
        	url : 'storeinfo/' + sid,
        	type : 'GET',
        	dataType : 'json',
        	error : function(xhr, status, msg){
        		alert("상태값 : " + status + "Http에러메시지 : " + msg);
        	},
        	success : function(data){ 
        		console.log(data);
        		$('input:text[name="sid"]').val(data.sid);
//         		$('input:text[name="spw"]').val(data.spw);
				current_pw=data.spw;
        		$('input:text[name="sname"]').val(data.sname);
        		$("#stel").val(data.stel);
        		$('input:text[name="sadd"]').val(data.sadd);
        		$('input:text[name="sadd2"]').val(data.sadd2);
        		$('input:text[name="sadd3"]').val(data.sadd3);
        		$("#stopentime").val(data.stopentime);
        		$("#stclosetime").val(data.stclosetime);
    /*     		$("#stdeliservice").val(data.stdeliservice); */
        		if(data.stdeliservice == 'Y'){
        			$("#stdeliservice_y").attr("checked","checked");
        		}
        		$("#stmileservice").val(data.stmileservice);
        		if(data.stmileservice == 'Y'){
        			$("#savings_service_y").attr("checked","checked");
        			
        		}
        		
        		
        	}
        });
	}

	
	function edit() {
		

		$("#edit_after").css('display', 'inline');
        $("#edit_before").css('display', 'none');
        $("#s_infoedit").css('display', 'inline');
        $("#s_info").css('display', 'none');
//         $("#sname").removeAttr("readonly");
//         $("#spw").removeAttr("readonly");
        $("#stel").removeAttr("readonly");
        $("#pwbt").removeAttr("disabled");
        $("#sadd").removeAttr("readonly");
        $("#sadd2").removeAttr("readonly");
        $("#sadd3").removeAttr("readonly");
        $("#stopentime").removeAttr("readonly");
        $("#stclosetime").removeAttr("readonly");
        $("#addbt").removeAttr("disabled");
        $("#stdeliservice_y").removeAttr("disabled");
        $("#stdeliservice_n").removeAttr("disabled");
//         $("#savings_service_y").removeAttr("disabled");
//         $("#savings_service_n").removeAttr("disabled");
		
		alert("수정이 가능합니다.");

		
	}
	
	function editok() {
		
		$.ajax({
			url : 'storeinfo',
			type : 'PUT',
			contentType : 'application/json;charrset=utf-8',
			dataType : 'json',
			data : JSON.stringify($("#storeinfoForm").serializeObject()),
			success : function(data) {
				alert("수정완료되었습니다.")
				

			}
		});
		
		
		$("#edit_after").css('display', 'none');
        $("#edit_before").css('display', 'inline');
        $("#s_infoedit").css('display', 'none');
        $("#s_info").css('display', 'inline');
        $("#sname").attr("readonly",true);
        $("#spw").attr("readonly",true);
        $("#stel").attr("readonly",true);
        $("#pwbt").attr("disabled","disabled");
        $("#sadd").attr("readonly",true);
        $("#sadd2").attr("readonly",true);
        $("#sadd3").attr("readonly",true);
        $("#addbt").attr("disabled","disabled");
        $("#stopentime").attr("readonly",true);
        $("#stclosetime").attr("readonly",true);
        $("#stdeliservice_y").attr("disabled",true);
        $("#stdeliservice_n").attr("disabled",true);
        $("#savings_service_y").attr("disabled",true);
        $("#savings_service_n").attr("disabled",true);
        
        readstoreinfo();
        
	}
	
	//다음 API 주소를 넣는 부분.
	function execPostCode() {
	     new daum.Postcode({
	         oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있고, 공동주택일 경우 추가한다.
	            if(data.buildingName !== '' && data.apartment === 'Y'){
	               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            console.log(data.zonecode);
	            console.log(fullRoadAddr);
	            
	            
	      //      $("[name=addr1]").val(data.zonecode);
	      //     $("[name=addr2]").val(fullRoadAddr);
	            
	            document.getElementById('sadd2').value = data.zonecode; //5자리 새우편번호 사용
	            document.getElementById('sadd').value = fullRoadAddr;
	        //    document.getElementById('cAdd3').value = data.jibunAddress; 
	        }
	     }).open();
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
								<th><input type="password" id="s_pw">
							</tr>
							<tr>
								<th>새 비밀번호</th>
								<th><input type="password" id="new_pw" name="spw" onKeyUp="javascript:chkPw(this, 'chkPwView');">
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
						class="btn btn-default" disabled="disabled">변경하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



<div class = "container" align="center">
	<hr>
	<p id = "s_info" align="center" class="titlefont">매장 정보</p>
	<p id = "s_infoedit" style=" display:none " align="center" class="titlefont">매장 정보 수정</p>
	<hr>
  <form id = "storeinfoForm" method = "post">
      <table class = "table">
        <tr>
          <th class="tableth">ID</th>
          <td><input type = "text" name = "sid" readonly></td>
        </tr>
        <tr>
          <th class="tableth">매장상호</th>
          <td><input type = "text" name = "sname" id = "sname" readonly></td>
        </tr>
        <tr>
          <th class="tableth">비밀번호</th>
          <td>
<!--           <input type = "text" name = "spw" id = "spw" readonly> -->
          		<button type="button" id="pwbt" onclick="openModeal()" class="btn btn-default btn-primary" disabled> 비밀번호 변경하기 </button>
          </td>
        </tr>
        <tr>
          <th class="tableth">매장연락처</th>
          <td><input type = "tel" name = "stel" id = "stel" readonly></td>
        </tr>
        <tr>
          <th class="tableth">매장주소</th>
        <td><input type = "text" id="sadd2" name = "sadd2" placeholder="우편번호" readonly>
          <button type = "button" id="addbt" class="btn btn-default btn-primary" onclick="execPostCode()" disabled>우편번호 찾기</button><br>
          		<input type = "text" id="sadd" name = "sadd" placeholder="주소" readonly>
          		<input type = "text" id="sadd3" name = "sadd3" placeholder="상세주소" readonly></td>
        </tr>
        <tr>
          <th class="tableth">영업시간</th>
          <td>
            <input type = "time" name = "stopentime" id = "stopentime"  readonly> ~ 
            <input type = "time" name = "stclosetime" id = "stclosetime" readonly><br>
            <font color = "gray" size = "2pt">* 영업시간은 1시간 단위로 설정이 가능합니다.</font>
          </td>
        </tr>
        <tr>
          <th class="tableth">배달유무</th>
          <td>
            <input type = "radio" name = "stdeliservice" id = "stdeliservice_y" value = 'Y' disabled>배달 가능
            <input type = "radio" name = "stdeliservice" id = "stdeliservice_n" value = 'N' checked="checked" disabled> 배달 불가능
          </td>
        </tr>
        <tr>
          <th class="tableth">적립금 사용 유무</th>
          <td>
            <input type = "radio" name = "stmileservice" id = "savings_service_y" value = 'Y' disabled>적립 가능
            <input type = "radio" name = "stmileservice" id = "savings_service_n" value = 'N' checked="checked" disabled>적립 불가능
          </td>
        </tr>
      </table>
      <a class="btn btn-secondary  pull-right"  href="javascript:history.go(-1)">돌아가기</a>
      <input type = "button" id = "edit_before"  class="btn btn-default btn-success" value = "수정하기" onclick = "edit()">
      <input style=" display:none " type = "button" class="btn btn-default" id = "edit_after" value = "수정완료" onclick = "editok()">
  </form>
  </div>
</body>
</html>