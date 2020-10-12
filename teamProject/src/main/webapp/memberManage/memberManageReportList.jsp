<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@include file="/decorator/moveLoginForm.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트 조회</title>

 

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
	window.document.location.href="${pageContext.request.contextPath}/memberManageReportModifyForm.ad?no="+ $('input[name="user_CheckBox"]:checked').val();
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
		
		<h3 class="page_title">신고 조회</h3>
	<hr>
		<div class="card-body">
			<div class="table-responsive">
			
					<div><button type="button" id='btn_n' class="btn btn-outline btn-primary pull-" onclick="modifypage()">수정</button>
					<button type="button" id='btn_d' class="btn btn-outline btn-primary pull-right" onclick="deletepage()">삭제</button></div>
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

					<thead>
					<tr>
						<th>선택</th>
						<th>BLACKLIST_NO</th>
						<th>MEMBER_NO</th>
						<th>NICKNAME</th>						
						<th>BLACKLIST_REASON</th>
						<th>LIMIT_DATE</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="black">
							<tr>
								<td><input type="checkbox" name="user_CheckBox" onclick="check(this)" value="${black.getBlacklist_no()}"></td>
								<td>${black.getBlacklist_no()}</td>
								<td>${black.getMember_no()}</td>
								<td>${black.getNickname()}</td>
								<td>${black.blacklist_reason}</td>
								<td>${black.getLimit_date()}</td>
								
						</c:forEach>
					</tbody>
				</table>
			
			</div>
		</div>
	</div>



</body>
</html>