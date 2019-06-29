<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<%@ include file="adminhead.jsp" %>
<title>Insert title here</title>
</head>
<body>
<h1>관리자MAIN</h1>
<br><br><br>
<div align="center">
	<img src="${pageContext.request.contextPath}/image/alarm.JPG" 
		width="50" height="50" title="매장등록신청이 (2)건 있습니다." 
		onclick="location.href='${pageContext.request.contextPath}/storemng.do'">


</div>
</body>
</html>