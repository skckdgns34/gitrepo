<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>

<script>
	function check(ck) {
		var obj = document.getElementsByName("user_CheckBox");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != ck) {
				obj[i].checked = false;
			}
		}
	};

	function modifypage() {
		if (confirm("수정하시겠습니까?") == true){ 
		window.document.location.href = "empManageModifyForm.ad?emp_no="
				+ $('input[name="user_CheckBox"]:checked').val();
		document.form.submit();
		}else{   //취소
		    return;
		}
	}
		
	function addpage() {
		window.document.location.href = "employeesInsertForm.ad";
		return;
	}

	function deletepage() {
		if (confirm("삭제하시겠습니까?") == true){  
		window.document.location.href = "employeesDelete.ad?emp_no="
				+ $('input[name="user_CheckBox"]:checked').val();
		document.form.submit();
		}else{   //취소
			$('user_CheckBox').attr('checked',false);
			window.document.location.href = "empManageList.ad";
		    return;
		}
	}
	$(document).on(
			"click",
			"#excel",
			function() {

				var data_type = 'data:application/vnd.ms-excel;charset=utf-8';
				var table_html = encodeURIComponent(document
						.getElementById('dataTable').outerHTML);

				var a = document.createElement('a');
				a.href = data_type + ',%EF%BB%BF' + table_html;
				a.download = 'test' + '_excel' + '.xls';
				a.click();

	})
	
</script>
</head>

<body id="page-top">

	<div class="container-fluid">

		<h3 class="page_title">사원 조회</h3>



		<div class="card-body">
			<div class="table-responsive">
				<div>
				
					<button type='button' id='btn_i'
						class="btn btn-outline btn-primary pull-left" onclick="addpage()">추가</button>
					<button type='button' id='btn_n'
						class="btn btn-outline btn-primary pull-left"
						onclick="modifypage()">수정</button>
					<button type="button" id='btn_d'
						class="btn btn-outline btn-primary pull-right"
						onclick="deletepage()">삭제</button>
					<button class="btn btn-primary" id="excel">엑셀</button>
					
				</div>
				<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">

					<thead>
						<th>선택</th>
						<th>사원번호</th>
						<th>사원 아이디</th>
						<th>사원 이름</th>
						<th>생년월일</th>
						<th>입사일</th>
						<th>부서코드</th>
						<th>사원 주소</th>
						<th>관리자 코드</th>

					</thead>
					<tbody>
						<c:forEach items="${list}" var="employees">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"
									onclick="check(this)" value="${employees.getEmp_no()}"></td>
								<td>${employees.getEmp_no()}</td>
								<td>${employees.getEmp_id()}</td>
								<td>${employees.getEmp_name()}</td>
								<td>${fn:substring(employees.emp_birth,0,10)}</td>
								<td>${fn:substring(employees.entereddate,0,10)}</td>
								<td>${employees.getDept_code_value()}</td>
								<td>${employees.getEmp_address()}</td>
								<td>${employees.getRank_code_value()}</td>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>