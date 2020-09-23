<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 class="page_title">회원 전체 조회</h3>
	<ul class="search">
		<li>메일수신여부</li>
		<li>성별</li>
		<li><button type="button">검색</button></li>
	</ul>
	<hr>
	<table id="members" border="1">
		<thead>
			<tr>
				<th>id</th>
				<th>pw</th>
				<th>job</th>
				<th>이유</th>
				<th>성별</th>
				<th>메일수신여부</th>
				<th>취미</th>
				<th>가입일자</th>
				
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${list}" var="member">
			<tr>
				<td><a href="memberSelect.do?id=${member.id}">${member.id}</a></td>
				<td>${member.pw}</td>
				<td>${member.job}</td>
				<td>${member.reason}</td>
				<td>${member.gender}</td>
				<td>
					<c:if test="${member.mailys==('y'||'on')}">
						<button type="button">메일발송</button>
					</c:if>
				</td>
				<td>${member.hobby}</td>
				<td>
					<fmt:parseDate value="${member.regdate}" pattern="yyyy-MM-dd" var="parseRegdate"></fmt:parseDate>
					<fmt:formatDate value="${parseRegdate}" pattern="yy-MM"/>
				</td>
				
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>