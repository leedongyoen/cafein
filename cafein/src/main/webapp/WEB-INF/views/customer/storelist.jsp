<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b402787b02c7003da0294158d1b3c1f8&libraries=services"></script>

<title>Insert title here</title>
</head>
<body>
<br>

<div class="container">

	<button id="selectStore" class="btn btn-outline-info" >매장 선택</button>
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
				<form class="form-borizontal" id="menudetailForm" action="${pageContext.request.contextPath}/customerorder" method="POST">
				<div class="modal-body">
						<input type="text" name="mNum" style="display: none;" >
						<input type="text" name="sId" style="display: none;" >
						<input type="text" name="cId" style="display: none;" >
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
							<tr id="hoticetr">
								<th>HOT/ICE</th>
								<td id="menudetailhotice"></td>
							</tr>
							<tr id="optiontr">
								<th>OPTION</th>
								<td id="menudetailoption">
									<!-- <input type="checkbox" class="checkoption" name="whipping" value="Y">휘핑크림 추가(+500)<br>
									<input type="checkbox" class="checkoption" name="syrup" value="Y">시럽 추가(+500)<br>
									<input type="checkbox" class="checkoption" name="shot" value="Y">샷 추가(+500) -->
								</td>
							</tr>
							<tr>
								<th>TOTAL PRICE</th>
								<td><input type="text" id="totalPrice" name="totalPrice" readonly="readonly"></td>
							</tr>
						</table>
					
				
				</div>
				<div class="modal-footer">	
					<input type="button" id="mymenuInsertbtn" class="btn btn-outline-primary" value="나만의 메뉴 등록" >
					<button type="submit"  class="btn btn-outline-primary" >주문</button>	
					<button type="button" class="btn btn-outline-primary" >담기</button>			
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
				</form>
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
					<div align="center">
						<button type="button" id="storelistbtn1" onclick="searchstorelist();" class="btn btn-outline-info" >주변매장</button>

						<button type="button" id="storelistbtn2" onclick="currentaddressStorelist()" class="btn btn-outline-info">기입주소매장조회</button>
						<button type="button" id="allstorelistbtn" onclick="allstroelist();" class="btn btn-outline-info">모든매장</button>	
					</div>
					<hr>
					<h3 id="storemodalminititle" align="center"></h3><hr>
					<h5 id="customerAddress" align="center"></h5>
					<hr>
					<form class="form-borizontal" action="#" method="POST">
						<input class="form-control" id="storeserch" type="text" placeholder="Search..">
						<div class="table-responsive">
						<table id="storetable" class="table">
							<thead>
							<tr> 
								<th>매장명</th>
								<th>주소</th>
								<th>거리</th>
								<th>배달</th>
							</tr>
							</thead>
							<tbody >
