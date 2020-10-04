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
	datas = new Array();
	gender = new Array();
	
	for(var i=0;i<data2.length;i++){
		datas[i] = data2[i].cnt;
		gender[i] = data2[i].gender;
		label[i] = data2[i].code_value;
	
	}
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
  type: 'radar',
  data: {
    labels: label,
    datasets: [{
      label: gender[0],
      data: datas[0],
      backgroundColor: "rgba(255,0,0,0.4)",
      borderColor: "rgba(255,0,0,1)",
    }, {
      label: gender[1],
      data: datas[1],
      backgroundColor: "rgba(255,153,0,0.4)",
      borderColor: "rgba(255,153,0,1)",
    }]
  }
});
}