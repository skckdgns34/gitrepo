<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@include file="/decorator/moveLoginForm.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>블랙리스트 조회</title>
</head>
<body id="page-top">
	
	<div class="container-fluid">
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">검색</h6>
				 </div>
				<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
					method="post" action="memberManageBlackList.ad">
					<div class="input-group">
						<select name='search_type'>
							<option value='MEMBER_NO'
								<c:if test="${search_type == 'MEMBER_NO'}">selected</c:if>>회원번호
								</option>
							<option value='LIMIT_DATE'
								<c:if test="${search_type == 'LIMIT_DATE'}">selected</c:if>>기간</option>
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


					<div><input type='button' id='btn_n' value='수정' onclick="modifypage()"></div>
					<div><input type='button' id='btn_d' value='삭제' onclick="deletepage()"></div>
					
			
				
			
		</div>
		<div class="card-body">
			<div class="table-responsive">
			
				<button type="button" class="btn btn-outline btn-primary pull-right" id="selectBtn">선택</button>
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">

					<thead>
					<tr>
						<th>선택</th>
						<th>BLACKLIST_NO</th>
						<th>BLACKLIST_REASON</th>
						<th>MEMBER_NO</th>
						<th>LIMIT_DATE</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="black">
							<tr>
								<td><input type="checkbox" name="user_CheckBox" onclick="check(this)" value="${black.getBlacklist_no()}"></td>
								<td>${black.getBlacklist_no()}</td>
								<td>${black.blacklist_reason}</td>
								<td>${black.getMember_no()}</td>
								<td>${black.getLimit_date()}</td>
								
						</c:forEach>
					</tbody>
				</table>
			
			</div>
		</div>
	</div>
</body>
</html>