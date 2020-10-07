<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

</script>

</head>
<body>
	<form action="${pageContext.request.contextPath}/revenueInput.do">
		
		<button name="btn" value="a" id="btn">1개월 읽기 3500</button>
		
		<button name="btn" value="b" id="btn">1개월 듣기 5000</button>
		
		<button name="btn" value="c" id="btn">1개월 일기 듣기 6000</button>
		
		<button name="btn" value="d" id="btn">1년 읽기 35000</button>
		
		<button name="btn" value="e" id="btn">1년 듣기 50000</button>
		
		<button name="btn" value="f" id="btn">1년 읽기 듣기 60000</button>
		
		
	</form>
	
	<a href="revenue/revenue.jsp">매출페이지로</a>
</body>
</html>