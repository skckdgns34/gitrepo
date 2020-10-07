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
			href="<%=application.getContextPath()%>/memberModify.do">내정보 수정</a>
		<li><a
			href="<%=application.getContextPath()%>/memberBookLuvList.do">내 서재</a>
		<li><a
			href="<%=application.getContextPath()%>/memberCreateBookCk.do">나만의 도서 확인</a>
		<li><a
			href="<%=application.getContextPath()%>/memberLicense.do">이용권 내용</a>
	</ul>
	<br>
	<br>
	<hr>
	<h5>찜목록</h5>
	<table border=1>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작가</td>
			<td>장르</td>
			<td>조회수</td>
		</tr>
		<c:forEach items="${list }" var="books">
				<tr>
					<td>${rownum }</td>
					<td>${books.title }</td>
					<td>${books.writer }</td>
					<td>${books.genre }</td>
					<td>${books.views }</td>
					<td><button>바로가기</button> <button>편집하기</button></td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>