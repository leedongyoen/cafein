<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Insert title here</title>
</head>
<body>
<h1 align="center">매장메뉴 등록</h1>
<hr>
<div class = "container" align="center">
카테고리:<select name="VALUES">
    <option value="">선택</option>
    <option value="VEBERAGE">음료</option>
    <option value="FOOD">푸드</option>
</select>
<select name="S_VALUES">
    <option value="">선택</option>
    <option value="VEBERAGE">COFFEE</option>
    <option value="FOOD">VEBERAGE</option>
</select>
<br><br>
<p>메뉴명 : <input type = "text" name="me_name" size="20" value="">
<button class="btn btn-default " onclick="#">검색</button></p> 
<p>메뉴가격 : <input type = "text" name="me_price" size="20" value=""></p>
<p>메뉴사진 : <input type="file" value="파일 선택" name="file"/></p>

<button class="btn btn-default " onclick="#">등록</button>
<a href="javascript:history.go(-1)" class="btn btn-default ">돌아가기</a>
</div>
</body>
</html>