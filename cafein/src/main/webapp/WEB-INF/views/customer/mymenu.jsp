<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function () {
    $(".test").click(function (e) {
    	e.preventDefault();
        $("#thedialog").load($(this).attr("href"));
        $("#somediv").dialog({
            width: 800,
            height: 800,
            modal: true,
            close: function () {
                $("#thedialog").attr('src', "about:blank");
            }
        });
        
        return false;

    });
});
$(window).resize(function() {
	//메소드명 입력.
	somediv();
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
<img src="${pageContext.request.contextPath}/image/coffee1.jpg" width="200" heigh="200" onclick = "location.href='${pageContext.request.contextPath}/mymenudetail.do'"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="myMenu1" value="myMenu1"  >아메리카노 ,알렉산더

</div>
</body>
</html>