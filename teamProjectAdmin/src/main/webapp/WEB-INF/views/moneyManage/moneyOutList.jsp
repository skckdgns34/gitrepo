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
	
	
	function drawChart() {
		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', '날짜'); 
		data.addColumn('number', '매출'); 
		var datatable = []; 
		
		//ajax
		$.ajax({
			async : false,
			url : "${pageContext.request.contextPath}/moneyOutList.ad",
			dataType : "json",
			data :  $("form").serialize(),
			success : function(datas) {
				console.dir(datas);
				userListResult(datas);
				
				for (i = 0; i < datas.length; i++) {
					datatable.push([ datas[i].sal_date, datas[i].revenue ]); 
				}
			}
		});
		data.addRows(datatable); 
		//데이터를 받아온 다음에 addrows를 해야하는데 ajax는 비동기가 default이기 때문에 ajax를 async써준다 이렇게 안하면 데이터도 없는데 addrows해버림
		// Set chart options
		var options = {
			'title' : '날짜별 통계',
			'width' : 400,
			'height' : 300
		};
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div')); //뒤에 chart_div가 차트가 들어갈 위치
		chart.draw(data, options);
	}
	//사용자 목록 조회 응답
	function userListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('tbody').append ( makeTr(item) );
		});//each
	}//userListResult
	
	function makeTr(item){
		return $('<tr>')
		.append($('<td>').html(item.pay_date))
		.append($('<td>').html(item.price))
		.append($('<td>').html(item.ticket_code));
		

	}
	
	
	</script>
</head>

<body>
	<div id="chart_div" style="width: 900px; height: 500px"></div>
	
	<form>
		<div>
			<input name="startdate" type="date" /> - <input name="enddate"type="date" /> <br> 
			<label for="quarterYear">연도선택</label> <select
				id="quarterYear" name="quarterYear">
				<option value="">선택</option>
				<option value="2015">2015년</option>
				<option value="2016">2016년</option>
				<option value="2017">2017년</option>
				<option value="2018">2018년</option>
				<option value="2019">2019년</option>
				<option value="2020">2020년</option>
			</select> <label for="quarter">분기선택</label>
			 
			<select id="quarter"name="quarter">
				<option value="">선택</option>
				<option value="aquarter">전체</option>
				<option value="fquarter">1분기</option>
				<option value="squarter">2분기</option>
				<option value="tquarter">3분기</option>
				<option value="qquarter">4분기</option>
			</select>
		</div>
		<button type="button" id="btnSelect">결과조회</button>


		<table border="1">
			<thead>
				<tr>
					<th>일자</th>
					<th>금액</th>
					<th>코드</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</form>
</body>
</html>