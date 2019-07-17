<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp"%>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style type="text/css">
body {
	font-family: Arial, Helvetica, sans-serif;
}

#myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

#myImg:hover {
	opacity: 0.7;
}

/* The Modal (background) */
@media screen and (min-width: 768px) {
	.modal {
		top: 30%;
		display: none;
		height: 80%;
		left: 425px;
		width: 50%;
		overflow: auto;
		vertical-align: middle;
	}
	/* .modal {
  display:  /* Hidden by default */
	position
	:
	 
	fixed
	; /* Stay in place */
	
  
	left
	:
	50%;
	
  
	margin-left
	:
	 
	-20%; /* half of width */
	height
	:
	 
	300
	px
	;
	
  
	top
	:
	 
	50%;
	margin-top
	:
	 
	-150
	px
	; /* half of height */
	/*  padding-top: auto; /* Location of the box */
	*
	/
	
  
	width
	:
	 
	50%; /* Full width */
	height
	:
	 
	50%; /* Full height */
	overflow
	:
	 
	auto
	; /* Enable scroll if needed */
	
  
	background-color
	:
	 
	#ffffff
	; /* Fallback color */
	

}

*/
	/* Modal Content (image) */ 
.modal-content {
	margin: auto;
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}

/* Add Animation */
.modal-content, #caption {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

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

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}
}
</style>

</head>
<body>
	<h1 align="center">나만의 메뉴</h1>
	<hr>
	<br>	
	<div class="container">
		<div id="play" align="right">

			<a href="${pageContext.request.contextPath}/customerstorelist.do"
				class="test btn">추가</a>
				<a class="test btn" href="javascript:deleteMymenu()" id="deletemymenu">삭제</a>
				<br>
			<div id="somediv" title="" style="display: none;">
				<div id="thedialog"></div>
			</div>

		</div>
		<table class="table text-center">

			<tbody id="GoToDetail"></tbody>
</table>
<div class="deleteCheckon" align="right">
<a class="deletetest btn" href="javascript:deleteMymenu()" id="deletemymenuon">삭제하기</a>
<a class="offtest btn" href="javascript:deleteMymenu()" id="offtest">돌아가기</a>
</div>
</div>




<!--모달 나만의 메뉴-->
<div id="myModal" class="modal">
<div class="modal-content">
		<h1 align="center">나만의메뉴상세</h1>
		<input type="text" name="qty" value="1" style="display: none;">
		<table id="detailtable" class="table table-hover">
		<tr>
			<th>매 장 명</th>
			<td><input type="text" id="sName" name="sName"
						readonly="readonly"></td>
		</tr>
		<tr>
			<th>메 뉴 명</th>
			<td><input type="text" id="mName" name="mName"
						readonly="readonly"></td>
		</tr>
		
		<tr>
			<th>가 격</th>
			<td><input type="text" id="mPrice" name="mPrice"
						readonly="readonly"></td>
		</tr>
		<tr>
			<th>수 량</th>
			<td>
			
				<button onclick="add(-1)">-</button>
				<span id="no">1 </span>
				<button onclick="add(1)">+</button>
			</td>
		</tr>
		<tr>
			<th>HOT/ICE</th>
			<td><input type="radio" name="type" value="hot" id="hot" checked> 
				<label for="hot">HOT</label> 
				<input type="radio" name="type" value="ice" id="ice"> <label
						for="ice">ICE</label>
			</td>
		</tr>
		<tr>
			<th>옵  션</th>
			<td>
			<input type="checkbox" name="mNum" value="ME021" /> <label for="whipping">휘핑크림 추가(+500원)</label><br>
			<input type="checkbox" name="mNum" value="ME022" />	 <label for="shot">1샷 추가(+500원)</label><br>
			<input type="checkbox" name="mNum" value="ME023" /> <label for="syrup">시럽 추가(+0원)</label>
			</td>
		</tr>
		<tr>
			<th>총 금 액</th>
			<td><input type="text" id="totalPrice" name="totalPrice"
						readonly="readonly"></td>
		</tr>
	</table>
	<br>
	<div align="right">
	<button class="btn btn-default " onclick="location='Order.do'">주문</button>&nbsp;&nbsp;
	<button class="btn btn-default " onclick="location='cusCart.do'">담기</button>&nbsp;&nbsp;
	</div>
	<span class="close">&times;</span>
	</div>
	</div>
