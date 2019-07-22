<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="adminhead.jsp" %>

<title>Login Page</title>
<script>
		
		function checkForm() {
			var form = document.loginForm;
			if(form.aId.value == ""){
				alert("아이디를 입력해 주세요.");
				form.aId.focus();
				return;
			} else if(form.aPw.value == ""){
				alert("비밀번호를 입력해 주세요.");
				form.aPw.focus();
				return;
			}
			
			form.submit();
		}
</script>
</head>
<body>
  <div class = "container" align="center">
  <form name = "loginForm" action = "adminloginresult.do" method = "post">
    <h3>로그인</h3>
      <label>ID </label><input type = "text" name = "aId"><br>
      <label>PW </label><input type = "password" name = "aPw"><br><br>
      <input type = "button" class="btn btn-default " onclick = "checkForm()" value = "로그인">
  </form>
  </div>
</body>
</html>