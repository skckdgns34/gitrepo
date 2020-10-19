<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js"
	referrerpolicy="origin"></script>
</head>
<body>
<h1 class="page_title">출판사 수정</h1>
		<div class="regist">
			<form method="post" name="frm" id="frm" 
				  enctype="multipart/form-data"
				  action="${pageContext.request.contextPath }/companyPop.ad"
				  >
				  <div>
					<label for="company_code">출판사코드</label> <input id="company_code" name="company_code" type="hidden" value="${result.company_code }">
				</div>
				<div>
					<label for="company_name">출판사이름</label> <input id="company_name" name="company_name" type="text" value="${result.company_name }">
				</div>
				<div>
					<label for="company_addr">출판사주소</label> <input id="company_addr" name="company_addr" type="text" value="${result.company_addr }">
				</div>
				<div>
					<label for="company_mgr">출판사담당자</label> <input id="company_mgr" name="company_mgr" type="text" value="${result.company_mgr }">
				</div>
				<div>
					<label for="company_tel">출판사전화번호</label> <input id="company_tel" name="company_tel" type="text" value="${result.company_tel }">
				</div>
				<div>
					<label for="company_mgr_tel">담당자전화번호</label> <input id="company_mgr_tel" name="company_mgr_tel" type="text" value="${result.company_mgr_tel }">
				</div>
				<div>
					<label for="company_bank">출판사은행정보</label> <input id="company_bank" name="company_bank" type="text" value="${result.company_bank }">
				</div>
				<div>
					<label for="company_account">출판사계좌정보</label> <input id="company_account" name="company_account" type="text" value="${result.company_account }">
				</div>
				<div>
					<button type="reset">초기화</button>
					<button>등록</button>
				</div>
			</form>
			<c:if test="${not empty result}">
				<form action="${pageContext.request.contextPath}/companyDelete.ad">
					<input type="hidden" name="company_code" value="${result.company_code}">
					<button>삭제</button>
				</form>
			</c:if>
		</div>
</body>
</html>