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
<h1 align="center">매장LIST</h1>
<div class = "container">

<div style="text-align:right">
			<input type='text' name='word' value=''>
			<button>검색</button>
		</div>
 <table table class = "table">
	<tr>
	<th>매장명</th>
	<th>ID</th>
	<th>주소</th>
	<th>전화번호</th>
	<th>배달</th>
	<th>적립금</th>
	<th>오픈시간</th>
	<th>마감시간</th>
	</tr>
	<tr>
	    <td>알렉산더</td>
	    <td>sh001</td>
	    <td>대구광역시 중구</td>
	    <td>010-0000-9999</td>
	    <td>N</td>
	    <td>N</td>
	    <td>09:00</td>
	    <td>22:00</td>
	</tr>
    </table>
    <div style="text-align:right">
	<button onclick="location.href='adminMain.jsp'">돌아가기</button>
	</div>
	</div>
</body>
</html>