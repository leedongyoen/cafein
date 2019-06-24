<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="cushead.jsp" %>
<title>주문 상세</title>
</head>
<body>

   <h2 align="center">주문 상세</h2>
	<div align="center">
   <br><br>
   <b>주문번호 :</b> <input type = "text" value="OR0012019618"> &nbsp;&nbsp;
   <b>매장주소 :</b> <input type = "text" size="30" value="대구광역시 중구 국채보상로 537">
   <br>
   <b>주문날짜 :</b> <input type = "text" value="2019-06-17 22:07:13"> &nbsp;&nbsp;
   <b>배달주소 :</b> <input type = "text" size="40" value="대구광역시 서구 00동 0000번지">
   <br>
   <b>매장상호 :</b> <input type = "text" value="린CAFE"> &nbsp;&nbsp;
   <b>배달번호 :</b> <input type = "text" value="DE00420190618">
   <br>
   <b>TEL :</b> <input type = "text" value="053-123-1111">
   <br><br><hr>
   </div>
   <div class = "container">
      <table class = "table table-hover">
         <tr>
            <th>주문번호</th>
            <th>메뉴명</th>
            <th>총 수량</th>
            <th>총 금액</th>
         </tr>

         <tr>
            <td>OR0012019618</td>
            <td>아메리카노(ICE)<br>
                                     바닐라라떼(HOT)</td>
            <td>2</td>
            <td>9.000원</td>
         </tr>
      </table>   
      <hr>
   </div>
   
   <div class = "container">
    <h4>결제방식</h4>
      <table class = "table table-hover">
         <tr>
            <th>카드</th>
            <th>현금</th>
            <th>휴대폰결제</th>
            <th>무통장입금</th>
         </tr>
         <tr>
            <td>
            <input type="checkbox" value="card" name="card" id="card" checked="checked"></td>
            <td>
            <input type="checkbox" value="money" name="money" id="money" disabled="disabled"></td>
            <td>
            <input type="checkbox" value="phonepay" name="phonepay" id="phonepay" disabled="disabled"></td>
            <td>
            <input type="checkbox" value="money" name="money" id="money" disabled="disabled"></td>
         </tr>
      </table>
    
      <hr><br>
         <b>고객명</b>&nbsp;<b>김*호(***123)</b><br>
         <b>카드명</b>&nbsp;<b>신한카드</b><br>
         <b>카드번호</b>&nbsp;<b>52**-****-**19</b>
         <div align ="right">
      <button type ="button" onclick ="location.href='orderlist.jsp'">돌아가기</button>
      </div>
      </div>
</body>
</html>