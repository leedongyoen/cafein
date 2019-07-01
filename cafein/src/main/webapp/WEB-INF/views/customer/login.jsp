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
<script>	
	function checkForm() {
		var form = document.loginForm;
		if(form.id.value == ""){
			alert("아이디를 입력해 주세요.");
			form.id.focus();
			return;
		} else if(form.pw.value == ""){
			alert("비밀번호를 입력해 주세요.");
			form.pw.focus();
			return;
		}
		
		form.submit();
	}		
</script>
</head>
<body>
  <div class = "container" align="center">
  <form name = "loginForm" action = "customermain.jsp" method = "post">
    <h3>로그인</h3>
      <label>ID </label><input type = "text" name = "id"><br>
      <label>PW </label><input type = "password" name = "pw"><br><br>
      <input type = "button" class="btn btn-default " onclick = "checkForm()" value = "로그인">
      <a id="kakao-login-btn" href=“https://kauth.kakao.com/oauth/authorize?client_id=ae2e6275133a2bf25fe30fba002ced8d&redirect_uri=localhost/cafein/customerlogin&response_type=code”></a>
	  <a href="http://developers.kakao.com/logout"></a>
      <input type = "button" class="btn btn-default " onclick = "location.href='${pageContext.request.contextPath}/customerjoin.do'" value = "회원가입">
      <input type = "button" class="btn btn-default " onclick = "location.href='${pageContext.request.contextPath}/customerfindidpw.do'" value = "ID/PW 찾기">
  </form>
  </div>
<script type='text/javascript'>
//<![CDATA[
  // 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('5fe7fabf65bb23ce907670dba5752a92');
  // 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      alert(JSON.stringify(authObj));
    },
    fail: function(err) {
       alert(JSON.stringify(err));
    }
  });
  
//]]>
</script>
</body>
</html>