<script type="text/javascript">

	var datas;
	var totalcheckboxnum;
	
	//화면에 뿌리기.
	function myMenuList() {
		$.ajax({
			url : 'customer/',
			type : 'GET',
			dataType : 'json',
			error : function(xhr, status, msg) {
				alert("상태값 :" + status + " Http에러메시지 :" + msg);
			},
			success : function myMenuListResult(data){
				console.log("in");
				datas=data;
				var imgurl = "${pageContext.request.contextPath}/image/"+itme.uploadFileName;
				$("#GoToDetail").empty();
				$.each(data, function(idx, item) {

				$("#GoToDetail").append("<td onclick=detailmyMenuListResult"+"('"+item.cuNum+"'"
									+")><div class='container'><img id=\"imgurl\" style=\"width:200px; height:200px;\"></div><div class='container'>"
									+item.mName+"</div><div class='container'>"+item.sName
									+"</div></td><td><div class=\"deleteCheck\"><input type='checkbox' name=\"checkDel\" id='hidden_cuNum"+idx+"'value='"
									+item.cuNum+"'></div></td>");
				})
				$(".deleteCheck").hide();
				$(".deleteCheckon").hide();
			}
		});
	}
	// 세부화면 모달창
	function detailmyMenuListResult(cuNum) {
		console.log(cuNum);
		modal.style.display = "block";
		$("#detailtable table").empty();
		$.each(datas, function(data, item) {
			if(item.cuNum == cuNum){
				var opNum = item.opNum;
				var s = opNum.split(",");
					console.log(s);
 				$("#cuNum").val(item.cuNum);
				$("#sName").val(item.sName);
				$("#mName").val(item.mName);
				$("#mPrice").val(item.mPrice);
				$("input:checkbox[name=mNum]").val(s);
				$("#totalPrice").val(item.mPrice);
			}
		})
	};
	//삭제창
	function deleteMymenu(cuNum) {
		$(".deleteCheckon").show();
		$(".deleteCheck").show();
		$("#deletemymenuon").on("click",function(){
			if(confirm("삭제하시겠습니까??")){
				var checked = [];
				$('input[name=checkDel]:checked').each(function(idx, item){
					checked.push(item.value);
				});
				console.log(checked);
				$.ajax({
					url : 'customer',
					type : 'DELETE',
					dataType : 'json',
					data: JSON.stringify({ cuNumList: checked}),
					contentType: 'application/json',
					error : function(xhr, status, msg) {
						alert("상태값 :" + status + " Http에러메시지 :" + msg);
					},
					success :function(data) {
							myMenuList();
							
					}
				});
			}
		});
		$("#offtest").on("click",function(){
			myMenuList();
		});
	};
	
	
	
	//수량
	function add(num) {
		var price = $('#mPrice').val();
		var v_totalprice = $('#totalPrice').val();

		var no = $("#no").html();
		if (num == -1) {
			if (Number(no) == 1) {
				alert("1개 이상으로 주문해주세요.");
				return;
			}
			no = Number(no) - 1;
			v_totalprice = Number(v_totalprice) - Number(price);
		} else if (num == 1) {
			no = Number(no) + 1;
			v_totalprice = Number(v_totalprice) + Number(price);
		}
		$('#totalPrice').val(v_totalprice);
		$("#no").html(no);
		$('input:text[name="qty"]').val(no);
	}
	//커스텀 수정
	
	
	
	
	//Get the modal
	var modal = document.getElementById("myModal");

	

	//Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	//When the user clicks on <span> (x), close the modal
	span.onclick = function() {
		modal.style.display = "none";
	}

	$(window).resize(function() {
		modal;
	});
</script>
</body>
</html>

