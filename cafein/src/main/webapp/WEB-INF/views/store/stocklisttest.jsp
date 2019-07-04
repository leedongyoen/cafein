<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="storehead.jsp" %>
<title>메뉴별 통계</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':[ 'table', 'corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
          $.ajax({
             url : "./stocklist.do",
             data : {oDnum : 1},
             type : "post",
             datatype : "json",
             success : function() {   
    
        var datas = google.visualization.arrayToDataTable([
          ['메뉴명', '총 수량' , '총 금액'],
          ['에스프레소', 31, 3213451],
          ['아메리카노', 92, 1234154],
          ['카페라떼',  78, 3588966],
          ['카페모카', 45, 4532132],
          ['녹차 라떼', 35, 2456322],
          ['홍차 라떼', 27, 1162235],
          ['레몬 에이드', 58, 2665459],
          ['자몽 에이드', 41, 3543213],
          ['딸기 스무디', 35, 2238854],
          ['망고 스무디', 24, 3545631]
        ]);

        var options = {
         
          title: ''
        };
      
        var table = new google.visualization.Table(document
            .getElementById('test_dataview1'))
      table.draw(datas, {
         showRowNumber: true, width: '30%', height: '30%'
      });
        
        
        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
           chart.draw(datas, options);
      }
          });
      };
      //차트 반응형으로 사이즈 크기 조절
      $(window).resize(function() {
         drawChart();
      });
    </script>
</head>
<body>
   <h2 align = "center">매출</h2>
   <h3 align="center">메뉴별 통계</h3>
    <div id="piechart" style=" height:500px; margin:auto;"></div>
    <p align = "center"><input type="date"></p>
    
         <table align = "center">
            <tr>
               <th><button onclick="location.href='salestime.do'">시간별매출</button></th>
               <th><button onclick="location.href='salesday.do'">일별매출</button></th>
               <th><button onclick="location.href='salesmonth.do'">월별매출</button></th>
               <th><button onclick="location.href='salesyear.do'">연별매출</button></th>
               <th><button onclick="location.href='salesmenu.do'">메뉴별매출</button></th>
            </tr>
         </table>
     <div align="center" id="test_dataview1"></div>
  </body>
</html>