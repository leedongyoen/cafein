<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="./js/json.min.js"></script>   
<script>

$(function(){
	var id = "<%= (String)session.getAttribute("sid") %>";
	console.log("store id = " + id);
	
	if(id == "null") {
		$("#loginbtn").css('display', 'inline');
		$("#logoutbtn").css('display', 'none');
	}
	if(id != "null") {
		$("#loginbtn").css('display', 'none');
		$("#logoutbtn").css('display', 'inline');
	}
});

function startTime() {
	var dayko = ['일','월','화','수','목','금','토'];
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
	var yy = 1900 + today.getYear();
    var mm = today.getMonth();
    var dd = today.getDate();
    var day = today.getDay();
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('clock').innerHTML =
    yy+"년 "+mm+"월 "+dd+"일 ("+dayko[day]+")  "+h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i}; // 숫자가 10보다 작을 경우 앞에 0을 붙여줌
    return i;
}
</script>

<style>
body {

	padding-top: 0px;

	padding-bottom: 30px;

}

</style>
</head>
<body onload="startTime()">
<!--메뉴바 추가 부분-->

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">

  <a class="navbar-brand" href="${pageContext.request.contextPath}/storemainform.do">HOME</a>

  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">

    <span class="navbar-toggler-icon"></span>

  </button>



  <div class="collapse navbar-collapse" id="navbarsExample03">

    <ul class="navbar-nav mr-auto">

      <li class="nav-item dropdown">

        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">매장</a>

        <div class="dropdown-menu" aria-labelledby="dropdown01">
        	<a class="dropdown-item" href="${pageContext.request.contextPath}/storeinfoedit.do">Store Id</a>
			<a class="dropdown-item" href="${pageContext.request.contextPath}/customerlist.do">고객 조회</a>
          	<a class="dropdown-item" href="${pageContext.request.contextPath}/salestime.do">매출</a>
          	<a class="dropdown-item" href="${pageContext.request.contextPath}/storerecipemenu">메뉴 관리</a>
          	<a class="dropdown-item" href="${pageContext.request.contextPath}/recipelist.do">레시피 관리</a>
		  	<a class="dropdown-item" href="${pageContext.request.contextPath}/storeorderlist.do">주문 내역</a>
        </div>

      </li>

	  <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pos.do">주문</a>

      <li class="nav-item dropdown">

        <a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">재고</a>

        <div class="dropdown-menu" aria-labelledby="dropdown02">
         <a class="dropdown-item" href="${pageContext.request.contextPath}/stocklist.do">재고 목록</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/warehousingregi.do">재고 입고</a>
		  <a class="dropdown-item" href="${pageContext.request.contextPath}/stockstatisticslist.do">재고 통계</a>
          <a class="dropdown-item" href="${pageContext.request.contextPath}/stocklist.do">재고 목록</a>

        </div>

      </li>
      
      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/warehousingregi.do">오픈</a></li>
      <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/daycal.do">마감</a></li>

    </ul>

	<div class="top-right">
        <ul class="navbar-nav mr-auto">
        		<li class="nav-link"  id="clock" style="color:orange; font-size:16px;"><a></a></li>
                <li class="nav-item">
                	<a class="nav-link" href="${pageContext.request.contextPath}/storelogin.do" id="loginbtn">Login</a>
                </li>
                <li class="nav-item">
                	<a class="nav-link" href="${pageContext.request.contextPath}/storelogout.do" id="logoutbtn">Logout</a>
                </li>

        </ul>

    </div>
  </div>

</nav>
</body>
</html>