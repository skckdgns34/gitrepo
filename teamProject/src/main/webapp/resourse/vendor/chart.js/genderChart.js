$(document).ready(function(){
	 $.ajax({
		    url: "./genderChart.ad",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: {},
		    contentType : "application/json; charset=UTF-8",
		    success: function(data1){
		    	drawPiechart(data1);
		    },
		    
		    error: function (request, status, error){        
		      alert("에러");
		    }
		  });
});


function drawPiechart(data1){
	label = new Array();
	datas = new Array();
	for(var i=0;i<data1.length;i++){
		label[i] = data1[i].gender;
		datas[i] = data1[i].cnt;
	}
// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'pie',
  data: {
    labels: label,
    datasets: [{
      data: datas,
      backgroundColor: ['rgba(54, 162, 235, 0.2)', 'rgba(255, 99, 132, 0.2)'],
      hoverBackgroundColor: ['rgba(54, 162, 235, 1)', 'rgba(255, 99, 132, 1)'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
}],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
}