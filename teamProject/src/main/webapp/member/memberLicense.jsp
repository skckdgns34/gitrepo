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
                            <a href="./index.html">내 정보</a>
                            <span>이용권 내용</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    <!--  이건 이제 지워도 되지 않을까??? -->
	<ul>
		<li><a
			href="<%=application.getContextPath()%>/memberModify.do">내정보 수정</a>
		<li><a
			href="<%=application.getContextPath()%>/memberBookMark.do">내 서재</a>
		<li><a
			href="<%=application.getContextPath()%>/memberCreateBookCk.do">나만의 도서 확인</a>
		<li><a
			href="<%=application.getContextPath()%>/memberLicense.do">이용권 내용</a>
	</ul>
	
	
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
		<my:paging paging="${paging }" jsfunc="gopage" />

	<script>
		function gopage(p) {
			searchFrm.p.value = p;
			searchFrm.submit();

			location.href="memberLicense.do?p=" + p;
		}
	</script>

</body>
</html>