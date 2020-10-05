$(document).ready(function(){
	 $.ajax({
		    url: "./ticketChart.ad",
		    type: "POST",
		    cache: false,
		    dataType: "json",
		    data: {},
		    contentType : "application/json; charset=UTF-8",
		    success: function(data2){
		    	drawRadarchart(data2);
		    },
		    
		    error: function (request, status, error){        
		      alert("에러");
		    }
		  });

});


function drawRadarchart(data2){
	label = new Array();
	datasf = new Array();
	datasm = new Array();
	
	
	for(var i=0;i<data2.length;i++){
		datasf[i] = data2[i].f; 
		datasm[i] = data2[i].m;
		label[i] = data2[i].code_value;
	
	}
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
  type: 'radar',
  data: {
    labels: label,
    datasets: [{
      label: '남자',
      data: datasm,
      backgroundColor: "rgba(54, 162, 235, 0.2)",
      borderColor: "rgba(54, 162, 235, 1)",
    }, {
      label: '여자',
      data: datasf,
      backgroundColor: "rgba(255, 99, 132, 0.2",
      borderColor: "rgba(255, 99, 132, 1)",
    }]
  }
});
}