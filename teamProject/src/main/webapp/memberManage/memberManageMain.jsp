<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>

<script>
	//선택 버튼 클릭 시 체크 된 Row의 값을 가져온다.
	$("#selectBtn").click(function(){
		var rowData  = new Array();
		var tdArr  = new Array();
		var checkbox  = $("input[name=user_CheckBox]:checked");
		
		//체크 된 체크박스 값을 가져온다.
		checkbox.each(function(i) {
			// checkbox.parent() : checkbox의 부모는 <td>이다.
			// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkbox.parent().parent().eq(i);
			var td = tr.children();
			
			//체크된 row의 모든 값을 배열에 담는다.
			rowData.push(tr.text());
			
			//td.eq(0)은 체크박스 이므로 td.eq(1)의 값부터 가져온다.
			var member_no = td.eq(1).text();
			var member_id = td.eq(2).text();
			var member_pw = td.eq(3).text();
			var nickname = td.eq(4).text();
			var member_tel = td.eq(5).text();
			var member_email = td.eq(6).text();
			var signup_date = td.eq(7).text();
			var ticket_date = td.eq(8).text();
			var last_access_date = td.eq(9).text();
			var gender = td.eq(10).text();
			var ticket_code = td.eq(11).text();
			
			tdArr.push(member_no);
			tdArr.push(member_id);
			tdArr.push(member_pw);
			tdArr.push(nickname);
			tdArr.push(member_tel);
			tdArr.push(member_email);
			tdArr.push(signup_date);
			tdArr.push(ticket_date);
			tdArr.push(last_access_date);
			tdArr.push(gender);
			tdArr.push(ticket_code);
		});
		
		$("#ex3_Result1").html(rowData);
		$("#ex3_Result2").html(tdArr);
	});


	</script>

</head>
<body id="page-top">
		<div class="col-lg-12" id="ex3_Result1"></div>
	<div class="col-lg-12" id="ex3_Result2"></div>
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
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
				</form>

			
				<div>
					<a href="${pageContext.request.contextPath}/memberManageModifyForm.ad">추가</a>
				</div>
				
			
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<button type="button" class="btn btn-outline btn-primary pull-right" id="selectBtn">선택</button>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<thead>
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
					</thead>

					<tbody>
						<c:forEach items="${list}" var="member">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"></td>
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