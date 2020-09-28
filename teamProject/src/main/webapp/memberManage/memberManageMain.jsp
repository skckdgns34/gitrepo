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
		for(var i =0; i<obj.length; i++){
			if(obj[i] != ck) {
				obj[i].checked = false;
			}
		}
	};

	function modifypage() //수정 
	{
	window.document.location.href="${pageContext.request.contextPath}/memberManageModifyForm.ad?no="+ $('input[name="user_CheckBox"]:checked').val();
	alert( $('input[name="user_CheckBox"]:checked').val())
	return;
	}
	
	function deletepage() //삭제
	{
	window.document.location.href="${pageContext.request.contextPath}/주소 적기...ㅠ.ad";
	return;
	}
	
	
	</script>

</head>
<body id="page-top">
	
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">검색</h6>
				 </div>
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
					method="post" action="memberManageMain.ad">
					<div class="input-group">
						<select name='search_type'>
							<option value='MEMBER_NO'
								<c:if test="${search_type == 'MEMBER_NO'}">selected</c:if>>회원
								번호</option>
							<option value='MEMBER_ID'
								<c:if test="${search_type == 'MEMBER_ID'}">selected</c:if>>회원
								아이디</option>
							<option value='NICKNAME'
								<c:if test="${search_type == 'NICKNAME'}">selected</c:if>>회원
								닉네임</option>
							<option value='MEMBER_TEL'
								<c:if test="${search_type == 'MEMBER_TEL'}">selected</c:if>>회원
								전화번호</option>
							<option value='MEMBER_EMAIL'
								<c:if test="${search_type == 'MEMBER_EMAIL'}">selected</c:if>>회원
								이메일</option>
							<option value='SIGNUP_DATE'
								<c:if test="${search_type == 'SIGNUP_DATE'}">selected</c:if>>회원
								가입일</option>
							<option value=TICKET_DATE
								<c:if test="${search_type == 'TICKET_DATE'}">selected</c:if>>이게
								뭐야?</option>
							<option value='LAST_ACCESS_DATE'
								<c:if test="${search_type == 'LAST_ACCESS_DATE'}">selected</c:if>>최종
								접속일</option>
							<option value='GENDER'
								<c:if test="${search_type == 'GENDER'}">selected</c:if>>회원
								성별</option>
							<option value='TICKET_CODE'
								<c:if test="${search_type == 'TICKET_CODE'}">selected</c:if>>이용권코드</option>
						</select>
						</div>
						
						<div class="input-group-append">
							<input type="text" id='search_text' name='search_text'
								placeholder="회원번호 또는 회원아이디를 입력해주세요" value="${search_text }">
							<button class="btn btn-primary" id="btnOk" type="submit">
								<i class="fas fa-search fa-sm"></i>
							</button> 	
						</div>
				</form>


					<div><input type='button' id='btn_n' value='수정' onclick="modifypage()"></div>
					<div><input type='button' id='btn_d' value='삭제' onclick="deletepage()"></div>
					
			
				
			
		</div>
		<div class="card-body">
			<div class="table-responsive">
			
				<button type="button" class="btn btn-outline btn-primary pull-right" id="selectBtn">선택</button>
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
						<th>TICKET_DATE</th>
						<th>LAST_ACCESS_DATE</th>
						<th>GENDER</th>
						<th>TICKET_CODE</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="member">
							<tr>
								<td><input type="checkbox" name="user_CheckBox" onclick="check(this)" value="${member.getMember_no()}"></td>
								<td>${member.getMember_no()}</td>
								<td>${member.getMember_id()}</td>
								<td>${member.getMember_pw()}</td>
								<td>${member.getNickname()}</td>
								<td>${member.getMember_tel()}</td>
								<td>${member.getMember_email()}</td>
								<td>${member.getSignup_date()}</td>
								<td>${member.getTicket_date()}</td>
								<td>${member.getLast_access_date()}</td>
								<td>${member.getGender()}</td>
								<td>${member.getTicket_code()}</td>
						</c:forEach>
					</tbody>
				</table>
			
			</div>
		</div>
	</div>
</body>
</html>