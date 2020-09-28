<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="page_title">출판사 전체 조회</h3>
	<hr>
	<table id="company" border="1">
		<thead>
			<tr>
				<th>출판사번호</th>
				<th>출판사이름</th>
				<th>출판사주소</th>
				<th>출판사담당자</th>
				<th>출판사전화번호</th>
				<th>담장자전화번호</th>
				<th>계좌정보</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="company">
			<tr>
				<td><a href="companyMain.ad?company_code=${company.company_code}">${company.company_code}</a></td>
				<td>${company.company_name}</td>
				<td>${company.company_addr}</td>
				<td>${company.company_mgr}</td>
				<td>${company.company_tel}</td>
				<td>${company.company_mgr_tel}</td>
				<td>${company.company_account}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>