<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 조회</title>



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
		window.document.location.href = "memberManageReportModifyForm.ad?blacklist_no="
				+ $('input[name="user_CheckBox"]:checked').val();
		alert($('input[name="user_CheckBox"]:checked').val())
		return;
	}

	function deletepage() //삭제
	{
		window.document.location.href = "memberManageReportDelete.ad?blacklist_no="
				+ $('input[name="user_CheckBox"]:checked').val();
		alert($('input[name="user_CheckBox"]:checked').val())
		return;
	}
</script>
</head>
<body id="page-top">

	<div class="container-fluid">

		<h3 class="page_title">신고 조회</h3>
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
							<th>신고 당한 애</th>
							<th>신고 내용</th>
							<th>신고자 번호</th>
							<th>신고일</th>
							<th>신고코드</th>
							<th>해당 책 번호</th>
							<th>리뷰번호</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="report">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"
									onclick="check(this)" value="${report.getMember_no()}"></td>
								<td>${report.getMember_no()}</td>
								<td>${report.getDeclaration_content()}</td>
								<td>${report.getReported_number()}</td>
								<td>${report.getDeclaration_date()}</td>
								<td>${report.getDeclaration_code()}</td>
								<td>${report.getBook_no()}</td>
								<td>${report.getReview_no()}</td>
								<td>${report.getCode_value()}</td>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>



</body>
</html>