<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body id="page-top">

	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">검색</h6>
				 </div>
<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
					method="post" action="companyMain.ad">
<div class="input-group">
		<select name='search_type'>
			<option value='COMPANY_CODE'<c:if test="${search_type == 'COMPANY_CODE'}">selected</c:if>>출판사 번호</option>
			<option value='COMPANY_NAME' <c:if test="${search_type == 'COMPANY_NAME'}">selected</c:if>>출판사 이름</option>
			<option value='COMPANY_ADDR'<c:if test="${search_type == 'COMPANY_ADDR'}">selected</c:if>>출판사 주소</option>
			<option value='COMPANY_MGR'<c:if test="${search_type == 'COMPANY_MGR'}">selected</c:if>>출판사 담당자</option>
			<option value='COMPANY_BANK'<c:if test="${search_type == 'COMPANY_BANK'}">selected</c:if>>출판사 은행</option>
	
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
		</div>
	
	
	</div>
<h3 class="page_title">출판사 전체 조회</h3>
	<hr>
	<div class="card-body">
			<div class="table-responsive">
	<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
		<thead>
			<tr>
				<th>출판사번호</th>
				<th>출판사이름</th>
				<th>출판사주소</th>
				<th>출판사담당자</th>
				<th>출판사전화번호</th>
				<th>담장자전화번호</th>
				<th>은행정보</th>
				<th>계좌정보</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="company">
			<tr>
				<td><a href="companySelect.ad?company_code=${company.company_code}">${company.company_code}</a></td>
				<td>${company.company_name}</td>
				<td>${company.company_addr}</td>
				<td>${company.company_mgr}</td>
				<td>${company.company_tel}</td>
				<td>${company.company_mgr_tel}</td>
				<td>${company.company_bank}</td>
				<td>${company.company_account}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
		
			</div>
		</div>
	</div>
</body>
</html>