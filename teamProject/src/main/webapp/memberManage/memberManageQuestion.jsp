<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/decorator/moveLoginForm.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의글 조회</title>
<script>
	function check(ck) {
		var obj = document.getElementsByName("user_CheckBox");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != ck) {
				obj[i].checked = false;
			}
		}
	};

	function modifypage() //수정 
	{
		window.document.location.href = "${pageContext.request.contextPath}/memberManageQuestion.ad?no="
				+ $('input[name="user_CheckBox"]:checked').val();
		return;
	}

	function deletepage() //삭제
	{
		window.document.location.href = "${pageContext.request.contextPath}/주소 적기...ㅠ.ad";
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
			<form
				class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
				method="post" action="memberManageBlackList.ad">
				<div class="input-group">
					<select name='search_type'>
						<option value='MEMBER_NO'
							<c:if test="${search_type == 'MEMBER_NO'}">selected</c:if>>회원번호
						</option>
						<option value='QUESTION_KIND'
							<c:if test="${search_type == 'QUESTION_KIND'}">selected</c:if>>문의
							코드</option>
						<option value='BLACKLIST_REASON'
							<c:if test="${search_type == 'BLACKLIST_REASON'}">selected</c:if>>이유</option>
					</select>
				</div>

				<div class="input-group-append">
					<input type="text" id='search_text' name='search_text'
						placeholder="회원번호 또는 기간을 입력해주세요" value="${search_text }">
					<button class="btn btn-primary" id="btnOk" type="submit">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</form>






		</div>
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
							<th>MEMBER_ID</th>
							<th>MEMBER_NO</th>
							<th>NICKNAME</th>
							<th>QUESTION_NO</th>
							<th>QUESTION_DATE</th>
							<th>QUESTION_CONTENTS</th>
							<th>QUESTION_TITLE</th>
							<th>QUESTION_FILE</th>							
							<th>QUESTION_KIND</th>
							
							
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="q">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"
									onclick="check(this)" value=""></td>
								<td>${q.member_id}</td>
								<td>${q.member_no}</td>
								<td>${q.nickname}</td>
								<td>${q.question_no}</td>
								<td>${q.question_date}</td>
								<td>${q.question_contents}</td>
								<td>${q.question_title}</td>
								<td>${q.question_file}</td>
								<td>${q.question_kind}</td>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>