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
  <div class = "container" align="center">
  <form name = "loginForm" action = "customerloginresult.do" method = "post">
    <h3>로그인</h3>
      <label>ID </label><input type = "text" name = "cId"><br>
      <label>PW </label><input type = "password" name = "cPw"><br><br>
      <input type = "button" class="btn btn-default " onclick = "checkForm()" value = "로그인">
      <a id="kakao-login-btn" href="https://kauth.kakao.com/oauth/authorize?client_id=ae2e6275133a2bf25fe30fba002ced8d&redirect_uri=http://localhost/cafein/kakaologin&response_type=code">
      	<img src="${pageContext.request.contextPath}/image/kakaologin.png">
      </a>
      <a id="naver-login-btn" href="http://localhost/cafein/naverlogin.do"><img src="${pageContext.request.contextPath}/image/naverlogin.PNG" style="witdh:222px;height:50px;"></a>
      
      <!-- 카카오로 로그인 시 이 로그아웃 버큰 사용하기 <a href="#"><img src="${pageContext.request.contextPath}/image/naverlogin.PNG" style = "width:222px;hieth:50px;"></a>-->
	  <a href="http://developers.kakao.com/logout"></a><br>
      <input type = "button" class="btn btn-default " onclick = "location.href='${pageContext.request.contextPath}/customerjoinForm.do'" value = "회원가입">
      <input type = "button" class="btn btn-default " onclick = "location.href='${pageContext.request.contextPath}/customerfindidpw.do'" value = "ID/PW 찾기">
  </form>
  </div>
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