<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Login Page</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

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
		if(form.cId.value == ""){
			alert("아이디를 입력해 주세요.");
			form.cId.focus();
			return;
		} else if(form.cPw.value == ""){
			alert("비밀번호를 입력해 주세요.");
			form.cPw.focus();
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
						고객 로그인
					</span>
				</div>

				<form class="login100-form validate-form" name = "loginForm" action="${pageContext.request.contextPath}/customerloginresult.do">
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">아이디</span>
						<input class="input100" type="text" name = "cId" placeholder="Enter user id">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">비밀번호</span>
						<input class="input100" type="password" name = "cPw" placeholder="Enter password">
						<span class="focus-input100"></span>
					</div>
					
					<div class="container-login100-form-btn">
						<input type = "button" class="btn btn-outline-success btn-lg" onclick = "checkForm()" value = "로그인" style="width:130px">&nbsp;
						<input type = "button" class="btn btn-outline-info btn-lg" onclick = "location.href='${pageContext.request.contextPath}/customerjoinForm.do'" value = "회원가입" style="width:130px">
						
						<div>
						
							<a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=ae2e6275133a2bf25fe30fba002ced8d&redirect_uri=http://localhost/cafein/kakaologin&response_type=code">
					      		<img  src="${pageContext.request.contextPath}/image/kakaologin.png">
					     	</a>
					      	<a id="naver-login-btn" href="http://localhost/cafein/naverlogin.do"><img src="${pageContext.request.contextPath}/image/naverlogin.PNG" style="witdh:222px;height:50px;"></a>
					      
					      	<!-- 카카오로 로그인 시 이 로그아웃 버큰 사용하기 <a href="#"><img src="${pageContext.request.contextPath}/image/naverlogin.PNG" style = "width:222px;hieth:50px;"></a>-->
						  	<a href="http://developers.kakao.com/logout"></a>
							
						</div>
					  	<input type = "button" class="btn btn-outline-info btn-lg" onclick = "location.href='${pageContext.request.contextPath}/customerfindidpw.do'" value = "ID/PW 찾기" style="width:130px"> 
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
  
<!-- 
<script type="text/javascript">
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "e0oMK_3hMZCOPonx0Tz1",
			callbackUrl: "http://localhost/cafein/naverloginresult.do",
			isPopup: false, /* 팝업을 통한 연동처리 여부 */
			loginButton: {color: "green", type: 3, height: 60} /* 로그인 버튼의 타입을 지정 */
		}
	);
	
	/* 설정정보를 초기화하고 연동을 준비 */
	naverLogin.init();
	
</script>
 -->
</body>
</html>