<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
<style type="text/css">
*{margin:0px;padding:0px;}
#emp_list{border: 1px solid black;}
#emp_list td,#emp_list th{border:0px;border-right:1px solid gray;border-bottom:1px solid gray;padding:5px}
#wrapper{
position: absolute;
top: 10px;
right: 10px;
overflow: hidden;
}
</style>

</head>
<body>
<div class="">

<div>
	<form class='search_area' method="post" action="memberManageMain.ad">
		<select name='search_type'>
			<option value='MEMBER_NO'<c:if test="${search_type == 'MEMBER_NO'}">selected</c:if>>회원 번호</option>
			<option value='MEMBER_ID' <c:if test="${search_type == 'MEMBER_ID'}">selected</c:if>>회원 아이디</option>
			<option value='NICKNAME'<c:if test="${search_type == 'NICKNAME'}">selected</c:if>>회원 닉네임</option>
			<option value='MEMBER_TEL'<c:if test="${search_type == 'MEMBER_TEL'}">selected</c:if>>회원 전화번호</option>
			<option value='MEMBER_EMAIL'<c:if test="${search_type == 'MEMBER_EMAIL'}">selected</c:if>>회원 이메일</option>
			<option value='SIGNUP_DATE'<c:if test="${search_type == 'SIGNUP_DATE'}">selected</c:if>>회원 가입일</option>
			<option value=TICKET_DATE<c:if test="${search_type == 'TICKET_DATE'}">selected</c:if>>이게 뭐야?</option>
			<option value='LAST_ACCESS_DATE'<c:if test="${search_type == 'LAST_ACCESS_DATE'}">selected</c:if>>최종 접속일</option>
			<option value='GENDER'<c:if test="${search_type == 'GENDER'}">selected</c:if>>회원 성별</option>
			<option value='TICKET_CODE'<c:if test="${search_type == 'TICKET_CODE'}">selected</c:if>>TICKET_CODE(이건 뭐야???)</option>
			
			
			
	
		</select>
		<input type="text" id='search_text' name='search_text' placeholder="회원번호 또는 회원아이디를 입력해주세요" value="${search_text }">
		<input type='submit' value='검색'>
	</form>
	<div><a href="${pageContext.request.contextPath}/memberInsertForm.ad">추가</a></div>
	<button>삭제</button>
	</div>
	
	<table id='member_list' border=1 cellpadding=0 cellspacing=0>

		<thead>
			<th>MEMBER_NO</th>
			<th>MEMBER_ID</th>
			<th>MEMBER_PW</th>
			<th>NICKNAME</th>
			<th>MEMBER_TEL</th>
			<th>MEMBER_EMAIL</th>
			<th>SIGNUP_DATE</th>
			<th>TICKET_DATE</th>
			<th>LAST_ACCESS_DATE</th>
			<th>GENDER</th>
			<th>TICKET_CODE</th>
			
		</thead>
		<tbody>
			<c:forEach items="${list}" var="member">
				<tr>
					<td>${member.getMember_no()}</td>
					<td>${member.getMember_id()}</td>
					<td>${member.getMember_pw}</td>
					<td>${member.getNickname()}</td>
					<td>${member.getMember_tel()}</td>
					<td>${member.getMember_email()}</td>
					<td>${member.getSignup_date()}</td>
					<td>${member.getTicket_date()}</td>
					<td>${member.getLast_access_date()}</td>
					<td>${member.getGender()}</td>
					<td>${member.getTicket_code()}</td>		
			</c:forEach>
		${message}
		</tbody>
	</table>
</div>
</body>
</html>