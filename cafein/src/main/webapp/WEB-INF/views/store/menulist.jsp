<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Insert title here</title>

</head>
<body>

	<div>

		<!-- 메뉴 CRUD -->
		<div style="float: left; width: 50%; border: 1px solid pink;">
			
			<!-- 메뉴 List-->
			<div>
				<h3>[메뉴 목록]</h3>
				<form action="#">
					<table border="1">
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
						
							<tr onclick="">
								<!-- ****tr 1번 클릭 시, 레시피 상세조회 페이지가 등장 -->
								<!-- ****tr 2번 더블 클릭 시, 메뉴 상세조회 페이지가 등장 -->
								<td>ME006</td>
								<td>카페 모카</td>
								<td>5000</td>
								<td>커피</td>
								<td>Y</td>
								<td>사용 가능</td>
								<td><input type="checkbox"></td>
							</tr>
							<tr onclick="">
								<!-- tr 누를경우 상세조회 페이지가 등장 -->
								<td>ME008</td>
								<td>카라멜 마끼야또</td>
								<td>5600</td>
								<td>커피</td>
								<td>Y</td>
								<td>사용 가능</td>
								<td><input type="checkbox"></td>
							</tr>
							<tr onclick="">
								<!-- tr 누를경우 상세조회 페이지가 등장 -->
								<td>ME010</td>
								<td>녹차 라떼</td>
								<td>4200</td>
								<td>음료</td>
								<td>Y</td>
								<td>사용 가능</td>
								<td><input type="checkbox"></td>
							</tr>
							<tr onclick="">
								<!-- tr 누를경우 상세조회 페이지가 등장 -->
								<td>ME013</td>
								<td>자몽 에이드</td>
								<td>5000</td>
								<td>음료</td>
								<td>Y</td>
								<td>사용 가능</td>
								<td><input type="checkbox"></td>
							</tr>
							<tr onclick="">
								<!-- tr 누를경우 상세조회 페이지가 등장 -->
								<td>ME015</td>
								<td>망고 스무디</td>
								<td>3800</td>
								<td>음료</td>
								<td>Y</td>
								<td>사용 가능</td>
								<td><input type="checkbox"></td>
							</tr>
							<tr onclick="">
								<!-- tr 누를경우 상세조회 페이지가 등장 -->
								<td>ME016</td>
								<td>프레즐</td>
								<td>2500</td>
								<td>디저트</td>
								<td>Y</td>
								<td>사용 가능</td>
								<td><input type="checkbox"></td>
							</tr>
							<tr onclick="">
								<!-- tr 누를경우 상세조회 페이지가 등장 -->
								<td>ME019</td>
								<td>초코케이크</td>
								<td>5500</td>
								<td>디저트</td>
								<td>Y</td>
								<td>사용 가능</td>
								<td><input type="checkbox"></td>
							</tr>
						</tbody>
					</table>
					<input type="button" value="추가"> <input type="submit"
						value="삭제">
					<!-- 체크된 항목 삭제 -->
				</form>
			</div>


			<!-- 상세조회&수정 -->
			<div style="border: 1px solid orange; margin: 3px">
				<h3>[메뉴 상세 추가/조회/수정]</h3>

				<form action="">
					<table border="1">


						<tr>
							<th>메뉴 번호</th>
							<td><input type="text" value="ME006" readonly></td>
						</tr>
						<tr>
							<th>메뉴 이름</th>
							<td><input type="text" value="카페 모카"></td>
						</tr>
						<tr>
							<th>메뉴 가격(원)</th>
							<td><input type="text" value="5000"></td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td><select name="VALUES">
									<option value="">선택</option>
									<option value="coffee">커피</option>
									<option value="veberage">음료</option>
									<option value="desert">디저트</option>
							</select></td>
						</tr>
						<tr>
							<th>판매 상태</th>
							<td><input type="radio" name="salestate" value="Y" checked>Y
								<input type="radio" name="salestate" value="N">N</td>
						</tr>
						<tr>
							<th>메뉴 상태</th>
							<td><input type="radio" name="menustate" value="Y" checked>Y
								<input type="radio" name="menustate" value="N">N</td>
						</tr>
							<tr>
								<th>메뉴 사진</th>
								<td><input type="file" value="파일 선택" name="file" /></td>
							</tr>
					</table>
					<input type="submit" value="확정">
					<input type="button" value="취소">
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