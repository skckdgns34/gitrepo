<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${error}
	<form action = "${pageContext.request.contextPath}/memberSearch.do">
		<input type="hidden" name="job" value = "delete">
		id: <input name="id">
		<button>검색</button>
	</form>
	
	<c:if test="${not empty member}">
		<h3>검색결과</h3>
			직업: ${member.job}<br>
			성별: ${member.gender}<br>
			ID: ${member.id}
		<form action = "${pageContext.request.contextPath}/memberDelete.do">
			<input type="hidden" name="id" value = "${member.id}">
			<button>삭제</button>
		</form>
	</c:if>
</body>
</html>