<%-- 							<c:forEach	items="${storelist}" var="store">									
							<tr onclick="menuList('${store.sid}','${store.sname}')">
								<td><input type="hidden" name="sid" value="${store.sid}"></td>
								<td>${store.sname}</td>
								<td>${store.sadd}</td>
								<td>구해야됨</td>
							</tr>
							</c:forEach> --%>
							</tbody>
						</table>
						</div>
					</form>
				
				</div>
				<div class="modal-footer">		
					<button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	
	// 메뉴 상세 모달창에 매장 이름 띄우기 위한 변수
	var storename;
	
	var selectstoreid;
	
	// 거리를 구하기 위해서 좌표를 저장하는 변수
	var searchLine;
	
	// 기준이 되는 매장 좌표
	var searchPostion;
	
	// 기준이 되는 매장 주소 앞 두자리
	var standardsearchStore;
	
	// 고객의 주소 ( DB 또는 검색한 주소)
	var standardsearchAddress;
	
	// 선택한 매장의 배달 서비스 여부
	var storedeliservice;
	
	// 나만의 메뉴 등록 가능 여부를 위한 로그인 체크
	var mymenu_login_check;
	
	//주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
	
	
	function menuList(sid,sname,stdeliservice){
		selectstoreid = sid;
		storename=sname;
		storedeliservice = stdeliservice;
		console.log(sid,sname)
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
	
    // 거리 계산을 위하여
    function setSearchLine(searchpostion){
    	searchLine = new kakao.maps.Polyline({

        	path: [searchpostion]
        	
        });
    }
    
    // DB정보로 거리 계산
    function getDBStoreDistance(sid,sname,saddress,stdeliservice){
    	// 주소로 좌표를 검색합니다
    	geocoder.addressSearch(saddress, function(result, status) {
	    	console.log("for문 안 ge "+saddress);
	    	
	        // 정상적으로 검색이 완료됐으면 
	         if (status === kakao.maps.services.Status.OK) {
	
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	            console.log(saddress+'  : '+coords);
	            // 거리 계산
	            var path= searchLine.getPath();
	            path.push(coords);
	            searchLine.setPath(path);
	            
	            var distance = Math.round(searchLine.getLength());
	            console.log(sname+' 거리  : '+distance+"m");
	           
	            if(distance < 300){
	            	
	            	$('<tr>').attr("onclick","menuList('"+sid+"','"+sname+"','"+stdeliservice+"')")
					.append($('<td>').html(sname))
					.append($('<td>').html(saddress))
					.append($('<td>').html(distance+"m"))
					.append($('<td>').html(stdeliservice))
					.appendTo('#storetable tbody');
						
	            }
	            
	            // 다른 매장과 거리 계산을 위해 초기화
	            searchLine.setMap(null);
	        	searchLine = null;
	        	
	        	// 기준 매장 주소를 다시 넣는다.
	            setSearchLine(searchPostion);
	        } 
	    }); 
    }
    
    // 주변매장 - DB에서 정보 가져옴
    function getstorelist(){
    	console.log(standardsearchStore);
		// 매장 정보 가져와서 거리 계산 후 뿌리기
		$.ajax({
			url:'searchstorelist/'+standardsearchStore,
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(list){
				$("#storetable tbody").empty();
				$("#storemodalminititle").html("주변매장");
				$.each(list,function(idx,item){
					getDBStoreDistance(item.sid,item.sname,item.sadd,item.stdeliservice);
				});
			}
		});
    }
	
	function searchstorelist(){
		new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수
                standardsearchAddress = addr;
                $("#customerAddress").html(addr);
                standardsearchStore = addr.substr(0,2);
                console.log(standardsearchStore);
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        searchPostion = new daum.maps.LatLng(result.y, result.x);
                        
                    
        	        	
                        
                        // 거리 계산을 위해서 설정.
                        setSearchLine(searchPostion);  
                        
                        // db에서 기준 매장 도시이름으로 검색
                        getstorelist();
                    }
                });
            }
        }).open();
     	
	}
	
	// 사용자가 입력한 주소 정보를 기준으로 검색하기.
	function currentaddressStorelist(){
		var checklogin = "<%=(String) session.getAttribute("cId")%>";
		console.log(checklogin);
		if(checklogin == null || checklogin =="null"){
			alert('로그인이 필요합니다.');
		}else{
			$.ajax({
				url:'customerinfo/'+checklogin,
				type:'GET',
				//contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
					$("#storetable tbody").empty();
					$("#customerAddress").html(data.cAdd);
					standardsearchAddress = data.cAdd;
					geocoder.addressSearch(data.cAdd, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {

	                        var result = results[0]; //첫번째 결과의 값을 활용

	                        // 해당 주소에 대한 좌표를 받아서
	                        searchPostion = new daum.maps.LatLng(result.y, result.x);
	                        
	                             	        	
	                        
	                        // 거리 계산을 위해서 설정.
	                        setSearchLine(searchPostion);  
	                        
	                        // db에서 기준 매장 도시이름으로 검색
	                        getstorelist();
	                    }
	                });
				}
			});
		}
		
	}
	 
	// 모든 매장 리스트 보여주기
	function allstroelist(){
		$.ajax({
			url:'storelistmenu',
			type:'GET',
			//contentType:'application/json;charset=utf-8',
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				standardsearchAddress="";
				$("#storetable tbody").empty();
				$("#storemodalminititle").html("모든매장");
				$("#customerAddress").html("");
				$.each(data,function(idx,item){
					$('<tr>').attr("onclick","menuList('"+item.sid+"','"+item.sname+"','"+item.stdeliservice+"')")
					.append($('<td>').html(item.sname))
					.append($('<td>').html(item.sadd))
					.append($('<td>').html("-"))
					.append($('<td>').html(item.stdeliservice))
					.append($('<input type=\'hidden\' id=\'hidden_menuId\'>').val(item.sid))
					.appendTo('#storetable tbody');
					
				});
			}
		});
	}
	
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
		$('input:text[name="qty"]').val(no);
	}
	
	
	
	// 상세 조회 후 해당 메뉴 옵션 조회
	function getmenuoptionlist(sid, mnum){
		var hoticelist = [];
		$.ajax({
			url:'getmenuoptionlist',
			type:'GET',
			dataType:'json',
			data:{ sId: sid , mNum: mnum },
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ 
				console.log(data);
				$("#menudetailoption").empty();
				$("#menudetailhotice").empty();
				if(data.length > 0){
					$.each(data,function(idx,item){
						
						if( item.caNum == "CAOP" ){
							$("<input>").attr({ 
							     type: "checkbox",
							     name: "cuoptionlist", 
							     id: item.stNum,
							     value: item.stNum,
							   	})
							   	.attr("class","checkoption")
							   	.appendTo("#menudetailoption");			
							$("<label>").attr("for",item.stNum)
										.append(item.opName+"("+item.opPrice+"원 추가)")
										.appendTo("#menudetailoption");
							$("<input>").attr({
								type:'hidden',
								id : 'option'+item.stNum,
								value: item.opPrice
							}).appendTo("#menudetailoption");
							$("<br>").appendTo("#menudetailoption");
						}else{
							
							console.log(item.caNum);
							$("<input>").attr({ 
							     type: "radio",
							     name: "hotice_option", 
							     id: item.caNum,
							     value: item.caNum,
							     checked: true
							   	})
							   	.appendTo("#menudetailhotice");			
							$("<label>").attr("for",item.caNum)
										.append(item.opName)
										.appendTo("#menudetailhotice");
							/* $("<input>").attr({
								type:'hidden',
								id : 'option'+item.caNum,
								value: item.opPrice
							}).appendTo("#menudetailhotice"); */
						}
					});
					
				}else{
					$("#hoticetr").hide();
					$("#optiontr").hide();
				}
				
				
			}
		});
	}
	
	// 선택한 메뉴 상세 조회
	function getmenudetail(sid,mnum){
		$.ajax({
			url:'getmenudetail',
			type:'GET',
			dataType:'json',
			data:{ sId: sid , mNum: mnum },
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ 
				$('input:text[name="sId"]').val(data.sId);
				$('input:text[name="cId"]').val(mymenu_login_check);
				$('#mName').val(data.mName);
				$('#price').val(data.mPrice);
				$('#totalPrice').val(data.mPrice);
				$('#sName').val(storename);
				$('#ordernum').text('1');
				$('input:text[name="mNum"]').val(data.mNum);
				getmenuoptionlist(data.sId,data.mNum);
			}
		});
	}

