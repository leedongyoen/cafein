<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Insert title here</title>
</head>
<body>
<h1 align="center">나만의 메뉴</h1><hr>
<br>

<div class = "container">
<div align="right">
<button onclick="location.href='myMenuRegi.jsp'">추가</button>
<button>삭제</button>
</div>
<img src="../image/coffee1.jpg" width="200" heigh="200" onclick = "location.href='MymenuOrder.jsp'"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="myMenu1" value="myMenu1"  >아메리카노 ,알렉산더

</div>
</body>
</html>