<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%
    String member_id = request.getParameter("member_id"); 
    String nickname = request.getParameter("nickname");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 환영</title>
</head>
<body>
	<h1>환영합니다!</h1>
	<%=nickname %>(<b><%=member_id %></b>)님!<br>
	가입해주셔서 감사합니다.
	<br><hr><br>
	<a href="/app/memberLogin.do">로그인하러가기</a>
</body>
</html>