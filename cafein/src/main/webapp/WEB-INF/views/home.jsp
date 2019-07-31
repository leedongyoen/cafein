<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>Main Page</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, user-scalable=no">
<link rel="stylesheet" href="mainresource/assets/css/main.css" />
<link rel="stylesheet" href="mainresource/assets/css/noscript.css" />
<style>
	body{
			background: url(image/main2.jpg) no-repeat center center fixed; 
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;

	}
	.bg {
		position: fixed; 
		top: -50%; 
		left: -50%; 
		width: 200%; 
		height: 200%;
	}
	.bgForm {
		padding: 5px 10px;
		text-align: center;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate( -50%, -50% );
	}
	
.customericon{ 
	background-image: url(image/customericon.png) no-repeat center center fixed; 
}	
.mainIcon{
	display: inline-block;
}
</style>
</head>
<body class="is-preload">
<div class="bgForm"> 
<!-- Wrapper -->
<div id="wrapper">

	<!-- Main -->
		<section id="main">
			<header>
				<span class="avatar"><img src="image/mainlogo.png" alt="" /></span>
				<br><br>
			</header>
			 
			<footer>    
				<div>
				<div class="icon1 mainIcon">
				<a href="${pageContext.request.contextPath}/customerlogin.do"  ><img src="image/customericon.png"><br>Customer</a>
				</div>&nbsp;
				<div class="icon2 mainIcon">
				<a href="${pageContext.request.contextPath}/storelogin.do" ><img src="image/storeicon.png"><br>Store</a>
				</div>&nbsp;&nbsp;
				<div class="icon3 mainIcon">
				<a href="${pageContext.request.contextPath}/adminlogin.do"><img src="image/adminicon.png"><br>&nbsp;Admin</a>
				</div>
				
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<%-- <ul class="icons">
					<li><a href="${pageContext.request.contextPath}/customerlogin.do"  ><img src="image/customericon.png"></a></li>
					<li><a href="${pageContext.request.contextPath}/storelogin.do" class="icon brands fa-instagram">Store</a><img src="image/storeicon.png"></li>
					<li><a href="${pageContext.request.contextPath}/adminlogin.do" class="icon brands fa-facebook-f">Admin</a><img src="image/adminicon.png"></li>
				</ul> --%>
			</footer>
		</section>

</div>
</div>
<!-- Scripts -->
<script>
	if ('addEventListener' in window) {
		window.addEventListener('load', function() { document.body.className = document.body.className.replace(/\bis-preload\b/, ''); });
		document.body.className += (navigator.userAgent.match(/(MSIE|rv:11\.0)/) ? ' is-ie' : '');
	}
</script>

</body>

</html>
