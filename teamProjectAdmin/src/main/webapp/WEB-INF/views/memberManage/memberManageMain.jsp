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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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

	function modifypage() //수정 ㅡ
	{
		window.document.location.href = "memberManageModifyForm.ad?member_no="
				+ $('input[name="user_CheckBox"]:checked').val();
		alert($('input[name="user_CheckBox"]:checked').val())
		return;
	}

	function deletepage() //삭제
	{
		window.document.location.href = "memberManageDelete.ad?member_no="
				+ $('input[name="user_CheckBox"]:checked').val();
		return;
	}
</script>

</head>
<body id="page-top">

	<div class="container-fluid">

		<h3 class="page_title">회원 전체 조회</h3>
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
							<th>회원 번호</th>
							<th>회원 아이디</th>
							<th>회원 패스워드</th>
							<th>닉네임</th>
							<th>회원 전화번호</th>
							<th>회원 이메일</th>
							<th>회원 가입일</th>
							<th>마지막 접속일</th>
							<th>성별</th>


						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="member">
							<tr>
								<td><input type="checkbox" name="user_CheckBox"
									onclick="check(this)" value="${member.getMember_no()}"></td>
								<td><button type="button" class="btn btn-link"
										onclick="btnClick()" value="${member.getMember_no()}">${member.getMember_no()}</button></td>
								<td>${member.getMember_id()}</td>
								<td>${member.getMember_pw()}</td>
								<td>${member.getNickname()}</td>
								<td>${member.getMember_tel()}</td>
								<td>${member.getMember_email()}</td>
								<td>${member.getSignup_date()}</td>
								<td>${member.getLast_access_date()}</td>
								<td>${member.getGender()}</td>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	
	

	<script>


		function btnClick() {
			var member_no= $(event.target).val();
			$.ajax({
				url : "${pageContext.request.contextPath}/memberManageDetail.ad",
				type : "POST",
				dataType : "JSON",
				data : {member_no:member_no},
				success : function(result) {
					for(var i=0; i<result.ticket.length; i++){
						console.log( result.ticket[i].pay_no);
						console.log(result.ticket[i].code_value);
						console.log(result.ticket[i].pay_date);
						/*  var addedTicket = $("<tr>" +
				                       "<td>" + result.ticket[i].pay_no + "</td>" +
				                       "<td>" + result.ticket[i].code_value + "</td>" + 
				                       "<td>" + result.ticket[i].pay_date + "</td>" +
				                       "</tr>");
				            $("#tbody").append(addedTicket);  */
				    }	
				}
					/* for(var i=0; i<result.review.length; i++){
						review_no[i] = result.review[i].review_no;
						book_no[i] = result.review[i].book_no;
						contents[i] = result.review[i].contents;
						title[i] = result.review[i].title;
						review_date[i] = result.review[i].review_date;						
						
						
					}for(var i=0; i<result.mylib.length; i++){
						mylibrary_no[i] = result.mylib[i].mylibrary_no;
						title[i] = result.mylib[i].title;
						book_no[i] = result.mylib[i].book_no;
						wish[i] = result.mylib[i].wish;
						last_read_index[i] = result.mylib[i].last_read_index;
					} */	

				
			})
		}
	</script>
	
	
	<!--  modal 폼 -->
	<div class="container">
  <h2>Modal Scroll Example</h2>
  <!-- Button to Open the Modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title">회원 상세보기</h1>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <h3>Some text to enable scrolling..</h3>
          <p>Some text</p>
          <p>Some.</p>         
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
	
</body>
</html>