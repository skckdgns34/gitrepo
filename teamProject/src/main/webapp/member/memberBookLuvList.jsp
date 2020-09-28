<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내서재 - 찜목록</title>
<style>
li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}
</style>
</head>
<body>
<h1>내정보</h1>
	<hr>
	<br>
	<ul>
		<li><a
			href="<%=application.getContextPath()%>/memberNodify.do">내정보 수정</a>
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
	<h6>찜목록</h6>
	<table border=1>
		<tr>
			<td>번호</td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>

</body>
</html>