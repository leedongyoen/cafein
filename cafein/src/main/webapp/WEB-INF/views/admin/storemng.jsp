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
<h1 align="center">매장등록신청내역</h1>
<div class = "container">
 <table table class = "table">
	<tr>
	<th>매장명</th>
	<th>ID</th>
	<th>주소</th>
	<th>전화번호</th>
	<th>배달</th>
	<th>적립금</th>
	<th>승인</th>
	</tr>
	<tr>
	    <td>juncoffee</td>
	    <td>jun123</td>
	    <td>대구광역시 중구</td>
	    <td>053-222-3333</td>
	    <td>Y</td>
	    <td>Y</td>
	    <td><input type="checkbox" name="storeapply1" value="storeapply"></td>
	</tr>
	<tr>
	    <td>JJUHOYA</td>
	    <td>jju123</td>
	    <td>대구광역시 서구</td>
	    <td>053-333-5553</td>
	    <td>Y</td>
	    <td>N</td>
	    <td><input type="checkbox" name="storeapply2" value="storeapply"></td>
	</tr>
	<tr>
	    <td>수빈's커피</td>
	    <td>su123</td>
	    <td>대구광역시 남구</td>
	    <td>053-222-3333</td>
	    <td>Y</td>
	    <td>Y</td>
	    <td><input type="checkbox" name="storeapply3" value="storeapply"></td>
	</tr>
	<tr>
	    <td>수빈2's커피</td>
	    <td>jju2123</td>
	    <td>대구광역시 남구</td>
	    <td>053-666-6666</td>
	    <td>N</td>
	    <td>N</td>
	    <td><input type="checkbox" name="storeapply4" value="storeapply"></td>
	</tr>
    </table>
    <div style="text-align:right">
    <button type="submit" onclick="#">승인</button>
	<button onclick="location.href='adminMain.jsp'">돌아가기</button>
	</div>
	</div>
</body>
</html>