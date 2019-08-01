<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
<link rel="stylesheet" href="./css/orderlist.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./js/json.min.js"></script>

<script >

	var checksocketid = "<%= (String)session.getAttribute("cId") %>";
	var webSocket;
	if(checksocketid != "null") {
		webSocket= new WebSocket('ws://cafein.co.kr/OrdercastingServer.do');
		
		webSocket.onerror = function(event) {
			 	onError(event)
		};
		webSocket.onopen = function(event) {
			 onOpen(event)
		};
		webSocket.onmessage = function(event) {
			 onMessage(event)
		};
	}
	
	 
	function onMessage(event) {
		var result = event.data;
		var list = result.split(":");
		
		
		// 매장 주문목록에서 승인/거절 시에는 이미 데이터가 바뀐 뒤
		if(list[0] == "승인"){
			alert("주문하신 메뉴가 준비중입니다.");
		}else if(list[0] == "거절"){
			alert("주문하신 메뉴가 거절되었습니다.");
		}
		
		// 매장 POS에서 승인/거절은 데이터가 바뀌지 않은 상태에서 먼저 보내기 때문에
		if(list[1] == "승인"){
			$.ajax({
				url: 'updateorderapply',
				type:'POST',
				data: {oNum : list[0] , takeTime: "40"},
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:function(data){
					alert("주문번호 : "+list[0]+" 가 승인되었습니다.");
				}
				
			});
			
		}else if(list[1] == "거절"){
			/* updateAlramCancel  */
			
			$.ajax({
				url: 'updateAlramCancel',
				type:'POST',
				data: {oNum : list[0]},
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:function(data){
					alert("주문번호 : "+list[0]+" 가 거절되었습니다.");
				}
				
			});
		}
 
	}

	function onOpen(event) {
	 	
	}

	function onError(event) {
		 console.log(event);
		
	}

	function send(v_type,v_sid) {
		var msg = {
				type : v_type,
				sId : v_sid,

		};
			//  Send  the msg  object  as  a  JSON-formatted  string.
		webSocket.send(JSON.stringify(msg));

		// webSocket.send(inputMessage.value);
		
	}
		 
		 
	$(function(){
		var id = "<%= (String)session.getAttribute("cId") %>";
		console.log("customer id = " + id);
		
		if(id == "null") {
			$("#loginbtn").css('display', 'block');
			$("#logoutbtn").css('display', 'none');
			$("#dropdown01").css('display', 'none');
			$("#cartbtn").css('display', 'none');
			
		}
		if(id != "null") {
			$("#loginbtn").css('display', 'none');
			$("#logoutbtn").css('display', 'block');
			$("#dropdown01").css('display', 'block');
			$("#cartbtn").css('display', 'block');  
		}
	});
	
	function loginCheck(){
		var cId = "<%= (String)session.getAttribute("cId") %>";
		if(cId == "null") {

			location.href="${pageContext.request.contextPath}/customerstorelist.do";
		}
	}
</script>
<style>
body {
	
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
</head>

<!--메뉴바 추가 부분-->

<nav class="navbar fixed-top navbar-expand-sm navbar-dark bg-dark">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/customermainform.do">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample03">
    <ul class="navbar-nav mr-auto">

	  <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/customerstorelist.do">주문</a>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" style="display: none;" aria-haspopup="true" aria-expanded="false">User Name</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
        	<a class="dropdown-item" href="${pageContext.request.contextPath}/customerinfoedit.do">내 정보</a>
			<a class="dropdown-item" href="${pageContext.request.contextPath}/mymenu.do">나만의 메뉴</a>
          	<a class="dropdown-item" href="${pageContext.request.contextPath}/orderlist.do">주문 내역</a>
        </div>
      </li>
    </ul>
	<div class="top-right">
        <ul class="navbar-nav mr-auto">
        		 <li class="nav-item">
                	<a class="nav-link" href="${pageContext.request.contextPath}/allstorelist.do">매장</a>
                <li class="nav-item">
                	<a class="nav-link" href="${pageContext.request.contextPath}/customerlogin.do" id="loginbtn" style="display: none;">Login</a>
                </li>                
                <li class="nav-item">
                	<a class="nav-link" href="${pageContext.request.contextPath}/customerlogout.do" id="logoutbtn" style="display: none;">Logout</a>
                </li>                
                <li class="nav-item">
                	<a class="nav-link" href="${pageContext.request.contextPath}/cartmng" id="cartbtn">장바구니</a>
                </li>
        </ul>
    </div>
  </div>
</nav>

</html>