<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이용권 목록</h3>
	<form action="${pageContext.request.contextPath }/licencePayment.do">
		<table border="1">
			<thead>
				<tr>
					<th>common_name</th>
					<th>code</th>
					<th>code_value</th>
					<th>결제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach begin="1" end="${commonList.size() }" var="i">
					<tr>
						<td>${commonList[i].common_name }</td>
						<td>${commonList[i].code }</td>
						<td>${commonList[i].code_value }</td>
						<td align="center">
							<c:if test="${member_ticket_list[i] !=null }">
								<label>보유중</label>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</form>
</body>
</html>