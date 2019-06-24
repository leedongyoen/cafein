<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Store Information Edit Page</title>
<script src="../js/jquery-1.11.0.min.js"></script>

<script>
	function edit() {

		$("#edit_after").css('display', 'inline');
        $("#edit_before").css('display', 'none');
        $("#s_infoedit").css('display', 'inline');
        $("#s_info").css('display', 'none');
        $("#s_name").removeAttr("readonly");
        $("#s_pw").removeAttr("readonly");
        $("#s_tel").removeAttr("readonly");
        $("#s_add").removeAttr("readonly");
        $("#open_time").removeAttr("readonly");
        $("#close_time").removeAttr("readonly");
        $("#deli_service_y").removeAttr("disabled");
        $("#deli_service_n").removeAttr("disabled");
        $("#savings_service_y").removeAttr("disabled");
        $("#savings_service_n").removeAttr("disabled");
	}
	
	function editok() {
		
		$("#edit_after").css('display', 'none');
        $("#edit_before").css('display', 'inline');
        $("#s_infoedit").css('display', 'none');
        $("#s_info").css('display', 'inline');
        $("#s_name").attr("readonly",true);
        $("#s_pw").attr("readonly",true);
        $("#s_tel").attr("readonly",true);
        $("#s_add").attr("readonly",true);
        $("#open_time").attr("readonly",true);
        $("#close_time").attr("readonly",true);
        $("#deli_service_y").attr("disabled",true);
        $("#deli_service_n").attr("disabled",true);
        $("#savings_service_y").attr("disabled",true);
        $("#savings_service_n").attr("disabled",true);
	}
</script>
</head>
<body>
<div class = "container" align="center">
  <form name = "storejoinForm" method = "post">
    <h3 id = "s_info">매장 정보</h3>
    <h3 id = "s_infoedit" style=" display:none ">매장 정보 수정</h3>
      <table class ="table">
        <tr>
          <th>ID</th>
          <td><input type = "text" name = "s_id" readonly></td>
        </tr>
        <tr>
          <th>매장상호</th>
          <td><input type = "text" name = "s_name" id = "s_name" readonly></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type = "text" name = "s_pw" id = "s_pw" readonly></td>
        </tr>
        <tr>
          <th>매장연락처</th>
          <td><input type = "tel" name = "s_tel" id = "s_tel" readonly></td>
        </tr>
        <tr>
          <th>매장주소</th>
          <td><input type = "text" name = "s_add" id = "s_add" readonly></td>
        </tr>
        <tr>
          <th>영업시간</th>
          <td>
            <input type = "time" name = "open_time" id = "open_time" value = "10:00" readonly> ~ 
            <input type = "time" name = "close_time" id = "close_time" value = "22:00" readonly><br>
            <font color = "gray" size = "2pt">* 영업시간은 1시간 단위로 설정이 가능합니다.</font>
          </td>
        </tr>
        <tr>
          <th>배달유무</th>
          <td>
            <input type = "radio" name = "deli_service" id = "deli_service_y" value = 'Y' disabled>배달 가능
            <input type = "radio" name = "deli_service" id = "deli_service_n" value = 'N' checked disabled> 배달 불가능
          </td>
        </tr>
        <tr>
          <th>적립금 사용 유무</th>
          <td>
            <input type = "radio" name = "savings_service" id = "savings_service_y" value = 'Y' disabled>적립 가능
            <input type = "radio" name = "savings_service" id = "savings_service_n" value = 'N' checked disabled>적립 불가능
          </td>
        </tr>
      </table>
      <a class="btn btn-default  pull-right"  href="javascript:history.go(-1)">돌아가기</a>
      <input type = "button" id = "edit_before" class="btn btn-default" value = "수정하기" onclick = "edit()">
      <input style=" display:none " type = "button" class="btn btn-default" id = "edit_after" value = "수정완료" onclick = "editok()">
  </form>
  </div>
</body>
</html>