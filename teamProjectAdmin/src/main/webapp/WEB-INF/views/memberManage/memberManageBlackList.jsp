<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트 조회</title>



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
		if (confirm("수정하시겠습니까?") == true) {
			window.document.location.href = "memberManageBlackListPopForm.ad?blacklist_no="
					+ $('input[name="user_CheckBox"]:checked').val();
			alert($('input[name="user_CheckBox"]:checked').val())
			document.form.submit();
		} else { //취소
			$('user_CheckBox').attr('checked', false);
			window.document.location.href = "memberManageBlackList.ad";
			return;
		}
	}

	function deletepage() //삭제
	{
		if (confirm("삭제하시겠습니까?") == true) {
			window.document.location.href = "memberManageBlackListDelete.ad?blacklist_no="
					+ $('input[name="user_CheckBox"]:checked').val();
			document.form.submit();
		} else { //취소
			$('user_CheckBox').attr('checked', false);
			window.document.location.href = "memberManageBlackList.ad";
			return;
		}

	}
</script>
<style>
thead {
	max-width: 90px;
}

tbody {
	max-width: 90px;
}

td {
	overflow: hidden;
	text-overflow: ellipsis !important;
	white-space: nowrap;
	max-width: 90px;
	height: 20px;
}
</style>
</head>
<body id="page-top">

	<div class="container-fluid">

		<h3 class="page_title">블랙리스트 조회</h3>
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
				<table class="table table-bordered table-hover" id="dataTable"
					width="100%" cellspacing="0">

					<thead>
						<tr>
							<th>선택</th>
							<th>번호</th>
							<th>회원 번호</th>
							<th>닉네임</th>
							<th>사유</th>
							<th>적용기간</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="black">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"
									onclick="check(this)" value="${black.getBlacklist_no()}"></td>
								<td>${black.getBlacklist_no()}</td>
								<td>${black.getMember_no()}</td>
								<td>${black.getNickname()}</td>
								<td>${black.getCode_value()}</td>
								<td>${black.getLimit_date()}</td>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>



</body>
</html>