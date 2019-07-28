<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <%@ include file="storehead.jsp" %> --%>
<title>Store Login Page</title>
<style>
	body{
	    background: url(image/loginbgimg.jpg) no-repeat center center fixed; 
	    -webkit-background-size: cover;
	    -moz-background-size: cover;
	    -o-background-size: cover;
	    background-size: cover;
	}
	.bg {
		position: fixed; 
		top: -50%; 
		left: -50%; 
		width: 200%; 
		height: 200%;
	}
	/* .bg bgimg {
		position: absolute; 
		top: 0; 
		left: 0; 
		right: 0; 
		bottom: 0; 
		margin: auto; 
		min-width: 50%;
		min-height: 50%;

	} */
	.bgForm {
		padding: 5px 10px;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate( -50%, -50% );
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
<div class="bg">
<!--   <div class="bgimg">
  	<img src="image/loginbgimg.jpg" alt="">
  </div> -->
  <div class="bgForm">
	  <div class = "container" align="center">
		  <form name = "loginForm" action="${pageContext.request.contextPath}/storeloginresult.do">
		    <h3>로그인</h3>
		      <label>ID </label><input type = "text" name = "sid"><br>
		      <label>PW </label><input type = "password" name = "spw"><br><br>
		      <input type = "button" class="btn btn-default " onclick = "checkForm()" value = "로그인">
		      <input type = "button" class="btn btn-default " onclick = "location.href='${pageContext.request.contextPath}/storejoin.do'" value = "회원가입">
		  </form>
	  </div>
  </div>
</div>
</body>
</html>