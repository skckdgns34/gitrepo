<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
<script>
function check(ck) {
	var obj = document.getElementsByName("user_CheckBox");
	for(var i =0; i<obj.length; i++){
		if(obj[i] != ck) {
			obj[i].checked = false;
		}
	}
};

function modifypage(page)
{
window.document.location.href='${pageContext.request.contextPath}/empManage/empManageModify.jsp';
return;
}
function addpage(page)
{
window.document.location.href="${pageContext.request.contextPath}/employeesInsertForm.ad";
return;
}


</script>
</head>

<body id="page-top">

	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">검색</h6>
				 </div>
<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
					method="post" action="empManageList.ad">
<div class="input-group">
		<select name='search_type'>
			<option value='EMP_NO'<c:if test="${search_type == 'EMP_NO'}">selected</c:if>>사원 번호</option>
			<option value='EMP_ID' <c:if test="${search_type == 'EMP_ID'}">selected</c:if>>사원 아이디</option>
			<option value='EMP_NAME'<c:if test="${search_type == 'EMP_NAME'}">selected</c:if>>사원 이름</option>
			<option value='EMP_BIRTH'<c:if test="${search_type == 'EMP_BIRTH'}">selected</c:if>>사원 생년월일</option>
			<option value='ENTEREDDATE'<c:if test="${search_type == 'ENTEREDDATE'}">selected</c:if>>사원 입사일</option>
			<option value='EMP_ADDRESS'<c:if test="${search_type == 'EMP_ADDRESS'}">selected</c:if>>사원 주소</option>
			<option value='DEPT_CODE'<c:if test="${search_type == 'DEPT_CODE'}">selected</c:if>>부서 코드</option>
			<option value='RANK_CODE'<c:if test="${search_type == 'RANK_CODE'}">selected</c:if>>??(이건 뭐야?)</option>
	
		</select>
		</div>
		<div class="input-group-append">
							<input type="text" id='search_text' name='search_text'
								placeholder="회원번호 또는 회원아이디를 입력해주세요" value="${search_text }">
								<button class="btn btn-primary" id="btnOk" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button> 
						</div>
	</form>
	<div><input type='button' value='추가' onclick="addpage()"></div>
		<div><input type='button' id='btn_n' value='수정' onclick="modifypage()"></div>
				<div><a href="${pageContext.request.contextPath}/employeesdelete.ad">삭제</a></div>
		</div>
	
	
	</div>
	<div class="card-body">
			<div class="table-responsive">
				<button type="button" class="btn btn-outline btn-primary pull-right" id="selectBtn">선택</button>
	<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

		<thead>
			<th>선택</th>
			<th>EMP_NO</th>
			<th>EMP_ID</th>
			<th>EMP_NAME</th>
			<th>EMP_BIRTH</th>
			<th>ENTEREDDATE</th>
			<th>DEPT_CODE</th>
			<th>EMP_ADDRESS</th>
			<th>RANK_CODE</th>
			
		</thead>
		<tbody>
			<c:forEach items="${list}" var="employees">
				<tr>
				<td><input type="checkbox" name="user_CheckBox" onclick="check(this)"></td>
					<td>${employees.getEmp_no()}</td>
					<td>${employees.getEmp_id()}</td>
					<td>${employees.getEmp_name()}</td>
					<td>${employees.getEmp_birth()}</td>
					<td>${employees.getEntereddate()}</td>
					<td>${employees.getDept_code()}</td>
					<td>${employees.getEmp_address()}</td>
					<td>${employees.getRank_code()}</td>
				
			</c:forEach>
		</tbody>
	</table>
</div>
</div>

</body>
</html>