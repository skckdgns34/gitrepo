<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%
	String member_id = request.getParameter("member_id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>아이디 찾기</h3>
	<form>
		<label for="id">아이디는 ${memberFind.member_id } 입니다.</label><br>
		<a href="/app/memberLogin.do">로그인하러가기</a>
		<a href="member/memberFindPassword.jsp">비밀번호 찾기</a>
	</form>
</body>
</html>