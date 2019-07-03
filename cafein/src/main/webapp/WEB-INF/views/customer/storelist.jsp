<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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

	<button id="selectStore">매장 선택</button>
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
			<div class="table-responsive">
			<table id="coffeetable" class="table">
			<thead>
				<tr><th>사진</th><th>메뉴명</th><th>가격</th></tr>
				</thead>
				<tbody id="searchTable">
				
			</tbody>
			</table>
			</div>
  		</div>
   		<div id="beverage" class="container tab-pane fade"><br>
    		<table id="beveragetable" class="table">
    			<thead>
				<tr><th>사진</th><th>메뉴명</th><th>가격</th></tr>
				</thead>
				<tbody id="searchTable">
				
				</tbody>
			</table>
   		</div>
   		<div id="bakery" class="container tab-pane fade"><br>
     		<table id="bakerytable" class="table">
     			<thead>
				<tr><th>사진</th><th>메뉴명</th><th>가격</th></tr>
				</thead>
				<tbody id="searchTable">
				
				</tbody>
			</table>
   		</div>
 	</div>
	
	
	<!-- 메뉴 선택하면 나오는 Modal -->
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
								<td><input type="text" id="sName" name="sName" readonly="readonly"></td>
							</tr>
							
							<tr>
								<th>MENU NAME</th>
								<td><input type="text"  id="mName" name="mName" readonly="readonly"></td>
							</tr>
							<tr>
								<th>PRICE</th>
								<td><input type="text" id="price" name="price" readonly="readonly">&nbsp;&nbsp;
									<button type="button" onclick="add(1)">+</button> <span id="ordernum">1</span>
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
								<td><input type="text" id="totalPrice" name="totalPrice" readonly="readonly"></td>
							</tr>
						</table>
					</form>
				
				</div>
				<div class="modal-footer">	
					<button type="button" class="btn btn-default" >나만의 메뉴 등록</button>	
					<button type="button" class="btn btn-default" >주문</button>	
					<button type="button" class="btn btn-default" >담기</button>			
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 매장 선택  Modal -->
	<div class="modal fade" id="storelistmodal" role="dialog">
		<div class="modal-dialog">		
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">매장</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					
					<form class="form-borizontal" action="#" method="POST">
						<input class="form-control" id="storeserch" type="text" placeholder="Search..">
						<div class="table-responsive">
						<table class="table">
							<tr>
								<th></th>
								<th>STORE NAME</th>
								<th>STORE ADDRESS</th>
								<th>STORE DISTANCE</th>
							</tr>
							
							<tbody id="storetable">
							<c:forEach	items="${storelist}" var="store">									
							<tr onclick="menuList('${store.sid}','${store.sname}')">
								<td><input type="hidden" name="sid" value="${store.sid}"></td>
								<td>${store.sname}</td>
								<td>${store.sadd}</td>
								<td>구해야됨</td>
							</tr>
							</c:forEach>
							</tbody>
						</table>
						</div>
					</form>
				
				</div>
				<div class="modal-footer">		
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	
	var storename;

	function menuList(sid,sname){
		var sid = sid;
		storename=sname;
		$.ajax({
			url:'storelistmenu/'+sid,
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:menuListResult
		});
	}	
	
	function menuListResult(data) {
		$('#storelistmodal').modal('hide');
		$("#coffeetable tbody").empty();
		$("#beveragetable tbody").empty();
		$("#bakerytable tbody").empty();
		$.each(data,function(idx,item){
			// 메뉴 상태에 따라, 카데고리에 따라 나누어서 출력하게 수정
			if(item.caNum == "CACO" && item.menuSale == "Y"){
				$('<tr>').attr("data-toggle","modal")//.addClass("openmodal")
				.append($('<td>').html(""))
				.append($('<td>').html(item.mName))
				.append($('<td>').html(item.mPrice))
				.append($('<input type=\'hidden\' id=\'hidden_menuId\'>').val(item.mNum))
				.appendTo('#coffeetable tbody');
			}
			else if(item.caNum == "CADR" && item.menuSale == "Y"){
				$('<tr>').attr("data-toggle","modal")
				.append($('<td>').html(""))
				.append($('<td>').html(item.mName))
				.append($('<td>').html(item.mPrice))
				.append($('<input type=\'hidden\' id=\'hidden_menuId\'>').val(item.mNum))
				.appendTo('#beveragetable tbody');
			}else if(item.caNum == "CADE" && item.menuSale == "Y"){
				$('<tr>').attr("data-toggle","modal")
				.append($('<td>').html(""))
				.append($('<td>').html(item.mName))
				.append($('<td>').html(item.mPrice))
				.append($('<input type=\'hidden\' id=\'hidden_menuId\'>').val(item.mNum))
				.appendTo('#bakerytable tbody');
			}
		});
	}
	
/* 	<th>PRICE</th>
	<td><input type="text" id="price" name="price" readonly="readonly">&nbsp;&nbsp;
		<button type="button" onclick="add(1)">+</button> <span id="ordernum">1개 </span>
		<button type="button" onclick="add(-1)">-</button>
	</td> */
		
	function add(num) {
		var price = $('#price').val();
		var v_totalprice = $('#totalPrice').val();

		var no = $("#ordernum").html();
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
		$("#ordernum").html(no);
	}

$(function(){
/* 	//openmodal123
	$("#openmodal123").on("click",function(){
		$('#mName').val($(this).children().eq(1).text());
		$('#price').val($(this).children().eq(2).text());
		console.log("in");
		$('#menudetailModal').modal('show');
	}); */
	
	
	// 커피 메뉴 선택시 모달창
	 $(document).on("click","#coffeetable tbody tr",function(event){
		 $('#mName').val($(this).children().eq(1).text());
		$('#price').val($(this).children().eq(2).text());
		$('#totalPrice').val($(this).children().eq(2).text());
		$('#sName').val(storename);
		console.log(storename);
		 $('#menudetailModal').modal('show');
     });
	
	// 음료 메뉴 선택시 모달창
	$(document).on("click","#beveragetable tbody tr",function(event){
		 $('#mName').val($(this).children().eq(1).text());
		$('#price').val($(this).children().eq(2).text());
		$('#totalPrice').val($(this).children().eq(2).text());
		$('#sName').val(storename);
		 $('#menudetailModal').modal('show');
    });
	
	// 빵 메뉴 선택시 모달창
	$(document).on("click","#bakerytable tbody tr",function(event){
		 $('#mName').val($(this).children().eq(1).text());
		$('#price').val($(this).children().eq(2).text());
		$('#totalPrice').val($(this).children().eq(2).text());
		$('#sName').val(storename);
		 $('#menudetailModal').modal('show');
    });

/* 	
	
	// 한 행 클릭시
	$("#coffeetable tbody tr").on("click",function(){
		$('#mName').val($(this).children().eq(1).text());
		$('#price').val($(this).children().eq(2).text());
		console.log("in");
		$('#menudetailModal').modal('show');
	}); */
	
	// 매장 선택시
	$("#selectStore").on("click",function(){
		$("#storeserch").val("");
		$("#storelistmodal").modal('show');
	});
	
		
	
	// 메뉴 검색
  	$("#myInput").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#searchTable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
  
	
 // 매장 검색
  	$("#storeserch").on("keyup", function() {
		var value = $(this).val().toLowerCase();
		$("#storetable tr").filter(function() {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});
 
 	
  	
  
});
</script>

</body>
</html>