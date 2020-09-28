<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<c:forEach items="${loginMember}" var="ticketList">
			<div><label> | </label> ${fn:substring(ticketList.ticket_date,0,10) }</div> 
		</c:forEach>
	
	<button>
		<a href="licenceClick.jsp"
			onclick="window.open(this.href, '_blank', 'width=750px,height=600px,toolbars=no,scrollbars=yes'); return false;">
			결제
		</a>
	</button>
</form>
	

</body>
</html>