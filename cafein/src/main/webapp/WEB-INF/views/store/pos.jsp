<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <%@ include file="storehead.jsp" %> --%>

<!-- <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./jqgrid/js/jquery.jqGrid.min.js"></script>
	Latest compiled and minified CSS
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->

<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.min.js" type="text/javascript"></script>
 <!-- The jQuery library is a prerequisite for all jqSuite products -->
    <script type="text/ecmascript" src="./js/jquery.min.js"></script> 
    <!-- We support more than 40 localizations -->
    <script type="text/ecmascript" src="./jqgrid/js/i18n/grid.locale-en.js"></script>
    <!-- This is the Javascript file of jqGrid -->   
    <script type="text/ecmascript" src="./jqgrid/js/jquery.jqGrid.min.js"></script>
    <!-- This is the localization file of the grid controlling messages, labels, etc.
    <!-- A link to a jQuery UI ThemeRoller theme, more than 22 built-in and many more custom -->
    <link rel="stylesheet" type="text/css" media="screen" href="./jqueryui/jquery-ui.css" />
    <!-- The link to the CSS that the grid needs -->
    <link rel="stylesheet" type="text/css" media="screen" href="./jqgrid/css/ui.jqgrid.css" />





<!-- <link rel="stylesheet" type="text/css" href="./jqueryui/jquery-ui.js">

 <link rel="stylesheet" type="text/css" media="screen" href="./jqgrid/css/ui.jqgrid.css" /> 
<link rel="stylesheet" type="text/css" href="./jqueryui/jquery-ui.css"> -->

<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>매장POS</title>
<style type="text/css">
.left {
  position:absolute;
  width:600px;
  height: 600px;
  border: 1px solid;
}
.content {
  position:relative;
  width:70%;
  left:600px;
  height:600px;
  border: 1px solid;
}

</style>
</head>
<body>
<script type="text/javascript">
//포스기 버튼

//jqgrid의 orderlist
 var dataArray = [
     {
       "name": "Lorene Battle",
       "phone": "(936) 574-3976"
     },
     {
       "name": "Wendi Downs",
       "phone": "(815) 510-3017"
     },
     {
       "name": "Wendi Downs",
       "phone": "(815) 510-3017"
     },
     {
       "name": "Wendi Downs",
       "phone": "(815) 510-3017"
     },
     {
       "name": "Wendi Downs",
       "phone": "(815) 510-3017"
     },
     {
       "name": "Wendi Downs",
       "phone": "(815) 510-3017"
     },
     {
       "name": "Wendi Downs",
       "phone": "(815) 510-3017"
     }
   ];

   $(document).ready(function() {
	   $("#gridlist").jqGrid({
           url: 'http://trirand.com/blog/phpjqgrid/examples/jsonp/getjsonp.php?callback=?&qwery=longorders',
           mtype: "GET",
           datatype: "jsonp",
           colModel: [
               { label: 'OrderID', name: 'OrderID', key: true, width: 75 },
               { label: 'Customer ID', name: 'CustomerID', width: 150 },
               { label: 'Order Date', name: 'OrderDate', width: 150 },
               { label: 'Freight', name: 'Freight', width: 150 },
               { label:'Ship Name', name: 'ShipName', width: 150 }
           ],
           viewrecords: true,
           height: 250,
           rowNum: 101,
           pager: "#jqGridPager"
       });
   });





</script>
<br><br>
<br><br>
<div class ="container">
  <div class="left">
  <table id="gridlist"><tr><td></td></tr></table> 
	<div id="pager"></div> 
  </div>
  <div class="content">
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
				<tbody id="searchTable">
				
			</tbody>
			</table>
			</div>
  		</div>
   		<div id="beverage" class="container tab-pane fade"><br>
    		<table id="beveragetable" class="table">
				<tbody id="searchTable">
				
				</tbody>
			</table>
   		</div>
   		<div id="bakery" class="container tab-pane fade"><br>
     		<table id="bakerytable" class="table">
				<tbody id="searchTable">
				
				</tbody>
			</table>
   		</div>
 	</div>
  </div>


<hr>
	<div style="text-align:left">
	<button>전체취소</button>
	<button>선택취소</button>
	<button>수량변경</button>
	<button>-</button>
	<button>+</button>
	
	
	</div>
	<div style="text-align:right"> <button>주문 추가</button></div>
	<div style="text-align:right"> 총 가격 4600원</div>
			<div style="text-align:right">
			<button>회원검색</button>
			<button>현금</button>
			<button>카드</button>
			<button onclick="location.href='#'">결제하기</button>
		</div>
</div>




</body>
</html>