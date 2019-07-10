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
        	success : function(data){ 
        		console.log(data);
        		$('input:text[name="sid"]').val(data.sid);
        		$('input:text[name="spw"]').val(data.spw);
        		$('input:text[name="sname"]').val(data.sname);
        		$("#stel").val(data.stel);
        		$('input:text[name="sadd"]').val(data.sadd);
        		$("#stopentime").val(data.stopentime);
        		$("#stclosetime").val(data.stclosetime);
    /*     		$("#stdeliservice").val(data.stdeliservice); */
        		if(data.stdeliservice == 'Y'){
        			$("#stdeliservice_y").attr("checked","checked");
        		}
        		$("#stmileservice").val(data.stmileservice);
        		if(data.stmileservice == 'Y'){
        			$("#savings_service_y").attr("checked","checked");
        			
        		}
        		
        		
        	}
        });
	}

	
	function edit() {
		

		$("#edit_after").css('display', 'inline');
        $("#edit_before").css('display', 'none');
        $("#s_infoedit").css('display', 'inline');
        $("#s_info").css('display', 'none');
//         $("#sname").removeAttr("readonly");
//         $("#spw").removeAttr("readonly");
        $("#stel").removeAttr("readonly");
        $("#sadd").removeAttr("readonly");
        $("#stopentime").removeAttr("readonly");
        $("#stclosetime").removeAttr("readonly");
        $("#stdeliservice_y").removeAttr("disabled");
        $("#stdeliservice_n").removeAttr("disabled");
//         $("#savings_service_y").removeAttr("disabled");
//         $("#savings_service_n").removeAttr("disabled");

		
	}
	
	function editok() {
		
		$.ajax({
			url : 'storeinfo',
			type : 'PUT',
			contentType : 'application/json;charrset=utf-8',
			dataType : 'json',
			data : JSON.stringify($("#storeinfoForm").serializeObject()),
			success : function(data) {
				alert("수정완료되었습니다. ㅎㅎㅎㅎ")

			}
		});
		
		
		$("#edit_after").css('display', 'none');
        $("#edit_before").css('display', 'inline');
        $("#s_infoedit").css('display', 'none');
        $("#s_info").css('display', 'inline');
        $("#sname").attr("readonly",true);
        $("#spw").attr("readonly",true);
        $("#stel").attr("readonly",true);
        $("#sadd").attr("readonly",true);
        $("#stopentime").attr("readonly",true);
        $("#stclosetime").attr("readonly",true);
        $("#stdeliservice_y").attr("disabled",true);
        $("#stdeliservice_n").attr("disabled",true);
        $("#savings_service_y").attr("disabled",true);
        $("#savings_service_n").attr("disabled",true);
        
        readstoreinfo();
        
	}
</script>
</head>
<body>
<div class = "container" align="center">
    <h3 id = "s_info">매장 정보</h3>
    <h3 id = "s_infoedit" style=" display:none ">매장 정보 수정</h3>
  <form id = "storeinfoForm" method = "post">
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
          <td><input type = "text" size=50 name = "sadd" id = "sadd" readonly></td>
        </tr>
        <tr>
          <th>영업시간</th>
          <td>
            <input type = "time" name = "stopentime" id = "stopentime"  readonly> ~ 
            <input type = "time" name = "stclosetime" id = "stclosetime" readonly><br>
            <font color = "gray" size = "2pt">* 영업시간은 1시간 단위로 설정이 가능합니다.</font>
          </td>
        </tr>
        <tr>
          <th>배달유무</th>
          <td>
            <input type = "radio" name = "stdeliservice" id = "stdeliservice_y" value = 'Y' disabled>배달 가능
            <input type = "radio" name = "stdeliservice" id = "stdeliservice_n" value = 'N' checked="checked" disabled> 배달 불가능
          </td>
        </tr>
        <tr>
          <th>적립금 사용 유무</th>
          <td>
            <input type = "radio" name = "stmileservice" id = "savings_service_y" value = 'Y' disabled>적립 가능
            <input type = "radio" name = "stmileservice" id = "savings_service_n" value = 'N' checked="checked" disabled>적립 불가능
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