<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style type="text/css">

body {font-family: Arial, Helvetica, sans-serif;}

#myImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: absolute; /* Stay in place */
   z-index: 10000; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  width: 50%; /* Full width */
  height: 50%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: #ffffff; /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 50%;
}


/* Add Animation */
.modal-content, #caption {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}


</style>

</head>
<body>
<h1 align="center">나만의 메뉴</h1><hr>
<br>
<div class = "container">
<div align = "right">

<a href="${pageContext.request.contextPath}/mymenuregi.do" class="test btn">추가</a><br>
<div id="somediv" title="" style="display:none;">
    <div id="thedialog"></div>
</div>

<button>삭제</button>
</div>
<table class="table text-center">
<thead>
		<tbody></tbody>
</table>

<img id="myImg" src="image/coffee1.jpg" width="200" heigh="200"></a><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="myMenu1" value="myMenu1"  >아메리카노 ,알렉산더
</div>



<!--모달 나만의 메뉴-->
<div id="myModal" class = "modal">
		<h1 align="center">나만의메뉴상세</h1>
		<table class = "table table-hover">
		<tr>
			<th>매 장 명</th>
			<td>(매장명)</td>
		</tr>
		<tr>
			<th>메 뉴 명</th>
			<td>(상품명)</td>
		</tr>
		<tr>
			<th>가 격</th>
			<td>(가격)</td>
		</tr>
		<tr>
			<th>HOT/ICE</th>
			<td><input type="radio" name="type" value="hot" id="hot" checked> 
				<label for="hot">HOT</label> 
				<input type="radio" name="type" value="ice" id="ice"> <label for="ice">ICE</label>
			</td>
		</tr>
		<tr>
			<th>옵  션</th>
			<td>
			<input type="checkbox" name="option" value="whipping" /> <label for="whipping">휘핑크림 추가(+500원)</label><br>
			<input type="checkbox" name="option" value="shot" />	 <label for="shot">1샷 추가(+500원)</label><br>
			<input type="checkbox" name="option" value="syrup" /> <label for="syrup">시럽 추가(+0원)</label>
			</td>
		</tr>
		<tr>
			<th>총 금 액</th>
			<td>(총금액값)</td>
		</tr>
	</table>
	<br>
	<div align ="right">
	<button class="btn btn-default " onclick="location='Order.jsp'">주문</button>&nbsp;&nbsp;
	<button class="btn btn-default " onclick="location='cusCart.jsp'">담기</button>&nbsp;&nbsp;
	<button class="btn btn-default " onclick="location='???????'">수정</button>&nbsp;&nbsp;
	<a href="javascript:history.go(-1)" class="btn btn-default ">돌아가기</a>
	</div>
	<span class="close">&times;</span>
	</div>
<script type="text/javascript">

function myMenuList(){
	$.ajax({
		url:'../mymenu.do',
		type:'GET',
		dataType:'json',
		error:function(xhr,status,msg){
		alert("상태값 :" + status + " Http에러메시지 :"+msg);
	},
	success:myMenuListResult
	})
}
function myMenuListResult(data) {
	$("tbody").empty();
	$.each(data,function(data,item){
		$('<tr>')
		.append($('<td>').html(item.image))
		$('<tr>')
		.append($('<td>').html(item.mMum))
		.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
		.appendTo('tbody');
	});//each
	}

//Get the modal
var modal = document.getElementById("myModal");

//Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById("myImg");
img.onclick = function(){
modal.style.display = "block";
}

//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//When the user clicks on <span> (x), close the modal
span.onclick = function() { 
modal.style.display = "none";
}
</script>
</body>
</html>

