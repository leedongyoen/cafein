const width_threshold = 480;

//var sId = '<%= (String)session.getAttribute("sId") %>'

function drawLineChart() {
	
	var i;
	$.ajax({
		url : "./getsalestime.do",
		data : { sId : sId},
		type : "POST",
		datatype : "json",
		async:false,
		success : function(data) {
			
			if ($("#lineChart").length) {
			    ctxLine = document.getElementById("lineChart").getContext("2d");
			    optionsLine = {
			      scales: {
			        yAxes: [
			          {
			            scaleLabel: {
			              display: true,
			              labelString: "금액"
			            }
			          }
			        ]
			      }
			    };

			    // Set aspect ratio based on window width
			    optionsLine.maintainAspectRatio =
			      $(window).width() < width_threshold ? false : true;
			    var chartlabel=[], chartdata=[], chartcnt=[];
			    
			    
			    $.each(data,function(idx,item){
			    	
			    chartlabel[idx] = item.week;
			    chartdata[idx] = parseInt(item.atotal);
			    chartcnt[idx] = parseInt(item.cnt);
			    });
			    
			    configLine = {
			      type: "line",
			      data: {
			        labels: chartlabel,
			        datasets: [
			          {
			            label: "매출",
			            data: chartdata,
			            fill: false,
			            borderColor: "rgb(75, 192, 192)",
			            cubicInterpolationMode: "monotone",
			            pointRadius: 0
			          },
			          {
		            
			            label: "수량",
			            data: chartcnt,
			            fill: false,
			            borderColor: "rgba(255,99,132,1)",
			            cubicInterpolationMode: "monotone",
			            pointRadius: 0
		              }
			        ]
			      },
			      /*options:{
			    	  annotations: {
			    	    textStyle: {
			    	      // The color of the text.
			    	      color: '#871b47'
			    	    }
			    	  }
			      }*/
			      /*
			      
			      options:{ 
			    	  legend: { labels: { fontColor: "#040404" } } 
			      	  ,hAxis: { labels: { fontColor: "#040404" } }
			      	  ,vAxis: { labels: { fontColor: "#040404" } } 
			      }
			      chart.draw(data, { titleTextStyle: { color: 'red' }, 
			    	  hAxis: { textStyle: { color: 'red' }, 
			    		  titleTextStyle: { color: 'red' } }, 
			    		  vAxis: { textStyle: { color: 'red' }, 
			    			  titleTextStyle: { color: 'red' } }, 
			    			  legend: { textStyle: { color: 'red' } } });
			      */
			      
			      
			      options: optionsLine
			    };

			    lineChart = new Chart(ctxLine, configLine);
	
			
			}
			
		}
	});
	
	
/*	
  if ($("#lineChart").length) {
    ctxLine = document.getElementById("lineChart").getContext("2d");
    optionsLine = {
      scales: {
        yAxes: [
          {
            scaleLabel: {
              display: true,
              labelString: "Hits"
            }
          }
        ]
      }
    };

    // Set aspect ratio based on window width
    optionsLine.maintainAspectRatio =
      $(window).width() < width_threshold ? false : true;

    configLine = {
      type: "line",
      data: {
        labels: [
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July"
        ],
        datasets: [
          {
            label: "Latest Hits",
            data: [88, 68, 79, 57, 50, 55, 70],
            fill: false,
            borderColor: "rgb(75, 192, 192)",
            cubicInterpolationMode: "monotone",
            pointRadius: 0
          }
        ]
      },
      options: optionsLine
    };

    lineChart = new Chart(ctxLine, configLine);
  }
  
 */ 
}

function drawBarChart() {
	
	
	$.ajax({
		url:"salesrank",
		type:'GET',			
		data:{sId:sId},
		dataType:'json',
		error:function(xhr,status,msg){
			alert('통신 실패');
		},
		success:function(data){ 
			
			var menulabel=[], menudata=[];
			
			$.each(data,function(idx,item){	
				menulabel[idx] = item.mName;
				menudata[idx] = item.cnt;
			});
				
				if ($("#barChart").length) {
				    ctxBar = document.getElementById("barChart").getContext("2d");

				    optionsBar = {
				      responsive: true,
				      scales: {
				        yAxes: [
				          {
				            barPercentage: 0.2,
				            ticks: {
				              beginAtZero: true
				            },
				            scaleLabel: {
				              display: true,
				              labelString: "메뉴"
				            }
				          }
				        ]
				      }
				    };

				    optionsBar.maintainAspectRatio =
				      $(window).width() < width_threshold ? false : true;

				    /**
				     * COLOR CODES
				     * Red: #F7604D
				     * Aqua: #4ED6B8
				     * Green: #A8D582
				     * Yellow: #D7D768
				     * Purple: #9D66CC
				     * Orange: #DB9C3F
				     * Blue: #3889FC
				     */

				    configBar = {
				      type: "horizontalBar",
				      data: {
				        labels: menulabel,
				        datasets: [
				          {
				            label: "판매율",
				            data: menudata,
				            backgroundColor: [
				              /*"#F7604D",
				              "#4ED6B8",
				              "#A8D582",
				              "#D7D768",*/
				              "#9D66CC",
				              "#DB9C3F",
				              "#3889FC"
				            ],
				            borderWidth: 0
				          }
				        ]
				      },
				      options: optionsBar
				    };

				    barChart = new Chart(ctxBar, configBar);
				  }
				

		}
	});
	
}

function drawPieChart() {
  if ($("#pieChart").length) {
    var chartHeight = 300;

    $("#pieChartContainer").css("height", chartHeight + "px");

    ctxPie = document.getElementById("pieChart").getContext("2d");

    optionsPie = {
      responsive: true,
      maintainAspectRatio: false,
      layout: {
        padding: {
          left: 10,
          right: 10,
          top: 10,
          bottom: 10
        }
      },
      legend: {
        position: "top"
      }
    };

    configPie = {
      type: "pie",
      data: {
        datasets: [
          {
            data: [18.24, 6.5, 9.15],
            backgroundColor: ["#F7604D", "#4ED6B8", "#A8D582"],
            label: "Storage"
          }
        ],
        labels: [
          "Used Storage (18.240GB)",
          "System Storage (6.500GB)",
          "Available Storage (9.150GB)"
        ]
      },
      options: optionsPie
    };

    pieChart = new Chart(ctxPie, configPie);
  }
}

function updateLineChart() {
  if (lineChart) {
    lineChart.options = optionsLine;
    lineChart.update();
  }
}

function updateBarChart() {
  if (barChart) {
    barChart.options = optionsBar;
    barChart.update();
  }
}
