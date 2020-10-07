<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
</style>
</head>
<body>
	<h1>이용권 내용</h1>
	<hr>
	<br>
	<ul>
		<li><a
			href="<%=application.getContextPath()%>/memberModify.do">내정보 수정</a>
		<li><a
			href="<%=application.getContextPath()%>/memberLibrary.do">내 서재</a>
		<li><a
			href="<%=application.getContextPath()%>/memberCreateBookCk.do">나만의 도서 확인</a>
		<li><a
			href="<%=application.getContextPath()%>/memberLicense.do">이용권 내용</a>
	</ul>
	<br>
	<br>
	<hr>
	<table border="1">
			<tr>
				<td>번호</td>
				<td>상태</td>
				<td>상품명</td>
				<td>결제일</td>
				<td>구매금액</td>
				<td>만료일자</td>
			</tr>
			<c:forEach items="${list }" var="license">
				<tr>
					<td></td>
					<td>${ }</td>
					<td>${ }</td>
					<td>${ }</td>
					<td>${ }</td>
					<td>${ }</td>
					<td>$${ }</td>
				</tr>
			</c:forEach>
		</table>
		<my:paging paging="${paging }" jsfunc="gopage" />
		
	<script>
		function gopage(p) {
			searchFrm.p.value = p;
			searchFrm.submit();

			//location.href="deptSelectAll?p=" + p;
		}
	</script>

</body>
</html>