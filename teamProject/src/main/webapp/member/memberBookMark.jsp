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
	<h1>읽은 책</h1>
	<hr>
	<br>
	<ul>
		<li><a
			href="<%=application.getContextPath()%>/memberModify.do">내정보 수정</a>
		<li><a
			href="<%=application.getContextPath()%>/memberBookMark.do">내 서재</a>
		<li><a
			href="<%=application.getContextPath()%>/memberCreateBookCk.do">나만의 도서 확인</a>
		<li><a
			href="<%=application.getContextPath()%>/memberLicense.do">이용권 내용</a>
	</ul>
	<br>
	<br>
	<hr>
	<h4>읽은 책</h4>
	<table border="1">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>만료일자</td>
			</tr>
			<c:forEach items="${list }" var="">
				<tr>
					<td></td>
					<td>${ }</td>
					<td>${ }</td>
					<td>${ }</td>
					<td>${ }</td>
					<td>${ }</td>
				</tr>
			</c:forEach>
		</table>

		
		<my:paging paging="${paging }" jsfunc="gopage" />

	<script>
		function gopage(p) {
			searchFrm.p.value = p;
			searchFrm.submit();

			location.href="memberLicense.do?p=" + p;
		}
	</script>

</body>
</html>