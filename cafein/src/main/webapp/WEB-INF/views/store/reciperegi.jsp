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
<h1 align="center">매장레시피 등록</h1>
<hr>
<br><br><br>
<div class = "container" align="center">
	<table>
	<tr>
		<th>
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
		</th>
		<th></th>
	</tr>
	<tr>
		<th>메뉴명 : <input type = "text" name="me_name" size="20" value="아메리카노"></th>
	</tr>
	
	<tr>
		<th>메뉴가격 : <input type = "text" name="me_price" size="20" value="4100"></th>
	</tr>
	<tr>
		<th>레시피 : <select name="stock">
    	<option value="coffeebean">원두</option>
   	 	<option value="milk">우유</option>
   	 	<option value="soymilk">두유</option>
   	 	</select>
    	<input type = "text" name="me_name" size="1" value="1">
    	<button onclick="#">+</button><button onclick="#">-</button>
    	<button onclick="#">추가</button><button onclick="#">삭제</button></th>
	</tr>

  </table>
<br><br><br>

<div align ="right">
<a class="btn btn-default pull-right"  href="javascript:history.go(-1)">돌아가기</a>
<button onclick="#" class="btn btn-default pull-right">등록</button>

</div>
</div>
</body>
</html>