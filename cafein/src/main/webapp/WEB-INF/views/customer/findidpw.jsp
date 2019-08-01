<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Find ID/PASSWORD Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="loginresource/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginresource/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginresource/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginresource/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginresource/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="loginresource/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginresource/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginresource/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="loginresource/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="loginresource/css/util.css">
	<link rel="stylesheet" type="text/css" href="loginresource/css/main.css">
<!--===============================================================================================-->
<style>

body {
	
	padding-top: 0px;
	padding-bottom: 0px;
}

.container-login100 {
  width: 100%;
  min-height: 100vh;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  align-items: center;
  padding: 15px;
  background: #F6E3CE;
}
</style>

	<script type="text/javascript">
		
// 		var cName = $('#cName').val();
// 		var cTel = $('#cTel').val();
// 		var cId = $('#cId').val();
		
		
		function idfine() {
			var form = document.idfindform;
			if(form.cName.value ==""){
				alert("이름을 입력해주세요.");
				return form.cName.focus();
			}
			if (form.cTel.value == "") {
				alert("연락처를 입력해주세요.");
				return form.cTel.focus();
			}
				alert("메일로 아이디를 발송했습니다.")	
				form.submit();		
			
				
			}
				
		function pwfine(){		
			var form = document.pwfindform;
			if(form.cId.value ==""){
				alert("ID를 입력해주세요.");
				return form.cId.focus();
			}
		
			if (form.cTel.value == "") {
				alert("연락처를 입력해주세요.");
				return form.cTel.focus();
			} 
				alert("메일로 비밀번호가 전송되었습니다.");
				form.submit();		
				
		}
	</script>
</head>
<body>
<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(image/loginbgimg.jpg);">
					<span class="login100-form-title-1">
						ID 찾기
					</span>
				</div>
			  	 <form class="login100-form validate-form" method ="post" action="idfind.do" name="idfindform">
						<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
											<span class="label-input100">이름</span>
											<input class="input100" type="text" id="cName" name = "cName" placeholder="Enter user name">
											<span class="focus-input100"></span>
						</div>
			
						<div class="wrap-input100 validate-input m-b-18" >
									<span class="label-input100">연락처</span>
									<input class="input100" type="text" name = "cTel" id="cTel" placeholder="Enter tel">
									<span class="focus-input100"></span>
						</div>
						<div style="align-content: center;">
							<button type ="button" class="btn btn-outline-success btn-lg" onclick="idfine()">아이디 찾기</button>
						</div>
				</form>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(image/loginbgimg.jpg);">
					<span class="login100-form-title-1">
						Password 찾기
					</span>
				</div>
				<form class="login100-form validate-form" method ="post" action="pwfind.do" name="pwfindform">
				
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
								<span class="label-input100">아이디</span>
								<input class="input100" type="text" name = "cId" id="cId" placeholder="Enter user id">
								<span class="focus-input100"></span>
					</div>
				
					<div class="wrap-input100 validate-input m-b-18" >
								<span class="label-input100">연락처</span>
								<input class="input100" type="text" name = "cTel" id="cTel" placeholder="Enter tel">
								<span class="focus-input100"></span>
					</div>
					
					<button class="btn btn-outline-success btn-lg" type ="button" onclick = "pwfine()">비밀번호 찾기</button>
					
				</form>

			</div>
		</div>
	
	  
  
</div>



<!-- 
<div class = "container" align="center">
<div class="titlefont" align="center">ID/PW 찾기</div><hr>
  	 <form method ="post" action="idfind.do" name="idfindform">
      	<table class = "table" >
      	  <tr class="trth">
      	    <th colspan = "2">아이디 찾기</th>
      	  </tr>
      	  <tr>
      	    <th >이름</th>
      	    <td><input type = "text" name = "cName" id="cName" ></td>
      	  </tr>
      	  <tr>
      	    <th>연락처</th>
      	    <td><input type = "text" name = "cTel" id="cTel"></td>
      	  </tr>
      	  <tr>
      	    <th colspan = "2">
      	    <button type ="button" class="btn btn-default"
      	    	onclick="idfine()">아이디 찾기</button></th>
      	  </tr>
      	</table>
      </form>
      
      <form method = "post" action="pwfind.do" name="pwfindform">
        <table class = "table">
      	  <tr>
      	    <th colspan = "2">비밀번호 찾기</th>
      	  </tr>
      	  <tr>
      	    <th>ID</th>
      	    <td><input type = "text" name = "cId" id="cId"></td>
      	  </tr>
      	  <tr>
      	    <th>연락처</th>
      	    <td><input type = "text" name = "cTel" id="cTel"></td>
      	  </tr>
      	  <tr>
      	    <th colspan = "2">
      	    <button class="btn btn-default " type ="button"
      	     onclick = "pwfine()">비밀번호 찾기</button></th>
      	  </tr>
      	</table>
      </form>
   <input type = "button" class="btn btn-default " onclick = "javascript:history.go(-1)" value = "돌아가기">
  
  
</div> -->



  <!--===============================================================================================-->
	<script src="loginresource/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="loginresource/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="loginresource/vendor/bootstrap/js/popper.js"></script>
	<script src="loginresource/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="loginresource/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="loginresource/vendor/daterangepicker/moment.min.js"></script>
	<script src="loginresource/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="loginresource/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="loginresource/js/main.js"></script>
</body>
</html>