<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>Closing Details Page</title>
<script>

	var sId = "<%= (String)session.getAttribute("sId") %>";	
	//var storeOpenTime, storeCloseTime;
	
	$(function(){
		// PDF 볼 수 있는 이벤트
		$('#storeList').on('click','.pdfbtn',function(){
			var opentime = $(this).parent().prev().find('span').eq(0).text();
			var closetime = $(this).parent().prev().find('span').eq(1).text();
			console.log('opentime : ' + opentime + ', closetime : ' + closetime)
			window.open('report.do?openTime='+opentime+'&closeTime='+closetime);
		});
		
		pdfList();
		
		
	});
	
	
	function pdfList(pagenumber){
		
		// 추가 부분
	    if(pagenumber == null) { 	// 페이지 번호를 안 넘어오는 경우
	       console.log("null");
	       pagenumber=1;
	    } else {
	       console.log(pagenumber);
	    }
		
		// 데이터 요청
		$.ajax({
			url:"closedetailslist",
			type:'GET',			
			data:{sId:sId,checkpagenum : pagenumber},
			dataType:'json',
			error:function(xhr,status,msg){
				alert('통신 실패');
				console.log("상태값 :" + status + ", Http에러메시지 :"+msg)
			},
			success:function(data){
				
				var list = data.list;
		        var paging = data.paging; 
		        $('#pageul').empty(); 
		        $('#storeList tbody').empty();
				$.each(list,function(idx,item){	
					
					//$('#storeList tbody').empty();
					if(item.openTime != null && item.closeTime != null) {
						$('<tr>')
						.append($('<th class="thcolor">').html("<span>"+item.openTime + '</span> ~ <span>' + item.closeTime+"</span>"))
						.append($('<th class="thcolor">').append($('<input>').attr({
							type:'button',
							value:'PDF 저장',
							class:'btn btn-outline-info'
						}).addClass('pdfbtn')))
						.appendTo('#storeList tbody');
					}
					
				});
				
				// 페이징 처리
	            
	            var li;
	            // 처음 페이지 번호에서 마지막 페이지번호까지
	            
	            for(var n= paging.startPage; n<=paging.endPage; n++){
	               
	                // 선택한 page 번호가 n이랑 같으면
	               // href 부분은 호출해야하는 함수를 적으면 되고
	               // n은 누르는 페이징 번호를 넘기기 위해서.
	               if(paging.page == n){
	                  li =  $('<li>').attr("class","page-item active")
	                        .append($('<a>').attr({
	                           class: "page-link"
	                              , href: "javascript:pdfList("+n+")"
	                           }).append(n));
	                    
	               }else{
	                  li =  $('<li>').attr("class","page-item")
	                              .append($('<a>').attr({
	                                 class: "page-link"
	                                    , href: "javascript:pdfList("+n+")"
	                                 }).append(n));
	               }  
	               $('#pageul').append(li);
	               
	            }
			}
		});
	}
	
	
	// 날짜 검색
	function searchDate(pagenumber){
		
		if(pagenumber == null) { 	// 페이지 번호를 안 넘어오는 경우
		       console.log("null");
		       pagenumber=1;
		    } else {
		       console.log(pagenumber);
		}
		
		var startDate = jQuery('#startdate').val();
  		var endDate = jQuery('#enddate').val();

  		var today = new Date();
  		var dd = today.getDate();
  		var mm = today.getMonth()+1; //January is 0!
  		var yyyy = today.getFullYear();
  		
  		if(dd<10) {
  		    dd='0'+dd
  		} 

  		if(mm<10) {
  		    mm='0'+mm
  		} 

  		today = yyyy+'-'+mm+'-'+dd;
  		
  		
  		console.log('today : '+today)
  		if(startDate > endDate){
  			alert('검색 날짜를 확인해주세요.');
  			return;
  		} else if (endDate > today) {
  			alert('오늘 이후 날짜는 검색할 수 없습니다.');
  			return;
  		} else if (startDate == '' || endDate == ''){
  			alert('날짜를 입력해주세요.');
  			return;
  		} 
  		
  		console.log("startDate : "+ startDate);
  		console.log("endDate : "+ endDate);
  		$('#pageul').empty();
		
		$.ajax({
			url: 'closedetailslist',
			type:'GET',
			data: {sId: sId, startDate: startDate, endDate: endDate,checkpagenum : pagenumber},
			dataType:'json',
			//async: false,		// 비동기식 으로 설정
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " Http에러메시지 :"+msg);
			},
			success:function(data){ //onclick="menuList('${store.sid}','${store.sname}')"
				var list = data.list;
		        var paging = data.paging; 
		        $('#pageul').empty(); 
				$('#storeList tbody').empty();
				$.each(list,function(idx,item){	
					//$('#storeList tbody').empty();
					if(item.openTime != null && item.closeTime != null) {
						$('<tr>')
						.append($('<th class="thcolor">').html("<span>"+item.openTime + '</span> ~ <span>' + item.closeTime+"</span>"))
						.append($('<th class="thcolor">').append($('<input>').attr({
							type:'button',
							value:'PDF 저장',
							class:'btn btn-outline-info'
						}).addClass('pdfbtn')))
						.appendTo('#storeList tbody');
					}
					

					
					
					
				});
				
				// 페이징 처리
	            
	            var li;
	            // 처음 페이지 번호에서 마지막 페이지번호까지
	            
	            for(var n= paging.startPage; n<=paging.endPage; n++){
	               
	                // 선택한 page 번호가 n이랑 같으면
	               // href 부분은 호출해야하는 함수를 적으면 되고
	               // n은 누르는 페이징 번호를 넘기기 위해서.
	               if(paging.page == n){
	                  li =  $('<li>').attr("class","page-item active")
	                        .append($('<a>').attr({
	                           class: "page-link"
	                              , href: "javascript:searchDate("+n+")"
	                           }).append(n));
	                    
	               }else{
	                  li =  $('<li>').attr("class","page-item")
	                              .append($('<a>').attr({
	                                 class: "page-link"
	                                    , href: "javascript:searchDate("+n+")"
	                                 }).append(n));
	               }  
	               $('#pageul').append(li);
	               
	            }
			}
		});
  		
	}
	
</script>
</head>
<body>
<br><br>
<style>
@media (min-width: 768px) {
  .container {
    width: 750px;
  }
}

@media (min-width: 992px) {
  .container {
    width: 940px;
  }
}


table tbody th{
	text-align: center;
}
.thcolor {
	background-color:white;
	color:black;
}
</style>

<div class = "container" align="center">
	<h3><%= session.getAttribute("sName") %> 마감 내역</h3><hr>

	<input type="date" class="btn btn-secondary" name="startdate" id="startdate">~
    <input type="date" class="btn btn-secondary" name="enddate" id="enddate">
    <input type="button" class="btn btn-success" onclick="searchDate()" value="조회"><br><br>
	
	<table class="table table-hover" id="storeList">
		<thead>
		<tr>
			<th style="text-align: center;" class="col-md-8">날짜</th>
			<th class="col-md-4">PDF 저장</th>
		</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<ul id="pageul" class="pagination justify-content-center" ></ul>
</div>
</body>
</html>