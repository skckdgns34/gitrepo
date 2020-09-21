<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function(){
			$("#testInput").autocomplete({
								source : function(request, response) {
									$.ajax({
										url : "${pageContext.request.contextPath}/mainsearchResult.do",
										type : "GET",
										dataType : "json",
										data : {data : $("#testInput").val()},	 // 검색 키워드
										success : function(data) { // 성공
											response($.map(data, function(item) {
													return {
														label : item.title, //목록에 표시되는 값
														value : item.title, //선택 시 input창에 표시되는 값	
														idx : item.testIdx};
											})); //response
										},//success
										error : function() { //실패
											alert("통신에 실패했습니다.");
										}
									});
								},
								minLength : 1,
								autoFocus : false,
								select : function(evt, ui) {
									console.log("전체 data: " + JSON.stringify(ui));
									console.log("db Index : " + ui.item.idx);
									console.log("검색 데이터 : " + ui.item.value);
								},
								focus : function(evt, ui) {
								return false;
								},
								close : function(evt) {
								}
			});
			
			
			function (){
				
			}
	});
</script>
</head>
<body>
	
		<input type="text" id="testInput" placeholder="자동완성" name="search"/> <br>
	
</body>
</html>