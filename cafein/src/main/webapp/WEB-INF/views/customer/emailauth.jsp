<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
		
			var authkeyCheck = 0;
			var authkey = $('#authNum').val();
			$(function(){
				$("#authkeyCheck").click(function() {
					$.ajax({
						url:"${pageContext.request.contextPath}/getauthjoin/"+$('#authNum').val(),
						type : "POST",
						datatype: "json",
						/* data: { authNum : authkey }, */
						success: function(data){
							if(data.cnt == 1){
								alert("인증완료");
								self.close();
							} else {
								alert("틀린 인증 번호입니다. 다시입력해주세요.");
							}
						}
					})
				})
			});
			
// 			function check() {	
// 				var form = document.authenform;
// 				var authNum = $('#authnum').val();
// 			 if(!form.authnum.value) {
// 				 alert("인증번호를 입력하세요.");
// 				 return false;
// 			 }
// 			 if(form.authnum.value != authNum) {
// 				 alert("틀린 인증번호입니다. 인증번호를 다시 입력해 주세요");
// 				 form.authnum.focus();
// 				 return false;
// 			 }
// 			 if(form.authnum.value == authNum) {
// 				 alert("인증완료");
// 				 self.close();
// 			}
//   }

	
</script>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	<h5>인증번호를 입력해주세요.</h5>
		<form method="post">
			<input type = "text" name="authNum" id="authNum">
			<input type = "button" value="전송" id="authkeyCheck">
		</form>
	</div>
</body>
</html>