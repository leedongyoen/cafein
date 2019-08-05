<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Customer Join Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style type="text/css">

table tbody tr td,
.table td{
	text-align: left;
 
}
input[type=password]{
font-family: "";
}
</style>
<script type="text/javascript">
	
	var idCheck = 0;
	var id = $('#cId').val();
	$(function(){
		$("#idCheck").click(function() {
			$.ajax({
				url:"getcustomerjoin/"+$('#cId').val(),
				type : "POST",
				datatype: "json",
				data: {cId:id},
				success: function(data){
					if(data.cnt == 0){
						alert("사용 가능한 아이디입니다.");
					}else{
						alert("사용 중인 아이디입니다.");
					}
				}
			})
		})
	});
		function checkForm() {
// 			var c_pw = $("#c_pw").val();
// 			var c_pw_check = $("#c_pw_check").val();
			$('#joins').attr("disabled",false);
			
			form = document.customerjoinForm;
			if (form.cId.value == "") {
				alert("아이디를 입력하세요.");
				return form.cId.focus();
			}
			if (form.cNick.value == "") {
				alert("닉네임을 입력하세요.");
				return form.cNick.focus();
			}
			if (form.cPw.value == "") {
				alert("비밀번호를 입력하세요.");
				return form.cPw.focus();
			}
 			if (form.cPw.value != form.cPwcheck.value) {
				alert("비밀번호가 서로 다릅니다. 다시 입력해주세요.");
				form.cPwcheck.focus
				return false();
			} 
			if (form.cName.value == "") {
				alert("이름을 입력하세요.");
				return form.cName.focus();
			}
			if (form.cTel.value == "") {
				alert("연락처를 입력하세요.");
				return form.cTel.focus();
			}
			if (form.cAdd.value == "") {
				alert("주소를 입력하세요.");
				return form.cAdd.focus();
			}
			if (form.dob.value == "") {
				alert("생년월일을 입력하세요.");
				return form.dob.focus();
 			}	
			if (form.email.value == "") {
				alert("이메일을 입력하세요.");
				return form.email.focus();
 			}	
			if (form.pInput.value != "yes") {
				alert("이메일 인증을 하세요.");
				return;
 			} 			
				alert("회원가입을 축하합니다");
				form.submit();
 			
		};
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
			  alert("비밀번호 사용 가능합니다.")
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
     
	                document.getElementById('cAdd2').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('cAdd').value = fullRoadAddr;
	            }
	         }).open();
	     }

	//이메일을 보내는 스크립트.
	function myFunction() {
		  var form = document.customerjoinForm;
		  var screenW = screen.availWidth;  // 스크린 가로사이즈
		  var screenH = screen.availHeight; // 스크린 세로사이즈
		  var popW = 500; // 띄울창의 가로사이즈
		  var popH = 300; // 띄울창의 세로사이즈

		  var posL=( screenW-popW ) / 2;   
		  var posT=( screenH-popH ) / 2;   
		  
		 if(form.email.value =="")  {
			 alert("이메일을 입력해주세요.");
		 } else {
			 window.open('sendmail.do/'+form.email.value,'','width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +',resizable=no,scrollbars=no');

		 }
		//  var myWindow = window.open("sendmail.do", "", "width=600,height=200");
		}





	
</script>
</head>
<body>
 <div class="container" align="center">
 <div class="row">
    <div class="col-sm-12 text-center" >
   
  <form name = "customerjoinForm" action="customerjoin.do" method="post">
    <h3>회원가입</h3><br>
      <table class = "table table-hover">
        <tr>
          <th>ID</th>
          <td>
          <input type = "text" name = "cId" id="cId" class="form-control"></td>
          <td><button type = "button" class="btn btn-success" id="idCheck">중복확인</button>
          </td>
        </tr>
        <tr>
          <th>닉네임</th>
          <td><input type = "text" name="cNick" class="form-control"></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type ="password" name ="cPw" class="form-control"></td>   
          <td><button type="button" class="btn btn-success" onclick="post_check()">비밀번호 체크</button>
          </td>
        </tr>
    	<tr>
          <th>비밀번호 확인</th>
          <td><input type = "password" id = "cPwcheck" class="form-control"></td>
        </tr>
        <tr>
          <th>이름</th>
          <td><input type = "text" name="cName" id="cName" class="form-control"></td>
        </tr>
        <tr>
          <th>연락처</th>
          <td><input type = "tel" name = "cTel" id="cTel" class="form-control"></td>
        </tr>
        <tr>
          <th>주소</th>
          <td>
          <input type = "text" name="cAdd2" id = "cAdd2" placeholder="우편번호" class="form-control"><br>
          <input type = "text" name = "cAdd" id="cAdd" placeholder="주소" class="form-control">
          <input type = "text" name = "cAdd3" id="cAdd3" placeholder="상세주소" class="form-control">
          </td>
       	<td> <button type = "button" onclick="execPostCode()" class="btn btn-success">주소 검색</button></td>
        </tr>
        <tr>
          <th>생년월일</th>
          <td><input type = "text" name="dob" class="form-control"></td>
          <td>ex) 2019/01/01</td>
        </tr>
        <tr>
        	<th>이메일</th>
        	<td><input type="email" name="email" id="email" class="form-control"></td>
        	 <td><button type="button" name="emailauth" id="emailauth"
        		onclick="myFunction()" class="btn btn-success">이메일 인증</button>
        		<input type="hidden" id="pInput" name="pInput">
        	</td>
        </tr>
      </table>
      <button type ="button" class="btn btn-primary" id="joins"
      onclick="checkForm()" >가입하기</button>
      <input type="button"  class="btn btn-default"
       onclick="location.href='customerlogin.do'" value="돌아가기" class="btn btn-success">
  </form>
 
  </div>
  </div>
  </div>
</body>
</html>