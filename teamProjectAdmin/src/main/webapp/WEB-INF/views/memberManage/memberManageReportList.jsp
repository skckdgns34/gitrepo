<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 조회</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>

	function check(ck) {
		var obj = document.getElementsByName("user_CheckBox");
		for (var i = 0; i < obj.length; i++) {
			if (obj[i] != ck) {
				obj[i].checked = false;
			}
		}
	};

	function modifypage() //블랙리스트 등록
	{
		window.document.location.href = "memberManageReportModifyForm.ad?declaration_no="
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
						class="btn btn-outline btn-primary pull-" onclick="modifypage()">블랙리스트 등록</button>
					<button type="button" id='btn_d'
						class="btn btn-outline btn-primary pull-right"
						onclick="deletepage()">삭제</button>
				</div>
				 <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">

					<thead>
						<tr>
							<th>선택</th>
							<th>신고번호</th>
							<th>신고자</th>
							<th>신고 내용</th>
							<th>신고 당한 애</th>
							<th>신고일</th>
							<th>해당 책 번호</th>
							<th>리뷰 번호</th>
							<th>신고 코드</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="report">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"
									onclick="check(this)" value="${report.getDeclaration_no()}"></td>
								<td>${report.getDeclaration_no()}</td>
								<td>${report.getMember_no()}</td>
								<td>${report.getDeclaration_content()}</td>
								<td>${report.getReported_member()}</td>
								<td>${report.getDeclaration_date()}</td>
								<td>${report.getBook_no()}</td>
								<td><button type="button" class="btn btn-link" onclick="btnClick()" value="${report.getReview_no()}">${report.getReview_no()}</button></td>
							
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>


<!-- 리뷰 신고 페이지 -->
	<div id="dialog-form" title="신고">
			<fieldset>
				<textarea rows="8" cols="50" name="contents" id="contents" class="text ui-widget-content ui-corner-all" ></textarea>
			</fieldset>
	</div>
	<script>
	var dialog;	
	$(function (){
			dialog = $( "#dialog-form" ).dialog({
		    	autoOpen: false,
			    height: 500,
			    width: 600,
			    modal: true,
			    buttons: {
			      "확인": function() {
			        dialog.dialog( "close" );
			      }
			    }
			    /* close: function() {
			      form[ 0 ].reset();
			      allFields.removeClass( "ui-state-error" );
			 	} */
			});

		})
		
		
		function btnClick(){
		var review_no = $(event.target).val();
		$.ajax({
    		url:"${pageContext.request.contextPath}/reportSelect.ad",
    		type: "POST",
    		dataType: "JSON",
    	  	data: { 
    			review_no: review_no
    		},
    		success :function(result){
    			console.log(result);
    			$("#contents").val(result.contents);
    		}
    	})
				dialog.dialog( "open" );
	}

	</script>
</body>
</html>