<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Login Page</title>
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
      <input type = "button" class="btn btn-default " onclick = "location.href='joinForm.do'" value = "회원가입">
      <input type = "button" class="btn btn-default " onclick = "location.href='findidpwForm.do'" value = "ID/PW 찾기">
  </form>
  </div>
</body>
</html>