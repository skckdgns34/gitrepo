<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	$(function() {
		$('#btnSelect').on('click', drawChart)
	});
	
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	
	$(function() {
		$('#btnSelect2').on('click', drawChart2)
	});
	
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	
	
	function drawChart() {
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', '날짜'); 
		data.addColumn('number', '매출'); 
		var datatable = []; 
		var cnt = 0;
		//ajax
		$.ajax({
			async : false,
			url : "${pageContext.request.contextPath}/moneyOutList.ad",  //
			dataType : "json",
			data :  $("form").serialize(),
			success : function(datas) {
				console.dir(datas);
				userListResult(datas);
				cnt = datas.length-1; //마지막 배열은 값이 입력되지 않음
				for (i = 0; i < datas.length-1; i++) {
					datatable.push([ datas[i].pay_date, parseInt(datas[i].price) ]); 
				}
			}
		});
		data.addRows(datatable); 
		//데이터를 받아온 다음에 addrows를 해야하는데 ajax는 비동기가 default이기 때문에 ajax를 async써준다 이렇게 안하면 데이터도 없는데 addrows해버림
		// Set chart options
		var options = {
			'title' : '날짜별 통계',
			'role'	: 'grid'
		};
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.LineChart(document.getElementById('chart_div')); //뒤에 chart_div가 차트가 들어갈 위치
		chart.draw(data, options);
		//차트까지 그린 후 넣지 않았던 값을 테이블에 따로 넣어줌
		datatable.push([ datas[cnt].pay_date, parseInt(datas[cnt].price) ]);
		data.addRows(datatable);
	}
	
	
	function drawChart2() {
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', '날짜'); 
		data.addColumn('number', '매출'); 
		var datatable = []; 
		var cnt = 0;
		//ajax
		$.ajax({
			async : false,
			url : "${pageContext.request.contextPath}/moneyOutlist.ad",  //
			dataType : "json",
			data :  $("form").serialize(),
			success : function(datas) {
				console.dir(datas);
				userlistResult(datas);
				cnt = datas.length-1;
				for (i = 0; i < datas.length-1; i++) {
					datatable.push([ datas[i].pay_date, parseInt(datas[i].price) ]); 
				}
			}
		});
		data.addRows(datatable); 
		//데이터를 받아온 다음에 addrows를 해야하는데 ajax는 비동기가 default이기 때문에 ajax를 async써준다 이렇게 안하면 데이터도 없는데 addrows해버림
		// Set chart options
		var options = {
			'title' : '날짜별 통계',
			'role'	: 'grid'
		};
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.LineChart(document.getElementById('chart_div')); //뒤에 chart_div가 차트가 들어갈 위치
		chart.draw(data, options);
		
		datatable.push([ datas[cnt].pay_date, parseInt(datas[cnt].price) ]);
		data.addRows(datatable); 
	}
	
	
	
	//사용자 목록 조회 응답
	function userListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('tbody').append ( makeTr(item) );
		});//each
	}//userListResult
	
	//사용자 목록 조회 응답
	function userlistResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item2){
			$('tbody').append ( makeTr2(item2) );
		});//each
	}//userListResult
	
	function makeTr(item){
		return $('<tr>')
		.append($('<td>').html(item.pay_date))
		.append($('<td>').html(item.price));
	}
	
	function makeTr2(item2){
		return $('<tr>')
		.append($('<td>').html(item2.pay_date))
		.append($('<td>').html(item2.price));
	}
	
	
	</script>
</head>

<body id="page-top">
<div class="container-fluid">
<div class="card-body"> 
<div class="table-responsive">
	
	<form>
		<div>
			<input name="startdate" type="date" /> - <input name="enddate"type="date"/>  
		<button type="button" id="btnSelect" class="btn btn-outline btn-primary pull-left">결과조회</button>
		
			<label for="quarterYear">연도선택</label> <select
				id="quarterYear" name="quarterYear">
				<option value="">선택</option>
				<option value="2015">2015년</option>
				<option value="2016">2016년</option>
				<option value="2017">2017년</option>
				<option value="2018">2018년</option>
				<option value="2019">2019년</option>
				<option value="2020">2020년</option>
			</select> 
			<label for="quarter">분기선택</label>
			<select id="quarter"name="quarter">
				<option value="">선택</option>
				<option value="aquarter">전체</option>
				<option value="fquarter">1분기</option>
				<option value="squarter">2분기</option>
				<option value="tquarter">3분기</option>
				<option value="qquarter">4분기</option>
			</select>
		<button type="button" id="btnSelect2" class="btn btn-outline btn-primary pull-left">결과조회</button>
		</div>
<div id="chart_div" role="grid">
		 <img src="./images/moneychart.png" alt="">
	</div>

 <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th>일자</th>
					<th>금액(원)</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</form>
	</div>
	</div>
	</div>
</body>
</html>