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
<style type="text/css">
body {
	text-align: center;
	}
	
	#a{
	color: #002347;
	}
	
	#b{
	color: #002347;
	}
</style>
</head>
<body>
<br>
<h3>아이디 찾기</h3>
	<form>
		<label for="id">아이디는 ${memberFind.member_id } 입니다.</label><br><br>
		<a id="a" href="${pageContext.request.contextPath}/memberLogin.do">로그인하러가기</a> |
		<a id="b"href="member/memberFindPassword.jsp">비밀번호 찾기</a>
	</form>
	<br>
</body>
</html>