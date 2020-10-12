<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		window.document.location.href = "memberManageAnswer.ad?question_no="
				+ $('input[name="user_CheckBox"]:checked').val();
		return;
	}

	function deletepage() //삭제
	{
		window.document.location.href = "주소 적기...ㅠ.ad";
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
						class="btn btn-outline btn-primary pull-" onclick="modifypage()">답글</button>
					<button type="button" id='btn_d'
						class="btn btn-outline btn-primary pull-right"
						onclick="deletepage()">삭제</button>
				</div>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<thead>
						<tr>
							<th>선택</th>
							<th>번호</th>
							<th>회원 번호</th>
							<th>회원 아이디</th>
							<th>닉네임</th>
							<th>제목</th>
							<th>내용</th>
							<th>등록일</th>
							<th>첨부파일</th>							
							<th>문의종류</th>
							<th>답변여부</th>

						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"
									onclick="check(this)" value="${list.question_no}"></td>
								
								<td>${list.question_no}</td>
								<td>${list.member_no}</td>
								<td>${list.member_id}</td>
								<td>${list.nickname}</td>
								<td>${list.question_title}</td>
								<td>${list.question_contents}</td>
								<td>${list.question_date}</td>
								<td>${list.question_file}</td>
								<td>${list.code_value}</td>
								<td>${list.question_status}</td>
								
								</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
</body>
</html>