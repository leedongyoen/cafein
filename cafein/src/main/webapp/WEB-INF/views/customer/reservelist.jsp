<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="cushead.jsp" %>
<title>매장별 적립금</title> 
<style type="text/css">
body{ 
			background: url(image/cusstoreselect.jpg) no-repeat center center fixed; 
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
}
.reservelist{
	background-color: #F2F2F2;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">

	var cId = '<%= session.getAttribute("cId") %>';
		
	//총 적립금과 사용한 적립금 남은적립금 리스트
	function getTotalReserve() {
		$.ajax({
			url : "getTotalReserve.do",
			data : {cId : cId},
			type : "GET",
			datatype : "json",
			success : function(data) {
				console.log(data);
				$("#reservetable1 tbody").empty();
				$.each(data,function(idx,item){
					$('<tr>')
					.append($('<td>').html(item.toto))
					.append($('<td>').html(item.uuu))
					.append($('<td>').html(item.rere))
					.appendTo('#reservetable1 tbody');
				});
			}
		})
	};
	//사용한 마일리지 내역 리스트 
	function getListReserve() {
		$.ajax({
			url : "getListReserve.do",
			data : {cId: cId},
			type : "GET",
			datatype : "json",
			success : function(data) {
				$("#reservetable tbody").empty();
				console.log(data);
				$.each(data,function(idx,item){
				orderdate = new Date(item.dates);
				enddates = new Date(item.enddate);
					$('<tr>').attr("class","reservelist")
					.append($('<td>').html(orderdate.toLocaleDateString()))
					.append($('<td>').html(item.sName))
					.append($('<td>').html(item.mileAge))
					.append($('<td>').html(enddates.toLocaleDateString()))
					.appendTo('#reservetable tbody');
				});
				
			}
		})
	};
	//객체를 호출하는 부분.
	$(function(){
		getListReserve();
		
		getTotalReserve();
		
	//	getUseReserve();
		
	});
</script>
</head>
<body>
	<hr>
		<div class="titlefont" align="center">나의적립금 현황</div>
	<hr>
	 <h5 align="center"><b>회원님의 적립금은</b></h5>
	<div class = "container" align="center" >
	 <table id="reservetable1" class = "table table-hover" >
			<thead>
			<tr class="tableth">
				<th>총 적립금</th>	
				<th>사용된 적립금</th>
				<th>남은 적립금</th>
			</tr>
			</thead>
			<tbody>
			</tbody>
<!-- 				<th>사용된 적립금</th> -->
<!-- 				<td>500 point</td> -->
<!-- 			</tr> -->			
		</table>
		</div>
	<br>
		 <h5 align="center"><b>적립금 리스트</b></h5>
	<div class = "container" align="center">
		<table id ="reservetable" class="table table-hover">
			<thead>
			<tr>
				<th width=250>날짜</th>
				<th width=250>매장명</th>
				<th width=250>마일리지 내역</th>
				<th width=250>만료날짜</th>
			</tr> 
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<p align="center"><button type="button"  class="btn btn-success"
	 onclick = "location.href='customermainform.do'">돌아가기</button></p>
</body>
</html>