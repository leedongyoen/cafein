<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<title>매장POS</title>
<style>
	* {
		padding: 0;
		margin: 0;
		font-family: arial;
	}
	.left-box {

		  float: left;
		  width: 50%;
	}
	.right-box {
		  float: right;
		  width: 50%;
	}
	[data-tabs2] {
		display: flex;
		background: #eee;
		padding: 10px;
		border: 2px solid #ccc;
	}
	[data-tabs2] >* {
		padding: 5px 20px;
		cursor: pointer;
	}
	[data-tabs2] .active {
		background: #31a3e8;
		color: #fff;
		border-radius: 5px;
	}
	[data-panes2] > * {
		display: none;
		border: 2px solid #ccc;
		border-top: none;
		padding: 20px;
	}
	[data-panes2] > .active {
		display: block;	
	}
	</style>
</head>
<body>
<br><br><br><br>
<div class="container">
<div class='left-box'>
   <div data-tabs2>
      <div>음료</div>
      <div>푸드</div>
   </div>

   <div data-panes2>
      <div>
         <div data-tabs2>
            <div>COFFEE</div>
            <div>VEBERAGE</div>
         </div>
         <div data-panes2>
            <div>
            <table style="margin-left: auto; margin-right: auto;" width="300" height="50" margin:auto;>
   <tr>
       <td><input type="button" value="에스프레소(3600)"></td>
       <td><input type="button" value="아메리카노(4100)"></td>
       <td><input type="button" value="카페라떼(4600)"></td>
       <td><input type="button" value="카페모카(5100)"></td>
   </tr>
    </table>
            </div>
            <div>
            <table style="margin-left: auto; margin-right: auto;" width="400" height="50" margin:auto;>
            <tr>
               <td><input type="button" value="홍차라떼(5000)"></td>
                <td><input type="button" value="녹차라떼(4200)"></td>
                <td><input type="button" value="레몬에이드(5000)"></td>
            </tr>
             </table>
            </div>
         </div>
      </div>
      <div>
      <table style="margin-left: 20; margin-right:20;" width="400" height="50" margin:auto;>
            <tr>
               <td><input type="button" value="프레즐(2500)"></td>
                <td><input type="button" value="베이글(2000)"></td>
                <td><input type="button" value="치즈케이크(5500)"></td>
            </tr>
             </table>
      </div>
   </div>
   </div>
	
	
	
	<div class='right-box'>
	<div data-tabs2>
		<div>옵션</div>
	</div>
	<div data-panes2>
		<div>
		<table style="margin-left: 20; margin-right:20; width:400; height: 50; margin:auto">
				<tr>
					<td><input type="button" value="ICE"></td>
				    <td><input type="button" value="HOT"></td>
				</tr>
				<tr>
					<td><input type="button" value="샷추가(500)"></td>
				    <td><input type="button" value="휘핑(500)"></td>
				    <td><input type="button" value="초코소스(300)"></td>
				    <td><input type="button" value="카라멜소스(300)"></td>
				</tr>
		</table>
				</div>
	</div>
</div>
</div>
	<hr>

<hr>
<div class ="container">


	<p>아메리카노 + ICE + 샷추가</p>
	<div style="text-align:right"> <button>주문 추가</button></div>
	<div style="text-align:right"> 총 가격 4600원</div>
			<div style="text-align:right">
			<button>현금</button>
			<button>카드</button>
			<button onclick="location.href='#'">결제하기</button>
		</div>

</div>
	<script src="js/tabbis.js"></script>
	
	<script>
		var tabs = tabbis.init({
			tabGroup: '[data-tabs2]',
			paneGroup: '[data-panes2]',
			tabActive: 'active',
			paneActive: 'active',
			callback: function(tab2, pane2) {
				console.log(tab);
				console.log(pane);
			}
		});
	</script>
</body>
</html>