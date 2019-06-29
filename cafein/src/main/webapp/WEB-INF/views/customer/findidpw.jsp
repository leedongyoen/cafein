<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Find ID/PASSWORD Page</title>
</head>
<body>
<div class = "container" align="center">
<h3 align="center">ID/PW 찾기</h3><hr>
<form name = "findidpwForm" method = "post">
  <table  >
    <tr>
      <td>
      	<table class = "table table" >
      	  <tr>
      	    <th colspan = "2">아이디 찾기</th>
      	  </tr>
      	  <tr>
      	    <th>이름</th>
      	    <td><input type = "text" name = "name"></td>
      	  </tr>
      	  <tr>
      	    <th>연락처</th>
      	    <td><input type = "text" name = "tel"></td>
      	  </tr>
      	  <tr>
      	    <th colspan = "2"><button class="btn btn-default " onclick = "location.href='findId.jsp'">아이디 찾기</button></th>
      	  </tr>
      	</table>
      </td>
      <td>
        <table class = "table table">
      	  <tr>
      	    <th colspan = "2">비밀번호 찾기</th>
      	  </tr>
      	  <tr>
      	    <th>ID</th>
      	    <td><input type = "text" name = "id"></td>
      	  </tr>
      	  <tr>
      	    <th>연락처</th>
      	    <td><input type = "text" name = "tel"></td>
      	  </tr>
      	  <tr>
      	    <th colspan = "2"><button class="btn btn-default " onclick = "location.href='findPw.jsp'">비밀번호 찾기</button></th>
      	  </tr>
      	</table>
      </td>
    </tr>
    <tr>
      <th colspan = "2"><input type = "button" class="btn btn-default " onclick = "javascript:history.go(-1)" value = "돌아가기"></th>
    </tr>
  </table>
</form>
</div>
</body>
</html>