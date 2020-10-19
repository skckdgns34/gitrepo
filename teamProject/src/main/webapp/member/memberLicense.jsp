<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
li {
	list-style-type: none;
	float: left;
	margin-left: 20px;
}

</style>
</head>
<body>
	   <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Menu</h4>
                        <div class="breadcrumb__links">
                            <a href="${pageContext.request.contextPath}/main.do">내 정보</a>
                            <span>이용권 내용</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	
	  <section class="section-margin--small mb-5">
	
	<div class="container">
      <div class="row">
       <div class="col-lg-12">
	<div class="table-responsive">
	<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
		 <thead>
			<tr>
				<td>번호</td>
				<td>상태</td>
				<td>상품명</td>
				<td>결제일</td>
				<td>구매금액</td>
				<td>만료일자</td>
			</tr>
			</thead>
			<c:forEach items="${list }" var="license">
				<tr>
					<td></td>
					<td>${license.US }</td>
					<td>${license.ticket_name }</td>
					<td>${license.pay_date }</td>
					<td>${license.price }</td>
					<td>${license.expiration }</td>
				</tr>
			</c:forEach>
		</table>
</div>
</div>
</div>
</div>
</section>
<script type="text/javascript">
jQuery(function($){ 
	$("#dataTable").DataTable(); 
}); 

$("#dataTable").DataTable({
	
	// 표시 건수를 10건 단위로 설정
	lengthMenu: [ 10, 20, 30, 40, 50 ]
});
</script>

</body>
</html>