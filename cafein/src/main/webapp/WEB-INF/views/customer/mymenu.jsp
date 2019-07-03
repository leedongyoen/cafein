<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
	#thedialog{
			border: 5px solid black;
			background-color: #FFFFFF;
		}
	@media (max-width: 480px){
		#thedialog{
		width: auto;
		float: none;
		
		}
	}
	
}
</style>
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
		.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
		.append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
		.append($('<input type=\'hidden\' id=\'hidden_userId\'>').val(item.id))
		.appendTo('tbody');
	});//each
	}
$(document).ready(function () {
    $(".test").click(function (e) {
    	e.preventDefault();
        $("#thedialog").load($(this).attr("href"));
        $("#somediv").dialog({
            width: '70%',
            height: '20%',
            modal: true,
            close: function () {
                $("#thedialog").attr('src', "about:blank");
            }
        });
        
        return false;

    });
});

</script>
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

<a href="${pageContext.request.contextPath}/mymenudetail.do" class="test btn"><img src="${pageContext.request.contextPath}/image/coffee1.jpg" width="200" heigh="200"></a><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="myMenu1" value="myMenu1"  >아메리카노 ,알렉산더
</div>
</body>
</html>