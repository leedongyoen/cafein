<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Info Page</title>
</head>
<body>
	<!-- 세션에서 token을 가져와서 출력한다. -->
    session token : ${sessionScope.token}
</body>
</html>