$(document).ready(function(){
	 $.ajax({
		    url: "./viewChart.ad",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: {},
		    contentType : "application/json; charset=UTF-8",
		    success: function(data){
		    	drawBarchart(data);
		    },
		    
		    error: function (request, status, error){        
		      alert("에러");
		    }
		  });

});
function drawBarchart(data){
	label = new Array();
	datas = new Array();
	for(var i=0;i<data.length;i++){
		label[i] = data[i].title;
		datas[i] = data[i].views;
	}
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: label,
	    datasets: [{
	      label: "조회수",
	      //backgroundColor: "#4e73df",
	      //hoverBackgroundColor: "#2e59d9",
	      borderColor: "#4e73df",
	      backgroundColor: [ 'rgb(255, 99, 132)','rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)', 'rgb(255, 127, 80)','rgb(0, 0, 139)','rgb(72, 61, 139)','rgb(85, 107, 47)'],
	      data: datas,
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 0,
	        right: 0,
	        top: 0,
	        bottom: 0
	      }
	    },		
	    scales: {
	      xAxes: [{
	        time: {
	          unit: 'month'
	        },
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: 6
	        },
	        maxBarThickness: 25,
	      }],
	    },
	    legend: {
	      display: false
	    },
	  
	  }
	});

}

