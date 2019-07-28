<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
	<title>Store Login Page</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
<script>
		
		function checkForm() {
			var form = document.loginForm;
			if(form.sid.value == ""){
				alert("아이디를 입력해 주세요.");
				form.sid.focus();
				return;
			} else if(form.spw.value == ""){
				alert("비밀번호를 입력해 주세요.");
				form.spw.focus();
				return;
			}
			
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
						매장 로그인
					</span>
				</div>

				<form class="login100-form validate-form" name = "loginForm" action="${pageContext.request.contextPath}/storeloginresult.do">
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">아이디</span>
						<input class="input100" type="text" name="sid" placeholder="Enter user id">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">비밀번호</span>
						<input class="input100" type="password" name="spw" placeholder="Enter password">
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<input type = "button" class="btn btn-outline-success btn-lg" onclick = "checkForm()" value = "로그인" style="width:130px">&nbsp;
						<input type = "button" class="btn btn-outline-info btn-lg" onclick = "location.href='${pageContext.request.contextPath}/storejoin.do'" value = "회원가입" style="width:130px">
					</div>
				</form>
			</div>
		</div>
	</div>
	
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