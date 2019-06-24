<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Customer Join Page</title>
</head>
<body>
 <div class = "container" align="center">
  <form name = "customerjoinForm" action = "login.jsp" method = "post">
    <h3>회원가입</h3>
      <table class = "table table-hover">
        <tr>
          <th>ID</th>
          <td><input type = "text" name = "c_id"><button class="btn btn-default " >중복확인</button></td>
        </tr>
        <tr>
          <th>닉네임</th>
          <td><input type = "text" name = "c_nick"></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type = "text" name = "c_pw"></td>
        </tr>
        <tr>
          <th>비밀번호 확인</th>
          <td><input type = "text" name = "c_pw_check"></td>
        </tr>
        <tr>
          <th>이름</th>
          <td><input type = "text" name = "c_name"></td>
        </tr>
        <tr>
          <th>연락처</th>
          <td><input type = "tel" name = "c_tel"></td>
        </tr>
        <tr>
          <th>주소</th>
          <td><input type = "text" name = "c_add"></td>
        </tr>
        <tr>
          <th>생년월일</th>
          <td><input type = "date" name = "dob"></td>
        </tr>
      </table>
      <input type = "submit" class="btn btn-default " value = "가입하기">
  </form>
  </div>
</body>
</html>