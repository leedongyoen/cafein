<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Main Page</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, user-scalable=no">
<link rel="stylesheet" href="mainresource/assets/css/main.css" />
<link rel="stylesheet" href="mainresource/assets/css/noscript.css" />
<style>
	body{
			background: url(image/main.jpg) no-repeat center center fixed; 
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
</style>
</head>
<body class="is-preload">
<div class="bgForm">
<!-- Wrapper -->
<div id="wrapper">

	<!-- Main -->
		<section id="main">
			<header>
				<h1>Jane Doe</h1>
				<p>Senior Psychonautics Engineer</p>
			</header>
			<!--
						<hr />
						<h2>Extra Stuff!</h2>
						<form method="post" action="#">
							<div class="fields">
								<div class="field">
									<input type="text" name="name" id="name" placeholder="Name" />
								</div>
								<div class="field">
									<input type="email" name="email" id="email" placeholder="Email" />
								</div>
								<div class="field">
									<select name="department" id="department">
										<option value="">Department</option>
										<option value="sales">Sales</option>
										<option value="tech">Tech Support</option>
										<option value="null">/dev/null</option>
									</select>
								</div>
								<div class="field">
									<textarea name="message" id="message" placeholder="Message" rows="4"></textarea>
								</div>
								<div class="field">
									<input type="checkbox" id="human" name="human" /><label for="human">I'm a human</label>
								</div>
								<div class="field">
									<label>But are you a robot?</label>
									<input type="radio" id="robot_yes" name="robot" /><label for="robot_yes">Yes</label>
									<input type="radio" id="robot_no" name="robot" /><label for="robot_no">No</label>
								</div>
							</div>
							<ul class="actions special">
								<li><a href="#" class="button">Get Started</a></li>
							</ul>
						</form>
						<hr />
						-->
			
			<footer>
				<ul class="icons">
					<li><a href="${pageContext.request.contextPath}/customerlogin.do" class="icon brands fa-twitter">Customer</a></li>
					<li><a href="${pageContext.request.contextPath}/storelogin.do" class="icon brands fa-instagram">Store</a></li>
					<li><a href="${pageContext.request.contextPath}/adminlogin.do" class="icon brands fa-facebook-f">Admin</a></li>
				</ul>
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
