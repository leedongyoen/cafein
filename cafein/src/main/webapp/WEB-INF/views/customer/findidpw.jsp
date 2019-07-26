<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Find ID/PASSWORD Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			alert("에일로 아이디를 발송했습니다.")	
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
<div class = "container" align="center">
<h3 align="center">ID/PW 찾기</h3><hr>
  	 <form method ="post" action="idfind.do" name="idfindform">
      	<table class = "table table" >
      	  <tr>
      	    <th colspan = "2">아이디 찾기</th>
      	  </tr>
      	  <tr>
      	    <th>이름</th>
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
        <table class = "table table">
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
  
  
</div>
</body>
</html>