<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>

<title>Store Registration Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" href="./css/orderlist.css" >
 <style type="text/css">
 table tbody tr td,
.table td{
	text-align: left;
 
} 
 
 </style>
<script type="text/javascript">

var idCheck = 0;
var id = $('#sid').val();
$(function(){
	$("#idCheck").click(function() {
		$.ajax({
			url:"getstorejoin/"+$('#sid').val(),
			type : "POST",
			datatype: "json",
			data: {sid:id},
			success: function(data){
				if(data.cnt == 0){
					alert("사용 가능한 아이디입니다.");
					$("#submitt").removeAttr("disabled");
				}else{
					alert("사용 중인 아이디입니다.");
				}
			}
		})
	})
});

function checkForm(){
	
	form = document.storejoinForm;
	
	if (form.spw.value != form.spwcheck.value) {
		alert("비밀번호가 서로 다릅니다. 다시 입력해주세요.");
		//event.stopPropagation();
		form.spwcheck.focus();
		return false;
	} else {
		
		if (form.sid.value == "") {
			alert("아이디를 입력하세요.");
			return form.sid.focus();
		}
		if (form.sname.value == "") {
			alert("매장상호를 입력하세요.");
			return form.sname.focus();
		}
		if (form.spw.value == "") {
			alert("비밀번호를 입력하세요.");
			return form.spw.focus();
		}
		if (form.stel.value == "") {
			alert("연락처를 입력하세요.");
			return form.stel.focus();
		}
		if (form.sadd.value == "") {
			alert("주소를 입력하세요.");
			return form.sadd.focus();
		}
		form.submit();
		
	}
	
	
}
function post_check(){
	//비밀번호 유효성체크를 하는 부분, maxlength="16"
	var UserPassword = document.customerjoinForm.cPw;
	  if(UserPassword.value.length<8) {
	    alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
	    return false;
	  }
	  
	  if(!UserPassword.value.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])|([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
	      alert("비밀번호는 영문(대소문자구분),숫자,특수문자(~!@#$%^&*()-_? 만 허용)를 혼용하여 8~16자를 입력해주세요.");
	    return false;
	  }
	 
	  return true;
};

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
 <div class = "container" align="center">
  <form name = "storejoinForm" action = "storejoin.do" method = "post">
	<hr>
    <p align="center" class="titlefont">매장 가입</p>
	<hr>
      <table class = "table ">
        <tr>
          <th class="tableth">ID</th>
          <td><input type = "text" id="sid" name = "sid">
          <button type = "button" class="btn btn-default btn-primary" id="idCheck">중복확인</button>
          </td>
        </tr>
        <tr>
          <th class="tableth">매장상호</th>
          <td><input type = "text" id="sid" name = "sname"></td>
        </tr>
        <tr>
          
          <th class="tableth">비밀번호</th>
          <td><input type = "password" id="spw" name = "spw"></td>
        </tr>
        <tr>
          <th class="tableth">비밀번호 확인</th>
          <td><input type = "password" id="spwcheck" name = "spwcheck"></td>
        </tr>
        <tr>
          <th class="tableth">매장연락처</th>
          <td><input type = "tel" id="stel" name = "stel"></td>
        </tr>
        <tr>
          <th class="tableth">매장주소</th> 
          <td><input type = "text" id="sadd2" name = "sadd2" placeholder="우편번호">
          <button type = "button" class="btn btn-default btn-primary" onclick="execPostCode()">우편번호 찾기</button><br>
          		<input type = "text" id="sadd" name = "sadd" placeholder="주소">
          		<input type = "text" id="sadd3" name = "sadd3" placeholder="상세주소"></td>
        </tr>
        <tr>
          <th class="tableth">영업시간</th>
          <td>
            <input type = "time" id="stopentime" name = "stopentime" > ~ 
            <input type = "time" id="stopentime" name = "stclosetime"><br>
            <font color = "gray" id="sid" size = "2pt">* 영업시간은 1시간 단위로 설정이 가능합니다.</font>
          </td>
        </tr>
        <tr>
          <th class="tableth">배달유무</th>
          <td>
            <input type = "radio"  id="sid" name= "stdeliservice" value="Y">배달 가능
            <input type = "radio"  id="sid" name= "stdeliservice" value="N" checked> 배달 불가능
          </td>
        </tr>
        <tr>
          <th class="tableth">적립금 사용 여부</th>
          <td>
            <input type = "radio" name ="stmileservice" id= "stmileservice_y" value="Y" >적립 가능
            <input type = "radio" name ="stmileservice" id= "stmileservice_n" value="N" checked> 적립 불가능
          </td>
        </tr>
      </table>
      <button type = "button"  class="btn btn-default btn-success" id="submitt" onclick="checkForm()" disabled="disabled">가입하기</button>
      <a class="btn btn-secondary"  href="javascript:history.go(-1)">돌아가기</a>
  </form>
  </div>
</body>
</html>