<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>매장별 적립금</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	
	
	$(function(){
		getListReserve();
	});
	
	//마일리지 리스트 
	function getListReserve() {
		$.ajax({
			url : "getListReserve.do",
			data : {cId: "ju123"},
			type : "GET",
			datatype : "json",
			success : function(data) {
				$("#reservetable tbody").empty();
				console.log(data);
				$.each(data,function(idx,item){
				orderdate = new Date(item.dates);
				
					$('<tr>')
					.append($('<td>').html(orderdate.toLocaleDateString()))
					.append($('<td>').html(item.sName))
					.append($('<td>').html(item.mileAge))
					.appendTo('#reservetable tbody');
				});
				
			}
		})
	};
	
	
</script>
</head>
<body>
	<h2 align="center">나의 적립금 현황</h2>
	<hr>
	 <p align="center"><b>회원님의 적립금은</b></p>
	<div class = "container" align="center" >
	 <table class = "table" >
			<tr>
				<th>총 적립금</th>
				<td>1.500 point</td>
				<th>사용된 적립금</th>
				<td>500 point</td>
			</tr>
			
		</table>
		</div>
	<hr><br>
	<div class = "container" align="center">
		<table id ="reservetable" class = "table">
			<thead>
			<tr>
				<th width=250>날짜</th>
				<th width=250>매장명</th>
				<th width=250>마일리지 내역</th>
			</tr> 
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<p align="center"><button type="button"  class="btn btn-default"
	 onclick = "location.href='customermainform.do'">돌아가기</button></p>
</body>
</html>