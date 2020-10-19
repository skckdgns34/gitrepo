<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 로그인이 안 하면 접근을 못ㅎ하게 만들어 놓음! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>companyRegister</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	function setParentText() {
		opener.document.getElementById("company").value = document
				.getElementById("company_name").value
				window.close();
	}
</script>
<script>

	function insertName() {
		var searchCompany = $('#company_name').val();
		$.ajax({
			url : "${pageContext.request.contextPath}/bookcompanySelect.do",
			type: "POST",
			data: { 
				searchCompany : searchCompany
			},
			success : function(datas) {
				console.dir(datas);
				userlistResult(datas);
				for (i = 0; i < datas.length; i++) {
					datatable.push.val(datas[i].company_name);
			}
			}
		});
	}
	function userlistResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('tbody').append ( makeTr(item) );
		});//each
	}//userListResult
	
	function makeTr(item){
		return $('<tr>')
		.append($('<td class="name" onclick="name_click()">').html(item.company_name));
	}
	function name_click(){
		$(".name").on("click",function(){
			var c_name = $(this).html();
			console.log(c_name);
			$("#company_name").val(c_name);
		})
	}
	
</script>
</head>
<body>
	<form>


	<br>
	<b><font size="5" color="gray">출판사 검색</font></b>
	<br>
	<br>
	<input type="text" id="company_name" name="company_name" >
	<!-- <input type="text" id="cInput" name="cInput"> -->
	<button type="button" id="btnSelect" onclick="insertName()">결과조회</button>
	<input type="button" value="등록하기" onclick="setParentText()">
	<br>
	<br>
	<input type="button" value="창닫기" onclick="window.close()">
		<table class="table table-bordered" id="dataTable" width="100%"
			cellspacing="0" border="1">
			<thead>
				<tr>
					<th>출판사 이름</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</form>
</body>
</html>


