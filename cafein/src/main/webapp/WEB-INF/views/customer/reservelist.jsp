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
// 	//사용된 적립금 
// 	function getUseReserve() {
// 		$.ajax({
// 			url : "getUseReserve.do",
// 			data : {cId : "ju123", sId : "SH001"},
// 			type :"GET",
// 			datatype : "json",
// 			success : function(data) {
// 				console.log(data)
// 				$("reservetable1 tbody").empty();
// 				$.each(data, function(idx, item){
// 					$('<tr>')
// 					.append($('<td>').html(item.usere))
// 					.appendTo('#reservetable1 tbody');
// 				});
// 			}
// 		})
// 	};
		var cId = '<%= session.getAttribute("cId") %>';
		
		var sId = '<%= session.getAttribute("sId")%>';

	//총적립금 리스트와 사용한 리스트
	function getTotalReserve() {
		$.ajax({
			url : "getTotalReserve.do",
			data : {cId : cId, sId : sId},
			type : "GET",
			datatype : "json",
			success : function(data) {
				console.log(data);
				$("#reservetable1 tbody").empty();
				$.each(data,function(idx,item){
					$('<tr>')
					.append($('<td>').html(item.totalre))
					.append($('<td>').html(item.usere))
					.appendTo('#reservetable1 tbody');
				});
			}
		})
	};
	//마일리지 리스트 
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
					$('<tr>')
					.append($('<td>').html(orderdate.toLocaleDateString()))
					.append($('<td>').html(item.sName))
					.append($('<td>').html(item.mileAge))
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
	<h2 align="center">나의 적립금 현황</h2>
	<hr>
	 <p align="center"><b>회원님의 적립금은</b></p>
	<div class = "container" align="center" >
	 <table id="reservetable1" class = "table" >
			<thead>
			<tr>
				<th>총 적립금</th>	
				<th>사용된 적립금</th>
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