$(function(){

	// 로그인시에만 나만의 메뉴 등록 가능하게
	mymenu_login_check = "<%= (String)session.getAttribute("cId") %>";
	if(mymenu_login_check == "null" || mymenu_login_check == ""){
		$("#mymenuInsertbtn").hide();
	}else{
		$("#mymenuInsertbtn").show();
	}
	
	// 커피 메뉴 선택시 모달창
	 $(document).on("click","#coffeetable tbody tr",function(event){
		$("#menudetailhotice").show();
		$("#hoticetr").show();
		$("#optiontr").show();
		// 선택한 메뉴 상세조회 + 옵션
		getmenudetail(selectstoreid,$(this).children().eq(3).val());
		
		console.log(selectstoreid);
		 $('#menudetailModal').modal('show');
     });
	
	// 음료 메뉴 선택시 모달창
	$(document).on("click","#beveragetable tbody tr",function(event){
		$("#menudetailhotice").show();
		$("#hoticetr").show();
		$("#optiontr").show();
		// 선택한 메뉴 상세조회 + 옵션
		getmenudetail(selectstoreid,$(this).children().eq(3).val());
		 $('#menudetailModal').modal('show');
    });
	
	// 빵 메뉴 선택시 모달창
	$(document).on("click","#bakerytable tbody tr",function(event){
		$("#menudetailhotice").show();
		$("#hoticetr").show();
		$("#optiontr").show();
		// 선택한 메뉴 상세조회 + 옵션
		getmenudetail(selectstoreid,$(this).children().eq(3).val());
		 $('#menudetailModal').modal('show');
    });

	
	// 매장 선택시
	$("#selectStore").on("click",function(){
		$("#storetable tbody").empty();
		allstroelist();
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

	 
 	// 옵션 선택시
  	$(document).on("change",".checkoption",function(){
  		
  		var v_totalprice = $('#totalPrice').val();
  		var option_price = $('#option'+$(this).val()).val();
  
  		if($(this).is(":checked")){
				v_totalprice = Number(v_totalprice)+Number(option_price);
		}else{
			v_totalprice = Number(v_totalprice)-Number(option_price);
		}
  		$('#totalPrice').val(v_totalprice);
  	});
 	
	// 나만의 메뉴 등록 시
	$("#mymenuInsertbtn").on("click",function(){
		var list =  $("#menudetailForm").serializeObject();
		var selectop = [];
		var selectoptionck=false;
		$('[name=cuoptionlist]:checked').each(function(){
			selectop.push($(this).val());
			selectoptionck=true;
		});
		if(selectoptionck){
			
			list.cuNumList = selectop;
		}else{
			list.cuNumList = null;
		}
		
		
		$.ajax({
			url : 'insertmymenu',
			type : 'PUT',
			contentType : 'application/json;charrset=utf-8',
			dataType : 'json',
			data : JSON.stringify(list),
			success : function(data) {
				console.log(data);

			},
			error : function(request,status,error) {
				alert(JSON.stringify(request,status,error));
			}
		});
		
	});
});
</script>

</body>
</html>