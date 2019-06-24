<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Store Registration Page</title>
</head>
<body>
 <div class = "container" align="center">
  <form name = "storejoinForm" action = "storelogin.jsp" method = "post">
    <h3>회원가입</h3>
      <table class = "table table-hover">
        <tr>
          <th>ID</th>
          <td><input type = "text" name = "s_id"><button>중복확인</button></td>
        </tr>
        <tr>
          <th>매장상호</th>
          <td><input type = "text" name = "s_name"></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type = "text" name = "s_pw"></td>
        </tr>
        <tr>
          <th>비밀번호 확인</th>
          <td><input type = "text" name = "s_pw_check"></td>
        </tr>
        <tr>
          <th>매장연락처</th>
          <td><input type = "tel" name = "s_tel"></td>
        </tr>
        <tr>
          <th>매장주소</th>
          <td><input type = "text" name = "s_add"></td>
        </tr>
        <tr>
          <th>영업시간</th>
          <td>
            <input type = "time" name = "open_time" value = "10:00"> ~ 
            <input type = "time" name = "close_time" value = "22:00"><br>
            <font color = "gray" size = "2pt">* 영업시간은 1시간 단위로 설정이 가능합니다.</font>
          </td>
        </tr>
        <tr>
          <th>배달유무</th>
          <td>
            <input type = "radio" name = "deli_service" value = 'Y'>배달 가능
            <input type = "radio" name = "deli_service" value = 'N' checked> 배달 불가능
          </td>
        </tr>
        <tr>
          <th>적립금 사용 여부</th>
          <td>
            <input type = "radio" name = "savings_service" value = 'Y'>적립 가능
            <input type = "radio" name = "savings_service" value = 'N' checked> 적립 불가능
          </td>
        </tr>
      </table>
      <input type = "submit"  class="btn btn-default " value = "가입하기">
      <a class="btn btn-default"  href="javascript:history.go(-1)">돌아가기</a>
  </form>
  </div>
</body>
</html>