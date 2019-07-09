<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Store Information Edit Page</title>


<script>

	$(function(){
		readstoreinfo();
	});
	
	function readstoreinfo(){
		
		$.ajax({
        	url : 'storeinfo/' + 'SH001',
        	type : 'GET',
        	dataType : 'json',
        	error : function(xhr, status, msg){
        		alert("상태값 : " + status + "Http에러메시지 : " + msg);
        	},
        	sucess : function(data){
        		console.log(data);
        		$('input:text[name="sid"]').val(data.sid);
        		$('input:text[name="spw"]').val(data.spw);
        		$('input:text[name="sname"]').val(data.sname);
        		$("#stel").val(data.stel);
        		$('input:text[name="s_add"]').val(data.sadd);
        		$("#stopentime").val(data.stopentime);
        		$("#stclosetime").val(data.stclosetime);
        		$("#stdeliservice").val(data.stdeliservice);
        		$("#stmileservice").val(data.stmileservice);
        		
        		
        		
        	}
        });
	}

	
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
        
        readstoreinfo();
        
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
          <td><input type = "text" name = "sid" readonly></td>
        </tr>
        <tr>
          <th>매장상호</th>
          <td><input type = "text" name = "sname" id = "sname" readonly></td>
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type = "text" name = "spw" id = "spw" readonly></td>
        </tr>
        <tr>
          <th>매장연락처</th>
          <td><input type = "tel" name = "stel" id = "stel" readonly></td>
        </tr>
        <tr>
          <th>매장주소</th>
          <td><input type = "text" name = "sadd" id = "sadd" readonly></td>
        </tr>
        <tr>
          <th>영업시간</th>
          <td>
            <input type = "time" name = "stopentime" id = "stopentime" value = "10:00" readonly> ~ 
            <input type = "time" name = "stclosetime" id = "stclosetime" value = "22:00" readonly><br>
            <font color = "gray" size = "2pt">* 영업시간은 1시간 단위로 설정이 가능합니다.</font>
          </td>
        </tr>
        <tr>
          <th>배달유무</th>
          <td>
            <input type = "radio" name = "stdeliservice" id = "stdeliservice" value = 'Y' disabled>배달 가능
            <input type = "radio" name = "stdeliservice" id = "stdeliservice" value = 'N' checked disabled> 배달 불가능
          </td>
        </tr>
        <tr>
          <th>적립금 사용 유무</th>
          <td>
            <input type = "radio" name = "stmileservice" id = "savings_service_y" value = 'Y' disabled>적립 가능
            <input type = "radio" name = "stmileservice" id = "savings_service_n" value = 'N' checked disabled>적립 불가능
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