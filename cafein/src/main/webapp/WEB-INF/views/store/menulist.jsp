<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Insert title here</title>
<script type="./js/json.min.js"></script>
<script>
$(function(){
	
	$('#toggleTable').hide();
	
	$("#menuTable tbody tr").click(function(){
		$('#list').empty();
		$('#toggleTable').show();
		var str="";
		var tdArr = new Array();
		
		var tr = $(this);
		var td = tr.children();
		
		console.log("row: "+tr.text());
		
		var mNum = td.eq(0).text();
		var mName = td.eq(1).text();
		var mPrice = td.eq(2).text();
		var mCate = td.eq(3).text();
		var saleState = td.eq(4).text();
		var menuState = td.eq(5).text();
		
		if(mCate=='CACO'){mCate="coffee";}
		else if(mCate=='CADR'){mCate="drink";}
		else if(mCate=='CADE'){mCate="desert";}
		else if(mCate=='CAOP'){mCate="option";}
		console.log("sale : "+saleState);
		console.log("menu : "+menuState);
		$("#mNum").val(mNum);
		$("#mName").val(mName);
		$("#mPrice").val(mPrice);
		$("#mCategory").val(mCate);
		$('input[name="salestate"]').removeAttr('checked');
		$("input:radio[name=salestate]:input[value='"+saleState+"']").attr("checked", true);
		$('input[name="menustate"]').removeAttr('checked');
		$("input:radio[name=menustate]:input[value='"+menuState+"']").attr("checked", true);
		
	})
	

	function menuUpdate(){
		$("#btnUpdate").on('click',function(){
			$.ajax({
				url: "menues",
				type: 'PUT',
				dataType: 'json',
				data: JSON.stringify($("#menudetail").serializeObject()),
				contentType: 'application/json',
				success: function(data) { 
					alert("ty");
				
				
				
				}
				
			});
		
		});
		
	}//menuUpdate
	
});




</script>
</head>
<body>

	<div>

		<!-- 메뉴 CRUD -->
		<div style="float: left; width: 50%; border: 1px solid pink;">
			
			<!-- 메뉴 List-->
			<div>
				<h3>[메뉴 목록]</h3>
				<form action="#">
					<table border="1" id="menuTable">
						<thead>
							<tr>
								<th>메뉴 번호</th>
								<th>메뉴 이름</th>
								<th>메뉴 가격</th>
								<th>카테고리</th>
								<th>판매 상태</th>
								<!-- 메뉴 판매 가능상태?(ex,계절메뉴) -->
								<th>메뉴 상태</th>
								<!-- sold out -->
								<th>삭제 체크</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${storemenu}" var="menu">
							<tr>
								<!-- ****tr 1번 클릭 시, 레시피 상세조회 페이지가 등장 -->
								<!-- ****tr 2번 더블 클릭 시, 메뉴 상세조회 페이지가 등장 -->
								<td>${menu.mNum}</td>
								<td>${menu.mName}</td>
								<td>${menu.mPrice}</td>
								<td>${menu.caNum}</td>
								<td>${menu.mStat}</td>
								<td>${menu.menuSale}</td>
								<td><input type="checkbox"></td>
							</tr>
							
						</c:forEach>
							
						</tbody>
					</table>
					
					<input type="button" value="추가">
					<input type="submit"value="삭제">
					
					<!-- 체크된 항목 삭제 -->
				</form>
				<button id="menuSelect">수정</button>
			</div>

			
			
			<!-- 상세조회&수정 -->
			<div style="border: 1px solid orange; margin: 3px" id="toggleTable">
				<h3>[메뉴 상세 추가/조회/수정]</h3>

				<form id="menudetail">
					<table border="1">


						<tr>
							<th>메뉴 번호</th>
							<td><input type="text" id="mNum" name="" readonly></td>
						</tr>
						<tr>
							<th>메뉴 이름</th>
							<td><input type="text" id="mName" name="" ></td>
						</tr>
						<tr>
							<th>메뉴 가격(원)</th>
							<td><input type="text" id="mPrice" name="" ></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td><select id="mCategory" name="values">
									<option value="">선택</option>
									<option value="coffee">커피</option>
									<option value="drink">음료</option>
									<option value="desert">디저트</option>
									<option value="option">옵션</option>
							</select></td>
						</tr>

						<tr>
							<th>판매 상태</th>
							<td>
							<input type="radio" id="salestate" name="salestate" value="A1">판매 가능
							<input type="radio" id="salestate" name="salestate" value="A2">sold out</td>
						</tr>
						<tr>
							<th>메뉴 상태</th>
							<td>
							<input type="radio" id="menustate" name="menustate" value="Y">Y
							<input type="radio" id="menustate" name="menustate" value="N">N</td>
							
						</tr>
							<tr>
								<th>메뉴 사진</th>
								<td><input type="file" value="파일 선택" name="file" /></td>
							</tr>
					</table>
					<input type="button" value="확정" id="btnUpdate">
					<input type="button" value="취소" id="btnCancle">
				</form>
			</div>

		</div>




		<!-- 레시피 CRUD-->
		<div style="float: left; border: 1px solid pink;">
			<!-- 레시피 등록, 메뉴 하나 Select된 상태에서 레시피 레시피 조회가능, 등록 버튼 활성화 -->

			<!-- Recipe Detail List로 표현-->
			<div style="border: 1px solid gray;">
				<h3>상세 레시피</h3>
				<table border="1">
					<tr>
						<th>메뉴 번호</th><td><input type="text" value="ME006" readonly></td>
					</tr>
							<tr>
								<th>메뉴 이름</th><td><input type="text" value="카페 모카" readonly></td>
							</tr>
						</table>
						
						<h4>재료 추가</h4>
						<select name="stock">
										<option value="coffeebean">원두</option>
										<option value="milk">우유</option>
										<option value="soymilk">두유</option>
								</select> <input type="text" value="1">
									
									<button onclick="#">+</button>
									<button onclick="#">-</button>
				<table border="1">

					<tr>
						<th>재료명</th>
						<th>소모량</th>
						<th>재료 적정수량</th>
						<th>기준 단위</th>
					</tr>

					<tbody>
					<tr>
						<td>원두</td>
						<td>0.015</td>
						<td>0.015</td>
						<td>1</td>
						</tr>
						<tr>
						<td>우유</td>
						<td>0.25</td>
						<td>0.25</td>
						<td>1</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 수정 버튼 누르면 수정가능하게 action  -->
			<button onclick="#">수정</button>

		</div>
	</div>



</body>
</html>