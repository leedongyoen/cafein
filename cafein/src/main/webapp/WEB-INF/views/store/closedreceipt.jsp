<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Closed Receipt</title>
<style>
ul {
	list-style: none;
	width:450px;
	margin-left: auto;
  	margin-right: auto;
}
li {
	width:450px;
}
hr {
	width:400;
	align:left;
}
span {
	display:inline-block;
	width:300px;
}
.sales {
	width:175px;
}
p {
	text-align:center;
}
</style>
</head>
<body>
<ul>
	<hr>
	<li>
		<p>*** <%= session.getAttribute("sName") %> 마감 결과 ***</p>
	</li>
	<hr>
	<!-- 오픈, 마감 일시 -->
	<li>
		<span>오픈일시</span>
		<label></label>
	</li>
	<li>
		<span>마감일시</span>
		<label></label>
	</li>
	<hr>
	<!-- 매출 -->
	<li>
		<span class="sales">현금</span>
		<span class="sales"></span>
		<label></label>
	</li>
	<li>
		<span class="sales">카드</span>
		<span class="sales"></span>
		<label></label>
	</li>
	<li>
		<span class="sales">포인트사용</span>
		<span class="sales"></span>
		<label></label>
	</li>
	<li>
		<span class="sales">포인트적립</span>
		<span class="sales"></span>
		<label></label>
	</li>
	<hr>
	<li>
		<span>총매출</span>
		<label></label>
	</li>
	<hr>
	<!-- 시재 -->
	<li>
		<p>현금 결제 건</p>
	</li>
	<li>
		<span>현금시재</span>
		<label></label>
	</li>
	<li>
		<span>현금매출</span>
		<label></label>
	</li>
	<li>
		<span>준비금</span>
		<label></label>
	</li>
	<li>
		<span>영업지출금</span>
		<label></label>
	</li>
	<li>
		<span>포인트사용</span>
		<label></label>
	</li>
	<hr>
	<li>
		<span>순수익</span>
		<label></label>
	</li>
	<hr>
	<li>
		<span>차액</span>
		<label></label>
	</li>
	<hr>
</ul>
</body>
</html>