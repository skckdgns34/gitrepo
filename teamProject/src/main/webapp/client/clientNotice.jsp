<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
</style>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<h1>공지</h1>
	<hr>
	<br>
	<ul>
		<li><a
			href="<%=application.getContextPath()%>/clientNotice.do">공지사항</a>
		<li><a
			href="<%=application.getContextPath()%>/clientFAQ.do">FAQ</a>
		<li><a
			href="<%=application.getContextPath()%>/clientQuestion.do">문의</a>
	</ul>
	<br>
	<br>
	<hr>
	<form action="${pageContext.request.contextPath }/clientNotice.do"
		method="get" nane="searchFrm">
		<table border="1">
			<tr>
				<td>게시물 번호</td>
				<td>제목</td>
				<td>등록일</td>
				<td>조회수</td>
			</tr>
			<c:forEach items="${list }" var="notice">
				<tr>
					<td>${notice.emp_no }</td>
					<td>${notice.notice_title }</td>
					<td>${notice.notice_date }</td>
					<td>${notice.views }</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<my:paging paging="${paging }" jsfunc="gopage" />
	<script>
		function gopage(p) {
			searchFrm.p.value = p;
			searchFrm.submit();

			//location.href="deptSelectAll?p=" + p;
		}
	</script>

	<input type="text">
	<button>검색</button>
</body>
</html>