<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<h1>내 정보</h1>
	<hr>
	<br>
	<ul>
		<li><a href="<%=application.getContextPath()%>/memberModify.do">내정보
				수정</a>
		<li><a href="<%=application.getContextPath()%>/memberBookMark.do">내
				서재</a>
		<li><a
			href="<%=application.getContextPath()%>/memberCreateBookCk.do">나만의
				도서 확인</a>
		<li><a href="<%=application.getContextPath()%>/memberLicense.do">이용권
				내용</a>
	</ul>
	<br>
	<ul>
		<li><a href="<%=application.getContextPath()%>/memberCreateBookCk.do">작성중</a>
		<li><a href="<%=application.getContextPath()%>/memberCreateBookComp.do">등록완료</a>
	</ul>
	<br>
	<hr>
	<h5>나만의 도서 확인 - 등록완료</h5>
		<input type="hidden" name="member_no" id="member_no" value="${member_no }">
		<table border=1>
			<tr>
				<td>제목</td>
				<td>장르</td>
				<td>조회수</td>
				<td>등록일자</td>
				<td></td>
			</tr>
			<c:forEach items="${list }" var="bookcomp">
				<tr>
					<td>${bookcomp.title }</td>
					<td>${bookcomp.genre }</td>
					<td>${bookcomp.views }</td>
					<td>${bookcomp.registration_date }</td>
					<td><button>바로가기</button> <button>편집하기</button></td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>