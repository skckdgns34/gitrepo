<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<!-- 로그인이 안 되면 접근을 못ㅎ하게 만들어 놓음! -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>

<script>
	function check(ck) {
		var obj = document.getElementsByName("user_CheckBox");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != ck) {
				obj[i].checked = false;
			}
		}
	};
	function addpage() //등록
	{
		window.document.location.href = "memberManageNoticeInsertForm.ad";
		return;
	}

	function modifypage() //수정 ㅡ
	{
		window.document.location.href = "memberManageNoticeModifyForm.ad?notice_no="
				+ $('input[name="user_CheckBox"]:checked').val();
		alert($('input[name="user_CheckBox"]:checked').val())
		return;
	}

	function deletepage() //삭제
	{
		window.document.location.href = "memberManageNoticeDelete.ad?notice_no= "
				+ $('input[name="user_CheckBox"]:checked').val();
		return;
	}
</script>

</head>
<body id="page-top">

	<div class="container-fluid">

		<h3 class="page_title">공지사항 전체 조회</h3>
		<hr>
		<div class="card-body">
			<div class="table-responsive">
				<div>
					<button type='button' id='btn_i'
						class="btn btn-outline btn-primary pull-left" onclick="addpage()">등록</button>
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
							<th>제목</th>
							<th>내용</th>
							<th>작성일</th>
							<th>첨부파일</th>
							<th>등록 사원이름</th>

						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="notice">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"
									onclick="check(this)" value="${notice.getNotice_no()}"></td>
								<td>${notice.getNotice_no()}</td>
								<td>${notice.getNotice_title()}</td>
								<td>${notice.getNotice_content()}</td>
								<td>${notice.getNotice_date()}</td>
								<td>${notice.getNotice_img()}</td>
								<td>${notice.getEmp_name()}</td>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>