<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <%@ include file="storehead.jsp" %> --%>
<title>Store Login Page</title>
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
  <div class = "container" align="center">
  <form name = "loginForm" action="${pageContext.request.contextPath}/storeloginresult.do">
    <h3>로그인</h3>
      <label>ID </label><input type = "text" name = "sid"><br>
      <label>PW </label><input type = "password" name = "spw"><br><br>
      <input type = "button" class="btn btn-default " onclick = "checkForm()" value = "로그인">
      <input type = "button" class="btn btn-default " onclick = "location.href='${pageContext.request.contextPath}/storejoin.do'" value = "회원가입">
  </form>
  </div>
</body>
</html>