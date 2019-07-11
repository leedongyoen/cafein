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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function(){
		var id = "<%= (String)session.getAttribute("cId") %>";
		console.log("customer id = " + id);
		
		if(id == "null") {
			$("#loginbtn").css('display', 'inline');
			$("#logoutbtn").css('display', 'none');
			$("#dropdown01").css('display', 'none');
		}
		if(id != "null") {
			$("#loginbtn").css('display', 'none');
			$("#logoutbtn").css('display', 'inline');
			$("#dropdown01").css('display', 'inline');
		}
	});
</script>
<style>
body {

	padding-top: 0px;
	padding-bottom: 30px;
}
</style>
</head>
<body>
<!--메뉴바 추가 부분-->

<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/customermainform.do">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample03">
    <ul class="navbar-nav mr-auto">

	  <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/customerstorelist.do">주문</a>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">User Name</a>
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
                	<a class="nav-link" href="${pageContext.request.contextPath}/customerlogin.do" id="loginbtn">Login</a>
                </li>                
                <li class="nav-item">
                	<a class="nav-link" href="${pageContext.request.contextPath}/customerlogout.do" id="logoutbtn">Logout</a>
                </li>                
                <li class="nav-item">
                	<a class="nav-link" href="${pageContext.request.contextPath}/cartmng.do">장바구니</a>
                </li>
        </ul>
    </div>
  </div>
</nav>
</body>
</html>