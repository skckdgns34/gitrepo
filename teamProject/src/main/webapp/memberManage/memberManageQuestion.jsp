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
		window.document.location.href = "${pageContext.request.contextPath}/memberManageQuestionPop.ad?no="
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
			<h3 class="page_title">문의 조회</h3>
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