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
	<table border="1">
		<thead>
			<tr>
				<th>code_value</th>
				<th>금액</th>
				<th>결제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach begin="1" end="${commonList.size() }" var="i">
				<tr>
					<td>${commonList[i-1].code_value }</td>
					<td>5000원</td><!-- db에 이용권 가격 넣으면 거기에 맞춰서 출력. -->
					
					<td align="center">
						<c:if test="${member_ticket_list[i-1] !=null }">
							<label>보유중(${member_ticket_list[i-1].ticket_date})</label>
						</c:if>
						<c:if test="${member_ticket_list[i-1] ==null }">
							<button>
								<a href="${pageContext.request.contextPath }/licence/licenceClick.jsp"
									onclick="window.open(this.href, '_blank', 'width=750px,height=600px,toolbars=no,scrollbars=yes'); return false;">
									결제
								</a>
							</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>