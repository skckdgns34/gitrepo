<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3 align="center">라이센스 결제정보</h3>
<hr>

<h5>연 정기구독</h5>
<form action="licenceClick.jsp">
	<div><label>구독기간 |</label></div>
	<div><label>다음 결제일 |</label> ${fn:substring(loginMember.ticket_date,0,10) }</div>
	<button>결제</button>
</form>

</body>
</html>