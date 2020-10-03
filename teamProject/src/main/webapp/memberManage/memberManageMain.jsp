<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!-- 로그인이 안 되면 접근을 못ㅎ하게 만들어 놓음! -->
<%@include file="/decorator/moveLoginForm.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>

<script>
	function check(ck) {
		var obj = document.getElementsByName("user_CheckBox");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != ck) {
				obj[i].checked = false;
			}
		}
	};

	function modifypage() //수정 ㅡ
	{
		window.document.location.href = "${pageContext.request.contextPath}/memberManageModifyForm.ad?no="
				+ $('input[name="user_CheckBox"]:checked').val();
		alert($('input[name="user_CheckBox"]:checked').val())
		return;
	}

	function deletepage() //삭제
	{
		window.document.location.href = "${pageContext.request.contextPath}/memberManageDelete.ad?no= "
				+ $('input[name="user_CheckBox"]:checked').val();
		return;
	}
</script>

</head>
<body id="page-top">

	<div class="container-fluid">
		
		<h3 class="page_title">회원 전체 조회</h3>
		<hr>
		<div class="card-body">
			<div class="table-responsive">
				<div>
					<button type="button" id='btn_n'
						class="btn btn-outline btn-primary pull-" onclick="modifypage()">수정</button>
					<button type="button" id='btn_d'
						class="btn btn-outline btn-primary pull-right"
						onclick="deletepage()">삭제</button>
				</div>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<thead>
						<tr>
							<th>선택</th>
							<th>MEMBER_NO</th>
							<th>MEMBER_ID</th>
							<th>MEMBER_PW</th>
							<th>NICKNAME</th>
							<th>MEMBER_TEL</th>
							<th>MEMBER_EMAIL</th>
							<th>SIGNUP_DATE</th>
							<th>LAST_ACCESS_DATE</th>
							<th>GENDER</th>
							<th>TICKET_CODE</th>
							<th>TICKET_DATE</th>
							
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="member">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"
									onclick="check(this)" value="${member.getMember_no()}"></td>
								<td>${member.getMember_no()}</td>
								<td>${member.getMember_id()}</td>
								<td>${member.getMember_pw()}</td>
								<td>${member.getNickname()}</td>
								<td>${member.getMember_tel()}</td>
								<td>${member.getMember_email()}</td>
								<td>${member.getSignup_date()}</td>
								<td>${member.getLast_access_date()}</td>
								<td>${member.getGender()}</td>
								<td>${member.getTicket_code()}</td>
								<td>${member.getTicket_date()}</td>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>