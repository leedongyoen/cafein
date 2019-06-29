<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Customer Information Edit Page</title>
<script>
	function edit() {

		$("#edit_after").css('display', 'inline');
        $("#edit_before").css('display', 'none');
        $("#c_infoedit").css('display', 'inline');
        $("#c_info").css('display', 'none');
        $("#c_nick").removeAttr("readonly");
        $("#c_pw").removeAttr("readonly");
        $("#c_name").removeAttr("readonly");
        $("#c_tel").removeAttr("readonly");
        $("#c_add").removeAttr("readonly");
        $("#dob").removeAttr("readonly");
	}
	
	function editok() {
		$("#edit_after").css('display', 'none');
        $("#edit_before").css('display', 'inline');
        $("#c_infoedit").css('display', 'none');
        $("#c_info").css('display', 'inline');
        $("#c_nick").attr("readonly",true);
        $("#c_pw").attr("readonly",true);
        $("#c_name").attr("readonly",true);
        $("#c_tel").attr("readonly",true);
        $("#c_add").attr("readonly",true);
        $("#dob").attr("readonly",true);
	}
</script>
</head>
<body>
<div class = "container" align="center">
<!-- 수정완료 버튼에 .do 보내기 -->
  <form name = "customerinfoForm" method = "post">
    <h3 id = "c_info">회원 정보</h3>
    <h3 id = "c_infoedit" style=" display:none "> 회원 정보 수정</h3>
      <table class ="table">
        <tr>
          <th>ID</th>
          <td><input type = "text" name = "c_id" readonly></td>
        </tr>
        <tr>
          <th>닉네임</th>
          <td><input type = "text" name = "c_nick" id = "c_nick" readonly></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type = "text" name = "c_pw" id = "c_pw" readonly></td>
        </tr>
        <tr>
          <th>이름</th>
          <td><input type = "text" name = "c_name" id = "c_name" readonly></td>
        </tr>
        <tr>
          <th>연락처</th>
          <td><input type = "tel" name = "c_tel" id = "c_tel" readonly></td>
        </tr>
        <tr>
          <th>주소</th>
          <td><input type = "text" name = "c_add" id = "c_add" readonly></td>
        </tr>
        <tr>
          <th>생년월일</th>
          <td><input type = "date" name = "dob" id = "dob" readonly></td>
        </tr>
      </table>
      <a class="btn btn-default  pull-right"  href="javascript:history.go(-1)">돌아가기</a>
      <input type = "button" class="btn btn-default" id = "edit_before" value = "수정하기" onclick = "edit()">
      <input style=" display:none " type = "button" class="btn btn-default" id = "edit_after" value = "수정완료" onclick = "editok()">
  </form>
</div>
  
</body>
</html>