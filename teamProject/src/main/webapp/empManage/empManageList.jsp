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
<style type="text/css">
*{margin:0px;padding:0px;}
#emp_list{border: 1px solid black;}
#emp_list td,#emp_list th{border:0px;border-right:1px solid gray;border-bottom:1px solid gray;padding:5px}
#wrapper{
position: absolute;
top: 10px;
right: 10px;
overflow: hidden;
}
</style>
<script>


</script>

</head>
<body>
<div class="">

<div>
	<form class='search_area' method="post" action="empManageList.ad">
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
		<input type="text" id='search_text' name='search_text' placeholder="사원번호 또는 아이디를 입력해주세요" value="${search_text }">
		<input type='submit' value='검색'>
	</form>
	<div><a href="${pageContext.request.contextPath}/employeesInsertForm.ad">추가</a></div>
	<button>삭제</button>
	</div>
	
	<table id='emp_list' border=1 cellpadding=0 cellspacing=0>

		<thead>
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
					<td>${employees.getEmp_no()}</td>
					<td>${employees.getEmp_id()}</td>
					<td>${employees.getEmp_name()}</td>
					<td>${employees.getEmp_birth()}</td>
					<td>${employees.getEntereddate()}</td>
					<td>${employees.getDept_code()}</td>
					<td>${employees.getEmp_address()}</td>
					<td>${employees.getRank_code()}</td>
				
			</c:forEach>
		${message}
		</tbody>
	</table>
</div>
</body>
</html>