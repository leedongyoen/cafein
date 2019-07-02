<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>

<title>Insert title here</title>
</head>
<body>
<br>

<div class="container">
	<!-- 매장 선택 -->
	<div class="dropdown" style="width:100%">
		<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">매장 선택
  			<span class="caret"></span>
  		</button>
  		<ul class="dropdown-menu">
  			<li><a id="cafelin" href="#">카페 린</a></li>
    		<li><a id="cafeex1" href="#">카페 예시1</a></li>
    		<li><a id="cafeex2" href="#">카페 예시2</a></li>
  		</ul>
	
	
	</div>
	<hr>
	
	<input class="form-control" id="myInput" type="text" placeholder="Search..">
	
	<hr>
	
	<!-- 메뉴 선택 -->
	<!-- Nav tabs -->
  <ul id="topclick" class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#coffee">커피</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#beverage">음료</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#bakery">베이커리</a>
    </li>
  </ul>

  <!-- Tab panes -->
	<div class="tab-content">
		<div id="coffee" class="container tab-pane active"><br>
			<table class="table">
			<thead>
				<tr><th>사진</th><th>메뉴명</th><th>가격</th></tr>
				</thead>
				<tbody id="searchTable">
				<tr data-toggle="modal" id="openmodal">
					<td>사진넣기</td>
					<td>아메리카노</td>
					<td>4100원</td>
				</tr>
			
				<tr>
					<td>사진넣기</td>
					<td>카페라떼</td>
					<td>5000원</td>
				</tr>
				<tr>
					<td>사진넣기</td>
					<td>카페모까</td>
					<td>5000원</td>
				</tr>
			</tbody>
			</table>
  		</div>
   		<div id="beverage" class="container tab-pane fade"><br>
    		<table class="table">
    			<thead>
				<tr><th>사진</th><th>메뉴명</th><th>가격</th></tr>
				</thead>
				<tbody id="searchTable">
				<tr>
					<td>사진넣기</td>
					<td>딸기에이드</td>
					<td>5100원</td>
				</tr>
				<tr>
					<td>사진넣기</td>
					<td>딸기스무디</td>
					<td>5500원</td>
				</tr>
				<tr>
					<td>사진넣기</td>
					<td>녹차</td>
					<td>5000원</td>
				</tr>
				</tbody>
			</table>
   		</div>
   		<div id="bakery" class="container tab-pane fade"><br>
     		<table class="table">
     			<thead>
				<tr><th>사진</th><th>메뉴명</th><th>가격</th></tr>
				</thead>
				<tbody id="searchTable">
				<tr>
					<td>사진넣기</td>
					<td>베이글</td>
					<td>3500원</td>
				</tr>
				<tr>
					<td>사진넣기</td>
					<td>딸기케이크</td>
					<td>5500원</td>
				</tr>
				</tbody>
			</table>
   		</div>
 	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" id="menudetailModal" role="dialog">
		<div class="modal-dialog">
		
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">메뉴</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<form class="form-borizontal" action="#" method="POST">
						<table class="table">
							<tr>
								<th>STORE NAME</th>
								<td><input type="text" id="sName" name="sName" value="매장명" readonly="readonly"></td>
							</tr>
							
							<tr>
								<th>MENU NAME</th>
								<td><input type="text"  id="mName" name="mName" readonly="readonly"></td>
							</tr>
							<tr>
								<th>PRICE</th>
								<td><input type="text" id="price" name="price" readonly="readonly">&nbsp;&nbsp;
									<button type="button" onclick="add(1)">+</button> <span id="no">1개 </span>
									<button type="button" onclick="add(-1)">-</button>
								</td>
								
							</tr>
							<tr>
								<th>HOT/ICE</th>
								<td><input type="radio" name="hotice" value="hot" checked="checked">hot
									<input type="radio" name="hotice" value="ice">ice</td>
							</tr>
							<tr>
								<th>OPTION</th>
								<td><input type="checkbox" name="whipping" value="whipping">휘핑크림 추가(+500)<br>
									<input type="checkbox" name="syrup" value="syrup">시럽 추가(+500)<br>
									<input type="checkbox" name="shot" value="shhot">샷 추가(+500)</td>
							</tr>
							<tr>
								<th>TOTAL PRICE</th>
								<td><input type="text" name="totalPrice" readonly="readonly"></td>
							</tr>
						</table>
					</form>
				
				</div>
				<div class="modal-footer">	
					<button type="button" class="btn btn-default" >주문</button>	
					<button type="button" class="btn btn-default" >담기</button>			
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	
	// 한 행 클릭시
	$("#openmodal").on("click",function(){
		$('#mName').val($(this).children().eq(1).text());
		$('#price').val($(this).children().eq(2).text());
		$('#menudetailModal').modal('show');
	});
	
	function add(num) {
		var price = $('#price').val();
		var v_totalprice =price;
		if (num == -1) {
			if (no == 1) {
				alert("1개 이상으로 주문해주세요.");
				return;
			}
			no--;
			v_totalprice = v_totalprice - price;
		} else if (num == 1) {
			no++;
			v_totalprice = priv_totalpricece + price;
		}
		$('#price').val(v_totalprice);
		$('#no').val(no+"개");

	}
	
	
	// 검색
  	$("#myInput").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#searchTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
  
  
});
</script>

</body>
</html>