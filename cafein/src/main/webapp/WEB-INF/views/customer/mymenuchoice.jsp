<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<%@ include file="cushead.jsp" %>
	<title>나만의메뉴등록하기</title>
	
	<style>
	* {
		padding: 0;
		margin: 0;
		font-family: arial;
	}
	body {
		padding: 0 40px;
	}
	h2 {
		margin: 20px 0;
	}
	[data-tabs] {
		display: flex;
		background: #eee;
		padding: 10px;
		border: 2px solid #ccc;
	}
	[data-tabs] >* {
		padding: 5px 20px;
		cursor: pointer;
	}
	[data-tabs] .active {
		background: #31a3e8;
		color: #fff;
		border-radius: 5px;
	}
	[data-panes] > * {
		display: none;
		border: 2px solid #ccc;
		border-top: none;
		padding: 20px;
	}
	[data-panes] > .active {
		display: block;
	}
	</style>
</head>
<body>
	<h1 align="center">나만의 메뉴 등록하기</h1>
		<div style="text-align:right">
			<input type='text' name='word' value=''>
			<button>검색</button>
			<button onclick="location.href='cusCart.jsp'">장바구니</button>
		</div>
	<div data-tabs>
		<div>음료</div>
		<div>푸드</div>
	</div>

	<div data-panes>
		<div>
			<div data-tabs>
				<div>COFFEE</div>
				<div>VEBERAGE</div>
			</div>
			<div data-panes>
				<div> 
				<table style="margin-left: auto; margin-right: auto;" width="200" height="200" margin:auto;>
	<th><img src="../image/coffee4.jpg" width="200" heigh="200" onclick = "location.href='MymenuInsert.jsp'"></th>
	<th><img src="../image/coffee1.jpg" width="200" heigh="200"></th>
	<th><img src="../image/coffee2.jpg" width="200" heigh="200"></th>
	<th><img src="../image/coffee3.jpg" width="200" heigh="200"></th>
	<tr>
	    <td>에스프레소</td>
	    <td>아메리카노</td>
	    <td>카페라떼</td>
	    <td>카페모카</td>
	</tr>
    </table>
				</div>
				<div>
				<table style="margin-left: auto; margin-right: auto;" width="200" height="200" margin:auto;>
				<th><img src="../image/veberage1.JPG" width="200" heigh="200"></th>
				<th><img src="../image/veberage2.JPG" width="200" heigh="200"></th>
				<th><img src="../image/veberage3.JPG" width="200" heigh="200"></th>
				<tr>
				    <td>홍차라떼</td>
				    <td>녹차라떼</td>
				    <td>레몬에이드</td>
				</tr>
			    </table>
				</div>
			</div>
		</div>
		<div>
		<table style="margin-left: auto; margin-right: auto;" width="200" height="200" margin:auto;>
				<th><img src="../image/dessert1.JPG" width="200" heigh="200"></th>
				<th><img src="../image/dessert2.JPG" width="200" heigh="200"></th>
				<th><img src="../image/dessert3.JPG" width="200" heigh="200"></th>
				<tr>
				    <td>프레즐</td>
				    <td>베이글</td>
				    <td>치즈케이크</td>
				</tr>
			    </table>
		
		</div>
	</div>

	<script src="../js/tabbis.js"></script>
	<script>
		var tabs = tabbis.init({
			tabGroup: '[data-tabs]',
			paneGroup: '[data-panes]',
			tabActive: 'active',
			paneActive: 'active',
			callback: function(tab, pane) {
				console.log(tab);
				console.log(pane);
			}
		});
	</script>
</body>
</html>