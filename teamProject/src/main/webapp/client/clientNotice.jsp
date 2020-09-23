<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	li {list-style-type: none; float: left; margin-left: 20px;}
</style>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<h1>공지</h1>
	<hr><br>
	<ul>
		<li><a href="<%=application.getContextPath() %>/member/clientNotice.jsp">공지사항</a>
		<li><a href="<%=application.getContextPath() %>/member/clientFAQ.jsp">FAQ</a>
		<li><a href="<%=application.getContextPath() %>/member/clientQuestion.jsp">문의</a>
	</ul><br>
	<br><hr>
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
			<td><a href="notice???.jsp">${notice.notice_title }</a></td>
			<td>${notice.notice_date }</td>
			<td>${notice.view }</td>
		</tr>
		</c:forEach>
	</table>
	<input type="text">
	<button>검색</button>
</body>
</html>